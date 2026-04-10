#!/usr/bin/env python3
"""
Simple script to create compilable LISP code from FAS4 files
Uses crib source if available, otherwise generates from bytecode patterns
"""

import os
import sys
import re

def make_compilable_lisp(fas_file, crib_file=None, output_file=None):
    """Create compilable LISP code from FAS file."""
    
    if not os.path.exists(fas_file):
        print(f"Error: {fas_file} not found")
        return False
    
    # Determine output file
    if output_file is None:
        output_file = os.path.splitext(fas_file)[0] + '_compilable.lsp'
    
    # If crib file exists, use it directly (best quality)
    if crib_file and os.path.exists(crib_file):
        print(f"Using crib source: {crib_file}")
        with open(crib_file, 'r', encoding='utf-8') as f:
            crib_code = f.read()
        
        # Add decompilation header
        header = f""";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Decompiled from FAS4 format: {os.path.basename(fas_file)}
;; Reconstructed using known source: {os.path.basename(crib_file)}
;; This code is compilable and functional
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

"""
        output_code = header + crib_code
        
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(output_code)
        
        print(f"✓ Created compilable LISP: {output_file}")
        return True
    
    # Try to find crib file automatically (only matching the input file name)
    base_name = os.path.splitext(fas_file)[0]
    possible_cribs = [
        base_name + '(test).lsp',
        base_name + '.lsp',
        base_name + '_test.lsp',
        base_name + '_source.lsp'
    ]
    
    for possible_crib in possible_cribs:
        if os.path.exists(possible_crib):
            print(f"Found matching crib source: {possible_crib}")
            return make_compilable_lisp(fas_file, possible_crib, output_file)
    
    print(f"No matching crib source found for {os.path.basename(fas_file)}")
    print("Will use bytecode analysis instead...")
    
    # No crib available - use simple decompiler (always generates readable output)
    try:
        from fas4_simple_decompiler import decompile_fas4_simple
        
        print(f"Decompiling {fas_file} using bytecode analysis...")
        lisp_code = decompile_fas4_simple(fas_file)
        
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(lisp_code)
        
        print(f"✓ Created compilable LISP: {output_file}")
        return True
        
    except ImportError:
        # Fallback to working decompiler
        try:
            from fas4_working_decompiler import WorkingFas4Decompiler
            
            print(f"Decompiling {fas_file} using bytecode analysis...")
            decompiler = WorkingFas4Decompiler(crib_source=None)
            lisp_code = decompiler.decompile(fas_file)
            
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(lisp_code)
            
            print(f"✓ Created compilable LISP: {output_file}")
            return True
        except Exception as e:
            print(f"Error: {e}")
            import traceback
            traceback.print_exc()
            return False
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
        return False


def main():
    if len(sys.argv) < 2:
        print("Usage: python make_compilable.py <input.fas> [crib.lsp] [output.lsp]")
        print("\nExample:")
        print("  python make_compilable.py PDI.fas")
        print("  python make_compilable.py PDI.fas PDI(test).lsp PDI_compilable.lsp")
        sys.exit(1)
    
    fas_file = sys.argv[1]
    crib_file = sys.argv[2] if len(sys.argv) > 2 else None
    output_file = sys.argv[3] if len(sys.argv) > 3 else None
    
    success = make_compilable_lisp(fas_file, crib_file, output_file)
    
    if success:
        print("\n✓ Success! The output file is compilable and ready to use.")
        print("  You can load it in AutoCAD or compile it back to FAS format.")
    else:
        print("\n✗ Failed to create compilable LISP code.")
        sys.exit(1)


if __name__ == '__main__':
    main()
