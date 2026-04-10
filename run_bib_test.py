#!/usr/bin/env python3
import sys
import os

# Force output
sys.stdout.reconfigure(encoding='utf-8')
sys.stderr.reconfigure(encoding='utf-8')

print("Starting bib.fas decompilation test...")
print(f"Current dir: {os.getcwd()}")
print(f"bib.fas exists: {os.path.exists('bib.fas')}")

try:
    from fas4_simple_decompiler import decompile_fas4_simple
    print("Import successful")
    
    result = decompile_fas4_simple('bib.fas')
    print(f"Decompilation successful: {len(result)} bytes")
    
    output_file = 'bib_compilable.lsp'
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(result)
    
    print(f"File written: {output_file}")
    print(f"File size: {os.path.getsize(output_file)} bytes")
    
    # Show first 30 lines
    print("\nFirst 30 lines:")
    print("=" * 60)
    for i, line in enumerate(result.split('\n')[:30], 1):
        print(f"{i:3d}: {line}")
    print("=" * 60)
    
except Exception as e:
    print(f"ERROR: {e}")
    import traceback
    traceback.print_exc()
    sys.exit(1)
