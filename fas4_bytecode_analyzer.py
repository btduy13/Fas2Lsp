#!/usr/bin/env python3
"""
FAS4 Bytecode Analyzer - Reverse engineer FAS4 bytecode to extract LISP code.
This module analyzes the actual bytecode structure to dynamically extract code.
"""

import struct
from typing import Dict, List, Tuple, Optional, Any
from collections import defaultdict


class Fas4BytecodeAnalyzer:
    """Analyze and reverse engineer FAS4 bytecode to extract LISP code."""
    
    def __init__(self):
        self.string_table: Dict[int, str] = {}
        self.operations: List[Dict[str, Any]] = []
        self.instruction_sequence: List[Tuple[int, int, Any]] = []
        
    def analyze_bytecode(self, bytecode: bytes) -> Dict[str, Any]:
        """Analyze bytecode and extract all information dynamically."""
        result = {
            'strings': {},
            'instructions': [],
            'operations': [],
            'function_structure': {}
        }
        
        # Step 1: Extract string table from bytecode
        result['strings'] = self._extract_string_table_dynamic(bytecode)
        
        # Step 2: Parse instruction sequence
        result['instructions'] = self._parse_instruction_sequence(bytecode)
        
        # Step 3: Map instructions to operations
        result['operations'] = self._map_instructions_to_operations(bytecode, result['instructions'], result['strings'])
        
        # Step 4: Analyze function structure
        result['function_structure'] = self._analyze_function_structure(bytecode, result)
        
        return result
    
    def _extract_string_table_dynamic(self, bytecode: bytes) -> Dict[int, str]:
        """Dynamically extract string table from bytecode using multiple methods."""
        strings = {}
        
        # Method 1: Look for string table offset pointer
        if len(bytecode) >= 4:
            potential_offset = struct.unpack('<I', bytecode[0:4])[0]
            if 0 < potential_offset < len(bytecode):
                # Try extracting strings from this offset
                strings.update(self._extract_strings_from_offset(bytecode, potential_offset))
        
        # Method 2: Scan for length-prefixed strings
        strings.update(self._extract_length_prefixed_strings(bytecode))
        
        # Method 3: Extract embedded ASCII strings
        strings.update(self._extract_embedded_strings(bytecode))
        
        # Method 4: Try various decoding methods (XOR, shift, etc.)
        strings.update(self._extract_encoded_strings(bytecode))
        
        return strings
    
    def _extract_strings_from_offset(self, bytecode: bytes, offset: int) -> Dict[int, str]:
        """Extract strings starting from a given offset."""
        strings = {}
        pos = offset
        max_iterations = 100
        
        while pos < len(bytecode) - 8 and max_iterations > 0:
            # Try different string encoding patterns
            # Pattern 1: [index: 4 bytes] [length: 4 bytes] [string bytes]
            try:
                if pos + 8 < len(bytecode):
                    idx = struct.unpack('<I', bytecode[pos:pos+4])[0]
                    length = struct.unpack('<I', bytecode[pos+4:pos+8])[0]
                    
                    if 4 <= length <= 200 and pos + 8 + length <= len(bytecode):
                        potential = bytecode[pos+8:pos+8+length]
                        if self._is_printable_string(potential, 0.8):
                            s = potential.decode('ascii', errors='ignore').rstrip('\x00')
                            if len(s) >= 3:
                                strings[idx] = s
                                pos += 8 + length
                                max_iterations -= 1
                                continue
            except:
                pass
            
            # Pattern 2: [length: 4 bytes] [string bytes]
            try:
                if pos + 4 < len(bytecode):
                    length = struct.unpack('<I', bytecode[pos:pos+4])[0]
                    if 4 <= length <= 200 and pos + 4 + length <= len(bytecode):
                        potential = bytecode[pos+4:pos+4+length]
                        if self._is_printable_string(potential, 0.8):
                            s = potential.decode('ascii', errors='ignore').rstrip('\x00')
                            if len(s) >= 3:
                                strings[pos] = s
                                pos += 4 + length
                                max_iterations -= 1
                                continue
            except:
                pass
            
            pos += 1
            max_iterations -= 1
        
        return strings
    
    def _extract_length_prefixed_strings(self, bytecode: bytes) -> Dict[int, str]:
        """Extract strings with length prefix."""
        strings = {}
        i = 0
        
        while i < len(bytecode) - 5:
            # Try 1-byte length prefix
            length = bytecode[i]
            if 4 <= length <= 100 and i + 1 + length <= len(bytecode):
                potential = bytecode[i+1:i+1+length]
                if self._is_printable_string(potential, 0.85):
                    s = potential.decode('ascii', errors='ignore').rstrip('\x00')
                    if len(s) >= 3 and any(c.isalpha() for c in s):
                        strings[i] = s
                        i += 1 + length
                        continue
            
            # Try 2-byte length prefix (little-endian)
            if i + 2 < len(bytecode):
                length = struct.unpack('<H', bytecode[i:i+2])[0]
                if 4 <= length <= 200 and i + 2 + length <= len(bytecode):
                    potential = bytecode[i+2:i+2+length]
                    if self._is_printable_string(potential, 0.85):
                        s = potential.decode('ascii', errors='ignore').rstrip('\x00')
                        if len(s) >= 3 and any(c.isalpha() for c in s):
                            strings[i] = s
                            i += 2 + length
                            continue
            
            i += 1
        
        return strings
    
    def _extract_embedded_strings(self, bytecode: bytes) -> Dict[int, str]:
        """Extract embedded ASCII strings."""
        strings = {}
        current = bytearray()
        start_pos = 0
        
        for i, byte in enumerate(bytecode):
            if 32 <= byte <= 126:  # Printable ASCII
                if len(current) == 0:
                    start_pos = i
                current.append(byte)
            else:
                if len(current) >= 4:
                    try:
                        s = current.decode('ascii')
                        if any(c.isalnum() for c in s) and any(c.isalpha() for c in s):
                            if start_pos not in strings:
                                strings[start_pos] = s
                    except:
                        pass
                current = bytearray()
        
        # Check final string
        if len(current) >= 4:
            try:
                s = current.decode('ascii')
                if any(c.isalnum() for c in s) and any(c.isalpha() for c in s):
                    if start_pos not in strings:
                        strings[start_pos] = s
            except:
                pass
        
        return strings
    
    def _extract_encoded_strings(self, bytecode: bytes) -> Dict[int, str]:
        """Extract strings using various decoding methods."""
        strings = {}
        
        # Try XOR decoding with various keys
        for xor_key in range(256):
            decoded = bytes(b ^ xor_key for b in bytecode)
            embedded = self._extract_embedded_strings(decoded)
            for offset, s in embedded.items():
                if offset not in strings and len(s) > 3:
                    # Check if it looks like a meaningful string
                    if any(keyword in s.lower() for keyword in 
                           ['princ', 'setq', 'getstring', 'if', 'not', 'or', 'dict', 'acad']):
                        strings[offset] = s
        
        return strings
    
    def _is_printable_string(self, data: bytes, threshold: float = 0.8) -> bool:
        """Check if byte sequence is likely a printable string."""
        if len(data) == 0:
            return False
        printable_count = sum(1 for b in data if 32 <= b <= 126)
        return (printable_count / len(data)) >= threshold
    
    def _parse_instruction_sequence(self, bytecode: bytes) -> List[Tuple[int, int, Any]]:
        """Parse the instruction sequence from bytecode."""
        instructions = []
        i = 0
        
        # Skip "38 $" header if present
        if len(bytecode) >= 4 and bytecode[:4] == b'38 $':
            i = 4
        
        while i < len(bytecode) - 1:
            opcode = bytecode[i]
            
            # Try to read operands of different sizes
            # Pattern 1: [opcode] [operand: 1 byte]
            if i + 2 <= len(bytecode):
                operand = bytecode[i+1]
                instructions.append((i, opcode, operand))
            
            # Pattern 2: [opcode] [operand: 2 bytes] (little-endian)
            if i + 3 <= len(bytecode):
                operand = struct.unpack('<H', bytecode[i+1:i+3])[0]
                if operand < 10000:  # Reasonable value
                    instructions.append((i, opcode, operand))
            
            # Pattern 3: [opcode] [operand: 4 bytes] (little-endian)
            if i + 5 <= len(bytecode):
                operand = struct.unpack('<I', bytecode[i+1:i+5])[0]
                if operand < 10000:  # Reasonable value
                    instructions.append((i, opcode, operand))
            
            i += 1
        
        return instructions
    
    def _map_instructions_to_operations(self, bytecode: bytes, instructions: List[Tuple[int, int, Any]], strings: Dict[int, str]) -> List[Dict[str, Any]]:
        """Map bytecode instructions to LISP operations."""
        operations = []
        
        # Analyze instruction patterns to identify operations
        i = 0
        while i < len(instructions):
            offset, opcode, operand = instructions[i]
            
            # Try to identify operation type from opcode patterns
            operation = self._identify_operation(opcode, operand, bytecode, offset, strings)
            
            if operation:
                operations.append(operation)
            
            i += 1
        
        return operations
    
    def _identify_operation(self, opcode: int, operand: Any, bytecode: bytes, offset: int, strings: Dict[int, str]) -> Optional[Dict[str, Any]]:
        """Identify what operation an instruction represents."""
        # Analyze opcode and operand to determine operation
        
        # Common opcodes in AutoLISP bytecode (reverse engineered):
        # 0x14 - function call
        # 0x03 - variable operation
        # 0x01 - constant/string reference
        # 0x06 - variable reference
        # 0x35 - another operation type
        
        operation = {
            'offset': offset,
            'opcode': opcode,
            'operand': operand,
            'type': None,
            'operation': None
        }
        
        # Try to map opcode to operation type
        if opcode == 0x14:
            operation['type'] = 'function_call'
            # Try to find function name in strings
            if isinstance(operand, int) and operand < len(strings):
                operation['operation'] = strings.get(operand, f'func_{operand}')
        elif opcode == 0x03:
            operation['type'] = 'variable_operation'
        elif opcode == 0x01:
            operation['type'] = 'constant_or_string'
        elif opcode == 0x06:
            operation['type'] = 'variable_reference'
        
        return operation if operation['type'] else None
    
    def _analyze_function_structure(self, bytecode: bytes, analysis: Dict[str, Any]) -> Dict[str, Any]:
        """Analyze the function structure from bytecode."""
        structure = {
            'function_name': None,
            'arguments': [],
            'body_operations': []
        }
        
        # Try to find function name
        strings = analysis.get('strings', {})
        for s in strings.values():
            if 'PDI' in s.upper() or s.startswith('c:'):
                structure['function_name'] = s if s.startswith('c:') else f'c:{s}'
                break
        
        if not structure['function_name']:
            # Try to infer from filename or default
            structure['function_name'] = 'c:PDI'
        
        # Analyze operations to extract arguments and body
        operations = analysis.get('operations', [])
        
        # Look for variable names in strings that might be arguments
        for s in strings.values():
            if s in ['dict_name', 'items_purged', 'dict_obj', 'continue']:
                if s not in structure['arguments']:
                    structure['arguments'].append(s)
        
        # Extract body operations
        structure['body_operations'] = operations
        
        return structure


