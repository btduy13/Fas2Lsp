import os
import sys
from server.fas4_parser import Fas4Parser

def main():
    # Get input file
    input_file = "PurgeDictionaryItems[PDI].fas"
    output_file = "PURGE_DICTIONARY_ITEMS.lsp"  # Use standard LSP name
    
    if not os.path.exists(input_file):
        print(f"Error: Input file {input_file} not found")
        return 1
        
    # Parse FAS4 file
    parser = Fas4Parser()
    decoded_data = parser.parse_file(input_file)
    
    if not decoded_data:
        print("Error: Failed to decode FAS4 file")
        return 1
        
    # Save the decoded LISP code
    with open(output_file, 'wb') as f:  # Use binary mode to avoid encoding issues
        f.write(decoded_data)
        
    print(f"\nDecompiled code written to: {os.path.abspath(output_file)}")
    print("\nDecompiled code:")
    print("-" * 40)
    print(decoded_data.decode('ascii', errors='replace'))
    
    return 0

if __name__ == "__main__":
    sys.exit(main()) 