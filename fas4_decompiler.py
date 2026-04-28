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
    resource_items_with_offsets: List[Tuple[int, Any]]
    symbols: List[str]
    resource_gvars: List[Any]
    function_gvars: List[Any]
    function_catalog: List[Tuple[str, int]]

# ─── Decryption & Parsing ──────────────────────────────────────────────────

class Fas4Parser:
    def _extract_text(self, value: Any) -> Optional[str]:
        if isinstance(value, str):
            return value
        if isinstance(value, tuple) and len(value) == 2 and value[0] in ('STRING', 'SYMBOL', 'REAL'):
            return str(value[1])
        return None

    def _extract_symbol_text(self, value: Any) -> Optional[str]:
        if isinstance(value, str):
            return value
        if isinstance(value, tuple) and len(value) == 2 and value[0] == 'SYMBOL':
            return str(value[1])
        return None

    def _collect_function_catalog(self, *tables: List[Any]) -> List[Tuple[str, int]]:
        seen: Set[int] = set()
        catalog: List[Tuple[str, int]] = []

        def walk(value: Any) -> None:
            if not isinstance(value, tuple):
                return
            if len(value) >= 4 and value[0] == 'FUNC':
                raw_name = self._extract_symbol_text(value[1]) or self._extract_text(value[1]) or ''
                start = value[2]
                if isinstance(start, int) and start not in seen:
                    seen.add(start)
                    catalog.append((str(raw_name), start))
                walk(value[3])
                return
            for item in value:
                walk(item)

        for table in tables:
            for value in table:
                walk(value)

        catalog.sort(key=lambda item: item[1])
        return catalog

    def decode_text(self, raw: bytes) -> str:
        for encoding in ('ascii', 'utf-8', 'cp1252', 'latin-1'):
            try:
                return raw.decode(encoding)
            except UnicodeDecodeError:
                continue
        return raw.decode('latin-1', errors='replace')

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

    def build_mvar_tables(self, res_data: bytes, nsyms: int) -> Tuple[List[Any], List[Any]]:
        """Best-effort reconstruction of the two GVar tables populated by opcode 0x43."""
        tables: Dict[int, List[Any]] = {
            0: [None] * nsyms,
            1: [None] * nsyms,
        }
        stack: List[Any] = []
        pos = 0

        def table0_value(idx: int) -> Any:
            if 0 <= idx < nsyms:
                return tables[0][idx]
            return None

        def pop_default(default: Any = None) -> Any:
            return stack.pop() if stack else default

        def pop_many(count: int) -> List[Any]:
            if count <= 0:
                return []
            if count > len(stack):
                count = len(stack)
            values = stack[-count:]
            del stack[-count:]
            return values

        while pos < len(res_data):
            op = res_data[pos]

            if op == 0x00:
                stack.append(None)
                pos += 1
            elif op == 0x01:
                stack.append(None)
                pos += 1
            elif op == 0x02:
                stack.append(True)
                pos += 1
            elif op == 0x0A:
                if stack:
                    stack.pop()
                pos += 1
            elif op == 0x0B:
                if stack:
                    stack.append(stack[-1])
                pos += 1
            elif op in (0x14, 0x15):
                if pos + 5 > len(res_data):
                    break
                stack.append(('DEFHDR', tuple(res_data[pos + 1:pos + 5])))
                pos += 5
            elif op in (0x03, 0x09):
                if pos + 3 > len(res_data):
                    break
                idx = struct.unpack('<H', res_data[pos + 1:pos + 3])[0]
                stack.append(table0_value(idx))
                pos += 3
            elif op == 0x06:
                if pos + 3 > len(res_data):
                    break
                idx = struct.unpack('<H', res_data[pos + 1:pos + 3])[0]
                if 0 <= idx < nsyms:
                    tables[0][idx] = pop_default()
                pos += 3
            elif op == 0x2A:
                if len(stack) >= 2:
                    right = stack.pop()
                    left = stack.pop()
                    stack.append(('CONS', left, right))
                pos += 1
            elif op == 0x28:
                value = pop_default()
                if isinstance(value, tuple) and len(value) == 3 and value[0] == 'CONS':
                    stack.append(value[1])
                elif isinstance(value, tuple) and value:
                    stack.append(value[0])
                else:
                    stack.append(('CAR', value))
                pos += 1
            elif op == 0x29:
                value = pop_default()
                if isinstance(value, tuple) and len(value) == 3 and value[0] == 'CONS':
                    stack.append(value[2])
                elif isinstance(value, tuple) and len(value) > 1:
                    stack.append(tuple(value[1:]))
                else:
                    stack.append(('CDR', value))
                pos += 1
            elif op == 0x32:
                if pos + 2 > len(res_data):
                    break
                stack.append(struct.unpack('<b', res_data[pos + 1:pos + 2])[0])
                pos += 2
            elif op == 0x33:
                if pos + 5 > len(res_data):
                    break
                stack.append(struct.unpack('<i', res_data[pos + 1:pos + 5])[0])
                pos += 5
            elif op == 0x39:
                if pos + 3 > len(res_data):
                    break
                count = struct.unpack('<H', res_data[pos + 1:pos + 3])[0]
                stack.append(tuple(pop_many(count)))
                pos += 3
            elif op == 0x34:
                if pos + 3 > len(res_data):
                    break
                argc = res_data[pos + 1]
                flags = res_data[pos + 2]
                args = pop_many(argc + 1)
                stack.append(('EVAL', argc, flags, tuple(args)))
                pos += 3
            elif op in (0x35, 0x51):
                if pos + 5 > len(res_data):
                    break
                argc = res_data[pos + 1]
                idx = struct.unpack('<H', res_data[pos + 2:pos + 4])[0]
                flags = res_data[pos + 4]
                args = pop_many(argc)
                stack.append(('CALL', table0_value(idx), idx, flags, tuple(args)))
                pos += 5
            elif op == 0x55:
                if pos + 3 > len(res_data):
                    break
                num_strings = struct.unpack('<H', res_data[pos + 1:pos + 3])[0]
                pos += 3
                for _ in range(num_strings):
                    if pos + 2 > len(res_data):
                        pos = len(res_data)
                        break
                    str_len = struct.unpack('<H', res_data[pos:pos + 2])[0]
                    pos += 2
                    if pos + str_len > len(res_data):
                        pos = len(res_data)
                        break
                    stack.append(('STRING', self.decode_text(res_data[pos:pos + str_len])))
                    pos += str_len
            elif op in (0x56, 0x5B):
                pos += 1
                while pos < len(res_data):
                    end = res_data.find(b'\x00', pos)
                    if end < 0:
                        pos = len(res_data)
                        break
                    sym_name = self.decode_text(res_data[pos:end])
                    pos = end + 1
                    if not sym_name:
                        break
                    stack.append(('SYMBOL', sym_name))
            elif op == 0x3A:
                if len(stack) >= 3:
                    name = stack.pop()
                    start = stack.pop()
                    module = stack.pop()
                    stack.append(('FUNC', name, start, module))
                pos += 1
            elif op == 0x43:
                if pos + 5 > len(res_data):
                    break
                var_pos = struct.unpack('<H', res_data[pos + 1:pos + 3])[0]
                st_init = struct.unpack('<H', res_data[pos + 3:pos + 5])[0]
                module_id = stack.pop() if stack else None
                table_idx = 0 if module_id is None else 1
                for idx in range(var_pos + st_init - 1, var_pos - 1, -1):
                    if not stack:
                        break
                    value = stack.pop()
                    if 0 <= idx < nsyms:
                        tables[table_idx][idx] = value
                pos += 5
            elif op == 0x23:
                stack.append(('NOT', pop_default()))
                pos += 1
            elif op == 0x24:
                stack.append(('ATOM', pop_default()))
                pos += 1
            elif op in (0x57, 0x67, 0x68, 0x69, 0x6A, 0x6B):
                pos += 5
            elif op in (0x05, 0x07, 0x0C, 0x0D, 0x0E, 0x1A, 0x1B,
                         0x37, 0x3C, 0x3D, 0x5C, 0x5D, 0x5E):
                pos += 3
            elif op in (0x1E, 0x1F):
                pos += 2
            elif op in (0x16, 0x1C, 0x20, 0x62, 0x63):
                pos += 1
            elif op == 0x3B:
                end = res_data.find(b'\x00', pos + 1)
                if end < 0:
                    break
                stack.append(('REAL', self.decode_text(res_data[pos + 1:end])))
                pos = end + 1
            else:
                pos += 1

        return tables[0], tables[1]

    def parse_resource_stream(self, res_data: bytes) -> Tuple[List[Any], List[Tuple[int, Any]], List[str]]:
        pos = 0
        items = []
        items_with_offsets = []
        symbols = []
        strings = []
        while pos < len(res_data):
            start = pos
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
                    decoded = self.decode_text(s)
                    strings.append(decoded)
                    item = ('STRING', decoded)
                    items.append(item)
                    items_with_offsets.append((pos - str_len, item))
            elif op in (0x56, 0x5B):
                pos += 1
                while pos < len(res_data):
                    end = res_data.find(b'\x00', pos)
                    if end < 0: break
                    sym_name = res_data[pos:end]
                    pos = end + 1
                    if len(sym_name) == 0: break
                    name = self.decode_text(sym_name)
                    symbols.append(name)
                    item = ('SYMBOL', name)
                    items.append(item)
                    items_with_offsets.append((pos - len(sym_name) - 1, item))
            elif op == 0x43: pos += 1
            elif op in (0x34, 0x35, 0x51):
                pos += 2
                if op in (0x35, 0x51) and pos + 2 <= len(res_data):
                    idx = struct.unpack('<H', res_data[pos:pos+2])[0]
                    pos += 2
                    item = ('FUNC_REF', idx)
                    items.append(item)
                    items_with_offsets.append((start, item))
                if pos < len(res_data): pos += 1
            elif op == 0x32:
                pos += 1
                if pos < len(res_data):
                    val = res_data[pos]
                    if val > 127: val -= 256
                    pos += 1
                    item = ('INT8', val)
                    items.append(item)
                    items_with_offsets.append((start, item))
            elif op == 0x33:
                pos += 1
                if pos + 4 <= len(res_data):
                    val = struct.unpack('<i', res_data[pos:pos+4])[0]
                    pos += 4
                    item = ('INT32', val)
                    items.append(item)
                    items_with_offsets.append((start, item))
            elif op == 0x3B:
                pos += 1
                end = res_data.find(b'\x00', pos)
                if end >= 0:
                    float_str = res_data[pos:end]
                    pos = end + 1
                    item = ('REAL', self.decode_text(float_str))
                    items.append(item)
                    items_with_offsets.append((start, item))
                else: break
            elif op == 0x3A: pos += 1
            elif op in (0x09, 0x03, 0x06, 0x1A, 0x1B, 0x0C, 0x5E, 0x05, 0x5C, 0x5D):
                pos += 1
                if pos + 2 <= len(res_data):
                    idx = struct.unpack('<H', res_data[pos:pos+2])[0]
                    pos += 2
                    item = ('OP_'+hex(op), idx)
                    items.append(item)
                    items_with_offsets.append((start, item))
            elif op in (0x0A, 0x01, 0x02, 0x16, 0x1C, 0x23, 0x24, 0x0B, 0x10):
                item = ('OP_'+hex(op),)
                items.append(item)
                items_with_offsets.append((start, item))
                pos += 1
            elif op in (0x18, 0x19, 0x39, 0x37):
                pos += 1
                if pos + 2 <= len(res_data):
                    count = struct.unpack('<H', res_data[pos:pos+2])[0]
                    pos += 2
                    item = ('OP_'+hex(op), count)
                    items.append(item)
                    items_with_offsets.append((start, item))
            elif op in (0x67, 0x57, 0x69):
                pos += 1
                if pos + 4 <= len(res_data):
                    target = struct.unpack('<i', res_data[pos:pos+4])[0]
                    pos += 4
                    item = ('OP_'+hex(op), target)
                    items.append(item)
                    items_with_offsets.append((start, item))
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
        return items, items_with_offsets, symbols

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
        
        res_items, res_items_with_offsets, symbols = self.parse_resource_stream(decrypted)
        resource_gvars, function_gvars = self.build_mvar_tables(decrypted, nsyms)
        function_catalog = self._collect_function_catalog(resource_gvars, function_gvars)
        
        return Fas4File(nsyms=nsyms, bytecode=bytecode, sec2_data=decrypted,
                        sec2_items=sec2_items, crunch_date=crunch_date,
                        tail_bytes=tail, key=key or b'',
                        resource_items=res_items, resource_items_with_offsets=res_items_with_offsets,
                        symbols=symbols, resource_gvars=resource_gvars, function_gvars=function_gvars,
                        function_catalog=function_catalog)

