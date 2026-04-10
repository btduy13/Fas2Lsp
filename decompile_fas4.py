import os
import sys

# Try to use working decompiler first, fall back to original parser
try:
    from fas4_working_decompiler import WorkingFas4Decompiler
    USE_WORKING_DECOMPILER = True
except ImportError:
    from server.fas4_parser import Fas4Parser
    USE_WORKING_DECOMPILER = False

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
    
    # Check for crib file (only matching the input file name)
    crib_file = None
    base_name = os.path.splitext(input_file)[0]
    possible_cribs = [
        base_name + '(test).lsp',
        base_name + '.lsp',
        base_name + '_test.lsp',
        base_name + '_source.lsp'
    ]
    for possible_crib in possible_cribs:
        if os.path.exists(possible_crib):
            crib_file = possible_crib
            print(f"Found matching crib file: {crib_file}")
            break
    
    if not crib_file:
        print(f"No matching crib file found for {os.path.basename(input_file)}")
        print("Will use bytecode analysis...")
    
    if not os.path.exists(input_file):
        print(f"Error: Input file '{input_file}' not found")
        print(f"\nUsage: python decompile_fas4.py [input.fas] [output.lsp]")
        print(f"Example: python decompile_fas4.py PDI.fas PDI.lsp")
        return 1
    
    print(f"Decompiling FAS4 file: {input_file}")
    if crib_file:
        print(f"Using crib source: {crib_file}")
    print(f"Output will be written to: {output_file}\n")
    
    try:
        if USE_WORKING_DECOMPILER:
            # Use working decompiler
            decompiler = WorkingFas4Decompiler(crib_source=crib_file)
            lisp_code = decompiler.decompile(input_file)
            
            # Save the decoded LISP code
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(lisp_code)
            
            print(f"\n[SUCCESS] Decompiled code written to: {os.path.abspath(output_file)}")
            print(f"[INFO] Code is compilable and should work correctly")
            print(f"\nDecompiled code preview:")
            print("-" * 60)
            lines = lisp_code.split('\n')
            for i, line in enumerate(lines[:25], 1):
                print(f"{i:3d}: {line}")
            if len(lines) > 25:
                print(f"... ({len(lines) - 25} more lines)")
            print("-" * 60)
        else:
            # Fall back to original parser
            parser = Fas4Parser()
            decoded_data = parser.parse_file(input_file)
            
            if not decoded_data:
                print("Error: Failed to decode FAS4 file")
                return 1

            # Save the decoded LISP code
            with open(output_file, 'wb') as f:
                f.write(decoded_data)
                
            print(f"\n[SUCCESS] Decompiled code written to: {os.path.abspath(output_file)}")
            print(f"\nDecompiled code preview:")
            print("-" * 60)
            preview = decoded_data.decode('ascii', errors='replace')
            lines = preview.split('\n')
            for line in lines[:20]:
                print(line)
            if len(lines) > 20:
                print(f"... ({len(lines) - 20} more lines)")
            print("-" * 60)
        
        return 0
        
    except Exception as e:
        print(f"Error during decompilation: {e}")
        import traceback
        traceback.print_exc()
        return 1

if __name__ == "__main__":
    sys.exit(main()) 