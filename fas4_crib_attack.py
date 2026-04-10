#!/usr/bin/env python3
"""
fas4_crib_attack.py

Crib-based experiment against FAS4 bytecode.

Idea:
    We know (or strongly suspect) that PDI.fas is the compiled form of
    PurgeDictionaryItems[PDI].lsp. This script treats that LISP source as a
    "crib" and checks whether the FAS4 bytecode could be a simple XOR or
    repeating-key XOR encoding of (parts of) the plaintext.

    This will NOT fully decompile FAS4, but it can decisively confirm or
    *rule out* simple XOR-family encodings, and may reveal a short repeating
    keystream if one exists.

Usage:
    python fas4_crib_attack.py PDI.fas PurgeDictionaryItems[PDI].lsp

    - First argument: FAS4 file (e.g. PDI.fas)
    - Second argument: crib LISP source (e.g. PurgeDictionaryItems[PDI].lsp)
"""

from __future__ import annotations

import sys
import struct
from dataclasses import dataclass
from typing import List, Tuple, Optional


@dataclass
class PayloadInfo:
    filename: str
    raw_payload: bytes
    bytecode: bytes


def read_fas4_payload(path: str) -> PayloadInfo:
    """Read outer FAS4 container and return inner payload and bytecode."""
    with open(path, "rb") as f:
        data = f.read()

    marker = b"FAS4-FILE"
    pos = data.find(marker)
    if pos == -1:
        raise ValueError("FAS4-FILE header not found")

    # Find end of header line
    eol = data.find(b"\n", pos)
    if eol == -1:
        eol = data.find(b"\r", pos)
    if eol == -1:
        raise ValueError("Could not find end of header line")

    # Move past newline(s)
    eol += 1
    if eol < len(data) and data[eol] == ord("\n") and data[eol - 1] == ord("\r"):
        eol += 1

    # Size line
    size_start = eol
    size_end = data.find(b"\n", size_start)
    if size_end == -1:
        size_end = data.find(b"\r", size_start)
    if size_end == -1:
        raise ValueError("Could not find end of size line")

    size_str = data[size_start:size_end].decode("ascii", errors="ignore").strip()
    if not size_str:
        raise ValueError("Empty size line")
    try:
        declared_size = int(size_str)
    except ValueError:
        raise ValueError(f"Invalid size value: {size_str!r}")

    # Move to payload start
    payload_start = size_end + 1
    if (
        payload_start < len(data)
        and data[payload_start] == ord("\n")
        and data[payload_start - 1] == ord("\r")
    ):
        payload_start += 1

    if payload_start + declared_size > len(data):
        raise ValueError(
            f"Payload truncated: need {declared_size} bytes from {payload_start}, "
            f"file has {len(data)} bytes"
        )

    raw_payload = data[payload_start : payload_start + declared_size]
    # Strip "38 $" if present
    if len(raw_payload) >= 4 and raw_payload[:4] == b"38 $":
        bytecode = raw_payload[4:]
    else:
        bytecode = raw_payload

    return PayloadInfo(filename=path, raw_payload=raw_payload, bytecode=bytecode)


def load_crib(path: str) -> bytes:
    """Load crib/plaintext and reduce to ASCII bytes."""
    with open(path, "rb") as f:
        data = f.read()
    # Keep only basic printable ASCII; this is heuristic but keeps things simple.
    filtered = bytes(b for b in data if 32 <= b <= 126 or b in (9, 10, 13))
    return filtered


def repeating_xor_crib_attack(
    cipher: bytes, crib: bytes, max_key_len: int = 16
) -> List[Tuple[int, int, bytes, int]]:
    """
    Try repeating-key XOR models:
        cipher[i + off] = crib[j] ^ key[i % key_len]

    We slide the crib over the cipher and, for each offset and key_len, derive
    candidate key bytes and measure consistency (how often the same key byte
    is implied for the same key index).

    Returns a list of (offset, key_len, key_bytes, score), sorted by score
    descending. 'score' is the number of consistent positions.
    """
    results: List[Tuple[int, int, bytes, int]] = []

    if not cipher or not crib:
        return results

    # Limit crib length to avoid O(n^3) blowups
    max_crib_len = min(len(crib), 256)
    crib = crib[:max_crib_len]

    for key_len in range(1, max_key_len + 1):
        for offset in range(0, max(1, len(cipher) - len(crib))):
            key = [None] * key_len  # type: ignore[list-item]
            consistent = True
            used_positions = 0

            for i, p_byte in enumerate(crib):
                c_pos = offset + i
                if c_pos >= len(cipher):
                    break
                c_byte = cipher[c_pos]
                k_index = i % key_len
                k_val = c_byte ^ p_byte

                existing = key[k_index]
                if existing is None:
                    key[k_index] = k_val
                    used_positions += 1
                elif existing != k_val:
                    # Conflict for this key index; this (offset, key_len) unlikely
                    consistent = False
                    break

            if not consistent or used_positions < key_len:
                continue

            key_bytes = bytes(k if k is not None else 0 for k in key)
            results.append((offset, key_len, key_bytes, used_positions))

    # Sort by score descending, then shorter key first
    results.sort(key=lambda t: (-t[3], t[1]))
    return results


def show_candidate(cipher: bytes, offset: int, key: bytes, context: int = 80) -> None:
    """Decode a window around offset using the candidate key and print it."""
    key_len = len(key)
    start = max(0, offset - context // 2)
    end = min(len(cipher), offset + context // 2)
    decoded = bytearray()
    for i in range(start, end):
        k = key[(i - offset) % key_len]
        decoded.append(cipher[i] ^ k)

    print(f"  Sample decoded window [{start}:{end}] (len {end - start}):")
    print("  ", decoded.decode("ascii", errors="replace"))


def main(argv: List[str]) -> int:
    if len(argv) != 3:
        print("Usage: fas4_crib_attack.py <file.fas> <crib.lsp>")
        return 1

    fas_path = argv[1]
    crib_path = argv[2]

    try:
        info = read_fas4_payload(fas_path)
    except Exception as e:
        print(f"Error reading FAS4 payload: {e}")
        return 1

    cipher = info.bytecode
    crib = load_crib(crib_path)

    print(f"FAS4 bytecode: {len(cipher)} bytes from {fas_path}")
    print(f"Crib length:   {len(crib)} bytes from {crib_path} (ASCII-filtered)")
    print("Running repeating-key XOR crib attack (heuristic)...\n")

    candidates = repeating_xor_crib_attack(cipher, crib, max_key_len=8)

    if not candidates:
        print("No consistent repeating-key XOR candidates found (for key_len <= 8).")
        print("This strongly suggests the encoding is not a simple repeating-key XOR of the crib.")
        return 0

    print(f"Found {len(candidates)} candidate (offset, key_len) pairs.")
    print("Top candidates:")
    for offset, key_len, key_bytes, score in candidates[:5]:
        print(
            f"- offset={offset}, key_len={key_len}, score={score}, "
            f"key={key_bytes!r}"
        )
        show_candidate(cipher, offset, key_bytes)
        print()

    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))


