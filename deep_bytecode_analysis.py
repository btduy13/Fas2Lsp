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

print("=== Deep Bytecode Analysis ===\n")

if raw_data[:4] == b'38 $':
    bytecode = raw_data[4:]
    print(f"Bytecode: {len(bytecode)} bytes\n")
    
    # Check offset 276 (first uint32)
    if len(bytecode) > 276:
        print(f"=== Analyzing offset 276 (potential string table) ===\n")
        offset = 276
        print(f"Bytes at offset 276-300:")
        print(' '.join(f'{b:02x}' for b in bytecode[offset:offset+24]))
        print()
        
        # Try reading as string table entries
        for i in range(10):
            try:
                if offset + 8 < len(bytecode):
                    idx = struct.unpack('<I', bytecode[offset:offset+4])[0]
                    length = struct.unpack('<I', bytecode[offset+4:offset+8])[0]
                    print(f"  Entry {i} at {offset}: idx={idx}, length={length}")
                    
                    if 4 <= length <= 200 and offset + 8 + length <= len(bytecode):
                        potential = bytecode[offset+8:offset+8+length]
                        printable = sum(1 for b in potential if 32 <= b <= 126)
                        print(f"    Printable: {printable}/{length} ({printable*100//length}%)")
                        if printable >= length * 0.5:
                            try:
                                s = potential.decode('ascii', errors='ignore').rstrip('\x00')
                                print(f"    String: '{s[:60]}'")
                            except:
                                pass
                        offset += 8 + length
                    else:
                        break
            except:
                break
    
    # Try XOR decoding at different offsets
    print(f"\n=== Trying XOR decoding ===\n")
    for xor_key in [0x38, 0x24, 0x13, 0x55, 0xAA, 0xFF]:
        decoded = bytes(b ^ xor_key for b in bytecode[276:276+100])
        # Look for known strings
        if b'ACAD' in decoded or b'princ' in decoded.lower() or b'setq' in decoded.lower():
            print(f"XOR key 0x{xor_key:02x} found potential strings!")
            # Find strings in decoded data
            current = bytearray()
            for i, byte in enumerate(decoded):
                if 32 <= byte <= 126:
                    current.append(byte)
                else:
                    if len(current) >= 4:
                        try:
                            s = current.decode('ascii')
                            if any(c.isalpha() for c in s) and len(s) >= 4:
                                print(f"  Found: '{s}'")
                        except:
                            pass
                    current = bytearray()
