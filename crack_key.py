#!/usr/bin/env python3
"""
Crack the FAS4 encryption key and decrypt the resource stream.
Based on reverse engineering the Fas-Disasm VB6 source (FasFile.cls).

The encryption algorithm is:
  key_old = key[0]
  for each byte in encrypted_stream:
    key_new = key[pos % len(key)]
    decrypted = byte ^ key_new ^ key_old
    key_old = key_new

The key is embedded in the FAS file between the code stream and the resource stream.
Format: <key_length_byte><key_bytes><'$' terminator>
The key format is: random_string(6..11) + "\n;fas4 crunch\n;"
"""

import struct
import re
import os

def parse_fas4(filepath):
    """Parse FAS4 file and extract all components including the encryption key."""
    with open(filepath, 'rb') as f:
        data = f.read()

    # Find header
    hdr = b' FAS4-FILE ; Do not change it!\r\n'
    hpos = data.find(hdr)
    if hpos == -1:
        raise ValueError("Not a valid FAS4 file")

    after = hpos + len(hdr)
    
    # Read FAS version from before header
    fas_version = 4

    # Get total size of code stream
    size_end = data.find(b'\r\n', after)
    code_stream_len = int(data[after:size_end])
    code_start = size_end + 2
    
    # Parse the code stream header: "NSYMS $" 
    code_data = data[code_start:code_start + code_stream_len]
    
    m = re.match(rb'(\d+) \$', code_data)
    if not m:
        raise ValueError("Could not find NSYMS header")
    nsyms = int(m.group(1))
    bytecode = code_data[m.end():]
    
    # After code stream, find the key and resource stream
    after_code = code_start + code_stream_len
    rest = data[after_code:]
    
    print(f"After code stream at offset 0x{after_code:x}")
    print(f"Rest bytes (first 100): {rest[:100]}")
    print(f"Rest hex: {rest[:100].hex()}")
    
    # The key starts right after the code stream
    # Format: ... <whitespace> <key_length_byte> <key_bytes> <terminator '$'>
    # Then: resource_stream_length resource_stream_vars '$' <resource_data>
    
    # Look for the pattern: the part between code stream and resource stream
    # contains the encryption key
    
    # Find the resource stream header: "LENGTH VARS $"
    # The resource stream header pattern is: digits + space + digits + space + '$'
    res_m = re.search(rb'(\d+) (\d+) \$', rest)
    if not res_m:
        print("WARNING: Could not find resource stream header")
        return None
    
    res_stream_len = int(res_m.group(1))
    res_stream_vars = int(res_m.group(2))
    res_data_start = res_m.end()
    res_data = rest[res_data_start:res_data_start + res_stream_len]
    
    # The key is between the code stream terminator and the resource header
    # Let's look at the bytes between code end and resource header
    between = rest[:res_m.start()]
    print(f"\nBytes between code and resource streams:")
    print(f"  Length: {len(between)}")
    print(f"  Hex: {between.hex()}")
    print(f"  Repr: {between!r}")
    
    # Parse the key
    # The format is: <possible whitespace> <key_length_byte> <key_data> <terminator>
    # Looking at the VB code:
    #   keylength = Asc(tmpChar)  -- single byte = key length
    #   Key = .FixedString(keylength)  -- key bytes
    #   tmpChar = .char  -- '$' terminator
    
    # In the 'between' data, we need to find the key
    # The between data starts with some bytes and ends before the resource header
    
    # Let's try: the first byte might be a length, followed by key data, then '$'
    # Or there might be whitespace/newlines first
    
    # From FasFile.cls getStreamData:
    # 1. Read code stream length -> already done
    # 2. Fill code stream with data 
    # 3. Then comes: key_length + key + '$'
    
    # Let's check: the 'between' bytes
    # between = rest[:res_m.start()]
    # Between should be: <tail_of_code_section> + <keylength> + <key> + '$'
    
    # Actually, let's look at this more carefully
    # The tail bytes are: 19 04 00 16 24 0d 0a
    # 19 = DEFUN_END, 04 00 = operand, 16 = END_BLOCK  
    # Then 24 = '$' (ASCII), 0d 0a = \r\n
    # So the code terminator is '$'
    # After that: 0d 0a (line break)
    
    # Then the resource stream section starts with a number
    # But before that there's the key!
    
    # Let me look at the raw file directly
    pos = after_code
    print(f"\n=== Scanning from offset 0x{pos:x} ===")
    
    # Skip to find the key section
    # After the code stream, there might be a newline, then key
    
    # According to VB source, getStreamData does:
    # 1. Reads the stream data
    # 2. Then reads keylength byte
    # 3. Then reads key bytes 
    # 4. Then reads '$' terminator
    
    # Actually, looking more carefully at the VB code:
    # The getStreamData function is called for BOTH code and resource streams
    # For the code stream: getStreamData StreamLength, StreamVars, OutStream
    # After that, it reads the key.
    
    # But wait - the key is part of getStreamData!
    # Let me re-read the code...
    
    # Actually from the VB code:
    # FASStreamLoad for code stream
    #   getStreamData -> reads the code data
    # Then the next call:
    # FASStreamLoad for resource stream  
    #   getStreamData -> reads the resource data
    
    # And getStreamData internally handles the key/encryption
    
    # Let me look at what getStreamData does by checking the bytes
    
    # Looking at the raw data around the boundary:
    raw_around = data[after_code-5:after_code+50]
    print(f"Around boundary: {raw_around.hex()}")
    print(f"Around boundary repr: {raw_around!r}")
    
    # OK let me just look at the entire between section character by character
    print(f"\nBetween section byte-by-byte:")
    for i, b in enumerate(between):
        print(f"  [{i:3d}] 0x{b:02x} ({b:3d}) '{chr(b) if 32 <= b < 127 else '.'}'")
    
    # Now let's extract the key
    # The key is: random_part + "\n;fas4 crunch\n;"
    crunch_marker = b'\n;fas4 crunch\n;'
    key_pos = between.find(crunch_marker)
    if key_pos >= 0:
        print(f"\nFound crunch marker at position {key_pos} in between section")
        # Key starts at beginning (after the length byte)
        # The length byte is the first byte of 'between'
        key_len = between[0]
        key = between[1:1+key_len]
        print(f"Key length byte: {key_len}")
        print(f"Key: {key!r}")
        print(f"Key hex: {key.hex()}")
        
        # Now decrypt the resource stream
        print(f"\n=== Decrypting resource stream ===")
        print(f"Resource stream: {res_stream_len} bytes, {res_stream_vars} items")
        
        decrypted = decrypt_stream(res_data, key)
        print(f"Decrypted (first 500 bytes): {decrypted[:500]!r}")
        
        return {
            'nsyms': nsyms,
            'bytecode': bytecode,
            'key': key,
            'res_data_encrypted': res_data,
            'res_data': decrypted,
            'res_vars': res_stream_vars,
        }
    else:
        print("\nCrunch marker not found in between section")
        # Try looking in the full rest
        key_pos = rest.find(crunch_marker)
        if key_pos >= 0:
            print(f"Found crunch marker at position {key_pos} in rest")
            # Walk back to find the key start
            # The key format: <random 6-11 chars> + crunch_marker
            # So the key is at most 11 + len(crunch_marker) = 26 bytes before
            for klen in range(6, 12):
                potential_key_start = key_pos - klen
                if potential_key_start >= 0:
                    potential_key = rest[potential_key_start:key_pos + len(crunch_marker)]
                    # Check: byte before potential_key should be the length
                    if potential_key_start > 0:
                        length_byte = rest[potential_key_start - 1]
                        if length_byte == len(potential_key):
                            print(f"Found key! Length={length_byte}")
                            print(f"Key: {potential_key!r}")
                            key = potential_key
                            
                            decrypted = decrypt_stream(res_data, key)
                            print(f"\nDecrypted (first 500): {decrypted[:500]!r}")
                            
                            return {
                                'nsyms': nsyms,
                                'bytecode': bytecode,
                                'key': key,
                                'res_data_encrypted': res_data,
                                'res_data': decrypted,
                                'res_vars': res_stream_vars,
                            }
        
        print("Could not find encryption key!")
        return None

def decrypt_stream(encrypted, key):
    """Decrypt using the FAS4 XOR cipher with rolling key."""
    result = bytearray(len(encrypted))
    key_old = key[0]
    key_pos = 0
    
    for i in range(len(encrypted)):
        if key_pos >= len(key):
            key_pos = 0
        key_new = key[key_pos]
        result[i] = encrypted[i] ^ key_new ^ key_old
        key_old = key_new
        key_pos += 1
    
    return bytes(result)


if __name__ == '__main__':
    import sys
    filepath = sys.argv[1] if len(sys.argv) > 1 else 'PDI.fas'
    print(f"=== Cracking {filepath} ===\n")
    result = parse_fas4(filepath)
    if result:
        print(f"\n=== SUCCESS ===")
        print(f"Symbols: {result['nsyms']}")
        print(f"Bytecode: {len(result['bytecode'])} bytes")
        print(f"Key: {result['key']!r}")
        print(f"Decrypted resource: {len(result['res_data'])} bytes")
