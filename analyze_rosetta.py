#!/usr/bin/env python3
"""
Rosetta Stone analysis: Map PDI.fas bytecode against known PDI(test).lsp source.
This will help us understand the EXACT FAS4 bytecode format.
"""

import struct
from fas4_decompiler import Fas4Parser

p = Fas4Parser()
fas = p.parse('PDI.fas')
bc = fas.bytecode

print(f"nsyms = {fas.nsyms}")  # 38 symbols
print(f"bytecode = {len(bc)} bytes")
print(f"sec2 = {len(fas.sec2_data)} bytes, {fas.sec2_items} items")
print()

# The known source is:
# (defun c:PDI ( / dict_name items_purged dict_obj continue)
#   (setq items_purged 0)
#   (princ "string1") ... many princ calls with strings
#   (setq dict_name (getstring "string"))
#   (setq dict_obj (namedobjdict))
#   (if (not dict_obj) ...)
#   (if (wcmatch dict_name "ACAD_*") ...)
#   (princ (strcat ...))
#   (if (dictremove dict_obj dict_name) ...)
#   (princ (strcat ...))
#   (princ)
# )
#
# There are 38 symbols. In the known source we see these unique symbols:
# defun, c:PDI, /, dict_name, items_purged, dict_obj, continue,
# setq, princ, getstring, namedobjdict, if, not, progn, exit,
# wcmatch, or, =, strcat, dictremove, itoa, 0, 1, "y", "Y",
# + many string constants

# Let's do a full instruction-by-instruction disassembly with ALL bytes shown
print("=== FULL DISASSEMBLY ===")
i = 0
inst_num = 0

OPCODES = {
    0x00: ('NIL', 0),
    0x01: ('PUSH_NIL', 0),
    0x02: ('PUSH_T', 0),
    0x03: ('SEP', 0),
    0x06: ('STORE', 1),       # 1-byte operand = sym index
    0x07: ('STORE2', 2),      # 2-byte operand = sym index
    0x09: ('LOAD_SYM', 2),    # 2-byte operand = sym index  
    0x0a: ('EXPR_END', 0),
    0x0b: ('LIST_START', 0),
    0x14: ('CALL', 4),        # 4-byte operand
    0x16: ('END_BLOCK', 0),
    0x18: ('RETURN', 2),      # 2-byte operand
    0x19: ('DEFUN_END', 2),
    0x1f: ('UNK_1F', 0),      # need to discover
    0x20: ('UNK_20', 0),      # need to discover  
    0x21: ('UNK_21', 0),      # need to discover - FUNCALL?
    0x28: ('FOREACH_START', 0),
    0x29: ('FOREACH_END', 0),
    0x32: ('MAKE_LIST', 0),
    0x33: ('MAKE_LIST2', 0),
    0x35: ('PUSH_REF', 2),    # 2-byte: sub_op(hi) + sym_idx(lo) or full index
    0x3c: ('DOTPAIR', 0),
    0x4b: ('LOOP_CTRL', 0),
    0x51: ('PUSH_INT', 2),    # 2-byte immediate integer
    0x57: ('JUMP', 4),        # 4-byte signed relative offset
    0x5c: ('SETQ_LOCAL', 2),
    0x5d: ('LOOKUP', 2),
    0x67: ('JMPIF', 4),       # jump if true
    0x68: ('JMPIF2', 4),
    0x6a: ('JMPIFNOT', 4),    # jump if nil
    0x6b: ('JMPIFNOT2', 4),
}

while i < len(bc):
    op = bc[i]
    entry = OPCODES.get(op)
    
    if entry:
        name, opsz = entry
        if opsz == 0:
            print(f"  [{inst_num:3d}] {i:04x}: {op:02x}          {name}")
            i += 1
        elif opsz == 1:
            operand = bc[i+1]
            print(f"  [{inst_num:3d}] {i:04x}: {op:02x} {bc[i+1]:02x}       {name} {operand} (0x{operand:02x})")
            i += 2
        elif opsz == 2:
            operand = struct.unpack('<H', bc[i+1:i+3])[0]
            print(f"  [{inst_num:3d}] {i:04x}: {op:02x} {bc[i+1]:02x} {bc[i+2]:02x}    {name} {operand} (0x{operand:04x})")
            i += 3
        elif opsz == 4:
            operand = struct.unpack('<I', bc[i+1:i+5])[0]
            signed = struct.unpack('<i', bc[i+1:i+5])[0]
            raw = bc[i+1:i+5].hex()
            print(f"  [{inst_num:3d}] {i:04x}: {op:02x} {raw}  {name} {operand} (signed={signed}, target=0x{i+5+signed:04x})")
            i += 5
    else:
        print(f"  [{inst_num:3d}] {i:04x}: {op:02x}          ??? UNKNOWN")
        i += 1
    
    inst_num += 1

print()
print("=== SECTION 2 ANALYSIS ===")
print(f"sec2_items = {fas.sec2_items}")
# Section 2 likely contains the encrypted string table
# Let's try to find patterns - maybe the encryption is simpler than we think

# Try to find if there's a key derivation or XOR pattern
s2 = fas.sec2_data

# Try simple XOR with various keys
print()
print("=== Trying XOR decryption on sec2 ===")
# The known strings start with: \nCommon Dictionaries:\n
# In hex that's 0a 43 6f 6d 6d 6f 6e 20 44 69 63 74 69 6f 6e 61 72 69 65 73 3a 0a
# Compared to sec2 bytes:     3e 67 77 1e 8e 58 8a 03 7c 2d 2b 46 14 15 67 6b ...

known_plain = b'\nCommon Dictionaries:\n'
for idx, (p, c) in enumerate(zip(known_plain, s2)):
    xor_key = p ^ c
    print(f"  pos {idx:3d}: cipher=0x{c:02x} plain=0x{p:02x} ('{chr(p) if 32<=p<127 else '?'}') xor_key=0x{xor_key:02x} ({xor_key})")

# Check if there's a pattern in the XOR keys
print()
xor_keys = [p ^ c for p, c in zip(known_plain, s2)]
print(f"XOR keys: {[f'0x{k:02x}' for k in xor_keys]}")

# Check if keys form an arithmetic sequence (LCG)
diffs = [xor_keys[i+1] - xor_keys[i] for i in range(len(xor_keys)-1)]
print(f"Key diffs: {diffs}")

# Check if there's a constant XOR or rotating pattern
print()
print("Every Nth key:")
for period in range(1, 8):
    groups = [xor_keys[i::period] for i in range(period)]
    print(f"  period {period}: {[[f'0x{k:02x}' for k in g] for g in groups]}")
