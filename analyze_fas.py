def analyze_fas4(filename):
    """Analyze a FAS4 file format."""
    with open(filename, 'rb') as f:
        # Read the file content
        content = f.read()
        
        # Print file info
        print(f"File size: {len(content)} bytes")
        print("\nFirst 100 bytes (hex):")
        print(' '.join(f'{b:02x}' for b in content[:100]))
        print("\nFirst 100 bytes (ASCII):")
        print(''.join(chr(b) if 32 <= b <= 126 else '.' for b in content[:100]))
        
        # Try to find patterns
        print("\nPossible structure:")
        pos = 0
        while pos < len(content):
            # Skip whitespace
            while pos < len(content) and content[pos:pos+1].isspace():
                pos += 1
            if pos >= len(content):
                break
                
            # Read a chunk
            chunk_start = pos
            while pos < len(content) and not content[pos:pos+1].isspace():
                pos += 1
            chunk = content[chunk_start:pos]
            
            # Analyze chunk
            if len(chunk) > 0:
                print(f"\nChunk at offset {chunk_start}:")
                print(f"  Raw: {chunk}")
                print(f"  Hex: {' '.join(f'{b:02x}' for b in chunk)}")
                try:
                    text = chunk.decode('ascii', errors='ignore')
                    print(f"  ASCII: {text}")
                except:
                    pass

if __name__ == '__main__':
    analyze_fas4('PurgeDictionaryItems[PDI].fas') 