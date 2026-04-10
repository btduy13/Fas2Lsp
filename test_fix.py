#!/usr/bin/env python3
"""Test that the crib selection fix works"""

import os
import sys

# Delete old output
if os.path.exists('test-bib_compilable.lsp'):
    os.remove('test-bib_compilable.lsp')
    print("Deleted old output file")

# Test the fixed function
from make_compilable import make_compilable_lisp

print("\n" + "="*60)
print("Testing make_compilable_lisp('test-bib.fas')")
print("="*60 + "\n")

result = make_compilable_lisp('test-bib.fas')

print("\n" + "="*60)
print(f"Result: {result}")
print("="*60)

# Check output
if os.path.exists('test-bib_compilable.lsp'):
    with open('test-bib_compilable.lsp', 'r') as f:
        content = f.read()
    
    print("\nFirst 10 lines of output:")
    print("-" * 60)
    for i, line in enumerate(content.split('\n')[:10], 1):
        print(f"{i:3d}: {line}")
    print("-" * 60)
    
    # Check if it's using PDI code (wrong) or bytecode analysis (correct)
    if 'c:PDI' in content and 'test-bib.fas' in content:
        print("\n⚠️  WARNING: Output still contains PDI code!")
        print("   This means it's using the wrong crib file.")
    elif 'Decompiled from FAS4 format' in content:
        print("\n✓ Output appears to be from bytecode analysis (correct)")
else:
    print("\n✗ Output file was not created")
