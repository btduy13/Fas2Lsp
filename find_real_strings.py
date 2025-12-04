#!/usr/bin/env python3
"""Find and extract real strings from FAS4 bytecode by trying all possible decoding methods."""

import struct

# Read the FAS4 file
with open('PDI.fas', 'rb') as f:
    data = f.read()

# Extract bytecode section
header_pos = data.find(b'FAS4-FILE')
size_pos = data.find(b'517')
size_end = data.find(b'\n', size_pos) + 1
if size_end < len(data) and data[size_end] == ord('\n'):
    size_end += 1

bytecode = data[size_end:size_end+517]

print(f"Bytecode length: {len(bytecode)} bytes")
print(f"First 50 bytes: {' '.join(f'{b:02x}' for b in bytecode[:50])}\n")

# Expected strings from the reference file
expected_strings = [
    "Common Dictionaries",
    "ACAD_GROUP",
    "ACAD_LAYOUT", 
    "ACAD_MATERIAL",
    "ACAD_MLINESTYLE",
    "ACAD_PLOTSETTINGS",
    "ACAD_TABLESTYLE",
    "ACAD_COLOR",
    "ACAD_VISUALSTYLE",
    "ACAD_DETAILVIEWSTYLE",
    "ACAD_SECTIONVIEWSTYLE",
    "ACAD_SCALELIST",
    "ACAD_MLEADERSTYLE",
    "AcDbVariableDictionary",
    "NOTE: Purging",
    "dict_name",
    "items_purged",
    "dict_obj",
    "continue",
    "princ",
    "setq",
    "getstring",
    "namedobjdict",
    "wcmatch",
    "dictremove",
    "strcat",
    "itoa",
    "if",
    "progn",
    "not",
    "exit",
    "or",
    "Purge Dictionary Items",
    "Enter case sensitive pattern",
    "Continue? [y/N]:",
    "WARNING:",
    "Error: Could not access",
    "Attempting to purge",
    "successfully purged",
    "Could not purge",
    "dictionary item(s) purged"
]

print("=== Trying to find expected strings using various decoding methods ===\n")

found_strings = {}

# Method 1: Try XOR with all possible keys
print("Method 1: XOR decoding...")
for xor_key in range(256):
    decoded = bytes(b ^ xor_key for b in bytecode)
    for expected in expected_strings:
        expected_bytes = expected.encode('ascii')
        if expected_bytes in decoded:
            offset = decoded.find(expected_bytes)
            if offset not in found_strings:
                found_strings[offset] = (expected, f'XOR_{xor_key:02x}')
                print(f"  Found '{expected}' at offset {offset} with XOR key 0x{xor_key:02x}")

# Method 2: Try ROT (Caesar cipher) decoding
print("\nMethod 2: ROT (Caesar cipher) decoding...")
for rot in range(1, 256):
    decoded = bytes((b + rot) & 0xFF for b in bytecode)
    for expected in expected_strings:
        expected_bytes = expected.encode('ascii')
        if expected_bytes in decoded:
            offset = decoded.find(expected_bytes)
            key = f'ROT_{rot}'
            if offset not in found_strings or found_strings[offset][1] != key:
                found_strings[offset] = (expected, key)
                print(f"  Found '{expected}' at offset {offset} with ROT {rot}")

# Method 3: Try reverse bytecode
print("\nMethod 3: Reversed bytecode...")
reversed_bc = bytecode[::-1]
for expected in expected_strings:
    expected_bytes = expected.encode('ascii')
    if expected_bytes in reversed_bc:
        offset = reversed_bc.find(expected_bytes)
        if offset not in found_strings:
            found_strings[offset] = (expected, 'REVERSED')
            print(f"  Found '{expected}' at reversed offset {offset}")

# Method 4: Try looking at string table offset (first uint32)
print("\nMethod 4: Checking string table offset...")
if len(bytecode) >= 4:
    offset = struct.unpack('<I', bytecode[0:4])[0]
    print(f"  First uint32 = {offset} (0x{offset:04x})")
    if 0 < offset < len(bytecode):
        print(f"  Trying to extract strings from offset {offset}...")
        # Try extracting from this offset
        table_data = bytecode[offset:]
        for xor_key in range(256):
            decoded = bytes(b ^ xor_key for b in table_data)
            for expected in expected_strings:
                expected_bytes = expected.encode('ascii')
                if expected_bytes in decoded:
                    real_offset = offset + decoded.find(expected_bytes)
                    key = f'TABLE_XOR_{xor_key:02x}'
                    if real_offset not in found_strings:
                        found_strings[real_offset] = (expected, key)
                        print(f"    Found '{expected}' at absolute offset {real_offset} (table XOR 0x{xor_key:02x})")

# Method 5: Try multi-byte XOR keys
print("\nMethod 5: Multi-byte XOR keys...")
for key_len in [2, 4]:
    for key_val in range(256):
        key = bytes([key_val] * key_len)
        decoded = bytearray()
        for i, b in enumerate(bytecode):
            decoded.append(b ^ key[i % key_len])
        decoded = bytes(decoded)
        for expected in expected_strings:
            expected_bytes = expected.encode('ascii')
            if expected_bytes in decoded:
                offset = decoded.find(expected_bytes)
                key_name = f'MULTI_XOR_{key_len}_{key_val:02x}'
                if offset not in found_strings or found_strings[offset][1] != key_name:
                    found_strings[offset] = (expected, key_name)
                    print(f"  Found '{expected}' at offset {offset} with {key_len}-byte XOR key 0x{key_val:02x}")

print(f"\n=== Summary: Found {len(found_strings)} strings ===")
if found_strings:
    print("\nStrings found (sorted by offset):")
    for offset in sorted(found_strings.keys()):
        string, method = found_strings[offset]
        print(f"  [{offset:04d}] '{string}' (method: {method})")
else:
    print("\nNo expected strings found. The encoding method is different or strings are compressed.")
    print("Trying to extract ANY readable strings...")
    
    # Last resort: extract all readable ASCII sequences
    current = bytearray()
    start_pos = 0
    all_strings = {}
    
    for i, byte in enumerate(bytecode):
        if 32 <= byte <= 126:
            if len(current) == 0:
                start_pos = i
            current.append(byte)
        else:
            if len(current) >= 4:
                try:
                    s = current.decode('ascii')
                    if any(c.isalpha() for c in s):
                        all_strings[start_pos] = s
                except:
                    pass
            current = bytearray()
    
    if all_strings:
        print(f"\nFound {len(all_strings)} readable ASCII strings:")
        for offset in sorted(all_strings.keys())[:20]:
            print(f"  [{offset:04d}] '{all_strings[offset]}'")

