import os
import sys
from server.fas4_parser import Fas4Parser

def main():
    # Get input file from command line or use default
    if len(sys.argv) > 1:
        input_file = sys.argv[1]
    else:
        input_file = "PDI.fas"
    
    # Generate output filename from input filename
    if input_file.endswith('.fas'):
        output_file = input_file[:-4] + '.lsp'
    else:
        output_file = input_file + '.lsp'
    
    # Allow custom output file
    if len(sys.argv) > 2:
        output_file = sys.argv[2]
    
    if not os.path.exists(input_file):
        print(f"Error: Input file '{input_file}' not found")
        print(f"\nUsage: python decompile_fas4.py [input.fas] [output.lsp]")
        print(f"Example: python decompile_fas4.py PDI.fas PDI.lsp")
        return 1
    
    print(f"Decompiling FAS4 file: {input_file}")
    print(f"Output will be written to: {output_file}\n")
        
    # Parse FAS4 file
    parser = Fas4Parser()
    decoded_data = parser.parse_file(input_file)
    
    if not decoded_data:
        print("Error: Failed to decode FAS4 file")
        return 1
        
    # Save the decoded LISP code
    with open(output_file, 'wb') as f:  # Use binary mode to avoid encoding issues
        f.write(decoded_data)
        
    print(f"\n[SUCCESS] Decompiled code written to: {os.path.abspath(output_file)}")
    print(f"\nDecompiled code preview:")
    print("-" * 60)
    preview = decoded_data.decode('ascii', errors='replace')
    # Show first 20 lines
    lines = preview.split('\n')
    for line in lines[:20]:
        print(line)
    if len(lines) > 20:
        print(f"... ({len(lines) - 20} more lines)")
    print("-" * 60)
    
    return 0

if __name__ == "__main__":
    sys.exit(main()) 