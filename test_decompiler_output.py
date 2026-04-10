#!/usr/bin/env python3
"""Test what the decompiler actually outputs"""

import sys
import os

# Clear any cached imports
if '__pycache__' in sys.modules:
    del sys.modules['__pycache__']

# Force reload
if 'fas4_working_decompiler' in sys.modules:
    del sys.modules['fas4_working_decompiler']

from fas4_working_decompiler import WorkingFas4Decompiler

# Delete old output
if os.path.exists('test-bib_compilable.lsp'):
    os.remove('test-bib_compilable.lsp')

print("Testing decompiler...")
d = WorkingFas4Decompiler()
result = d.decompile('test-bib.fas')

print(f"\nOutput length: {len(result)} bytes")
print(f"Function name: {result.split('(defun ')[1].split('(')[0] if '(defun ' in result else 'NOT FOUND'}")
print(f"Has 'Bytecode Analysis': {'Bytecode Analysis' in result}")
print(f"Has 'test': {'test' in result.lower()}")
print(f"Has 'PDI': {'c:PDI' in result}")

print("\n=== FULL OUTPUT ===")
print(result)
print("=== END ===")

# Write to file
with open('test-bib_compilable.lsp', 'w', encoding='utf-8') as f:
    f.write(result)
print(f"\nWritten to test-bib_compilable.lsp")
