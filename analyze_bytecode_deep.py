#!/usr/bin/env python3
"""Deep analysis to find strings in FAS4 bytecode."""

import struct

# Read the file
with open('PDI.fas', 'rb') as f:
    data = f.read()

# Extract data section
header_pos = data.find(b'FAS4-FILE')
size_pos = data.find(b'517')
size_end = data.find(b'\n', size_pos) + 1
if size_end < len(data) and data[size_end] == ord('\n'):
    size_end += 1

raw_data = data[size_end:size_end+517]
bytecode = raw_data[4:] if raw_data[:4] == b'38 $' else raw_data

print("=== Deep Bytecode String Analysis ===\n")
print(f"Bytecode size: {len(bytecode)} bytes\n")

# Expected strings from PDI(test).lsp
expected_strings = [
    "Common Dictionaries:",
    "ACAD_GROUP", "ACAD_LAYOUT", "ACAD_MATERIAL", "ACAD_MLINESTYLE",
    "ACAD_PLOTSETTINGS", "ACAD_TABLESTYLE", "ACAD_COLOR", "ACAD_VISUALSTYLE",
    "ACAD_DETAILVIEWSTYLE", "ACAD_SECTIONVIEWSTYLE", "ACAD_SCALELIST",
    "ACAD_MLEADERSTYLE", "AcDbVariableDictionary",
    "NOTE: Purging",
    "getstring", "namedobjdict", "wcmatch", "dictremove", "strcat", "itoa",
    "setq", "princ", "if", "progn", "not", "exit", "or", "=",
    "dict_name", "items_purged", "dict_obj", "continue"
]

# Try all XOR keys
print("Trying XOR decoding with all keys...")
found_strings = {}
for xor_key in range(256):
    decoded = bytes(b ^ xor_key for b in bytecode)
    
    # Check for expected strings
    for expected in expected_strings:
        if expected.encode('ascii') in decoded:
            offset = decoded.find(expected.encode('ascii'))
            if offset not in found_strings:
                found_strings[offset] = (expected, xor_key)
                print(f"Found '{expected}' at offset {offset} with XOR key 0x{xor_key:02x}")

# Try different byte ranges
print("\nTrying different byte ranges...")
for start in [0, 4, 8, 16, 32, 64, 128, 256, 276]:
    if start < len(bytecode):
        test_range = bytecode[start:start+200]
        for xor_key in range(256):
            decoded = bytes(b ^ xor_key for b in test_range)
            for expected in expected_strings:
                if expected.encode('ascii') in decoded:
                    print(f"Found '{expected}' in range [{start}:{start+200}] with XOR key 0x{xor_key:02x}")

# Try ROT13, Caesar cipher, etc.
print("\nTrying other encoding methods...")
for shift in range(1, 256):
    decoded = bytes((b + shift) & 0xFF for b in bytecode)
    for expected in expected_strings:
        if expected.encode('ascii') in decoded:
            offset = decoded.find(expected.encode('ascii'))
            print(f"Found '{expected}' at offset {offset} with shift {shift}")

print("\n=== Analysis complete ===")

