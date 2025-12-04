#!/usr/bin/env python3
"""Test different decoding methods for FAS4 bytecode."""

import struct

# Read the file
with open('PDI.fas', 'rb') as f:
    data = f.read()

# Extract bytecode
header_pos = data.find(b'FAS4-FILE')
size_pos = data.find(b'517')
size_end = data.find(b'\n', size_pos) + 1
if size_end < len(data) and data[size_end] == ord('\n'):
    size_end += 1

raw_data = data[size_end:size_end+517]
bytecode = raw_data[4:] if raw_data[:4] == b'38 $' else raw_data

print(f"Bytecode size: {len(bytecode)} bytes\n")

# Try to find the actual string encoding
# Maybe strings are stored with a specific pattern
# Try looking for length-prefixed strings at different offsets

print("=== Trying to find string table structure ===\n")

# Check offset 276 (first uint32)
if len(bytecode) > 276:
    print(f"Bytes at offset 276-300:")
    print(' '.join(f'{b:02x}' for b in bytecode[276:300]))
    print()
    
    # Try different interpretations
    # Maybe it's: [count] [string1_len] [string1] [string2_len] [string2] ...
    # Or: [offset_table] [strings]
    
    # Try reading as string count
    str_count = struct.unpack('<I', bytecode[276:280])[0] if len(bytecode) > 280 else 0
    print(f"At offset 276, uint32 = {str_count}")
    
    # Try reading strings from this offset
    pos = 280
    strings_found = []
    for i in range(min(20, str_count if str_count < 100 else 20)):
        if pos + 4 > len(bytecode):
            break
        length = struct.unpack('<I', bytecode[pos:pos+4])[0]
        if 4 <= length <= 200 and pos + 4 + length <= len(bytecode):
            potential = bytecode[pos+4:pos+4+length]
            printable = sum(1 for b in potential if 32 <= b <= 126)
            if printable >= length * 0.7:
                try:
                    s = potential.decode('ascii', errors='ignore').rstrip('\x00')
                    if len(s) >= 3:
                        strings_found.append((pos, s))
                        print(f"  String at {pos}: '{s[:50]}'")
                        pos += 4 + length
                        continue
                except:
                    pass
        pos += 1
        if pos >= len(bytecode):
            break

print(f"\nFound {len(strings_found)} potential strings")

