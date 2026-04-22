#!/usr/bin/env python3
"""
Full FAS4 decryptor + resource parser.
Correctly decrypts the resource stream and extracts symbols + strings.
"""

import struct
import re
import os
import sys

def find_key(data):
    """Find the FAS4 encryption key embedded in the file."""
    crunch_marker = b'\n;fas4 crunch\n;'
    pos = data.find(crunch_marker)
    if pos < 0:
        return None
    
    # Try random lengths 6-11
    for rlen in range(6, 12):
        key_start = pos - rlen
        key_end = pos + len(crunch_marker)
        key_len = key_end - key_start
        length_byte_pos = key_start - 1
        if length_byte_pos >= 0:
            if data[length_byte_pos] == key_len:
                return data[key_start:key_end]
    return None


def decrypt_stream(encrypted, key):
    """Decrypt using the FAS4 XOR cipher. Key cycles starting from index 1."""
    result = bytearray(len(encrypted))
    key_old = key[0]
    kp = 1  # Start from index 1!
    
    for i in range(len(encrypted)):
        if kp >= len(key):
            kp = 0
        key_new = key[kp]
        result[i] = encrypted[i] ^ key_new ^ key_old
        key_old = key_new
        kp += 1
    
    return bytes(result)


def parse_fas4_file(filepath):
    """Parse a FAS4 file, decrypt it, and extract all data."""
    with open(filepath, 'rb') as f:
        data = f.read()
    
    # Find header
    hdr = b' FAS4-FILE ; Do not change it!\r\n'
    hpos = data.find(hdr)
    if hpos == -1:
        raise ValueError("Not a valid FAS4 file")
    
    after = hpos + len(hdr)
    size_end = data.find(b'\r\n', after)
    code_stream_len = int(data[after:size_end])
    code_start = size_end + 2
    
    # Parse code stream
    code_data = data[code_start:code_start + code_stream_len]
    m = re.match(rb'(\d+) \$', code_data)
    if not m:
        raise ValueError("Could not find NSYMS header")
    nsyms = int(m.group(1))
    bytecode = code_data[m.end():]
    
    # Find key
    key = find_key(data)
    if not key:
        raise ValueError("Could not find encryption key")
    
    print(f"Key found ({len(key)} bytes): {key!r}")
    
    # Find resource stream header
    after_code = code_start + code_stream_len
    rest = data[after_code:]
    res_m = re.search(rb'(\d+) (\d+) \$', rest)
    if not res_m:
        raise ValueError("Could not find resource stream header")
    
    res_len = int(res_m.group(1))
    res_vars = int(res_m.group(2))
    res_data = rest[res_m.end():res_m.end() + res_len]
    
    # Decrypt resource stream
    decrypted = decrypt_stream(res_data, key)
    
    return {
        'nsyms': nsyms,
        'bytecode': bytecode,
        'key': key,
        'res_data': decrypted,
        'res_vars': res_vars,
    }


