#!/usr/bin/env python3
"""Fix indentation in fas4_parser.py"""

with open('server/fas4_parser.py', 'r', encoding='utf-8') as f:
    lines = f.readlines()

# Fix line 59 (index 58)
if len(lines) > 58:
    # Remove extra indentation - should be 16 spaces, not 20
    line = lines[58]
    if line.startswith('                    '):  # 20 spaces
        lines[58] = '                ' + line[20:]  # Replace with 16 spaces
        print(f"Fixed line 59: {repr(lines[58])}")

with open('server/fas4_parser.py', 'w', encoding='utf-8') as f:
    f.writelines(lines)

print("Fixed indentation")

