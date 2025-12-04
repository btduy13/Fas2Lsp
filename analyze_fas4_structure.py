#!/usr/bin/env python3
"""Analyze the FAS4 file structure in detail."""

import struct

# Read the file
with open('PDI.fas', 'rb') as f:
    data = f.read()

print(f"Total file size: {len(data)} bytes\n")

# Find the FAS4-FILE header
header_pos = data.find(b'FAS4-FILE')
print(f"FAS4-FILE header found at offset: {header_pos}")

# Find the size line
size_pos = data.find(b'517')
print(f"Size '517' found at offset: {size_pos}")

# Find where data starts
size_end = data.find(b'\n', size_pos) + 1
if size_end < len(data) and data[size_end] == ord('\n') and data[size_end - 1] == ord('\r'):
    size_end += 1

raw_data = data[size_end:size_end+517]
print(f"Raw data section: {len(raw_data)} bytes")
print(f"Data starts at file offset: {size_end}\n")

# Analyze the first bytes
print("First 50 bytes as hex:")
print(' '.join(f'{b:02x}' for b in raw_data[:50]))
print("\nFirst 50 bytes as ASCII (printable only):")
print(''.join(chr(b) if 32 <= b <= 126 else '.' for b in raw_data[:50]))
print("\nFirst 50 bytes as integers:")
print([b for b in raw_data[:50]])

# Try interpreting as different data types
print("\n=== Trying different interpretations ===")

# As little-endian uint32s
print("\nAs little-endian uint32s (first 10):")
for i in range(0, min(40, len(raw_data)), 4):
    if i + 4 <= len(raw_data):
        val = struct.unpack('<I', raw_data[i:i+4])[0]
        print(f"  Offset {i:3d}: {val:10d} (0x{val:08x})")

# As big-endian uint32s
print("\nAs big-endian uint32s (first 10):")
for i in range(0, min(40, len(raw_data)), 4):
    if i + 4 <= len(raw_data):
        val = struct.unpack('>I', raw_data[i:i+4])[0]
        print(f"  Offset {i:3d}: {val:10d} (0x{val:08x})")

# Look for patterns
print("\n=== Looking for patterns ===")
# Check if first bytes might be a header
first_4 = raw_data[:4]
print(f"First 4 bytes: {first_4} (hex: {' '.join(f'{b:02x}' for b in first_4)})")

# Check if it might be a size field
if len(raw_data) >= 4:
    possible_size = struct.unpack('<I', raw_data[0:4])[0]
    print(f"First 4 bytes as uint32 (LE): {possible_size}")
    if possible_size < len(raw_data):
        print(f"  Could be a size field pointing to offset {possible_size}")

# Look for repeated patterns
print("\n=== Looking for repeated byte sequences ===")
from collections import Counter
seq_2 = Counter()
seq_4 = Counter()
for i in range(len(raw_data) - 4):
    seq_2[raw_data[i:i+2]] += 1
    seq_4[raw_data[i:i+4]] += 1

print("Most common 2-byte sequences:")
for seq, count in seq_2.most_common(5):
    print(f"  {seq.hex()}: {count} times")

print("Most common 4-byte sequences:")
for seq, count in seq_4.most_common(5):
    print(f"  {seq.hex()}: {count} times")

# Check if data might be XOR-encrypted with different keys
print("\n=== Testing XOR decryption with different keys ===")
for key in [0x00, 0x55, 0xFF, 0xAA, 0x5A]:
    result = bytes(b ^ key for b in raw_data[:20])
    if any(32 <= b <= 126 for b in result[:10]):
        print(f"Key 0x{key:02x}: {result[:20]}")

