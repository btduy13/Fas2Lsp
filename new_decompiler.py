#!/usr/bin/env python3
import struct
import re
import os
import sys
from dataclasses import dataclass, field
from typing import List, Dict, Tuple, Optional, Any, Set

@dataclass
class Instruction:
    offset: int
    opcode: int
    op_name: str
    operands: List[Any] = field(default_factory=list)
    size: int = 1
    comment: str = ''

@dataclass
class FunctionDef:
    name: str
    sym_idx: int
    args: List[int]
    locals: List[int]
    body_start: int
    body_end: int
    instructions: List[Instruction] = field(default_factory=list)

@dataclass
class Fas4File:
    nsyms: int
    bytecode: bytes
    sec2_data: bytes
    sec2_items: int
    crunch_date: str
    tail_bytes: bytes
    key: bytes
    resource_items: List[Any]
    symbols: List[str]

# ─── Decryption & Parsing ──────────────────────────────────────────────────

class Fas4Parser:
    def find_key(self, data: bytes) -> Optional[bytes]:
        crunch_marker = b'\n;fas4 crunch\n;'
        pos = data.find(crunch_marker)
        if pos < 0:
            return None
        for rlen in range(6, 12):
            key_start = pos - rlen
            key_end = pos + len(crunch_marker)
            key_len = key_end - key_start
            length_byte_pos = key_start - 1
            if length_byte_pos >= 0 and data[length_byte_pos] == key_len:
                return data[key_start:key_end]
        return None

    def decrypt_stream(self, encrypted: bytes, key: bytes) -> bytes:
        result = bytearray(len(encrypted))
        key_old = key[0]
        kp = 1
        for i in range(len(encrypted)):
            if kp >= len(key): kp = 0
            key_new = key[kp]
            result[i] = encrypted[i] ^ key_new ^ key_old
            key_old = key_new
            kp += 1
        return bytes(result)

    def parse_resource_stream(self, res_data: bytes) -> Tuple[List[Any], List[str]]:
        pos = 0
        items = []
        symbols = []
        strings = []
        while pos < len(res_data):
            op = res_data[pos]
            if op in (0x14, 0x15):
                pos += 2
            elif op == 0x55:
                pos += 1
                if pos + 2 > len(res_data): break
                num_strings = struct.unpack('<H', res_data[pos:pos+2])[0]
                pos += 2
                for _ in range(num_strings):
                    if pos + 2 > len(res_data): break
                    str_len = struct.unpack('<H', res_data[pos:pos+2])[0]
                    pos += 2
                    if pos + str_len > len(res_data): break
                    s = res_data[pos:pos+str_len]
                    pos += str_len
                    try: decoded = s.decode('ascii')
                    except: decoded = s.decode('latin-1')
                    strings.append(decoded)
                    items.append(('STRING', decoded))
            elif op in (0x56, 0x5B):
                pos += 1
                while pos < len(res_data):
                    end = res_data.find(b'\x00', pos)
                    if end < 0: break
                    sym_name = res_data[pos:end]
                    pos = end + 1
                    if len(sym_name) == 0: break
                    try: name = sym_name.decode('ascii')
                    except: name = sym_name.decode('latin-1')
                    symbols.append(name)
                    items.append(('SYMBOL', name))
            elif op == 0x43: pos += 1
            elif op in (0x34, 0x35, 0x51):
                pos += 2
                if op in (0x35, 0x51) and pos + 2 <= len(res_data):
                    idx = struct.unpack('<H', res_data[pos:pos+2])[0]
                    pos += 2
                    items.append(('FUNC_REF', idx))
                if pos < len(res_data): pos += 1
            elif op == 0x32:
                pos += 1
                if pos < len(res_data):
                    val = res_data[pos]
                    if val > 127: val -= 256
                    pos += 1
                    items.append(('INT8', val))
            elif op == 0x33:
                pos += 1
                if pos + 4 <= len(res_data):
                    val = struct.unpack('<i', res_data[pos:pos+4])[0]
                    pos += 4
                    items.append(('INT32', val))
            elif op == 0x3B:
                pos += 1
                end = res_data.find(b'\x00', pos)
                if end >= 0:
                    float_str = res_data[pos:end]
                    pos = end + 1
                    items.append(('REAL', float_str.decode('ascii', errors='replace')))
                else: break
            elif op == 0x3A: pos += 1
            elif op in (0x09, 0x03, 0x06, 0x1A, 0x1B, 0x0C, 0x5E, 0x05, 0x5C, 0x5D):
                pos += 1
                if pos + 2 <= len(res_data):
                    idx = struct.unpack('<H', res_data[pos:pos+2])[0]
                    pos += 2
                    items.append(('OP_'+hex(op), idx))
            elif op in (0x0A, 0x01, 0x02, 0x16, 0x1C, 0x23, 0x24, 0x0B, 0x10):
                items.append(('OP_'+hex(op),))
                pos += 1
            elif op in (0x18, 0x19, 0x39, 0x37):
                pos += 1
                if pos + 2 <= len(res_data):
                    count = struct.unpack('<H', res_data[pos:pos+2])[0]
                    pos += 2
                    items.append(('OP_'+hex(op), count))
            elif op in (0x67, 0x57, 0x69):
                pos += 1
                if pos + 4 <= len(res_data):
                    target = struct.unpack('<i', res_data[pos:pos+4])[0]
                    pos += 4
                    items.append(('OP_'+hex(op), target))
            elif op in (0x20, 0x62, 0x63, 0x3E, 0x3F, 0x38, 0x40, 0x00): pos += 1
            elif op in (0x1E, 0x1F):
                pos += 1
                if pos < len(res_data): pos += 1
            elif op == 0x21: pos += 1
            elif op in (0x07, 0x0D, 0x3C, 0x0E, 0x3D):
                pos += 1
                if pos + 2 <= len(res_data): pos += 2
            elif op in (0x6A, 0x68):
                pos += 1
                if pos + 4 <= len(res_data): pos += 4
            else: pos += 1
        return items, symbols

    def parse(self, filepath: str) -> Fas4File:
        with open(filepath, 'rb') as f: data = f.read()
        hdr = b' FAS4-FILE ; Do not change it!\r\n'
        hpos = data.find(hdr)
        after = hpos + len(hdr)
        size_end = data.find(b'\r\n', after)
        total_size = int(data[after:size_end])
        payload_start = size_end + 2
        payload = data[payload_start:payload_start + total_size]
        
        m = re.match(rb'(\d+) \$', payload)
        nsyms = int(m.group(1))
        bytecode = payload[m.end():]

        after_payload = payload_start + total_size
        rest = data[after_payload:]
        m2 = re.search(rb'(\d+) (\d+) \$', rest)
        sec2_data, sec2_items = b'', 0
        if m2:
            sec2_size = int(m2.group(1))
            sec2_items = int(m2.group(2))
            sec2_start = after_payload + m2.end()
            sec2_data = data[sec2_start:sec2_start + sec2_size]

        tail = data[after_payload:after_payload + m2.start()] if m2 else b''
        crunch_m = re.search(rb';fas4 crunch\n;\$;A([\d/]+)', data)
        crunch_date = crunch_m.group(1).decode('ascii') if crunch_m else ''
        
        key = self.find_key(data)
        decrypted = self.decrypt_stream(sec2_data, key) if key else sec2_data
        
        res_items, symbols = self.parse_resource_stream(decrypted)
        
        return Fas4File(nsyms=nsyms, bytecode=bytecode, sec2_data=decrypted,
                        sec2_items=sec2_items, crunch_date=crunch_date,
                        tail_bytes=tail, key=key or b'',
                        resource_items=res_items, symbols=symbols)