def parse_resource_stream(res_data, res_vars):
    """Parse the decrypted resource stream to extract symbols and strings.
    
    The resource stream contains opcodes similar to the code stream.
    Key opcodes for data:
    - 0x55: Load strings (inline string data)
    - 0x56/0x5B: Load symbols (zero-terminated strings)
    - 0x43: Init/setup
    - 0x14/0x15: defun
    - 0x34/0x35/0x51: function call (with GVar index)
    - 0x32: push int8
    - 0x33: push int32
    - 0x3B: push real (float as string)
    """
    pos = 0
    symbols = {}  # index -> name
    strings = []  # list of all strings found
    gvar_names = {}  # gvar index -> name
    
    # The resource stream sets up symbol tables and string tables
    # Let's parse it instruction by instruction
    
    items = []
    current_gvar = 0
    
    while pos < len(res_data):
        op = res_data[pos]
        
        if op == 0x14 or op == 0x15:  # defun
            # 4-byte: param_count (int8) + stuff
            param_count = res_data[pos+1] if pos+1 < len(res_data) else 0
            # Read function args, flags etc
            pos += 2
            # More parameters follow but hard to parse without full context
            # Skip the rest of this complex opcode
            
        elif op == 0x55:  # Load strings
            pos += 1
            if pos + 2 > len(res_data):
                break
            num_strings = struct.unpack('<H', res_data[pos:pos+2])[0]
            pos += 2
            for _ in range(num_strings):
                if pos + 2 > len(res_data):
                    break
                str_len = struct.unpack('<H', res_data[pos:pos+2])[0]
                pos += 2
                if pos + str_len > len(res_data):
                    break
                s = res_data[pos:pos+str_len]
                pos += str_len
                try:
                    strings.append(s.decode('ascii'))
                except:
                    strings.append(s.decode('latin-1'))
                items.append(('STRING', strings[-1]))
                
        elif op == 0x56 or op == 0x5B:  # Load symbols
            pos += 1
            # Read zero-terminated strings until empty string
            while pos < len(res_data):
                # Find the zero terminator
                end = res_data.find(b'\x00', pos)
                if end < 0:
                    break
                sym_name = res_data[pos:end]
                pos = end + 1
                if len(sym_name) == 0:
                    break  # Empty string = end of symbol list
                try:
                    name = sym_name.decode('ascii')
                except:
                    name = sym_name.decode('latin-1')
                items.append(('SYMBOL', name))
                
        elif op == 0x43:  # Init
            pos += 1
            # This sets up stringtables - skip for now
            
        elif op == 0x34 or op == 0x35 or op == 0x51:  # Function call
            pos += 1
            # param_count (int8)
            param_count = res_data[pos] if pos < len(res_data) else 0
            pos += 1
            
            if op == 0x35 or op == 0x51:
                # GVar index (int16)
                if pos + 2 <= len(res_data):
                    gvar_idx = struct.unpack('<H', res_data[pos:pos+2])[0]
                    pos += 2
                    items.append(('FUNC_REF', gvar_idx, param_count))
            
            # Flags (int8)
            if pos < len(res_data):
                flags = res_data[pos]
                pos += 1
                
        elif op == 0x32:  # Push int8
            pos += 1
            if pos < len(res_data):
                val = res_data[pos]
                # Interpret as signed
                if val > 127:
                    val -= 256
                pos += 1
                items.append(('INT8', val))
                
        elif op == 0x33:  # Push int32
            pos += 1
            if pos + 4 <= len(res_data):
                val = struct.unpack('<i', res_data[pos:pos+4])[0]
                pos += 4
                items.append(('INT32', val))
                
        elif op == 0x3B:  # Push real
            pos += 1
            # Read zero-terminated string representing a float
            end = res_data.find(b'\x00', pos)
            if end >= 0:
                float_str = res_data[pos:end]
                pos = end + 1
                items.append(('REAL', float_str.decode('ascii', errors='replace')))
            else:
                break
                
        elif op == 0x3A:  # Define function
            pos += 1
            # Skip for now
            
        elif op == 0x09:  # Push GVar on stack
            pos += 1
            if pos + 2 <= len(res_data):
                idx = struct.unpack('<H', res_data[pos:pos+2])[0]
                pos += 2
                items.append(('GVAR_PUSH', idx))
            
        elif op == 0x03:  # Push GVar16 on stack
            pos += 1
            if pos + 2 <= len(res_data):
                idx = struct.unpack('<H', res_data[pos:pos+2])[0]
                pos += 2
                items.append(('GVAR16_PUSH', idx))
                
        elif op == 0x06 or op == 0x1A or op == 0x1B:  # Pop into GVar16
            pos += 1
            if pos + 2 <= len(res_data):
                idx = struct.unpack('<H', res_data[pos:pos+2])[0]
                pos += 2
                items.append(('GVAR_STORE', idx))
                
        elif op == 0x0A:  # Pop dummy
            pos += 1
            items.append(('POP',))
            
        elif op == 0x01:  # Push nil
            pos += 1
            items.append(('NIL',))
            
        elif op == 0x02:  # Push T
            pos += 1
            items.append(('T',))
            
        elif op == 0x16:  # End defun
            pos += 1
            items.append(('DEFUN_END',))
            
        elif op == 0x1C:  # Init done
            pos += 1
            items.append(('INIT_DONE',))
            
        elif op == 0x18:  # Copy stack to local var (init args)
            pos += 1
            if pos + 2 <= len(res_data):
                param_count = struct.unpack('<H', res_data[pos:pos+2])[0]
                pos += 2
                items.append(('INIT_ARGS', param_count))
                
        elif op == 0x19:  # Clear args+vars
            pos += 1
            if pos + 2 <= len(res_data):
                count = struct.unpack('<H', res_data[pos:pos+2])[0]
                pos += 2
                items.append(('CLEAR_ARGS', count))
                
        elif op == 0x39:  # Ld_LIST
            pos += 1
            if pos + 2 <= len(res_data):
                count = struct.unpack('<H', res_data[pos:pos+2])[0]
                pos += 2
                items.append(('LIST', count))
                
        elif op == 0x37:  # List object
            pos += 1
            if pos + 2 <= len(res_data):
                count = struct.unpack('<H', res_data[pos:pos+2])[0]
                pos += 2
                items.append(('LISTOBJ', count))
                
        elif op == 0x67:  # Branch32 if true
            pos += 1
            if pos + 4 <= len(res_data):
                target = struct.unpack('<i', res_data[pos:pos+4])[0]
                pos += 4
                items.append(('BRANCH_TRUE', target))
                
        elif op == 0x57:  # Goto32
            pos += 1
            if pos + 4 <= len(res_data):
                target = struct.unpack('<i', res_data[pos:pos+4])[0]
                pos += 4
                items.append(('GOTO', target))
                
        elif op in (0x05, 0x5C):  # Push local var
            pos += 1
            if pos + 2 <= len(res_data):
                idx = struct.unpack('<H', res_data[pos:pos+2])[0]
                pos += 2
                items.append(('LOCAL_PUSH', idx))
            
        elif op == 0x5D:  # Pop into local var
            pos += 1
            if pos + 2 <= len(res_data):
                idx = struct.unpack('<H', res_data[pos:pos+2])[0]
                pos += 2
                items.append(('LOCAL_POP', idx))
                
        elif op in (0x20, 0x62, 0x63):  # NOP
            pos += 1
            
        elif op == 0x23:  # null/not
            pos += 1
            items.append(('NOT',))
            
        elif op == 0x24:  # atom
            pos += 1
            items.append(('ATOM',))
            
        elif op == 0x0B:  # Stack duplicate
            pos += 1
            items.append(('DUP',))
            
        elif op == 0x10:  # List step
            pos += 1
            items.append(('LIST_STEP',))
            
        elif op == 0x0C:  # Push Gvar16 on stack
            pos += 1
            if pos + 2 <= len(res_data):
                idx = struct.unpack('<H', res_data[pos:pos+2])[0]
                pos += 2
                items.append(('GVAR_PUSH2', idx))
                
        elif op == 0x5E:  # Clear local var
            pos += 1
            if pos + 2 <= len(res_data):
                idx = struct.unpack('<H', res_data[pos:pos+2])[0]
                pos += 2
                items.append(('LOCAL_CLEAR', idx))
                
        elif op == 0x1E:  # ??? alpha
            pos += 1
            if pos < len(res_data):
                pos += 1  # skip int8 param
                
        elif op == 0x1F:  # ??? beta
            pos += 1
            if pos < len(res_data):
                pos += 1  # skip int8 param
                
        elif op == 0x21:  # select/funcall
            pos += 1
            # Has sub-params but complex
            
        elif op == 0x07:  # ???
            pos += 1
            if pos + 2 <= len(res_data):
                pos += 2
                
        elif op == 0x0D or op == 0x3C:  # Branch16 if false
            pos += 1
            if pos + 2 <= len(res_data):
                pos += 2
                
        elif op == 0x0E or op == 0x3D:  # Branch16 if true
            pos += 1
            if pos + 2 <= len(res_data):
                pos += 2
                
        elif op == 0x6A:  # AND/Cond
            pos += 1
            if pos + 4 <= len(res_data):
                pos += 4
                
        elif op == 0x68:  # Cond
            pos += 1
            if pos + 4 <= len(res_data):
                pos += 4
                
        elif op == 0x69:  # Branch32
            pos += 1
            if pos + 4 <= len(res_data):
                pos += 4
                
        elif op == 0x3E:  # Pop and exit if not zero
            pos += 1
        elif op == 0x3F:  # Pop and exit if zero
            pos += 1
            
        elif op == 0x38:  # Convert
            pos += 1
            
        elif op == 0x40:  # ???
            pos += 1
            
        elif op == 0x00:  # nil/nop  
            pos += 1
            
        else:
            # Unknown opcode - skip
            print(f"  Unknown opcode 0x{op:02x} at pos {pos}")
            pos += 1
    
    return items


