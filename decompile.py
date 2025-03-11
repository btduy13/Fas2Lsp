from server.fas_parser import FasParser
import os
import sys

def main():
    parser = FasParser()
    input_file = 'PurgeDictionaryItems[PDI].fas'
    output_file = input_file.rsplit('.', 1)[0] + '.lsp'
    
    parser.parse_file(input_file)  # Parse file regardless of return value
    
    if parser.functions or parser.symbols:  # If we have any content
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
    else:
        print("No content found in FAS file")

if __name__ == '__main__':
    main() 