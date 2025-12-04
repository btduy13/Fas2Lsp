#!/usr/bin/env python3
"""Analyze bytecode to find how strings are encoded."""

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

print("=== Analyzing Bytecode for String Encoding ===\n")

if raw_data[:4] == b'38 $':
    bytecode = raw_data[4:]
    print(f"Bytecode: {len(bytecode)} bytes\n")
    
    # Expected strings that should be in the bytecode
    expected = [
        "ACAD_GROUP", "ACAD_LAYOUT", "ACAD_MATERIAL", "dict_name",
        "items_purged", "princ", "getstring", "namedobjdict"
    ]
    
    # Try different encoding methods
    print("=== Method 1: Direct search ===\n")
    for exp in expected:
        encoded = exp.encode('ascii')
        pos = bytecode.find(encoded)
        if pos >= 0:
            print(f"Found '{exp}' directly at offset {pos}")
        else:
            # Try XOR encoded
            for key in [0x00, 0xFF, 0x55, 0xAA, 0x38, 0x24]:
                xored = bytes(b ^ key for b in encoded)
                pos = bytecode.find(xored)
                if pos >= 0:
                    print(f"Found '{exp}' XOR-encoded (key=0x{key:02x}) at offset {pos}")
                    break
    
    # Try interpreting as indices
    print("\n=== Method 2: Index-based encoding ===\n")
    # Maybe strings are stored elsewhere and bytecode uses indices
    # Try to find a string table at different offsets
    for offset in [0, 4, 8, 12, 16, 20, 24, 28, 32, 64, 128, 256, 276]:
        if offset < len(bytecode) - 20:
            # Try reading as string table entry
            if offset + 8 < len(bytecode):
                idx = struct.unpack('<I', bytecode[offset:offset+4])[0]
                length = struct.unpack('<I', bytecode[offset+4:offset+8])[0]
                if 4 <= length <= 200 and offset + 8 + length < len(bytecode):
                    potential = bytecode[offset+8:offset+8+length]
                    printable = sum(1 for b in potential if 32 <= b <= 126)
                    if printable >= length * 0.7:
                        try:
                            s = potential.decode('ascii', errors='ignore').rstrip('\x00')
                            if len(s) >= 3 and any(c.isalnum() for c in s):
                                print(f"Potential string at offset {offset}: idx={idx}, len={length}, str='{s[:50]}'")
                        except:
                            pass
    
    # Try bytecode instruction interpretation
    print("\n=== Method 3: Instruction-based string references ===\n")
    # Maybe instructions reference strings by index
    # Look for patterns: [opcode] [string_index: 4 bytes]
    for i in range(min(300, len(bytecode) - 5)):
        opcode = bytecode[i]
        if opcode in [0x01, 0x03, 0x06, 0x14, 0x18, 0x21, 0x35]:
            if i + 5 <= len(bytecode):
                idx = struct.unpack('<I', bytecode[i+1:i+5])[0]
                # If index is reasonable, might be a string reference
                if 0 <= idx < 1000:
                    # Check if this index might point to a string
                    # (This is speculative - we'd need to know where strings are stored)
                    print(f"Potential string reference at {i}: opcode=0x{opcode:02x}, index={idx}")