if __name__ == '__main__':
    filepath = sys.argv[1] if len(sys.argv) > 1 else 'PDI.fas'
    print(f"=== Processing {filepath} ===\n")
    
    result = parse_fas4_file(filepath)
    
    print(f"Symbols: {result['nsyms']}")
    print(f"Bytecode: {len(result['bytecode'])} bytes")
    print(f"Resource data: {len(result['res_data'])} bytes")
    print()
    
    # Write decrypted resource to file for inspection
    dec_path = os.path.splitext(filepath)[0] + '_decrypted.bin'
    with open(dec_path, 'wb') as f:
        f.write(result['res_data'])
    print(f"Decrypted resource written to: {dec_path}")
    
    # Parse the resource stream
    print(f"\n=== Parsing resource stream ===")
    items = parse_resource_stream(result['res_data'], result['res_vars'])
    
    print(f"\nFound {len(items)} items:")
    for i, item in enumerate(items):
        print(f"  [{i:4d}] {item}")
    
    # Extract just the symbols and strings
    print(f"\n=== SYMBOLS ===")
    syms = [item for item in items if item[0] == 'SYMBOL']
    for i, item in enumerate(syms):
        print(f"  [{i:3d}] {item[1]}")
    
    print(f"\n=== STRINGS ===")
    strs = [item for item in items if item[0] == 'STRING']
    for i, item in enumerate(strs):
        print(f"  [{i:3d}] {item[1]!r}")
