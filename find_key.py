#!/usr/bin/env python3
"""Find the exact FAS4 encryption key in the file."""

with open('PDI.fas', 'rb') as f:
    data = f.read()

# Find the crunch marker
crunch_full = b'\n;fas4 crunch\n;'
crunch_pos = data.find(crunch_full)
print(f'Full crunch marker at: 0x{crunch_pos:x} ({crunch_pos})')

# Context around it
start = max(0, crunch_pos - 30)
end = min(len(data), crunch_pos + len(crunch_full) + 10)
for i in range(start, end):
    b = data[i]
    ch = chr(b) if 32 <= b < 127 else '.'
    print(f'  [{i:4d}] 0x{i:04x}: 0x{b:02x} ({b:3d}) {ch!r}')

# Try all random lengths 6-11
for rlen in range(6, 12):
    key_start = crunch_pos - rlen
    key_end = crunch_pos + len(crunch_full)
    key_len = key_end - key_start
    length_byte_pos = key_start - 1
    if length_byte_pos >= 0:
        length_byte = data[length_byte_pos]
        if length_byte == key_len:
            print(f'\nFOUND KEY!')
            print(f'  Random length: {rlen}')
            print(f'  Key length byte at 0x{length_byte_pos:x} = {length_byte}')
            key = data[key_start:key_end]
            print(f'  Key ({len(key)} bytes): {key!r}')
            print(f'  Key hex: {key.hex()}')
            term = data[key_end]
            print(f'  Terminator: 0x{term:02x}')
            
            # Now decrypt the resource stream with this key
            # Resource stream is at the known location
            # After: "719 5 $"
            res_marker = b'719 5 $'
            res_pos = data.find(res_marker)
            if res_pos >= 0:
                res_data_start = res_pos + len(res_marker)
                encrypted = data[res_data_start:res_data_start + 719]
                
                # Decrypt
                result = bytearray(len(encrypted))
                key_old = key[0]
                kp = 0
                for i in range(len(encrypted)):
                    if kp >= len(key):
                        kp = 0
                    key_new = key[kp]
                    result[i] = encrypted[i] ^ key_new ^ key_old
                    key_old = key_new
                    kp += 1
                
                print(f'\nDecrypted (first 200): {bytes(result[:200])!r}')
                
                # Try alternate: maybe key starts from index 1
                result2 = bytearray(len(encrypted))
                key_old = key[0]
                kp = 1  # start from second byte
                for i in range(len(encrypted)):
                    if kp >= len(key):
                        kp = 0
                    key_new = key[kp]
                    result2[i] = encrypted[i] ^ key_new ^ key_old
                    key_old = key_new
                    kp += 1
                
                print(f'\nAlt decrypt (first 200): {bytes(result2[:200])!r}')
                
                # Try simplest XOR: just cycle the key
                result3 = bytearray(len(encrypted))
                for i in range(len(encrypted)):
                    result3[i] = encrypted[i] ^ key[i % len(key)]
                print(f'\nSimple XOR (first 200): {bytes(result3[:200])!r}')
