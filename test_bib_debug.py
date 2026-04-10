#!/usr/bin/env python3
"""Test bib.fas decompilation and show output"""

import sys
import os

# Test simple decompiler
print("=" * 60)
print("Testing bib.fas decompilation")
print("=" * 60)

try:
    from fas4_simple_decompiler import decompile_fas4_simple
    
    print("\n1. Calling decompile_fas4_simple('bib.fas')...")
    result = decompile_fas4_simple('bib.fas')
    
    print(f"   ✓ Generated {len(result)} bytes")
    print(f"   ✓ Function name: {result.split('(defun ')[1].split('(')[0] if '(defun ' in result else 'NOT FOUND'}")
    print(f"   ✓ Has analysis: {'Bytecode Analysis' in result}")
    
    # Write to file
    output_file = 'bib_compilable.lsp'
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(result)
    
    print(f"\n2. Written to {output_file}")
    print(f"   File size: {os.path.getsize(output_file)} bytes")
    
    print("\n3. First 50 lines of output:")
    print("-" * 60)
    lines = result.split('\n')
    for i, line in enumerate(lines[:50], 1):
        print(f"{i:3d}: {line}")
    if len(lines) > 50:
        print(f"... ({len(lines) - 50} more lines)")
    print("-" * 60)
    
    print("\n✓ SUCCESS!")
    
except Exception as e:
    print(f"\n✗ ERROR: {e}")
    import traceback
    traceback.print_exc()
    sys.exit(1)