class Disassembler:
    OPCODES = {
        0x00: ('NIL', ''), 0x01: ('PUSH_NIL', ''), 0x02: ('PUSH_T', ''),
        0x03: ('SEP', ''), 0x06: ('STORE', '1'), 0x07: ('STORE2', '2'),
        0x09: ('LOAD_SYM', '2'), 0x0a: ('EXPR_END', ''), 0x0b: ('LIST_START', ''),
        0x14: ('CALL', '4'), 0x16: ('END_BLOCK', ''), 0x18: ('RETURN', '2'),
        0x19: ('DEFUN_END', '2'), 0x21: ('FUNCALL', ''), 0x28: ('FOREACH_START', ''),
        0x29: ('FOREACH_END', ''), 0x32: ('MAKE_LIST', ''), 0x33: ('MAKE_LIST2', ''),
        0x35: ('PUSH_REF', '2'), 0x3c: ('DOTPAIR', ''), 0x4b: ('LOOP_CTRL', ''),
        0x51: ('PUSH_REF2', '2'), 0x57: ('JUMP', 's4'), 0x5c: ('SETQ_LOCAL', '2'),
        0x5d: ('LOOKUP', '2'), 0x67: ('JMPIF', '4'), 0x68: ('JMPIF2', '4'),
        0x6a: ('JMPIFNOT', '4'), 0x6b: ('JMPIFNOT2', '4'),
    }

    def disassemble(self, bytecode: bytes, nsyms: int) -> List[Instruction]:
        instructions = []
        i = 0
        while i < len(bytecode):
            op = bytecode[i]
            entry = self.OPCODES.get(op)
            if entry:
                name, fmt = entry
                inst = Instruction(offset=i, opcode=op, op_name=name)
                if fmt == '4':
                    val = struct.unpack('<I', bytecode[i+1:i+5])[0] if i+4<len(bytecode) else 0
                    inst.operands = [val]
                    inst.size = 5
                elif fmt == 's4':
                    val = struct.unpack('<i', bytecode[i+1:i+5])[0] if i+4<len(bytecode) else 0
                    inst.operands = [val]
                    inst.size = 5
                elif fmt == '2':
                    val = struct.unpack('<H', bytecode[i+1:i+3])[0] if i+2<len(bytecode) else 0
                    inst.operands = [val]
                    inst.size = 3
                elif fmt == '1':
                    val = bytecode[i+1] if i+1<len(bytecode) else 0
                    inst.operands = [val]
                    inst.size = 2
                else: inst.size = 1
            else:
                inst = Instruction(offset=i, opcode=op, op_name=f'UNK_{op:02x}')
                inst.size = 1
            instructions.append(inst)
            i += inst.size
        return instructions

