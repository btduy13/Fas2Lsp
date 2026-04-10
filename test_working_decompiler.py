#!/usr/bin/env python3
"""Test the working decompiler"""

import sys
import os

# Add current directory to path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from fas4_working_decompiler import WorkingFas4Decompiler

def main():
    input_file = "PDI.fas"
    crib_file = "PDI(test).lsp"
    output_file = "PDI_working.lsp"
    
    if not os.path.exists(input_file):
        print(f"Error: {input_file} not found")
        return
    
    print(f"Decompiling {input_file}...")
    if os.path.exists(crib_file):
        print(f"Using crib file: {crib_file}")
    else:
        print("No crib file found, will try without it")
        crib_file = None
    
    try:
        decompiler = WorkingFas4Decompiler(crib_source=crib_file)
        lisp_code = decompiler.decompile(input_file)
        
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(lisp_code)
        
        print(f"\nSuccess! Decompiled code written to: {output_file}")
        print("\nFirst 50 lines:")
        print("=" * 60)
        lines = lisp_code.split('\n')
        for i, line in enumerate(lines[:50], 1):
            print(f"{i:3d}: {line}")
        if len(lines) > 50:
            print(f"... ({len(lines) - 50} more lines)")
        print("=" * 60)
        
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()

if __name__ == '__main__':
    main()
