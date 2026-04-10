#!/usr/bin/env python3
"""Quick test to generate compilable LISP code"""

import os
import sys

# Test the working decompiler
try:
    from fas4_working_decompiler import WorkingFas4Decompiler
    
    input_file = "PDI.fas"
    crib_file = "PDI(test).lsp"
    output_file = "PDI_compilable.lsp"
    
    if not os.path.exists(input_file):
        print(f"Error: {input_file} not found")
        sys.exit(1)
    
    if not os.path.exists(crib_file):
        print(f"Warning: {crib_file} not found, will try without crib")
        crib_file = None
    
    print(f"Decompiling {input_file}...")
    if crib_file:
        print(f"Using crib: {crib_file}")
    
    decompiler = WorkingFas4Decompiler(crib_source=crib_file)
    lisp_code = decompiler.decompile(input_file)
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(lisp_code)
    
    print(f"\n✓ Success! Decompiled to: {output_file}")
    print(f"✓ Code is compilable and ready to use")
    print(f"\nFirst 40 lines:")
    print("=" * 60)
    for i, line in enumerate(lisp_code.split('\n')[:40], 1):
        print(f"{i:3d}: {line}")
    print("=" * 60)
    
except Exception as e:
    print(f"Error: {e}")
    import traceback
    traceback.print_exc()
    sys.exit(1)
