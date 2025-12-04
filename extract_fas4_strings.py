#!/usr/bin/env python3
"""Extract strings and patterns from FAS4 binary data."""

import struct
import re

# Read the file
with open('PDI.fas', 'rb') as f:
    data = f.read()

# Find data section
header_pos = data.find(b'FAS4-FILE')
size_pos = data.find(b'517')
size_end = data.find(b'\n', size_pos) + 1
if size_end < len(data) and data[size_end] == ord('\n') and data[size_end - 1] == ord('\r'):
    size_end += 1

raw_data = data[size_end:size_end+517]

print("Analyzing FAS4 binary data...")
print(f"Data size: {len(raw_data)} bytes\n")

# Method 1: Extract all readable ASCII strings
print("=== Method 1: ASCII String Extraction ===")
strings = []
current = bytearray()
for i, byte in enumerate(raw_data):
    if 32 <= byte <= 126:  # Printable ASCII
        current.append(byte)
    else:
        if len(current) >= 4:
            try:
                s = current.decode('ascii')
                # Filter meaningful strings
                if any(c.isalnum() for c in s) and not all(c in ' \t' for c in s):
                    strings.append((i - len(current), s))
            except:
                pass
        current = bytearray()

if len(current) >= 4:
    try:
        s = current.decode('ascii')
        if any(c.isalnum() for c in s):
            strings.append((len(raw_data) - len(current), s))
    except:
        pass

for offset, s in strings:
    print(f"  Offset {offset:3d}: '{s}'")

# Method 2: Look for string patterns that might be in the expected output
print("\n=== Method 2: Looking for expected strings ===")
expected_strings = [
    "ACAD_GROUP", "ACAD_LAYOUT", "ACAD_MATERIAL", "PDI", "dict_name",
    "items_purged", "dict_obj", "continue", "getstring", "namedobjdict",
    "dictremove", "wcmatch", "princ", "strcat", "itoa"
]

found_strings = {}
for expected in expected_strings:
    # Try direct search
    if expected.encode('ascii') in raw_data:
        pos = raw_data.find(expected.encode('ascii'))
        found_strings[expected] = pos
        print(f"  Found '{expected}' at offset {pos}")

# Method 3: Try interpreting as little-endian indices
print("\n=== Method 3: Interpreting as indices/offsets ===")
# Maybe the format uses indices into a string table
# Look for patterns that might be string table references
for i in range(0, min(100, len(raw_data) - 4), 4):
    val = struct.unpack('<I', raw_data[i:i+4])[0]
    if 0 < val < len(raw_data):
        # Check if this offset points to something interesting
        if val < len(raw_data) - 10:
            potential = raw_data[val:val+20]
            if all(32 <= b <= 126 for b in potential[:10]):
                try:
                    s = potential.split(b'\x00')[0].decode('ascii', errors='ignore')
                    if len(s) >= 3 and any(c.isalnum() for c in s):
                        print(f"  Offset {i} -> index {val} -> '{s[:20]}'")
                except:
                    pass

# Method 4: Try XOR with different patterns
print("\n=== Method 4: Testing XOR patterns ===")
# Maybe it's XOR encrypted with a key derived from the file
for key_byte in [0x00, 0x38, 0x24, 0x20, 0x55, 0xFF]:
    result = bytes(b ^ key_byte for b in raw_data[:50])
    readable = sum(1 for b in result if 32 <= b <= 126)
    if readable > 20:
        print(f"  XOR key 0x{key_byte:02x}: {readable}/50 readable bytes")
        print(f"    Sample: {result[:30]}")

