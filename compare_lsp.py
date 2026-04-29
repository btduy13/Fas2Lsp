#!/usr/bin/env python3
"""
Compare a decompiled .lsp file with an original/reference .lsp file.

The comparison is intentionally structural and string-focused. FAS decompilation
usually cannot recover comments, formatting, and exact local names, but missing
string literals and command names are strong signals that the files do not match.
"""
from __future__ import annotations

import argparse
import re
from collections import Counter
from pathlib import Path
from typing import Iterable, List


STRING_RE = re.compile(r'"(?:\\.|[^"\\])*"', re.DOTALL)
DEFUN_RE = re.compile(r'\(\s*defun\s+([^\s()]+)', re.IGNORECASE)
SYMBOL_RE = re.compile(r'[A-Za-z_][A-Za-z0-9_:\-?!*/=<>+.]*(?:\*)?')


def unescape_lisp_string(token: str) -> str:
    body = token[1:-1]
    result: List[str] = []
    i = 0
    while i < len(body):
        if body[i] == '\\' and i + 1 < len(body):
            nxt = body[i + 1]
            if nxt == 'n':
                result.append('\n')
            elif nxt == 'r':
                result.append('\r')
            elif nxt == 't':
                result.append('\t')
            else:
                result.append(nxt)
            i += 2
            continue
        result.append(body[i])
        i += 1
    return ''.join(result)


def extract_strings(text: str) -> List[str]:
    return [unescape_lisp_string(match.group(0)) for match in STRING_RE.finditer(strip_line_comments(text))]


def extract_defuns(text: str) -> List[str]:
    return [match.group(1).lower() for match in DEFUN_RE.finditer(strip_line_comments(text))]


def extract_symbols(text: str) -> List[str]:
    no_strings = STRING_RE.sub(' ', strip_line_comments(text))
    return [match.group(0).lower() for match in SYMBOL_RE.finditer(no_strings)]


def strip_line_comments(text: str) -> str:
    lines = []
    for line in text.splitlines():
        in_string = False
        escaped = False
        cut = len(line)
        for i, ch in enumerate(line):
            if escaped:
                escaped = False
                continue
            if ch == '\\' and in_string:
                escaped = True
                continue
            if ch == '"':
                in_string = not in_string
                continue
            if ch == ';' and not in_string:
                cut = i
                break
        lines.append(line[:cut])
    return '\n'.join(lines)


def subtract(left: Iterable[str], right: Iterable[str]) -> List[str]:
    remaining = Counter(left)
    remaining.subtract(Counter(right))
    values: List[str] = []
    for value, count in remaining.items():
        values.extend([value] * max(count, 0))
    return values


def render_value(value: str) -> str:
    return value.replace('\\', '\\\\').replace('\r', '\\r').replace('\n', '\\n')


def main() -> int:
    parser = argparse.ArgumentParser(description='Compare original and decompiled LSP files.')
    parser.add_argument('original', type=Path)
    parser.add_argument('decompiled', type=Path)
    args = parser.parse_args()

    original = args.original.read_text(encoding='utf-8')
    decompiled = args.decompiled.read_text(encoding='utf-8')

    original_strings = extract_strings(original)
    decompiled_strings = extract_strings(decompiled)
    original_defuns = extract_defuns(original)
    decompiled_defuns = extract_defuns(decompiled)
    original_symbols = extract_symbols(original)
    decompiled_symbols = extract_symbols(decompiled)

    missing_strings = subtract(original_strings, decompiled_strings)
    extra_strings = subtract(decompiled_strings, original_strings)
    missing_defuns = subtract(original_defuns, decompiled_defuns)
    extra_defuns = subtract(decompiled_defuns, original_defuns)

    original_symbol_set = set(original_symbols)
    decompiled_symbol_set = set(decompiled_symbols)
    missing_symbols = sorted(original_symbol_set - decompiled_symbol_set)
    extra_symbols = sorted(decompiled_symbol_set - original_symbol_set)

    print(f'Original:   {args.original}')
    print(f'Decompiled: {args.decompiled}')
    print()
    print(f'Defuns:  original={len(original_defuns)} decompiled={len(decompiled_defuns)}')
    print(f'Strings: original={len(original_strings)} decompiled={len(decompiled_strings)}')
    print(f'Symbols: original={len(original_symbol_set)} decompiled={len(decompiled_symbol_set)}')
    print()

    if missing_defuns:
        print('Missing defuns:')
        for value in missing_defuns:
            print(f'  - {value}')
        print()
    if extra_defuns:
        print('Extra defuns:')
        for value in extra_defuns:
            print(f'  + {value}')
        print()

    if missing_strings:
        print('Strings present in original but absent from decompiled output:')
        for value in missing_strings:
            print(f'  - "{render_value(value)}"')
        print()
    if extra_strings:
        print('Strings present in decompiled output but absent from original:')
        for value in extra_strings:
            print(f'  + "{render_value(value)}"')
        print()

    if missing_symbols:
        print('Symbols present only in original:')
        print('  ' + ', '.join(missing_symbols[:80]))
        if len(missing_symbols) > 80:
            print(f'  ... {len(missing_symbols) - 80} more')
        print()
    if extra_symbols:
        print('Symbols present only in decompiled output:')
        print('  ' + ', '.join(extra_symbols[:80]))
        if len(extra_symbols) > 80:
            print(f'  ... {len(extra_symbols) - 80} more')
        print()

    if missing_strings:
        print('Conclusion: the reference source has string literals that are not in the decoded FAS resource table.')
        print('That usually means the .fas was compiled from a different .lsp revision, or the reference was manually rewritten.')
        return 2

    print('Conclusion: no reference strings are missing from the decompiled output.')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
