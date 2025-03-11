#!/usr/bin/env python3
import os
import sys
import argparse
from server.fas_parser import FasParser
from server.fas4_parser import Fas4Parser

def detect_fas_format(file_path):
    """Detect if the file is in FAS4 format or standard FAS format."""
    with open(file_path, 'rb') as f:
        # Skip any leading whitespace
        while True:
            byte = f.read(1)
            if not byte or byte not in b' \r\n\t':
                break
        
        # Check for FAS4 format
        header = byte + f.read(9)  # "FAS4-FILE"
        if header == b'FAS4-FILE ':
            return "FAS4"
        else:
            return "STANDARD"

def decompile_fas(input_file, output_file=None):
    """Decompile a FAS file to LSP format."""
    if not os.path.exists(input_file):
        print(f"Error: Input file '{input_file}' not found")
        return False
    
    # Determine output file name if not provided
    if output_file is None:
        output_file = os.path.splitext(input_file)[0] + '.lsp'
    
    # Detect FAS format
    fas_format = detect_fas_format(input_file)
    print(f"Detected format: {fas_format}")
    
    if fas_format == "FAS4":
        # Use FAS4 parser
        parser = Fas4Parser()
        decoded_data = parser.parse_file(input_file)
        
        if not decoded_data:
            print("Error: Failed to decode FAS4 file")
            return False
            
        # Save the decoded LISP code
        with open(output_file, 'wb') as f:  # Use binary mode to avoid encoding issues
            f.write(decoded_data)
            
        print(f"\nDecompiled code written to: {os.path.abspath(output_file)}")
        print("\nDecompiled code:")
        print("-" * 40)
        print(decoded_data.decode('ascii', errors='replace'))
        
        return True
    else:
        # Use standard FAS parser
        parser = FasParser()
        parser.parse_file(input_file)
        
        if not parser.functions and not parser.symbols:
            print("No content found in FAS file")
            return False
            
        print(f"\nSuccessfully parsed {input_file}")
        
        # Write decompiled code to file
        with open(output_file, 'w') as f:
            # Write symbols as global variables
            for sym in parser.symbols.values():
                if isinstance(sym.value, (int, float)):
                    f.write(f"(setq {sym.name} {sym.value})\n")
                elif isinstance(sym.value, str):
                    f.write(f'(setq {sym.name} "{sym.value}")\n')
                elif sym.value is None:
                    f.write(f"(setq {sym.name} nil)\n")
            f.write("\n")
            
            # Write functions
            for func in parser.functions:
                f.write(parser.decompile_function(func))
                f.write("\n")
        
        print(f"\nDecompiled code written to: {os.path.abspath(output_file)}")
        
        # Also show the decompiled code in terminal
        print("\nDecompiled code:")
        print("-" * 40)
        with open(output_file, 'r') as f:
            print(f.read())
        
        print("\nSymbols:")
        print("-" * 40)
        for sym in parser.symbols.values():
            print(f"{sym.name}: {sym.value}")
        
        print("\nString table:")
        print("-" * 40)
        for idx, string in parser.string_table.items():
            print(f"[{idx}] = '{string}'")
            
        return True

def main():
    # Set up command line argument parsing
    parser = argparse.ArgumentParser(description='Decompile FAS files to LSP format')
    parser.add_argument('input_file', help='Path to the FAS file to decompile')
    parser.add_argument('-o', '--output', help='Output LSP file path (default: same name with .lsp extension)')
    
    # Parse arguments
    args = parser.parse_args()
    
    # Decompile the file
    success = decompile_fas(args.input_file, args.output)
    
    # Return appropriate exit code
    return 0 if success else 1

if __name__ == '__main__':
    sys.exit(main()) 