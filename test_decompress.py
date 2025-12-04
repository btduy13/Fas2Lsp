import zlib
import struct

# Read the file
with open('PDI.fas', 'rb') as f:
    data = f.read()

# Find the size
pos = data.find(b'517')
size_end = data.find(b'\n', pos) + 1
if size_end < len(data) and data[size_end] == ord('\n') and data[size_end - 1] == ord('\r'):
    size_end += 1

raw_data = data[size_end:size_end+517]
print(f"Raw data length: {len(raw_data)}")
print(f"First 50 bytes (hex): {' '.join(f'{b:02x}' for b in raw_data[:50])}")
print(f"First 50 bytes (repr): {repr(raw_data[:50])}")

# Check if it's already FAS format
if raw_data.startswith(b'FAS'):
    print("\nData already has FAS header - no decompression needed!")
else:
    print("\nNo FAS header found - trying decompression methods...")
    
    # Try zlib
    print("\nTrying zlib decompression...")
    try:
        decompressed = zlib.decompress(raw_data)
        print(f"Success! Decompressed size: {len(decompressed)}")
        print(f"First 100 bytes (hex): {' '.join(f'{b:02x}' for b in decompressed[:100])}")
        if decompressed.startswith(b'FAS'):
            print("Has FAS header!")
    except Exception as e:
        print(f"zlib failed: {e}")
    
    # Try treating as raw FAS data (maybe it's not compressed)
    print("\nTrying to parse as raw FAS data...")
    if len(raw_data) >= 4:
        print(f"First 4 bytes: {raw_data[:4]}")
        # Maybe it's a different format - try reading as little-endian integers
        if len(raw_data) >= 8:
            val1 = struct.unpack('<I', raw_data[0:4])[0]
            val2 = struct.unpack('<I', raw_data[4:8])[0]
            print(f"First two uint32s: {val1}, {val2}")

