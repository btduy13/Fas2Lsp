#!/usr/bin/env python3
"""Deep analysis of FAS4 bytecode to understand the format."""

import struct

# Read the file
with open('PDI.fas', 'rb') as f:
    data = f.read()

# Extract data section
header_pos = data.find(b'FAS4-FILE')
size_pos = data.find(b'517')
size_end = data.find(b'\n', size_pos) + 1
if size_end < len(data) and data[size_end] == ord('\n') and data[size_end - 1] == ord('\r'):
    size_end += 1

raw_data = data[size_end:size_end+517]

print("=== Deep Analysis of FAS4 Bytecode ===\n")
print(f"Data size: {len(raw_data)} bytes")
print(f"First 100 bytes (hex): {' '.join(f'{b:02x}' for b in raw_data[:100])}\n")

# Analyze bytecode patterns
print("=== Bytecode Pattern Analysis ===")
# Look for common patterns that might be opcodes
opcode_counts = {}
for i in range(len(raw_data) - 1):
    opcode = raw_data[i]
    opcode_counts[opcode] = opcode_counts.get(opcode, 0) + 1

print("Most common bytes (potential opcodes):")
for opcode, count in sorted(opcode_counts.items(), key=lambda x: x[1], reverse=True)[:20]:
    print(f"  0x{opcode:02x} ({opcode:3d}): {count:4d} times")

# Look for instruction-like patterns
print("\n=== Looking for instruction sequences ===")
# Common patterns: opcode followed by operands
for i in range(min(200, len(raw_data) - 8)):
    # Look for patterns like: opcode, operand1, operand2, etc.
    opcode = raw_data[i]
    if opcode in [0x00, 0x01, 0x03, 0x06, 0x14, 0x18, 0x21, 0x35]:
        # Check if followed by what might be operands
        if i + 4 < len(raw_data):
            operand1 = struct.unpack('<I', raw_data[i+1:i+5])[0] if i+5 <= len(raw_data) else 0
            operand2 = struct.unpack('<I', raw_data[i+5:i+9])[0] if i+9 <= len(raw_data) else 0
            if operand1 < 1000 and operand2 < 1000:  # Reasonable operand values
                print(f"  Offset {i:3d}: opcode=0x{opcode:02x}, op1={operand1}, op2={operand2}")

# Try to find string table or symbol references
print("\n=== Looking for string/symbol references ===")
# Maybe the format uses indices that point to strings
# Try interpreting sequences as: [opcode] [index1] [index2] ...
for i in range(0, min(100, len(raw_data) - 12), 4):
    # Try reading as: opcode (1 byte) + index (4 bytes) + index (4 bytes) + ...
    if i + 1 < len(raw_data):
        potential_opcode = raw_data[i]
        if i + 5 < len(raw_data):
            idx1 = struct.unpack('<I', raw_data[i+1:i+5])[0]
            if 0 < idx1 < len(raw_data):
                # Check if this index points to something interesting
                if idx1 < len(raw_data) - 10:
                    potential_str = raw_data[idx1:idx1+20]
                    readable = sum(1 for b in potential_str if 32 <= b <= 126)
                    if readable > 10:
                        try:
                            s = potential_str.split(b'\x00')[0].decode('ascii', errors='ignore')
                            if len(s) >= 3:
                                print(f"  Offset {i}: opcode=0x{potential_opcode:02x}, idx={idx1} -> '{s[:30]}'")
                        except:
                            pass

# Try different interpretations of the data structure
print("\n=== Trying different data structure interpretations ===")
# Maybe it's: [header] [string_table_size] [strings...] [code...]
# Or: [magic] [version] [tables...] [bytecode...]

# Check if "38 $" might be "38" (size?) and "$" (marker?)
if raw_data[:4] == b'38 $':
    print("Found '38 $' header")
    # Maybe "38" is a size or version?
    # Try parsing after this header
    after_header = raw_data[4:]
    print(f"Data after header: {len(after_header)} bytes")
    
    # Try reading as structured data
    if len(after_header) >= 4:
        first_val = struct.unpack('<I', after_header[0:4])[0]
        print(f"First value after header (LE uint32): {first_val}")
        if first_val < len(after_header):
            print(f"  Could be an offset/size pointing to offset {first_val}")

