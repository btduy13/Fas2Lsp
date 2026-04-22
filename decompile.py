#!/usr/bin/env python3
"""
FAS4 Decompiler entry point.
Usage: python decompile.py <input.fas> [output.lsp]
"""
import sys
import os

# Add project root to path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from fas4_decompiler import Fas4Decompiler


def main():
    if len(sys.argv) < 2:
        print("FAS4 Decompiler - Reverse engineer FAS4 to AutoLISP")
        print()
        print("Usage: python decompile.py <input.fas> [output.lsp]")
        print()
        print("Examples:")
        print("  python decompile.py bib.fas")
        print("  python decompile.py bib.fas bib.lsp")
        print("  python decompile.py PDI.fas PDI_out.lsp")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else None

    if not os.path.exists(input_file):
        print(f"Error: File '{input_file}' not found")
        sys.exit(1)

    decompiler = Fas4Decompiler()
    try:
        code = decompiler.decompile(input_file, output_file)
        
        # Show summary
        lines = code.splitlines()
        defuns = sum(1 for l in lines if '(defun ' in l)
        setqs = sum(1 for l in lines if '(setq ' in l)
        ifs = sum(1 for l in lines if '(if ' in l)
        
        print(f"\n=== Summary ===")
        print(f"  Functions: {defuns}")
        print(f"  Assignments: {setqs}")
        print(f"  Conditionals: {ifs}")
        print(f"  Total lines: {len(lines)}")
        
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)


if __name__ == '__main__':
    main()