#!/usr/bin/env python3
"""Test decompiling test-bib.fas"""

import os
import sys

# Clear any cached output
output_file = 'test-bib_compilable.lsp'
if os.path.exists(output_file):
    os.remove(output_file)
    print(f"Deleted old {output_file}")

# Import and run
from make_compilable import make_compilable_lisp

print("=" * 60)
print("Decompiling test-bib.fas")
print("=" * 60)
print()

result = make_compilable_lisp('test-bib.fas')

print()
print("=" * 60)
print(f"Result: {result}")
print("=" * 60)

# Check output
if os.path.exists(output_file):
    with open(output_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    print(f"\nOutput file created: {output_file}")
    print(f"File size: {len(content)} bytes")
    print(f"First 20 lines:")
    print("-" * 60)
    for i, line in enumerate(content.split('\n')[:20], 1):
        print(f"{i:3d}: {line}")
    print("-" * 60)
    
    # Check what was used
    if 'PDI(test).lsp' in content:
        print("\n⚠️  WARNING: Output contains reference to PDI(test).lsp")
        print("   This means it's using the wrong crib file!")
    elif 'Decompiled from FAS4 format' in content and 'bytecode' in content.lower():
        print("\n✓ Output appears to be from bytecode analysis (correct)")
    else:
        print("\n? Output source unclear")
else:
    print(f"\n✗ Output file {output_file} was not created")