class ControlFlowAnalyzer:
    def __init__(self, instructions: List[Instruction]):
        self.instructions = instructions
        self.functions: List[FunctionDef] = []

    def find_functions(self) -> List[FunctionDef]:
        functions = []
        defun_ends = [idx for idx, inst in enumerate(self.instructions) if inst.op_name == 'DEFUN_END']
        if not defun_ends:
            functions.append(FunctionDef('c:main', 0, [], [], 0, len(self.instructions)-1, self.instructions))
        else:
            prev_end = 0
            func_num = 0
            for de_idx in defun_ends:
                func_insts = self.instructions[prev_end:de_idx+1]
                if func_insts:
                    locals_list = []
                    for j, inst in enumerate(func_insts):
                        if inst.op_name == 'PUSH_NIL' and j+1 < len(func_insts):
                            next_inst = func_insts[j+1]
                            if next_inst.op_name in ('STORE', 'STORE2') and next_inst.operands:
                                locals_list.append(next_inst.operands[0])
                    functions.append(FunctionDef(f'c:fn{func_num}', func_num, [], locals_list, prev_end, de_idx, func_insts))
                    func_num += 1
                prev_end = de_idx + 1
            if prev_end < len(self.instructions):
                remaining = self.instructions[prev_end:]
                if any(inst.op_name not in ('NIL', 'SEP', 'END_BLOCK') for inst in remaining):
                    functions.append(FunctionDef('c:init', -1, [], [], prev_end, len(self.instructions)-1, remaining))
        self.functions = functions
        return functions

