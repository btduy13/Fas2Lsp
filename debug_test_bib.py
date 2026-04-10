#!/usr/bin/env python3
"""Debug test-bib.fas decompilation"""

from fas4_working_decompiler import WorkingFas4Decompiler
import os

# Delete old output
if os.path.exists('test-bib_compilable.lsp'):
    os.remove('test-bib_compilable.lsp')

print("=" * 60)
print("Decompiling test-bib.fas")
print("=" * 60)

decompiler = WorkingFas4Decompiler(crib_source=None)
lisp_code = decompiler.decompile('test-bib.fas')

print(f"\nStrings extracted: {len(decompiler.strings)}")
if decompiler.strings:
    print("\nTop 10 extracted strings:")
    sorted_strs = sorted(decompiler.strings.items(), key=lambda x: -x[1].confidence)
    for i, (offset, ext_str) in enumerate(sorted_strs[:10], 1):
        print(f"  {i:2d}. [{offset:04d}] '{ext_str.value}' (conf: {ext_str.confidence:.2f}, method: {ext_str.method})")

print(f"\nFunction name in code: {lisp_code.split('(defun ')[1].split('(')[0] if '(defun ' in lisp_code else 'NOT FOUND'}")

with open('test-bib_compilable.lsp', 'w', encoding='utf-8') as f:
    f.write(lisp_code)

print(f"\nOutput written to test-bib_compilable.lsp")
print("\nFirst 30 lines of output:")
print("-" * 60)
for i, line in enumerate(lisp_code.split('\n')[:30], 1):
    print(f"{i:3d}: {line}")
print("-" * 60)