class Disassembler:
    OPCODES = {
        0x00: ('NIL', ''), 0x01: ('PUSH_NIL', ''), 0x02: ('PUSH_T', ''),
        0x03: ('PUSH_VALUE', '2'), 0x05: ('GET_LOCAL', '1'), 0x06: ('SETQ_G', '2'), 0x07: ('COPY_ELEM', 'bb'),
        0x09: ('PUSH_G', '2'), 0x0a: ('POP', ''), 0x0b: ('DUP', ''),
        0x0c: ('PUSH_GLOBAL', '2'), 0x0d: ('JMP16_IFNOT', '2'), 0x0e: ('JMP16_IF', '2'),
        0x14: ('DEFUN', 'h'), 0x16: ('END_DEFUN', ''), 0x18: ('INIT_ARGS', '2'),
        0x19: ('CLEAR_ARGS', '2'), 0x1c: ('INIT_DONE', ''), 0x1e: ('ALPHA', '1'), 0x1f: ('BETA', '1'),
        0x20: ('NOP', ''), 0x21: ('END_DEFUN_CLEANUP', '2'), 0x23: ('NOT', ''), 0x24: ('ATOM', ''),
        0x28: ('CAR', ''), 0x29: ('CDR', ''), 0x32: ('PUSH_INT8', '1'), 0x33: ('PUSH_INT32', '4'),
        0x34: ('EVAL', 'e'), 0x37: ('LIST_OBJ', '2'), 0x39: ('BUILD_LIST', '2'),
        0x3a: ('DEFCODE', ''), 0x3b: ('PUSH_REAL', 'z'), 0x3c: ('JMP16_IFNOT_2', '2'),
        0x3d: ('JMP16_IF_2', '2'), 0x3e: ('EXIT_IF_NOT_ZERO', ''), 0x3f: ('EXIT_IF_ZERO', ''),
        0x40: ('UNK_40', ''),
        0x35: ('USUBR', 'u'),
        0x46: ('FIX_ADD', ''), 0x47: ('FIX_SUB', ''), 0x48: ('FIX_MUL', ''), 0x49: ('FIX_DIV', ''),
        0x4a: ('FIX_MOD', ''), 0x4b: ('FIX_LEQ', ''), 0x4c: ('FIX_GEQ', ''), 0x4d: ('FIX_LT', ''),
        0x4e: ('FIX_GT', ''), 0x4f: ('INC', ''), 0x50: ('DEC', ''),
        0x51: ('FUNC', 'f'), 0x57: ('JUMP', 's4'), 0x5c: ('GET_LOCAL', '2'),
        0x5d: ('SET_LOCAL', '2'), 0x5e: ('CLEAR_LOCAL', '2'), 0x62: ('NOP_62', ''), 0x63: ('NOP_63', ''),
        0x67: ('BR_IF_TRUE', 's4'), 0x68: ('COND_OR', 's4'), 0x69: ('JUMP32', 's4'),
        0x6a: ('AND', 's4'), 0x6b: ('AND2', 's4'),
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
                elif fmt == 'bb':
                    left = bytecode[i+1] if i+1 < len(bytecode) else 0
                    right = bytecode[i+2] if i+2 < len(bytecode) else 0
                    inst.operands = [left, right]
                    inst.size = 3
                elif fmt == 'u':
                    argc = bytecode[i+1] if i+1 < len(bytecode) else 0
                    idx = struct.unpack('<H', bytecode[i+2:i+4])[0] if i+3 < len(bytecode) else 0
                    flags = bytecode[i+4] if i+4 < len(bytecode) else 0
                    inst.operands = [argc, idx, flags]
                    inst.size = 5
                elif fmt == 'f':
                    argc = bytecode[i+1] if i+1 < len(bytecode) else 0
                    idx = struct.unpack('<H', bytecode[i+2:i+4])[0] if i+3 < len(bytecode) else 0
                    flags = bytecode[i+4] if i+4 < len(bytecode) else 0
                    zero = bytecode[i+5] if i+5 < len(bytecode) else 0
                    inst.operands = [argc, idx, flags, zero]
                    inst.size = 6
                elif fmt == 'h':
                    values = [bytecode[i+j] if i+j < len(bytecode) else 0 for j in range(1, 5)]
                    inst.operands = values
                    inst.size = 5
                elif fmt == 'e':
                    argc = bytecode[i+1] if i+1 < len(bytecode) else 0
                    flag = bytecode[i+2] if i+2 < len(bytecode) else 0
                    inst.operands = [argc, flag]
                    inst.size = 3
                elif fmt == 'z':
                    end = bytecode.find(b'\x00', i + 1)
                    if end == -1:
                        inst.operands = ['']
                        inst.size = 1
                    else:
                        raw = bytecode[i+1:end].decode('ascii', errors='replace')
                        inst.operands = [raw]
                        inst.size = (end - i) + 1
                else: inst.size = 1
            else:
                inst = Instruction(offset=i, opcode=op, op_name=f'UNK_{op:02x}')
                inst.size = 1
            instructions.append(inst)
            i += inst.size
        return instructions

class ControlFlowAnalyzer:
    def __init__(self, instructions: List[Instruction], function_catalog: Optional[List[Tuple[str, int]]] = None):
        self.instructions = instructions
        self.function_catalog = function_catalog or []
        self.functions: List[FunctionDef] = []

    def find_functions(self) -> List[FunctionDef]:
        if self.function_catalog:
            functions = self._build_from_catalog()
        else:
            defun_starts = [idx for idx, inst in enumerate(self.instructions) if inst.op_name == 'DEFUN']
            if defun_starts:
                functions = self._build_from_defun_headers(defun_starts)
            else:
                functions = self._build_from_defun_ends()
        self.functions = functions
        return functions

    def _build_from_catalog(self) -> List[FunctionDef]:
        offset_to_index = {inst.offset: idx for idx, inst in enumerate(self.instructions)}
        entries: List[Tuple[str, int, int]] = []
        seen: Set[int] = set()
        for name, offset in sorted(self.function_catalog, key=lambda item: item[1]):
            idx = offset_to_index.get(offset)
            if idx is None or idx in seen:
                continue
            if self.instructions[idx].op_name != 'DEFUN':
                continue
            seen.add(idx)
            entries.append((name or '', offset, idx))

        if not entries:
            return self._build_from_defun_headers([idx for idx, inst in enumerate(self.instructions) if inst.op_name == 'DEFUN'])

        functions = []
        cursor = 0
        for pos, (name, _offset, start_idx) in enumerate(entries):
            if start_idx > cursor:
                prelude = self.instructions[cursor:start_idx]
                if self._has_meaningful_code(prelude):
                    functions.append(
                        FunctionDef('c:init', -1, [], [], cursor, start_idx - 1, prelude)
                    )
            next_start = entries[pos + 1][2] if pos + 1 < len(entries) else len(self.instructions)
            func_insts = self.instructions[start_idx:next_start]
            if not func_insts:
                continue
            locals_list = self._collect_local_slots(func_insts)
            functions.append(
                FunctionDef(
                    name or f'c:fn{pos}',
                    pos,
                    [],
                    locals_list,
                    start_idx,
                    next_start - 1,
                    func_insts,
                )
            )
            cursor = next_start

        if cursor < len(self.instructions):
            remaining = self.instructions[cursor:]
            if self._has_meaningful_code(remaining):
                functions.append(
                    FunctionDef('c:init_tail', -1, [], [], cursor, len(self.instructions) - 1, remaining)
                )
        return functions

    def _build_from_defun_headers(self, starts: List[int]) -> List[FunctionDef]:
        functions = []
        func_num = 0
        cursor = 0
        for pos, start in enumerate(starts):
            if start < cursor:
                continue
            if start > cursor:
                prelude = self.instructions[cursor:start]
                if self._has_meaningful_code(prelude):
                    functions.append(
                        FunctionDef('c:init', -1, [], [], cursor, start - 1, prelude)
                    )
            next_start = starts[pos + 1] if pos + 1 < len(starts) else len(self.instructions)
            end_idx = self._find_defun_end(start, next_start)

            func_insts = self.instructions[start:end_idx + 1]
            locals_list = self._collect_local_slots(func_insts)
            functions.append(
                FunctionDef(
                    f'c:fn{func_num}',
                    func_num,
                    [],
                    locals_list,
                    start,
                    end_idx,
                    func_insts,
                )
            )
            func_num += 1
            cursor = end_idx + 1

        if cursor < len(self.instructions):
            remaining = self.instructions[cursor:]
            if self._has_meaningful_code(remaining):
                functions.append(
                    FunctionDef('c:init_tail', -1, [], [], cursor, len(self.instructions) - 1, remaining)
                )
        return functions

    def _find_defun_end(self, start: int, next_start: int) -> int:
        clear_idx = None
        for idx in range(start, next_start):
            if self.instructions[idx].op_name == 'CLEAR_ARGS':
                clear_idx = idx
        if clear_idx is not None:
            end_idx = clear_idx
            if end_idx + 1 < len(self.instructions) and self.instructions[end_idx + 1].op_name == 'END_DEFUN':
                end_idx += 1
            return end_idx
        return min(next_start - 1, len(self.instructions) - 1)

    def _build_from_defun_ends(self) -> List[FunctionDef]:
        functions = []
        defun_ends = [idx for idx, inst in enumerate(self.instructions) if inst.op_name == 'END_DEFUN']
        if not defun_ends:
            return [FunctionDef('c:main', 0, [], [], 0, len(self.instructions) - 1, self.instructions)]

        prev_end = 0
        func_num = 0
        for de_idx in defun_ends:
            func_insts = self.instructions[prev_end:de_idx + 1]
            if func_insts:
                locals_list = self._collect_local_slots(func_insts)
                functions.append(
                    FunctionDef(
                        f'c:fn{func_num}',
                        func_num,
                        [],
                        locals_list,
                        prev_end,
                        de_idx,
                        func_insts,
                    )
                )
                func_num += 1
            prev_end = de_idx + 1

        if prev_end < len(self.instructions):
            remaining = self.instructions[prev_end:]
            if self._has_meaningful_code(remaining):
                functions.append(
                    FunctionDef('c:init', -1, [], [], prev_end, len(self.instructions) - 1, remaining)
                )
        return functions

    def _next_defun_end(self, defun_ends: List[int], start: int) -> Optional[int]:
        for idx in defun_ends:
            if idx >= start:
                return idx
        return None

    def _collect_local_slots(self, instructions: List[Instruction]) -> List[int]:
        slots = []
        seen = set()
        for inst in instructions:
            if inst.op_name in ('GET_LOCAL', 'SET_LOCAL', 'CLEAR_LOCAL') and inst.operands:
                slot = inst.operands[0]
                if slot not in seen:
                    slots.append(slot)
                    seen.add(slot)
        return slots

    def _has_meaningful_code(self, instructions: List[Instruction]) -> bool:
        return any(inst.op_name not in ('NIL', 'INIT_DONE') for inst in instructions)

class LispGenerator:
    BUILTIN_SYMBOLS = {
        '=', '1+', 'ACAD_STRLSORT', 'ATOM', 'CAR', 'CDR', 'CONS', 'DICTREMOVE',
        'ENTGET', 'GETSTRING', 'ITOA', 'NAMEDOBJDICT', 'NOT', 'PRINC', 'STRCAT',
        'STRLEN', 'TEXTSCR', 'WCMATCH', 'VL-ACAD-DEFUN'
    }
    COMMON_ARITY = {
        'PRINC': {0, 1},
        'NAMEDOBJDICT': {0},
        'TEXTSCR': {0},
        'GETSTRING': {1, 2},
        'STRLEN': {1},
        'WCMATCH': {2, 3},
        'DICTREMOVE': {2},
        'ITOA': {1},
        'CAR': {1},
        'CDR': {1},
        'CONS': {2},
        '=': {2},
        '>': {2},
        '<': {2},
        '>=': {2},
        '<=': {2},
        '1+': {1},
        '1-': {1},
        'NOT': {1},
        'ATOM': {1},
        'ENTGET': {1},
        'ENTDEL': {1},
        'RTOS': {1, 2, 3},
    }

    def __init__(self, fas: Fas4File):
        self.fas = fas
        self.string_values = [
            str(item[1]) for item in fas.resource_items
            if item[0] == 'STRING' and isinstance(item[1], str)
        ]
        self.function_names_by_offset: Dict[int, str] = {}
        self.function_names_by_index: Dict[int, str] = {}
        self.command_candidates: List[str] = []
        self._build_function_catalog()

    def generate(self, functions: List[FunctionDef], filename: str) -> str:
        specs = [self._analyze_function(func, idx) for idx, func in enumerate(functions)]
        self._apply_command_fallback(specs)
        self._finalize_function_names(specs)

        source_name = os.path.basename(filename)
        lines = [
            f';; Auto-decompiled from {source_name}',
            ';; Decompiler: fas4_decompiler.py  (full-semantics pass)',
            f';; Functions: {len(specs)}   Warnings: 0',
            ''
        ]

        if self.string_values:
            lines.append(';; Recovered strings (first 12):')
            for value in self.string_values[:12]:
                lines.append(f';;   {self._comment_text(value)}')
            lines.append('')

        for spec in specs:
            lines.extend(self._emit_function(spec))
            lines.append('')

        return '\n'.join(lines)

    def _build_function_catalog(self) -> None:
        for table in (self.fas.resource_gvars, self.fas.function_gvars):
            for value in table:
                self._collect_function_descriptors(value)
                self._collect_command_candidates(value)
        self._collect_function_ref_names()
        self.command_candidates = list(dict.fromkeys(self.command_candidates))

    def _collect_function_descriptors(self, value: Any) -> None:
        if isinstance(value, tuple) and len(value) >= 4 and value[0] == 'FUNC':
            name = self._extract_symbol_text(value[1]) or self._extract_text(value[1])
            start = value[2]
            if isinstance(name, str) and isinstance(start, int):
                self.function_names_by_offset.setdefault(start, name)
                self._collect_command_candidates(name)
            self._collect_function_descriptors(value[3])
            return
        if isinstance(value, tuple):
            for item in value:
                self._collect_function_descriptors(item)

    def _collect_command_candidates(self, value: Any) -> None:
        text = self._extract_text(value)
        if isinstance(text, str):
            if text.upper().startswith('C:'):
                self.command_candidates.append(text)
            return
        if isinstance(value, tuple):
            for item in value:
                self._collect_command_candidates(item)

    def _collect_function_ref_names(self) -> None:
        items = self.fas.resource_items_with_offsets
        for idx, (_, item) in enumerate(items):
            if item[0] != 'FUNC_REF':
                continue
            ref_idx = item[1]
            if idx == 0:
                continue
            prev = items[idx - 1][1]
            if not (isinstance(prev, tuple) and len(prev) >= 2 and prev[0] == 'OP_0x9'):
                continue
            slot = prev[1]
            name = self._resource_gvar_text(slot)
            if name:
                self.function_names_by_index.setdefault(ref_idx, name)
                self._collect_command_candidates(name)

    def _analyze_function(self, func: FunctionDef, func_index: int) -> Dict[str, Any]:
        signature = self._extract_signature(func.instructions)
        referenced_symbols = self._referenced_symbols(func.instructions[signature['body_start']:])
        referenced_strings = self._referenced_strings(func.instructions[signature['body_start']:])
        original_name = self._choose_function_name(func, func_index, referenced_symbols)
        is_init = func.sym_idx < 0

        local_used: Set[str] = set()
        slot_names: Dict[int, str] = {}
        arg_names: List[str] = []
        arg_originals: List[str] = []
        arg_slots = set()
        for pos, (slot, raw_name) in enumerate(signature['args']):
            safe_name = self._unique_symbol(raw_name, f'arg_{pos + 1}', False, local_used)
            arg_names.append(safe_name)
            arg_originals.append(raw_name)
            slot_names[slot] = safe_name
            arg_slots.add(slot)

        local_names: List[str] = []
        local_originals: List[str] = []
        bound_symbol_map: Dict[str, str] = {}
        for pos, raw_name in enumerate(signature.get('local_binding_names', [])):
            safe_name = self._unique_symbol(raw_name, f'local_{pos + 1}', False, local_used)
            local_names.append(safe_name)
            local_originals.append(raw_name)
            bound_symbol_map[raw_name.upper()] = safe_name
        for slot in func.locals:
            if slot in arg_slots:
                continue
            raw_name = f'local_{slot}'
            safe_name = self._unique_symbol(raw_name, raw_name, False, local_used)
            local_names.append(safe_name)
            local_originals.append(raw_name)
            slot_names[slot] = safe_name

        return {
            'func': func,
            'index': func_index,
            'is_init': is_init,
            'original_name': original_name,
            'name': '',
            'args': arg_names,
            'arg_originals': arg_originals,
            'locals': local_names,
            'local_originals': local_originals,
            'body_start': signature['body_start'],
            'body_symbols': referenced_symbols,
            'body_strings': referenced_strings,
            'slot_names': slot_names,
            'local_used': local_used,
            'bound_symbol_map': bound_symbol_map,
            'global_aliases': {},
        }

    def _apply_command_fallback(self, specs: List[Dict[str, Any]]) -> None:
        unique_commands = list(dict.fromkeys(
            name for name in self.command_candidates if isinstance(name, str) and name.upper().startswith('C:')
        ))
        if len(unique_commands) != 1:
            return
        if any(spec['original_name'].upper().startswith('C:') for spec in specs if spec['original_name']):
            return
        candidates = [spec for spec in specs if not spec['is_init']]
        if not candidates:
            return
        target = max(candidates, key=lambda spec: len(spec['func'].instructions))
        target['original_name'] = unique_commands[0]

    def _finalize_function_names(self, specs: List[Dict[str, Any]]) -> None:
        used: Set[str] = set()
        for spec in specs:
            default_name = 'fas_init' if spec['is_init'] else f'fas_fn_{spec["index"] + 1:04d}'
            spec['name'] = self._unique_symbol(
                spec['original_name'],
                default_name,
                True,
                used,
            )

    def _emit_function(self, spec: Dict[str, Any]) -> List[str]:
        args_text = ' '.join(spec['args'])
        local_text = ''
        if spec['locals']:
            local_text = ' / ' + ' '.join(spec['locals'])

        lines: List[str] = []
        normalized_name = self._normalize_symbol(
            spec['original_name'],
            spec['name'],
            allow_command_prefix=True,
        )
        if spec['original_name'] and normalized_name != spec['name']:
            lines.append(f';; Original name hint: {spec["original_name"]}')
        if spec['arg_originals']:
            lines.append(f';; Original arg hints: {", ".join(spec["arg_originals"])}')
        if spec['body_symbols']:
            lines.append(f';; Referenced symbols: {", ".join(spec["body_symbols"][:10])}')
        if spec['body_strings']:
            preview = ', '.join(self._comment_text(value) for value in spec['body_strings'][:3])
            lines.append(f';; Referenced strings: {preview}')

        lines.append(f'(defun {spec["name"]} ({args_text}{local_text})')
        body_lines = self._generate_body(spec)
        if not body_lines:
            body_lines = ['  nil']
        lines.extend(body_lines)
        lines.append(')')
        return lines

    def _generate_body(self, spec: Dict[str, Any]) -> List[str]:
        instructions = spec['func'].instructions[spec['body_start']:]
        lines = self._render_block(spec, instructions, 0, len(instructions), 1)
        if not any(line.strip() and not line.strip().startswith(';;') for line in lines):
            lines.append('  nil')
        return lines

    def _generate_body_linear(self, spec: Dict[str, Any]) -> List[str]:
        lines: List[str] = []
        stack: List[str] = []
        unresolved_ops: Set[str] = set()

        def pop_expr(default: Optional[str] = 'nil') -> Optional[str]:
            return stack.pop() if stack else default

        def pop_many(count: int) -> List[str]:
            if count <= 0:
                return []
            if count > len(stack):
                count = len(stack)
            values = stack[-count:]
            del stack[-count:]
            return values

        def flush_stack() -> None:
            while stack:
                expr = stack.pop(0)
                lines.append(self._statement_line(expr, 1))

        for inst in spec['func'].instructions[spec['body_start']:]:
            name = inst.op_name
            if name in ('PUSH_G', 'PUSH_GLOBAL') and inst.operands:
                stack.append(self._literal_from_gvar(inst.operands[0]))
            elif name == 'PUSH_VALUE' and inst.operands:
                stack.append(self._value_from_gvar(inst.operands[0], spec))
            elif name == 'GET_LOCAL' and inst.operands:
                stack.append(self._local_name(inst.operands[0], spec))
            elif name == 'PUSH_NIL':
                stack.append('nil')
            elif name == 'PUSH_T':
                stack.append('T')
            elif name in ('PUSH_INT8', 'PUSH_INT32') and inst.operands:
                stack.append(str(inst.operands[0]))
            elif name == 'PUSH_REAL' and inst.operands:
                stack.append(str(inst.operands[0]))
            elif name == 'DUP':
                if stack:
                    stack.append(stack[-1])
            elif name == 'CAR':
                stack.append(f'(car {pop_expr()})')
            elif name == 'CDR':
                stack.append(f'(cdr {pop_expr()})')
            elif name == 'NOT':
                stack.append(f'(not {pop_expr()})')
            elif name == 'ATOM':
                stack.append(f'(atom {pop_expr()})')
            elif name in ('BUILD_LIST', 'LIST_OBJ') and inst.operands:
                args = pop_many(inst.operands[0])
                stack.append(self._make_call_text('list', args))
            elif name in ('USUBR', 'FUNC') and len(inst.operands) >= 2:
                argc = inst.operands[0]
                args = pop_many(argc)
                call_name = self._call_name(inst.operands[1], argc, spec, args)
                stack.append(self._make_call_text(call_name, args))
            elif name == 'EVAL' and inst.operands:
                args = pop_many(inst.operands[0] + 1)
                stack.append(self._make_call_text('eval', args))
            elif name == 'SETQ_G' and inst.operands:
                expr = pop_expr()
                target = self._value_from_gvar(inst.operands[0], spec)
                stack.append(f'(setq {target} {expr})')
            elif name == 'SET_LOCAL' and inst.operands:
                expr = pop_expr()
                target = self._local_name(inst.operands[0], spec)
                stack.append(f'(setq {target} {expr})')
            elif name == 'CLEAR_LOCAL' and inst.operands:
                target = self._local_name(inst.operands[0], spec)
                stack.append(f'(setq {target} nil)')
            elif name == 'POP':
                expr = pop_expr(default=None)
                if expr is not None:
                    lines.append(self._statement_line(expr, 1))
            elif name == 'INIT_ARGS' and inst.operands:
                consumed = pop_many((inst.operands[0] // 2) * 2)
                flush_stack()
                if consumed:
                    preview = ', '.join(consumed[:4])
                    lines.append(f'  ;; init-args {inst.operands[0]}: {preview}')
            elif name == 'END_DEFUN_CLEANUP' and inst.operands:
                dropped = pop_many(inst.operands[0] + 2)
                flush_stack()
                if dropped:
                    lines.append(f'  ;; cleanup {inst.operands[0]} vars')
            elif name in ('BR_IF_TRUE', 'JMP16_IF', 'JMP16_IF_2', 'JMP16_IFNOT', 'JMP16_IFNOT_2'):
                cond = pop_expr('T' if 'IFNOT' not in name else 'nil')
                flush_stack()
                keyword = 'if-not' if 'IFNOT' in name else 'if'
                lines.append(f'  ;; {keyword} {cond} then jump {inst.operands[0]:+d}')
            elif name in ('COND_OR', 'AND', 'AND2'):
                cond = pop_expr('nil')
                flush_stack()
                keyword = 'or' if name == 'COND_OR' else 'and'
                lines.append(f'  ;; {keyword}-branch {cond} -> {inst.operands[0]:+d}')
            elif name in ('JUMP', 'JUMP32'):
                flush_stack()
                lines.append(f'  ;; jump {inst.operands[0]:+d}')
            elif name in ('CLEAR_ARGS', 'END_DEFUN', 'INIT_DONE'):
                flush_stack()
            elif name in ('NIL', 'NOP', 'NOP_62', 'NOP_63'):
                continue
            else:
                unresolved_ops.add(name)

        flush_stack()

        if unresolved_ops:
            lines.append(f'  ;; unresolved ops: {", ".join(sorted(unresolved_ops)[:12])}')
        return lines

    def _render_block(self, spec: Dict[str, Any], instructions: List[Instruction],
                      start: int, end: int, indent: int) -> List[str]:
        lines: List[str] = []
        stack: List[str] = []
        unresolved_ops: Set[str] = set()
        pending_logic: List[Dict[str, Any]] = []
        offset_to_idx = {inst.offset: idx for idx, inst in enumerate(instructions)}

        def pop_expr(default: Optional[str] = 'nil') -> Optional[str]:
            return stack.pop() if stack else default

        def pop_many(count: int) -> List[str]:
            if count <= 0:
                return []
            if count > len(stack):
                count = len(stack)
            values = stack[-count:]
            del stack[-count:]
            return values

        def flush_stack() -> None:
            if pending_logic:
                stack.append(self._combine_short_circuit_terms(pending_logic))
                pending_logic.clear()
            while stack:
                expr = stack.pop(0)
                lines.append(self._statement_line(expr, indent))

        i = start
        while i < end:
            inst = instructions[i]
            name = inst.op_name

            if name in ('BR_IF_TRUE', 'JMP16_IF', 'JMP16_IF_2', 'JMP16_IFNOT', 'JMP16_IFNOT_2'):
                cond = pop_expr('T' if 'IFNOT' not in name else 'nil')
                if pending_logic:
                    cond = self._combine_short_circuit_terms(pending_logic, cond)
                    pending_logic.clear()
                flush_stack()
                target_idx = self._branch_target_index(instructions, offset_to_idx, i)
                if target_idx is not None and start <= target_idx <= end:
                    loop_info = self._detect_loop(spec, instructions, offset_to_idx, i, target_idx, end, cond)
                    if loop_info and (loop_info['keyword'] == 'foreach' or self._looks_structured_condition(cond)):
                        head = f'({loop_info["keyword"]} {loop_info["head"]}'
                        lines.append(f'{"  " * indent}{head}')
                        lines.extend(self._render_block(
                            spec,
                            instructions,
                            loop_info['body_start'],
                            loop_info['body_end'],
                            indent + 1,
                        ))
                        lines.append(f'{"  " * indent})')
                        i = loop_info['after']
                        continue

                    if_info = self._detect_if(instructions, offset_to_idx, i, target_idx, end)
                    if if_info and self._looks_structured_condition(cond):
                        then_lines = self._render_block(
                            spec,
                            instructions,
                            if_info['then_start'],
                            if_info['then_end'],
                            indent + 2,
                        )
                        lines.append(f'{"  " * indent}(if {cond}')
                        lines.extend(self._emit_progn(then_lines, indent + 1))
                        if if_info['else_start'] is not None and if_info['else_end'] is not None:
                            else_lines = self._render_block(
                                spec,
                                instructions,
                                if_info['else_start'],
                                if_info['else_end'],
                                indent + 2,
                            )
                            if else_lines:
                                lines.extend(self._emit_progn(else_lines, indent + 1))
                        lines.append(f'{"  " * indent})')
                        i = if_info['after']
                        continue

                i += 1
                continue

            if name in ('PUSH_G', 'PUSH_GLOBAL') and inst.operands:
                stack.append(self._literal_from_gvar(inst.operands[0]))
            elif name == 'PUSH_VALUE' and inst.operands:
                stack.append(self._value_from_gvar(inst.operands[0], spec))
            elif name == 'GET_LOCAL' and inst.operands:
                stack.append(self._local_name(inst.operands[0], spec))
            elif name == 'PUSH_NIL':
                stack.append('nil')
            elif name == 'PUSH_T':
                stack.append('T')
            elif name in ('PUSH_INT8', 'PUSH_INT32') and inst.operands:
                stack.append(str(inst.operands[0]))
            elif name == 'PUSH_REAL' and inst.operands:
                stack.append(str(inst.operands[0]))
            elif name == 'DUP':
                if stack:
                    stack.append(stack[-1])
            elif name == 'CAR':
                stack.append(f'(car {pop_expr()})')
            elif name == 'CDR':
                stack.append(f'(cdr {pop_expr()})')
            elif name == 'NOT':
                stack.append(f'(not {pop_expr()})')
            elif name == 'ATOM':
                stack.append(f'(atom {pop_expr()})')
            elif name in ('BUILD_LIST', 'LIST_OBJ') and inst.operands:
                args = pop_many(inst.operands[0])
                stack.append(self._make_call_text('list', args))
            elif name in ('FIX_ADD', 'FIX_SUB', 'FIX_MUL', 'FIX_DIV', 'FIX_MOD',
                          'FIX_LEQ', 'FIX_GEQ', 'FIX_LT', 'FIX_GT'):
                right = pop_expr()
                left = pop_expr()
                op_map = {
                    'FIX_ADD': '+',
                    'FIX_SUB': '-',
                    'FIX_MUL': '*',
                    'FIX_DIV': '/',
                    'FIX_MOD': 'rem',
                    'FIX_LEQ': '<=',
                    'FIX_GEQ': '>=',
                    'FIX_LT': '<',
                    'FIX_GT': '>',
                }
                stack.append(self._make_call_text(op_map[name], [left or 'nil', right or 'nil']))
            elif name == 'INC':
                stack.append(self._make_call_text('1+', [pop_expr() or 'nil']))
            elif name == 'DEC':
                stack.append(self._make_call_text('1-', [pop_expr() or 'nil']))
            elif name in ('USUBR', 'FUNC') and len(inst.operands) >= 2:
                argc = inst.operands[0]
                args = pop_many(argc)
                call_name = self._call_name(inst.operands[1], argc, spec, args)
                stack.append(self._make_call_text(call_name, args))
            elif name == 'EVAL' and inst.operands:
                args = pop_many(inst.operands[0] + 1)
                stack.append(self._make_call_text('eval', args))
            elif name == 'SETQ_G' and inst.operands:
                expr = pop_expr()
                target = self._value_from_gvar(inst.operands[0], spec)
                stack.append(f'(setq {target} {expr})')
            elif name == 'SET_LOCAL' and inst.operands:
                expr = pop_expr()
                target = self._local_name(inst.operands[0], spec)
                stack.append(f'(setq {target} {expr})')
            elif name == 'CLEAR_LOCAL' and inst.operands:
                target = self._local_name(inst.operands[0], spec)
                stack.append(f'(setq {target} nil)')
            elif name == 'POP':
                expr = pop_expr(default=None)
                if expr is not None:
                    lines.append(self._statement_line(expr, indent))
            elif name == 'INIT_ARGS' and inst.operands:
                consumed = pop_many((inst.operands[0] // 2) * 2)
                flush_stack()
                if consumed:
                    preview = ', '.join(consumed[:4])
                    lines.append(f'{"  " * indent};; init-args {inst.operands[0]}: {preview}')
            elif name == 'END_DEFUN_CLEANUP' and inst.operands:
                dropped = pop_many(inst.operands[0] + 2)
                flush_stack()
                if dropped:
                    lines.append(f'{"  " * indent};; cleanup {inst.operands[0]} vars')
            elif name in ('COND_OR', 'AND', 'AND2'):
                cond = pop_expr('nil')
                target_offset = inst.offset + inst.size + inst.operands[0] if inst.operands else None
                pending_logic.append({
                    'kind': 'or' if name == 'COND_OR' else 'and',
                    'expr': cond or 'nil',
                    'target': target_offset,
                })
            elif name in ('JUMP', 'JUMP32'):
                flush_stack()
            elif name in ('CLEAR_ARGS', 'END_DEFUN', 'INIT_DONE'):
                flush_stack()
            elif name in ('NIL', 'NOP', 'NOP_62', 'NOP_63', 'DEFUN'):
                pass
            else:
                unresolved_ops.add(name)
            i += 1

        flush_stack()
        if unresolved_ops:
            raise NotImplementedError(f'Unhandled opcodes: {", ".join(sorted(unresolved_ops))}')
        return lines

    def _emit_progn(self, body_lines: List[str], indent: int) -> List[str]:
        if not body_lines:
            return [f'{"  " * indent}nil']
        return [f'{"  " * indent}(progn', *body_lines, f'{"  " * indent})']

    def _combine_short_circuit_terms(self, terms: List[Dict[str, Any]],
                                     final_expr: Optional[str] = None) -> str:
        grouped: List[Tuple[str, List[str]]] = []
        for term in terms:
            expr = term['expr']
            if expr in {'T', 'nil'}:
                continue
            key = f'{term["kind"]}:{term.get("target")}'
            if grouped and grouped[-1][0] == key:
                grouped[-1][1].append(expr)
            else:
                grouped.append((key, [expr]))

        if final_expr and final_expr not in {'T', 'nil'}:
            if grouped:
                grouped[-1][1].append(final_expr)
            else:
                grouped.append(('and:final', [final_expr]))

        if not grouped:
            return final_expr or 'T'

        rendered: List[Tuple[str, str]] = []
        for key, exprs in grouped:
            kind = key.split(':', 1)[0]
            unique_exprs = list(dict.fromkeys(exprs))
            if len(unique_exprs) == 1:
                rendered.append((kind, unique_exprs[0]))
            else:
                rendered.append((kind, self._make_call_text(kind, unique_exprs)))

        result = rendered[0][1]
        for kind, expr in rendered[1:]:
            result = self._make_call_text(kind, [result, expr])
        return result

    def _branch_target_index(self, instructions: List[Instruction], offset_to_idx: Dict[int, int],
                             idx: int) -> Optional[int]:
        inst = instructions[idx]
        if not inst.operands:
            return None
        target_offset = inst.offset + inst.size + inst.operands[0]
        return offset_to_idx.get(target_offset)

    def _skip_pops(self, instructions: List[Instruction], idx: int, end: int) -> int:
        while idx < end and instructions[idx].op_name == 'POP':
            idx += 1
        return idx

    def _detect_foreach_setup(self, spec: Dict[str, Any], instructions: List[Instruction],
                              body_start: int, body_end: int, source_expr: str) -> Optional[Dict[str, Any]]:
        if body_start + 6 > body_end:
            return None
        seq = instructions[body_start:body_start + 6]
        if [inst.op_name for inst in seq] != ['GET_LOCAL', 'CAR', 'SETQ_G', 'GET_LOCAL', 'CDR', 'SET_LOCAL']:
            return None
        slot = seq[0].operands[0] if seq[0].operands else None
        if slot is None or not seq[3].operands or not seq[5].operands:
            return None
        if seq[3].operands[0] != slot or seq[5].operands[0] != slot:
            return None
        item_name = self._value_from_gvar(seq[2].operands[0], spec) if seq[2].operands else 'item'
        return {
            'keyword': 'foreach',
            'head': f'{item_name} {source_expr}',
            'body_start': body_start + 6,
            'body_end': body_end,
        }

    def _detect_loop(self, spec: Dict[str, Any], instructions: List[Instruction],
                     offset_to_idx: Dict[int, int], branch_idx: int, target_idx: int,
                     end: int, cond_expr: str) -> Optional[Dict[str, Any]]:
        back_jump_idx = None
        for idx in range(target_idx - 1, branch_idx, -1):
            inst = instructions[idx]
            if inst.op_name not in ('JUMP', 'JUMP32') or not inst.operands:
                continue
            jump_target = self._branch_target_index(instructions, offset_to_idx, idx)
            if jump_target is None or jump_target >= idx:
                continue
            if jump_target <= branch_idx:
                back_jump_idx = idx
                break
        if back_jump_idx is None:
            return None

        body_start = self._skip_pops(instructions, branch_idx + 1, back_jump_idx)
        loop_info = self._detect_foreach_setup(spec, instructions, body_start, back_jump_idx, cond_expr)
        if loop_info:
            loop_info['after'] = self._skip_pops(instructions, target_idx, end)
            return loop_info
        return {
            'keyword': 'while',
            'head': cond_expr,
            'body_start': body_start,
            'body_end': back_jump_idx,
            'after': self._skip_pops(instructions, target_idx, end),
        }

    def _detect_if(self, instructions: List[Instruction], offset_to_idx: Dict[int, int],
                   branch_idx: int, target_idx: int, end: int) -> Optional[Dict[str, int]]:
        then_start = self._skip_pops(instructions, branch_idx + 1, target_idx)
        jump_idx = None
        jump_target = None
        for idx in range(branch_idx + 1, min(target_idx, end)):
            inst = instructions[idx]
            if inst.op_name not in ('JUMP', 'JUMP32') or not inst.operands:
                continue
            target = self._branch_target_index(instructions, offset_to_idx, idx)
            if target is None or target <= idx or target < target_idx:
                continue
            jump_idx = idx
            jump_target = target
        if jump_idx is not None and jump_target is not None:
            if then_start >= jump_idx:
                return None
            return {
                'then_start': then_start,
                'then_end': jump_idx,
                'else_start': self._skip_pops(instructions, target_idx, min(jump_target, end)),
                'else_end': min(jump_target, end),
                'after': self._skip_pops(instructions, min(jump_target, end), end),
            }
        if then_start >= target_idx:
            return None
        return {
            'then_start': then_start,
            'then_end': target_idx,
            'else_start': None,
            'else_end': None,
            'after': self._skip_pops(instructions, target_idx, end),
        }

    def _looks_structured_condition(self, expr: str) -> bool:
        return expr not in {'T', 'nil', '0', '0.0'}

    def _extract_signature(self, instructions: List[Instruction]) -> Dict[str, Any]:
        start = 1 if instructions and instructions[0].op_name == 'DEFUN' else 0
        init_idx = None
        limit = min(len(instructions), start + 24)
        for idx in range(start, limit):
            if instructions[idx].op_name == 'INIT_ARGS':
                init_idx = idx
                break
            if instructions[idx].op_name in ('SETQ_G', 'SET_LOCAL', 'USUBR', 'FUNC', 'BR_IF_TRUE', 'JUMP'):
                break
        if init_idx is None:
            return {'args': [], 'body_start': start, 'local_binding_names': []}

        init_count = instructions[init_idx].operands[0] if instructions[init_idx].operands else 0
        pushed: List[Tuple[str, Any]] = []
        for inst in instructions[start:init_idx]:
            if inst.op_name == 'PUSH_G' and inst.operands:
                pushed.append(('name', inst.operands[0]))
            elif inst.op_name == 'GET_LOCAL' and inst.operands:
                pushed.append(('slot', inst.operands[0]))
            elif inst.op_name == 'PUSH_NIL':
                pushed.append(('nil', None))

        args: List[Tuple[int, str]] = []
        local_binding_names: List[str] = []
        pair_items = pushed[-((init_count // 2) * 2):]
        for pos in range(0, len(pair_items) - 1, 2):
            left, right = pair_items[pos], pair_items[pos + 1]
            if left[0] == 'name' and right[0] == 'slot':
                raw_item = self._gvar_item(left[1])
                symbol_list = self._extract_symbol_list(raw_item)
                if symbol_list:
                    local_binding_names.extend(symbol_list)
                    continue
                raw_name = self._gvar_symbol(left[1]) or f'arg_{len(args) + 1}'
                args.append((right[1], raw_name))

        return {'args': args, 'body_start': init_idx + 1, 'local_binding_names': local_binding_names}

    def _referenced_symbols(self, instructions: List[Instruction]) -> List[str]:
        names: List[str] = []
        seen = set()
        for inst in instructions:
            candidate = None
            if inst.op_name in ('USUBR', 'FUNC') and len(inst.operands) >= 2:
                candidate = self._gvar_symbol(inst.operands[1])
            elif inst.op_name == 'PUSH_VALUE' and inst.operands:
                candidate = self._gvar_symbol(inst.operands[0])
            elif inst.op_name == 'PUSH_G' and inst.operands:
                literal = self._gvar_item(inst.operands[0])
                candidate = self._extract_symbol_text(literal)
            if candidate and candidate not in seen:
                names.append(candidate)
                seen.add(candidate)
        return names

    def _referenced_strings(self, instructions: List[Instruction]) -> List[str]:
        values: List[str] = []
        seen = set()
        for inst in instructions:
            if inst.op_name != 'PUSH_G' or not inst.operands:
                continue
            literal = self._gvar_item(inst.operands[0])
            text = self._extract_text(literal)
            if isinstance(text, str) and not self._extract_symbol_text(literal):
                if text not in seen:
                    values.append(text)
                    seen.add(text)
        return values

    def _choose_function_name(self, func: FunctionDef, func_index: int, referenced_symbols: List[str]) -> str:
        if func.name and not func.name.startswith('c:fn') and not (func.sym_idx < 0 and func.name.startswith('c:init')):
            return func.name
        start_offset = func.instructions[0].offset if func.instructions else -1
        if start_offset in self.function_names_by_offset:
            return self.function_names_by_offset[start_offset]
        if func.sym_idx >= 0 and func.sym_idx in self.function_names_by_index:
            return self.function_names_by_index[func.sym_idx]
        if func.sym_idx < 0:
            return 'fas_init' if func_index == 0 else f'fas_init_{func_index}'

        command_refs = [name for name in referenced_symbols if name.upper().startswith('C:')]
        unique_commands = list(dict.fromkeys(command_refs))
        if len(unique_commands) == 1:
            return unique_commands[0]

        for name in referenced_symbols:
            if name.upper() in self.BUILTIN_SYMBOLS:
                continue
            if len(name) <= 1:
                continue
            return name

        return f'fas_fn_{func_index + 1:04d}'

    def _gvar_item(self, idx: int) -> Any:
        if 0 <= idx < len(self.fas.function_gvars) and self.fas.function_gvars[idx] is not None:
            return self.fas.function_gvars[idx]
        if 0 <= idx < len(self.fas.resource_gvars) and self.fas.resource_gvars[idx] is not None:
            return self.fas.resource_gvars[idx]
        if 0 <= idx < len(self.fas.symbols):
            return self.fas.symbols[idx]
        return None

    def _gvar_symbol(self, idx: int) -> Optional[str]:
        value = self._gvar_item(idx)
        return self._extract_symbol_text(value)

    def _resource_gvar_text(self, idx: int) -> Optional[str]:
        if 0 <= idx < len(self.fas.resource_gvars):
            return self._extract_text(self.fas.resource_gvars[idx])
        return None

    def _value_from_gvar(self, idx: int, spec: Dict[str, Any]) -> str:
        bound_name = self._bound_symbol_name(idx, spec)
        if bound_name:
            return bound_name

        aliases = spec['global_aliases']
        if idx in aliases:
            return aliases[idx]

        raw_name = self._gvar_symbol(idx) or f'gvar_{idx}'
        candidate = raw_name
        if not any(ch.isalpha() for ch in raw_name) and not raw_name.startswith('*'):
            candidate = f'gvar_{idx}'
        elif raw_name.upper() in self.BUILTIN_SYMBOLS or raw_name.upper().startswith('C:'):
            candidate = f'gvar_{idx}_{raw_name}'
        aliases[idx] = self._unique_symbol(candidate, f'gvar_{idx}', False, spec['local_used'])
        return aliases[idx]

    def _literal_from_gvar(self, idx: int) -> str:
        return self._render_literal(self._gvar_item(idx))

    def _call_name(self, idx: int, argc: int = 0, spec: Optional[Dict[str, Any]] = None,
                   args: Optional[List[str]] = None) -> str:
        raw_name = self._gvar_symbol(idx)
        if raw_name and self._looks_callable_name(raw_name):
            repaired = self._repair_call_target(idx, raw_name, argc, spec, args or [])
            if repaired:
                raw_name = repaired
            return self._normalize_symbol(raw_name, f'gfun_{idx}', allow_command_prefix=True)
        repaired = self._repair_call_target(idx, None, argc, spec, args or [])
        if repaired:
            return self._normalize_symbol(repaired, f'gfun_{idx}', allow_command_prefix=True)
        return f'gfun_{idx}'

    def _local_name(self, slot: int, spec: Dict[str, Any]) -> str:
        if slot not in spec['slot_names']:
            spec['slot_names'][slot] = self._unique_symbol(
                f'local_{slot}',
                f'local_{slot}',
                False,
                spec['local_used'],
            )
        return spec['slot_names'][slot]

    def _render_literal(self, value: Any) -> str:
        if value is None:
            return 'nil'
        if value is True:
            return 'T'
        if isinstance(value, int):
            return str(value)
        symbol_text = self._extract_symbol_text(value)
        if symbol_text:
            return "'" + self._normalize_symbol(symbol_text, 'sym', allow_command_prefix=True)
        text = self._extract_text(value)
        if isinstance(text, str):
            return self._quote(text)
        rendered = self._render_data_item(value)
        if rendered.startswith('('):
            return "'" + rendered
        return "'" + rendered

    def _render_data_item(self, value: Any) -> str:
        if value is None:
            return 'nil'
        if value is True:
            return 'T'
        if isinstance(value, int):
            return str(value)
        symbol_text = self._extract_symbol_text(value)
        if symbol_text:
            return self._normalize_symbol(symbol_text, 'sym', allow_command_prefix=True)
        text = self._extract_text(value)
        if isinstance(text, str):
            return self._quote(text)
        if isinstance(value, tuple):
            if len(value) >= 4 and value[0] == 'FUNC':
                func_name = self._extract_symbol_text(value[1]) or self._extract_text(value[1]) or 'fn'
                return self._normalize_symbol(str(func_name), 'fn', allow_command_prefix=True)
            if len(value) == 3 and value[0] == 'CONS':
                return f'(cons {self._render_data_item(value[1])} {self._render_data_item(value[2])})'
            if len(value) == 5 and value[0] == 'CALL':
                func_name = self._extract_symbol_text(value[1]) or self._extract_text(value[1]) or f'gfun_{value[2]}'
                args = [self._render_data_item(item) for item in value[4]]
                return self._make_call_text(self._normalize_symbol(str(func_name), 'fn', allow_command_prefix=True), args)
            if len(value) == 4 and value[0] == 'EVAL':
                args = [self._render_data_item(item) for item in value[3]]
                return self._make_call_text('eval', args)
            if len(value) == 2 and value[0] in ('STRING', 'REAL'):
                return self._quote(str(value[1]))
            if len(value) == 2 and value[0] == 'SYMBOL':
                return self._normalize_symbol(str(value[1]), 'sym', allow_command_prefix=True)
            if len(value) == 2 and value[0] in ('NOT', 'ATOM'):
                return f'({value[0].lower()} {self._render_data_item(value[1])})'
            return '(' + ' '.join(self._render_data_item(item) for item in value) + ')'
        return self._quote(str(value))

    def _extract_text(self, value: Any) -> Optional[str]:
        if isinstance(value, str):
            return value
        if isinstance(value, tuple) and len(value) == 2 and value[0] in ('STRING', 'SYMBOL', 'REAL'):
            return str(value[1])
        return None

    def _extract_symbol_text(self, value: Any) -> Optional[str]:
        if isinstance(value, str) and self._is_symbol_like(value):
            return value
        if isinstance(value, tuple) and len(value) == 2 and value[0] == 'SYMBOL':
            return str(value[1])
        return None

    def _extract_symbol_list(self, value: Any) -> List[str]:
        if not isinstance(value, tuple) or not value:
            return []
        if len(value) == 2 and value[0] in ('SYMBOL', 'STRING', 'REAL'):
            return []
        result: List[str] = []
        for item in value:
            text = self._extract_symbol_text(item)
            if not text:
                return []
            result.append(text)
        return result

    def _bound_symbol_name(self, idx: int, spec: Dict[str, Any]) -> Optional[str]:
        bound = spec.get('bound_symbol_map', {})
        for candidate_idx in (idx, idx + 1, idx - 1, idx + 2, idx - 2):
            name = self._gvar_symbol(candidate_idx)
            if name and name.upper() in bound:
                return bound[name.upper()]
        return None

    def _repair_call_target(self, idx: int, raw_name: Optional[str], argc: int,
                            spec: Optional[Dict[str, Any]], args: List[str]) -> Optional[str]:
        if raw_name and not self._is_bad_builtin_arity(raw_name, argc):
            return raw_name

        prefer_princ = argc == 1 and any(arg.startswith('"') or 'strcat' in arg.lower() for arg in args)
        best_name = None
        best_score = None
        max_distance = 24 if raw_name is None else 12
        for distance in range(1, max_distance + 1):
            for candidate_idx in (idx + distance, idx - distance):
                name = self._gvar_symbol(candidate_idx)
                if not name or not self._looks_callable_name(name):
                    continue
                if spec and name.upper() in spec.get('bound_symbol_map', {}):
                    continue
                if raw_name is None and self._is_bad_builtin_arity(name, argc):
                    continue
                score = -distance
                arity = self.COMMON_ARITY.get(name.upper())
                if arity is not None and argc in arity:
                    score += 250
                elif not self._is_bad_builtin_arity(name, argc):
                    score += 100
                if prefer_princ and name.upper() == 'PRINC':
                    score += 200
                if best_score is None or score > best_score:
                    best_name = name
                    best_score = score

        if best_name:
            return best_name

        if raw_name:
            return raw_name
        return None

    def _is_bad_builtin_arity(self, name: str, argc: int) -> bool:
        allowed = self.COMMON_ARITY.get(name.upper())
        if allowed is None:
            return False
        return argc not in allowed

    def _make_call_text(self, name: str, args: List[str]) -> str:
        if args:
            return f'({name} {" ".join(args)})'
        return f'({name})'

    def _statement_line(self, expr: str, indent: int = 1) -> str:
        prefix = '  ' * indent
        return f'{prefix}{expr}'

    def _is_symbol_like(self, value: str) -> bool:
        if not value:
            return False
        if '\n' in value or '\r' in value or ' ' in value or '"' in value:
            return False
        return bool(re.match(r'^[A-Za-z0-9_:\\/*+#<>=?.-]+$', value))

    def _normalize_symbol(self, name: str, prefix: str = 'sym', allow_command_prefix: bool = False) -> str:
        if not name:
            return prefix

        raw = name.strip()
        if raw in {'=', '>', '<', '>=', '<=', '/=', '1+', '1-', '+', '-', '*', '/'}:
            return raw.lower()
        command_prefix = raw[:2].lower() if allow_command_prefix and raw.upper().startswith('C:') else ''
        body = raw[2:] if command_prefix else raw

        if raw.startswith('*') and raw.endswith('*') and len(raw) > 2:
            inner = re.sub(r'[^A-Za-z0-9_:-]+', '_', raw[1:-1]).strip('_')
            return f'*{(inner or prefix).lower()}*'

        body = re.sub(r'[^A-Za-z0-9_+<>=.-]+', '_', body)
        body = re.sub(r'_+', '_', body)
        if not body:
            body = prefix
        if body[0].isdigit():
            body = f'{prefix}_{body}'
        return f'{command_prefix}{body}'.lower() if command_prefix else body.lower()

    def _looks_callable_name(self, value: str) -> bool:
        if value in {'=', '>', '<', '>=', '<=', '/=', '1+', '1-', '+', '-', '*', '/'}:
            return True
        return any(ch.isalpha() for ch in value) or value.upper().startswith('C:') or value.startswith('*')

    def _unique_symbol(self, name: str, prefix: str, allow_command_prefix: bool, used: Set[str]) -> str:
        candidate = self._normalize_symbol(name, prefix, allow_command_prefix)
        counter = 2
        unique = candidate
        while unique in used:
            unique = f'{candidate}_{counter}'
            counter += 1
        used.add(unique)
        return unique

    def _quote(self, value: str) -> str:
        escaped = (
            value.replace('\\', '\\\\')
            .replace('"', '\\"')
            .replace('\r', '\\r')
            .replace('\n', '\\n')
        )
        return f'"{escaped}"'

    def _comment_text(self, value: str) -> str:
        return value.replace('\r', '\\r').replace('\n', '\\n')

class Fas4Decompiler:
    def decompile(self, filepath: str, output_path: str = None) -> str:
        parser = Fas4Parser()
        fas = parser.parse(filepath)
        disasm = Disassembler()
        instructions = disasm.disassemble(fas.bytecode, fas.nsyms)
        cf = ControlFlowAnalyzer(instructions, fas.function_catalog)
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
    if len(sys.argv) < 2:
        print("Usage: python fas4_decompiler.py <input.fas> [output.lsp]")
        sys.exit(1)
    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else None
    if not os.path.exists(input_file):
        print(f"Error: File '{input_file}' not found")
        sys.exit(1)
    decompiler = Fas4Decompiler()
    try:
        decompiler.decompile(input_file, output_file)
        print(f"Decompilation complete for {input_file}")
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)