class LispGenerator:
    def __init__(self, fas: Fas4File):
        self.fas = fas
        self.sym_names = {i: name for i, name in enumerate(fas.symbols)}
        
    def resolve_push_ref(self, val: int) -> str:
        idx = val >> 8
        if idx < len(self.fas.resource_items):
            item = self.fas.resource_items[idx]
            if item[0] == 'STRING':
                s = str(item[1]).replace('\\', '\\\\').replace('\"', '\\\"').replace('\n', '\\n')
                return f'"{s}"'
            elif item[0] == 'SYMBOL':
                return item[1]
            elif item[0] == 'REAL':
                return item[1]
            elif item[0] == 'INT32' or item[0] == 'INT8':
                return str(item[1])
            else:
                return f'ref_{idx}'
        return f'item_{idx}'

    def generate(self, functions: List[FunctionDef], filename: str) -> str:
        lines = [
            ';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;',
            f';; Decompiled from: {os.path.basename(filename)}',
            ';; Generated by FAS4 Decompiler (Decryption Enabled)',
            ';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;',
            ''
        ]

        # Use actual function names if possible.
        # Function mappings:
        # PDI has 4 DEFUN_ENDs. The resource stream maps "symbols" to functions.
        # Typical order: The last loaded symbol defines the function name.
        # For simplicity we just use the name extracted from the body if possible.
        
        for idx, func in enumerate(functions):
            # Try to identify function name from STORE or string refs in the function
            # If not, use generic naming.
            if func.name.startswith('c:fn'):
                pass # Can improve this later with actual function bindings
            lines.append(self._generate_function(func))
            lines.append('')
        lines.append('(princ) ;; Silent load')
        return '\n'.join(lines)

    def _generate_function(self, func: FunctionDef) -> str:
        lines = []
        locals_str = ''
        if func.locals:
            local_names = [self.sym_names.get(idx, f'__v{idx}') for idx in func.locals]
            locals_str = ' / ' + ' '.join(local_names)
        
        lines.append(f'(defun {func.name} ({locals_str.strip()})')
        body = self._generate_body(func.instructions)
        for line in body: lines.append(f'  {line}')
        lines.append(')')
        return '\n'.join(lines)

    def _generate_body(self, instructions: List[Instruction]) -> List[str]:
        lines = []
        stack = []
        depth = 0
        def indent(): return '  ' * depth
        def sym(idx): return self.sym_names.get(idx, f'sym_{idx}')

        for inst in instructions:
            if inst.op_name == 'CALL':
                func_idx = inst.operands[0] if inst.operands else 0
                if func_idx == 1:
                    # In 0x14 ('CALL', '4'), func_idx might be the GVAR offset, but actually 0x14 operand might just be an index. 
                    # WAIT. 0x14 with operand 65793 (0x010101). Actually CALL operand might be something else. Let's use sym(func_idx) for now.
                    # Wait, old decompiler just did sym(func_idx).
                    pass
                name = sym(func_idx)
                
                # Special fix for 65793
                if func_idx == 65793: name = 'PRINC' # Just a temporary fallback, real index logic needs refine.
                
                if stack:
                    args = ' '.join(str(a) for a in stack)
                    stack.clear()
                    stack.append(f'({name} {args})')
                else: stack.append(f'({name})')
                
            elif inst.op_name == 'LOAD_SYM':
                sym_idx = inst.operands[0] if inst.operands else 0
                stack.append(sym(sym_idx))
            elif inst.op_name in ('PUSH_REF', 'PUSH_REF2'):
                val = inst.operands[0] if inst.operands else 0
                stack.append(self.resolve_push_ref(val))
            elif inst.op_name == 'PUSH_INT':
                val = inst.operands[0] if inst.operands else 0
                stack.append(str(val))
            elif inst.op_name == 'PUSH_NIL': stack.append('nil')
            elif inst.op_name == 'PUSH_T': stack.append('T')
            elif inst.op_name in ('STORE', 'STORE2'):
                sym_idx = inst.operands[0] if inst.operands else 0
                val = stack.pop() if stack else 'nil'
                lines.append(f'{indent()}(setq {sym(sym_idx)} {val})')
            elif inst.op_name == 'SETQ_LOCAL':
                sym_idx = inst.operands[0] if inst.operands else 0
                if stack:
                    val = stack.pop()
                    lines.append(f'{indent()}(setq {sym(sym_idx)} {val})')
            elif inst.op_name == 'FUNCALL':
                if stack: lines.append(f'{indent()}(eval {stack.pop()})')
            elif inst.op_name in ('JMPIF', 'JMPIF2'):
                cond_expr = stack.pop() if stack else 'T'
                lines.append(f'{indent()}(if {cond_expr}')
                lines.append(f'{indent()}  (progn')
                depth += 2
            elif inst.op_name in ('JMPIFNOT', 'JMPIFNOT2'):
                cond_expr = stack.pop() if stack else 'nil'
                lines.append(f'{indent()}(if {cond_expr}')
                lines.append(f'{indent()}  nil')
                lines.append(f'{indent()}  (progn')
                depth += 2
            elif inst.op_name == 'JUMP':
                if depth >= 2:
                    depth -= 2
                    lines.append(f'{indent()}  ) ;; end progn')
                    lines.append(f'{indent()}) ;; end if')
                elif depth >= 1:
                    depth -= 1
                    lines.append(f'{indent()}) ;; end block')
            elif inst.op_name == 'EXPR_END':
                if stack:
                    for item in stack: lines.append(f'{indent()}{item}')
                    stack.clear()
            elif inst.op_name in ('MAKE_LIST', 'MAKE_LIST2'):
                if stack:
                    items = ' '.join(str(a) for a in stack)
                    stack.clear()
                    stack.append(f'(list {items})')
            elif inst.op_name == 'LOOKUP':
                sym_idx = inst.operands[0] if inst.operands else 0
                stack.append(sym(sym_idx))
            elif inst.op_name == 'FOREACH_START':
                lines.append(f'{indent()}(foreach item collection')
                depth += 1
            elif inst.op_name == 'FOREACH_END':
                if depth > 0: depth -= 1
                lines.append(f'{indent()})')

        for item in stack:
            if isinstance(item, str): lines.append(f'{indent()}{item}')
        while depth > 0:
            depth -= 1
            lines.append(f'{"  " * depth})')
        return self._balance_parens(lines)

    def _balance_parens(self, lines: List[str]) -> List[str]:
        full_text = '\n'.join(lines)
        diff = full_text.count('(') - full_text.count(')')
        if diff > 0:
            for _ in range(diff): lines.append(')')
        elif diff < 0:
            excess = -diff
            while lines and excess > 0:
                last = lines[-1].strip()
                if last in (')', ') ;; end progn', ') ;; end if', ') ;; end block'):
                    lines.pop()
                    excess -= 1
                else: break
        return lines

class Fas4Decompiler:
    def decompile(self, filepath: str, output_path: str = None) -> str:
        parser = Fas4Parser()
        fas = parser.parse(filepath)
        disasm = Disassembler()
        instructions = disasm.disassemble(fas.bytecode, fas.nsyms)
        cf = ControlFlowAnalyzer(instructions)
        functions = cf.find_functions()
        gen = LispGenerator(fas)
        code = gen.generate(functions, filepath)
        if output_path is None:
            base = os.path.splitext(filepath)[0]
            output_path = base + '_decompiled.lsp'
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(code)
        return code

if __name__ == '__main__':
    dl = Fas4Decompiler()
    dl.decompile('PDI.fas', 'PDI_dec.lsp')
    print("Done. Wrote PDI_dec.lsp")
