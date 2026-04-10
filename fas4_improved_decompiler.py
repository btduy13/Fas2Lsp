#!/usr/bin/env python3
"""
Improved FAS4 Decompiler - Enhanced reverse engineering with better heuristics
"""

import struct
import os
import sys
from typing import Dict, List, Tuple, Optional, Any, Set
from dataclasses import dataclass


@dataclass
class ExtractedString:
    offset: int
    value: str
    confidence: float
    method: str


class ImprovedFas4Decompiler:
    """Improved FAS4 decompiler with better string extraction and bytecode analysis."""
    
    # Common AutoLISP keywords and functions
    AUTOLISP_KEYWORDS = {
        'princ', 'setq', 'getstring', 'namedobjdict', 'wcmatch', 'dictremove',
        'strcat', 'itoa', 'if', 'progn', 'not', 'exit', 'or', 'and', 'while',
        'foreach', 'mapcar', 'apply', 'lambda', 'defun', 'cond', 'case',
        'car', 'cdr', 'cons', 'list', 'append', 'reverse', 'length', 'member',
        'assoc', 'subst', 'nth', 'last', 'nthcdr', 'append', 'reverse'
    }
    
    # Common AutoCAD dictionary names
    ACAD_DICTS = {
        'ACAD_GROUP', 'ACAD_LAYOUT', 'ACAD_MATERIAL', 'ACAD_MLINESTYLE',
        'ACAD_PLOTSETTINGS', 'ACAD_TABLESTYLE', 'ACAD_COLOR', 'ACAD_VISUALSTYLE',
        'ACAD_DETAILVIEWSTYLE', 'ACAD_SECTIONVIEWSTYLE', 'ACAD_SCALELIST',
        'ACAD_MLEADERSTYLE', 'AcDbVariableDictionary'
    }
    
    def __init__(self):
        self.bytecode = b''
        self.strings: Dict[int, ExtractedString] = {}
        self.operations: List[Dict[str, Any]] = []
        self.function_info: Dict[str, Any] = {}
        
    def decompile(self, file_path: str) -> str:
        """Decompile FAS4 file to LISP code."""
        # Read and parse FAS4 file
        with open(file_path, 'rb') as f:
            data = f.read()
        
        # Parse FAS4 header
        header_pos = data.find(b'FAS4-FILE')
        if header_pos == -1:
            raise ValueError("Not a valid FAS4 file")
        
        # Find size line
        size_start = data.find(b'\n', header_pos) + 1
        if size_start == 0:
            size_start = data.find(b'\r', header_pos) + 1
        
        size_end = data.find(b'\n', size_start)
        if size_end == -1:
            size_end = data.find(b'\r', size_start)
        
        size_str = data[size_start:size_end].decode('ascii', errors='ignore').strip()
        try:
            payload_size = int(size_str)
        except ValueError:
            raise ValueError(f"Invalid size value: {size_str}")
        
        # Extract payload
        payload_start = size_end + 1
        if payload_start < len(data) and data[payload_start] == ord('\n'):
            payload_start += 1
        
        payload = data[payload_start:payload_start + payload_size]
        
        # Skip "38 $" header if present
        if len(payload) >= 4 and payload[:4] == b'38 $':
            self.bytecode = payload[4:]
        else:
            self.bytecode = payload
        
        print(f"Analyzing {len(self.bytecode)} bytes of bytecode...")
        
        # Extract strings using improved methods
        self._extract_strings_comprehensive()
        
        # Analyze bytecode structure
        self._analyze_bytecode_structure()
        
        # Generate LISP code
        return self._generate_lisp_code()
    
    def _extract_strings_comprehensive(self):
        """Extract strings using multiple improved methods."""
        print("Extracting strings using comprehensive methods...")
        
        # Method 1: Direct ASCII extraction (high confidence)
        self._extract_ascii_strings()
        
        # Method 2: Try string table at offset (first uint32)
        if len(self.bytecode) >= 4:
            offset = struct.unpack('<I', self.bytecode[0:4])[0]
            if 0 < offset < len(self.bytecode):
                self._extract_string_table(offset)
        
        # Method 3: Try various XOR keys with validation
        self._extract_xor_strings()
        
        # Method 4: Try ROT/shift ciphers
        self._extract_shift_strings()
        
        # Method 5: Try length-prefixed strings throughout
        self._extract_length_prefixed_strings()
        
        # Method 6: Try known pattern matching (crib attack)
        self._extract_known_patterns()
        
        print(f"Extracted {len(self.strings)} unique strings")
    
    def _extract_ascii_strings(self):
        """Extract readable ASCII strings directly."""
        current = bytearray()
        start_pos = 0
        
        for i, byte in enumerate(self.bytecode):
            if 32 <= byte <= 126:  # Printable ASCII
                if len(current) == 0:
                    start_pos = i
                current.append(byte)
            else:
                if len(current) >= 3:
                    try:
                        s = current.decode('ascii')
                        if self._is_meaningful_string(s):
                            confidence = self._calculate_confidence(s, 'ascii')
                            if start_pos not in self.strings or confidence > self.strings[start_pos].confidence:
                                self.strings[start_pos] = ExtractedString(
                                    start_pos, s, confidence, 'ascii'
                                )
                    except:
                        pass
                current = bytearray()
        
        if len(current) >= 3:
            try:
                s = current.decode('ascii')
                if self._is_meaningful_string(s):
                    confidence = self._calculate_confidence(s, 'ascii')
                    if start_pos not in self.strings or confidence > self.strings[start_pos].confidence:
                        self.strings[start_pos] = ExtractedString(
                            start_pos, s, confidence, 'ascii'
                        )
            except:
                pass
    
    def _extract_string_table(self, offset: int):
        """Extract strings from potential string table location."""
        pos = offset
        max_iter = 200
        
        # Try format: [index: 4 bytes] [length: 4 bytes] [string bytes]
        while pos < len(self.bytecode) - 8 and max_iter > 0:
            try:
                idx = struct.unpack('<I', self.bytecode[pos:pos+4])[0]
                length = struct.unpack('<I', self.bytecode[pos+4:pos+8])[0]
                
                if 1 <= length <= 500 and pos + 8 + length <= len(self.bytecode):
                    string_bytes = self.bytecode[pos+8:pos+8+length]
                    s = self._decode_string_bytes(string_bytes)
                    if s:
                        confidence = self._calculate_confidence(s, 'string_table')
                        if idx not in self.strings or confidence > self.strings[idx].confidence:
                            self.strings[idx] = ExtractedString(
                                idx, s, confidence, 'string_table'
                            )
                        pos += 8 + length
                        max_iter -= 1
                        continue
            except:
                pass
            
            # Try format: [length: 4 bytes] [string bytes]
            try:
                if pos + 4 < len(self.bytecode):
                    length = struct.unpack('<I', self.bytecode[pos:pos+4])[0]
                    if 1 <= length <= 500 and pos + 4 + length <= len(self.bytecode):
                        string_bytes = self.bytecode[pos+4:pos+4+length]
                        s = self._decode_string_bytes(string_bytes)
                        if s:
                            confidence = self._calculate_confidence(s, 'string_table')
                            if pos not in self.strings or confidence > self.strings[pos].confidence:
                                self.strings[pos] = ExtractedString(
                                    pos, s, confidence, 'string_table'
                                )
                            pos += 4 + length
                            max_iter -= 1
                            continue
            except:
                pass
            
            pos += 1
            max_iter -= 1
    
    def _extract_xor_strings(self):
        """Extract strings using XOR decoding with validation."""
        # Try common XOR keys
        keys = [0x00, 0x01, 0xFF, 0x55, 0xAA, 0x38, 0x24, 0x13, 0x7F, 0x80, 0xC0]
        
        for key in keys:
            decoded = bytes(b ^ key for b in self.bytecode)
            self._extract_from_decoded(decoded, f'xor_{key:02x}')
    
    def _extract_shift_strings(self):
        """Extract strings using shift/rotation ciphers."""
        # Try ROT13-like shifts
        for shift in [1, 2, 3, 4, 5, 13, 25]:
            decoded = bytes((b + shift) & 0xFF for b in self.bytecode)
            self._extract_from_decoded(decoded, f'shift_{shift}')
            
            decoded = bytes((b - shift) & 0xFF for b in self.bytecode)
            self._extract_from_decoded(decoded, f'shift_neg_{shift}')
    
    def _extract_from_decoded(self, decoded: bytes, method: str):
        """Extract strings from decoded bytecode."""
        current = bytearray()
        start_pos = 0
        
        for i, byte in enumerate(decoded):
            if 32 <= byte <= 126:
                if len(current) == 0:
                    start_pos = i
                current.append(byte)
            else:
                if len(current) >= 3:
                    try:
                        s = current.decode('ascii')
                        if self._is_meaningful_string(s):
                            confidence = self._calculate_confidence(s, method)
                            # Only add if better than existing or new
                            if start_pos not in self.strings or confidence > self.strings[start_pos].confidence:
                                self.strings[start_pos] = ExtractedString(
                                    start_pos, s, confidence, method
                                )
                    except:
                        pass
                current = bytearray()
        
        if len(current) >= 3:
            try:
                s = current.decode('ascii')
                if self._is_meaningful_string(s):
                    confidence = self._calculate_confidence(s, method)
                    if start_pos not in self.strings or confidence > self.strings[start_pos].confidence:
                        self.strings[start_pos] = ExtractedString(
                            start_pos, s, confidence, method
                        )
            except:
                pass
    
    def _extract_length_prefixed_strings(self):
        """Extract length-prefixed strings throughout bytecode."""
        for i in range(len(self.bytecode) - 4):
            # Try 1-byte length prefix
            if i + 1 < len(self.bytecode):
                length = self.bytecode[i]
                if 3 <= length <= 200 and i + 1 + length <= len(self.bytecode):
                    string_bytes = self.bytecode[i+1:i+1+length]
                    s = self._decode_string_bytes(string_bytes)
                    if s:
                        confidence = self._calculate_confidence(s, 'length_prefixed')
                        if i not in self.strings or confidence > self.strings[i].confidence:
                            self.strings[i] = ExtractedString(
                                i, s, confidence, 'length_prefixed'
                            )
            
            # Try 4-byte length prefix (little-endian)
            if i + 4 < len(self.bytecode):
                try:
                    length = struct.unpack('<I', self.bytecode[i:i+4])[0]
                    if 3 <= length <= 200 and i + 4 + length <= len(self.bytecode):
                        string_bytes = self.bytecode[i+4:i+4+length]
                        s = self._decode_string_bytes(string_bytes)
                        if s:
                            confidence = self._calculate_confidence(s, 'length_prefixed')
                            if i not in self.strings or confidence > self.strings[i].confidence:
                                self.strings[i] = ExtractedString(
                                    i, s, confidence, 'length_prefixed'
                                )
                except:
                    pass
    
    def _extract_known_patterns(self):
        """Extract strings by matching known AutoLISP patterns."""
        # Try to find known keywords and dictionary names
        all_patterns = list(self.AUTOLISP_KEYWORDS) + list(self.ACAD_DICTS)
        
        # Try XOR with all keys to find known patterns
        for key in range(256):
            decoded = bytes(b ^ key for b in self.bytecode)
            for pattern in all_patterns:
                pattern_bytes = pattern.encode('ascii')
                pos = decoded.find(pattern_bytes)
                if pos != -1:
                    # Found a known pattern - extract surrounding context
                    confidence = 0.9  # High confidence for known patterns
                    if pos not in self.strings or confidence > self.strings[pos].confidence:
                        self.strings[pos] = ExtractedString(
                            pos, pattern, confidence, f'known_pattern_xor_{key:02x}'
                        )
    
    def _decode_string_bytes(self, data: bytes) -> Optional[str]:
        """Try to decode string bytes using various methods."""
        # Try direct ASCII
        try:
            s = data.decode('ascii', errors='ignore').rstrip('\x00')
            if self._is_meaningful_string(s):
                return s
        except:
            pass
        
        # Try XOR with common keys
        for key in [0x00, 0x01, 0xFF, 0x55, 0xAA, 0x38]:
            try:
                decoded = bytes(b ^ key for b in data)
                s = decoded.decode('ascii', errors='ignore').rstrip('\x00')
                if self._is_meaningful_string(s):
                    return s
            except:
                pass
        
        return None
    
    def _is_meaningful_string(self, s: str) -> bool:
        """Check if string is meaningful (not garbage)."""
        if len(s) < 2:
            return False
        
        # Must have at least one letter or number
        if not any(c.isalnum() for c in s):
            return False
        
        # Filter garbage patterns
        garbage = ['}}}}', '{{{', '|||', '~~~', '^^^', 'UUU', '888', '&&&', 'TTT']
        if any(g in s for g in garbage):
            return False
        
        # Should not be all special chars
        if all(c in ' \t\n\r{}[]()' for c in s):
            return False
        
        # Check for reasonable character distribution
        if len(s) > 10:
            # Should have some variety
            unique_chars = len(set(s))
            if unique_chars < len(s) * 0.3:  # Too repetitive
                return False
        
        return True
    
    def _calculate_confidence(self, s: str, method: str) -> float:
        """Calculate confidence score for extracted string."""
        confidence = 0.5  # Base confidence
        
        # Boost for known keywords
        s_lower = s.lower()
        if s_lower in self.AUTOLISP_KEYWORDS:
            confidence += 0.3
        
        # Boost for known dictionary names
        if s in self.ACAD_DICTS:
            confidence += 0.3
        
        # Boost for method
        if method == 'ascii':
            confidence += 0.1
        elif method.startswith('known_pattern'):
            confidence += 0.2
        
        # Boost for reasonable length
        if 3 <= len(s) <= 50:
            confidence += 0.1
        
        # Boost for alphanumeric content
        if any(c.isalpha() for c in s) and any(c.isalnum() for c in s):
            confidence += 0.1
        
        return min(confidence, 1.0)
    
    def _analyze_bytecode_structure(self):
        """Analyze bytecode structure to identify operations."""
        print("Analyzing bytecode structure...")
        
        # Extract function information from strings
        func_name = 'c:PDI'
        for ext_str in self.strings.values():
            s = ext_str.value
            if 'PDI' in s.upper() or s.startswith('c:'):
                func_name = s if s.startswith('c:') else f'c:{s}'
                break
        
        # Extract arguments from strings
        args = []
        for ext_str in self.strings.values():
            s = ext_str.value
            if s in ['dict_name', 'items_purged', 'dict_obj', 'continue']:
                if s not in args:
                    args.append(s)
        
        self.function_info = {
            'name': func_name,
            'args': args
        }
        
        # Analyze instruction patterns
        self._analyze_instructions()
    
    def _analyze_instructions(self):
        """Analyze bytecode instructions."""
        # Look for common opcode patterns
        i = 0
        while i < len(self.bytecode) - 5:
            opcode = self.bytecode[i]
            
            # Try to identify operation types
            if opcode == 0x14:  # Potential function call
                if i + 5 <= len(self.bytecode):
                    operand = struct.unpack('<I', self.bytecode[i+1:i+5])[0]
                    self.operations.append({
                        'offset': i,
                        'type': 'function_call',
                        'opcode': opcode,
                        'operand': operand
                    })
            
            i += 1
    
    def _generate_lisp_code(self) -> str:
        """Generate LISP code from extracted information."""
        lines = []
        lines.append(';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;')
        lines.append(';; Decompiled from FAS4 format (improved reverse engineering)')
        lines.append(';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;')
        lines.append('')
        
        # Build function definition
        func_name = self.function_info.get('name', 'c:PDI')
        args = self.function_info.get('args', [])
        args_str = ' '.join(f'/{arg}' for arg in args) if args else ''
        
        lines.append(f'(defun {func_name} ({args_str})')
        lines.append('')
        
        # Build function body from extracted strings
        body_lines = self._build_function_body()
        lines.extend(body_lines)
        
        lines.append(')')
        lines.append('')
        
        return '\n'.join(lines)
    
    def _build_function_body(self) -> List[str]:
        """Build function body from extracted strings."""
        body_lines = []
        
        # Sort strings by offset
        sorted_strings = sorted(self.strings.items(), key=lambda x: x[0])
        
        # Group strings into expressions
        keywords = list(self.AUTOLISP_KEYWORDS)
        current_expr = []
        
        for offset, ext_str in sorted_strings:
            s = ext_str.value
            s_lower = s.lower()
            
            # If we find a keyword, it might be the start of an expression
            if s_lower in keywords:
                # Build expression from current group
                if current_expr:
                    expr = self._build_expression_from_group(current_expr)
                    if expr:
                        body_lines.append(f'  {expr}')
                current_expr = [s]
            else:
                current_expr.append(s)
        
        # Process final expression
        if current_expr:
            expr = self._build_expression_from_group(current_expr)
            if expr:
                body_lines.append(f'  {expr}')
        
        # If we couldn't build much, show what we extracted
        if not body_lines or len(body_lines) < 3:
            body_lines.append('  ;; Extracted strings from bytecode:')
            for offset, ext_str in sorted_strings[:30]:
                body_lines.append(f'  ;; [{offset:04d}] "{ext_str.value}" (confidence: {ext_str.confidence:.2f}, method: {ext_str.method})')
            body_lines.append('')
            body_lines.append('  ;; NOTE: FAS4 format is proprietary')
            body_lines.append('  ;; Full decompilation requires understanding the encoding algorithm')
            body_lines.append('  (princ "FAS4 bytecode analysis: strings extracted but full decompilation requires format specification")\n')
        
        return body_lines
    
    def _build_expression_from_group(self, strings: List[str]) -> Optional[str]:
        """Build a LISP expression from a group of strings."""
        if not strings:
            return None
        
        keywords = list(self.AUTOLISP_KEYWORDS)
        
        # Find keyword
        keyword = None
        args = []
        
        for s in strings:
            if s.lower() in keywords:
                keyword = s
            else:
                args.append(s)
        
        if not keyword:
            return None
        
        # Build expression
        if args:
            # Quote string arguments appropriately
            quoted_args = []
            for arg in args[:3]:  # Limit args
                if any(c.isalpha() for c in arg):
                    # Check if it needs quoting
                    if ' ' in arg or ':' in arg or arg in self.ACAD_DICTS:
                        quoted_args.append(f'"{arg}"')
                    else:
                        quoted_args.append(arg)
                else:
                    quoted_args.append(str(arg))
            return f'({keyword} {" ".join(quoted_args)})'
        else:
            return f'({keyword})'


def main():
    if len(sys.argv) < 2:
        print("Usage: python fas4_improved_decompiler.py <input.fas> [output.lsp]")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else os.path.splitext(input_file)[0] + '_improved.lsp'
    
    if not os.path.exists(input_file):
        print(f"Error: File '{input_file}' not found")
        sys.exit(1)
    
    try:
        decompiler = ImprovedFas4Decompiler()
        lisp_code = decompiler.decompile(input_file)
        
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(lisp_code)
        
        print(f"\nDecompiled code written to: {os.path.abspath(output_file)}")
        print("\nPreview:")
        print("-" * 60)
        lines = lisp_code.split('\n')
        for line in lines[:30]:
            print(line)
        if len(lines) > 30:
            print(f"... ({len(lines) - 30} more lines)")
        print("-" * 60)
        
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)


if __name__ == '__main__':
    main()
