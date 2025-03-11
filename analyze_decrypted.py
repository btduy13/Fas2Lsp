from server.fas4_parser import Fas4Parser
import string

def analyze_data(data: bytes):
    """Analyze the decrypted data."""
    print(f"\nData size: {len(data)} bytes")
    
    # Print as hex
    print("\nFirst 100 bytes (hex):")
    print(' '.join(f'{b:02x}' for b in data[:100]))
    
    # Print as ASCII
    print("\nFirst 100 bytes (ASCII):")
    print(''.join(chr(b) if chr(b) in string.printable else '.' for b in data[:100]))
    
    # Analyze byte patterns
    print("\nByte frequency analysis:")
    freq = {}
    for b in data:
        freq[b] = freq.get(b, 0) + 1
    
    print("\nMost common bytes:")
    for b, count in sorted(freq.items(), key=lambda x: x[1], reverse=True)[:10]:
        print(f"0x{b:02x} ({chr(b) if chr(b) in string.printable else '.'}) : {count} times")
    
    # Look for patterns
    print("\nCommon sequences:")
    sequences = {}
    for i in range(len(data)-3):
        seq = data[i:i+4]
        sequences[seq] = sequences.get(seq, 0) + 1
    
    print("\nMost common 4-byte sequences:")
    for seq, count in sorted(sequences.items(), key=lambda x: x[1], reverse=True)[:5]:
        print(f"{' '.join(f'{b:02x}' for b in seq)} : {count} times")
    
    # Try to detect structure
    print("\nPossible structure markers:")
    for i in range(len(data)-4):
        if all(32 <= b <= 126 for b in data[i:i+4]):
            print(f"ASCII at {i}: {data[i:i+4].decode('ascii')}")

def main():
    parser = Fas4Parser()
    if parser.parse_file('PurgeDictionaryItems[PDI].fas'):
        print("Successfully parsed FAS4 file")
        
        decrypted = parser.get_decrypted_data()
        if decrypted:
            analyze_data(decrypted)
        else:
            print("Failed to decrypt data")
    else:
        print("Failed to parse FAS4 file")

if __name__ == '__main__':
    main() 