#!/usr/bin/env python3
"""Reverse engineer FAS4 bytecode to understand the format."""

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

print("=== Reverse Engineering FAS4 Bytecode ===\n")
print(f"Data: {len(raw_data)} bytes")
print(f"Starts with: {repr(raw_data[:20])}\n")

# The data starts with "38 $" - analyze what follows
if raw_data[:4] == b'38 $':
    bytecode = raw_data[4:]
    print(f"Bytecode (after '38 $'): {len(bytecode)} bytes\n")
    
    # Analyze the structure
    # First few bytes might be metadata
    print("First 20 bytes as hex:", ' '.join(f'{b:02x}' for b in bytecode[:20]))
    print("First 20 bytes as uint32s (LE):")
    for i in range(0, 20, 4):
        if i + 4 <= len(bytecode):
            val = struct.unpack('<I', bytecode[i:i+4])[0]
            print(f"  Offset {i:3d}: {val:10d} (0x{val:08x})")
    
    # Try to find patterns
    # Common opcodes: 0x00, 0x01, 0x03, 0x06, 0x14, 0x18, 0x21, 0x35
    print("\n=== Analyzing instruction patterns ===\n")
    
    # Try different interpretations
    # Maybe format is: [opcode: 1 byte] [operand: 1-4 bytes] ...
    # Or: [opcode: 1 byte] [operand_count: 1 byte] [operands...]
    
    # Look for repeated patterns that might be instructions
    instructions = []
    i = 0
    while i < len(bytecode) - 5:
        opcode = bytecode[i]
        
        # Try reading as: [opcode] [operand1: 4 bytes] [operand2: 4 bytes]
        if i + 9 <= len(bytecode):
            operand1 = struct.unpack('<I', bytecode[i+1:i+5])[0]
            operand2 = struct.unpack('<I', bytecode[i+5:i+9])[0]
            
            # If operands are reasonable values, might be an instruction
            if 0 <= operand1 < 10000 and 0 <= operand2 < 10000:
                if opcode in [0x00, 0x01, 0x03, 0x06, 0x14, 0x18, 0x21, 0x35]:
                    instructions.append((i, opcode, operand1, operand2))
                    if len(instructions) <= 30:
                        print(f"  Offset {i:3d}: opcode=0x{opcode:02x}, op1={operand1:5d}, op2={operand2:5d}")
        
        i += 1
    
    print(f"\nFound {len(instructions)} potential instructions")
    
    # Try to find string references
    # Maybe operands are indices into a string table
    print("\n=== Looking for string table ===\n")
    # Check if any offsets point to readable strings
    for offset in [0, 4, 8, 12, 16, 20, 24, 28, 32, 276]:
        if offset < len(bytecode):
            # Try reading as string table entry: [index] [length] [string]
            if offset + 8 < len(bytecode):
                idx = struct.unpack('<I', bytecode[offset:offset+4])[0]
                length = struct.unpack('<I', bytecode[offset+4:offset+8])[0]
                if 4 <= length <= 200 and offset + 8 + length < len(bytecode):
                    potential = bytecode[offset+8:offset+8+length]
                    if all(32 <= b <= 126 for b in potential):
                        try:
                            s = potential.decode('ascii')
                            print(f"  Offset {offset}: idx={idx}, length={length}, string='{s}'")
                        except:
                            pass

