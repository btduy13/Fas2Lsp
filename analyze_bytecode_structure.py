#!/usr/bin/env python3
"""Analyze FAS4 bytecode to understand its structure."""

import struct

# Read the file
with open('PDI.fas', 'rb') as f:
    data = f.read()

# Extract data section
header_pos = data.find(b'FAS4-FILE')
size_pos = data.find(b'517')
size_end = data.find(b'\n', size_pos) + 1
if size_end < len(data) and data[size_end] == ord('\n') and data[size_end - 1] == ord('\r'):
    size_end += 1

raw_data = data[size_end:size_end+517]

print("=== Analyzing FAS4 Bytecode Structure ===\n")
print(f"Data: {len(raw_data)} bytes")
print(f"Starts with: {repr(raw_data[:10])}\n")

# The data starts with "38 $" - maybe this is metadata
# Let's try different interpretations

# Maybe "38" is a version or size, "$" is a marker
# Or maybe it's part of the data structure itself

# Try interpreting the entire data as structured format
# Common patterns in compiled formats:
# 1. Header/metadata
# 2. String table
# 3. Symbol table  
# 4. Code/bytecode

print("=== Trying to find string table ===\n")
# Look for patterns that might be strings
# Expected strings from PDI.lsp:
expected = [
    "PDI", "dict_name", "items_purged", "dict_obj", "continue",
    "ACAD_GROUP", "ACAD_LAYOUT", "ACAD_MATERIAL", "princ", "getstring",
    "namedobjdict", "wcmatch", "dictremove", "strcat", "itoa"
]

# Try to find these strings in the bytecode
for expected_str in expected:
    encoded = expected_str.encode('ascii')
    pos = raw_data.find(encoded)
    if pos >= 0:
        print(f"Found '{expected_str}' at offset {pos}")
        # Show context
        start = max(0, pos - 10)
        end = min(len(raw_data), pos + len(encoded) + 10)
        context = raw_data[start:end]
        print(f"  Context: {context.hex()} / {repr(context)}")

print("\n=== Analyzing byte patterns ===\n")
# Look for repeated patterns that might indicate structure
# Common opcodes: 0x00, 0x01, 0x03, 0x06, 0x14, 0x18, 0x21, 0x35

# Try to see if there's a pattern like: [opcode] [operand] [operand] ...
# Where operands might be indices into string table

# Maybe the format is:
# [magic: "38 $"] [string_table] [bytecode]
# Or: [magic: "38 $"] [metadata] [string_table] [bytecode]

# Try skipping "38 $" and see if rest is parseable
if raw_data[:4] == b'38 $':
    after_magic = raw_data[4:]
    print(f"After '38 $': {len(after_magic)} bytes")
    print(f"First 50 bytes: {after_magic[:50].hex()}")
    
    # Try to interpret as structured data
    # Maybe first few bytes are metadata (counts, sizes, etc.)
    if len(after_magic) >= 4:
        first_val = struct.unpack('<I', after_magic[0:4])[0]
        print(f"\nFirst uint32 (LE): {first_val}")
        if first_val < len(after_magic):
            print(f"  Could be offset/size pointing to {first_val}")

