#!/usr/bin/env python3
"""Reverse engineer FAS4 bytecode format by analyzing patterns."""

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
print(f"Data size: {len(raw_data)} bytes\n")

# The data starts with "38 $" - let's analyze what comes after
if raw_data[:4] == b'38 $':
    print("Header: '38 $'")
    bytecode = raw_data[4:]
    print(f"Bytecode size: {len(bytecode)} bytes\n")
    
    # Analyze bytecode structure
    # Common patterns suggest:
    # - Opcodes (single bytes like 0x00, 0x01, 0x03, 0x06, etc.)
    # - Operands (4-byte little-endian integers)
    # - String references (indices into string table)
    
    print("=== Analyzing bytecode structure ===\n")
    
    # Try to find string table
    # Strings might be stored as: [index: 4 bytes] [length: 4 bytes] [string bytes...]
    # Or: [length: 1-4 bytes] [string bytes...]
    
    pos = 0
    strings_found = {}
    
    # Method 1: Look for length-prefixed strings
    print("Method 1: Looking for length-prefixed strings...")
    i = 0
    while i < len(bytecode) - 4:
        # Try: [length: 1 byte] [string]
        if i + 1 < len(bytecode):
            length = bytecode[i]
            if 4 <= length <= 100 and i + 1 + length < len(bytecode):
                potential = bytecode[i+1:i+1+length]
                if all(32 <= b <= 126 for b in potential):
                    try:
                        s = potential.decode('ascii')
                        if any(c.isalnum() for c in s):
                            strings_found[i] = s
                            print(f"  Offset {i}: length={length}, string='{s}'")
                            i += 1 + length
                            continue
                    except:
                        pass
        
        # Try: [index: 4 bytes] [length: 4 bytes] [string]
        if i + 8 < len(bytecode):
            idx = struct.unpack('<I', bytecode[i:i+4])[0]
            length = struct.unpack('<I', bytecode[i+4:i+8])[0]
            if 4 <= length <= 100 and i + 8 + length < len(bytecode):
                potential = bytecode[i+8:i+8+length]
                if all(32 <= b <= 126 for b in potential):
                    try:
                        s = potential.decode('ascii')
                        if any(c.isalnum() for c in s):
                            strings_found[idx] = s
                            print(f"  Offset {i}: idx={idx}, length={length}, string='{s}'")
                            i += 8 + length
                            continue
                    except:
                        pass
        
        i += 1
    
    print(f"\nFound {len(strings_found)} strings\n")
    
    # Method 2: Analyze instruction patterns
    print("=== Analyzing instruction patterns ===\n")
    # Look for common opcode patterns
    # 0x00 appears 172 times - likely NIL or delimiter
    # 0x03 appears 57 times - likely an opcode
    # 0x01, 0x06, 0x14, 0x18, 0x21, 0x35 - other opcodes
    
    # Try to interpret as: [opcode: 1 byte] [operand1: 4 bytes] [operand2: 4 bytes] ...
    instructions = []
    i = 0
    while i < len(bytecode) - 5:
        opcode = bytecode[i]
        if opcode in [0x00, 0x01, 0x03, 0x06, 0x14, 0x18, 0x21, 0x35]:
            if i + 5 < len(bytecode):
                operand1 = struct.unpack('<I', bytecode[i+1:i+5])[0]
                if operand1 < 10000:  # Reasonable operand value
                    instructions.append((i, opcode, operand1))
                    if len(instructions) <= 20:  # Show first 20
                        print(f"  Offset {i:3d}: opcode=0x{opcode:02x}, operand={operand1}")
        i += 1
    
    print(f"\nFound {len(instructions)} potential instructions\n")
    
    # Method 3: Try to find function definitions
    # AutoLISP functions typically have:
    # - Function name
    # - Argument list
    # - Body (bytecode)
    print("=== Looking for function structure ===\n")
    # Maybe function starts with a marker, then name index, then args, then body
    
    # Check if any of the found strings match expected function names
    for idx, s in strings_found.items():
        if 'PDI' in s.upper() or 'defun' in s.lower() or s.startswith('c:'):
            print(f"  Potential function name at index {idx}: '{s}'")

