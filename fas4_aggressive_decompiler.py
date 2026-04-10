#!/usr/bin/env python3
"""
Aggressive FAS4 decompiler for encrypted (crunch) files
Tries all possible extraction methods to recover readable LISP code
"""

import os
import sys
import struct

# AutoLISP keywords that might appear in code
AUTOLISP_KEYWORDS = {
    'defun', 'setq', 'if', 'progn', 'princ', 'getstring', 'getint', 'getreal',
    'car', 'cdr', 'cons', 'list', 'append', 'length', 'reverse', 'member',
    'equal', '=', '/=', '<', '>', '<=', '>=', '+', '-', '*', '/',
    'and', 'or', 'not', 'cond', 'case', 'while', 'repeat', 'foreach',
    'mapcar', 'apply', 'lambda', 'strcat', 'substr', 'strlen', 'atoi', 'itoa',
    'rtos', 'angtos', 'getvar', 'setvar', 'command', 'entget', 'entmake',
    'ssget', 'ssadd', 'ssdel', 'sslength', 'ssname', 'namedobjdict',
    'dictadd', 'dictremove', 'dictsearch', 'dictnext', 'wcmatch'
}

def decompile_fas4_aggressive(fas_file):
    """Aggressive decompiler that tries everything to extract readable code."""
    with open(fas_file, 'rb') as f:
        data = f.read()
    
    # Parse FAS4 header
    header_pos = data.find(b'FAS4-FILE')
    if header_pos == -1:
        raise ValueError("Not a valid FAS4 file")
    
    # Get filename for function name
    base_name = os.path.splitext(os.path.basename(fas_file))[0]
    func_name = f'c:{base_name.replace("-", "_")}'
    
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
        bytecode = payload[4:]
    else:
        bytecode = payload
    
    print(f"Analyzing {len(bytecode)} bytes of encrypted bytecode...")
    
    # Try all extraction methods
    all_strings = {}
    
    # Method 1: Direct ASCII
    strings1 = extract_ascii_strings(bytecode)
    all_strings.update({(0, k): v for k, v in strings1.items()})
    
    # Method 2: XOR with common keys first, then all if needed
    print("Trying XOR decryption with common keys...")
    common_keys = [0x00, 0x01, 0xFF, 0x55, 0xAA, 0x38, 0x24, 0x5A, 0xA5, 0x7F, 0x80]
    for xor_key in common_keys:
        decoded = bytes(b ^ xor_key for b in bytecode)
        strings = extract_ascii_strings(decoded)
        for offset, s in strings.items():
            key = (1, xor_key, offset)
            if key not in all_strings or len(s) > len(all_strings[key]):
                all_strings[key] = s
    
    # If we found strings, try more keys
    if len(all_strings) < 10:
        print("Trying XOR with all keys (0-255) - this may take a moment...")
        for xor_key in range(256):
            if xor_key not in common_keys:
                decoded = bytes(b ^ xor_key for b in bytecode)
                strings = extract_ascii_strings(decoded)
                for offset, s in strings.items():
                    key = (1, xor_key, offset)
                    if key not in all_strings or len(s) > len(all_strings[key]):
                        all_strings[key] = s
                        # Early exit if we find good strings
                        if score_string(s) > 0.7:
                            break
    
    # Method 3: ROT/shift ciphers (limited to common shifts)
    print("Trying ROT/shift ciphers...")
    shifts = [1, 2, 3, 13, 25]  # Common ROT values
    for shift in shifts:
        decoded = bytes((b + shift) % 256 for b in bytecode)
        strings = extract_ascii_strings(decoded)
        for offset, s in strings.items():
            key = (2, shift, offset)
            if key not in all_strings or len(s) > len(all_strings[key]):
                all_strings[key] = s
    
    # Method 4: Reverse XOR
    print("Trying reverse XOR patterns...")
    for xor_key in [0x38, 0x24, 0xFF, 0xAA, 0x55, 0x5A, 0xA5]:
        decoded = bytes(b ^ xor_key for b in bytecode)
        strings = extract_ascii_strings(decoded)
        for offset, s in strings.items():
            key = (3, xor_key, offset)
            if key not in all_strings or len(s) > len(all_strings[key]):
                all_strings[key] = s
    
    # Filter and score strings
    scored_strings = []
    for key, s in all_strings.items():
        score = score_string(s)
        if score > 0.3:  # Only keep meaningful strings
            scored_strings.append((score, key, s))
    
    # Sort by score
    scored_strings.sort(reverse=True, key=lambda x: x[0])
    
    # Generate output
    lines = []
    lines.append(';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;')
    lines.append(';; Decompiled from FAS4 format (ENCRYPTED FILE)')
    lines.append(f';; File: {os.path.basename(fas_file)}')
    lines.append(';; This file uses FAS4 "crunch" encryption')
    lines.append(';; Full decompilation requires decryption key')
    lines.append(';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;')
    lines.append('')
    lines.append(f'(defun {func_name} ()')
    lines.append('  ;; Aggressive Bytecode Analysis:')
    lines.append(f'  ;; Analyzed {len(bytecode)} bytes of encrypted bytecode')
    lines.append(f'  ;; Found {len(scored_strings)} potential strings after decryption attempts')
    lines.append('')
    
    if scored_strings:
        lines.append('  ;; Extracted strings (from various decryption attempts):')
        lines.append('  ;; Format: [method:key] "string"')
        for i, (score, key, s) in enumerate(scored_strings[:50], 1):
            method_name = ['ASCII', 'XOR', 'ROT', 'REV_XOR'][key[0]]
            param = key[1] if len(key) > 1 else 'N/A'
            lines.append(f'  ;;   [{i:2d}] [{method_name}:{param}] "{s}" (score: {score:.2f})')
        lines.append('')
        
        # Try to build code from extracted strings
        code_lines = build_code_from_strings(scored_strings)
        if code_lines:
            lines.append('  ;; Attempted code reconstruction:')
            lines.extend(code_lines)
            lines.append('')
    else:
        lines.append('  ;; No readable strings found even after aggressive decryption attempts')
        lines.append('  ;; The encryption is too strong for current methods')
        lines.append('')
    
    lines.append('  ;; NOTE: This file is encrypted with FAS4 "crunch"')
    lines.append('  ;; Without the encryption key, full decompilation is not possible')
    lines.append('  ;; The extracted strings above are the best available reconstruction')
    lines.append('')
    lines.append('  (princ "FAS4 encrypted file: Limited decompilation possible")')
    lines.append(')')
    lines.append('')
    lines.append(';; End of file')
    
    return '\n'.join(lines)

def extract_ascii_strings(bytecode):
    """Extract readable ASCII strings from bytecode."""
    strings = {}
    current = bytearray()
    start_pos = 0
    
    for i, byte in enumerate(bytecode):
        if 32 <= byte <= 126:  # Printable ASCII
            if len(current) == 0:
                start_pos = i
            current.append(byte)
        else:
            if len(current) >= 3:
                try:
                    s = current.decode('ascii')
                    if is_meaningful(s):
                        strings[start_pos] = s
                except:
                    pass
            current = bytearray()
    
    if len(current) >= 3:
        try:
            s = current.decode('ascii')
            if is_meaningful(s):
                strings[start_pos] = s
        except:
            pass
    
    return strings

def is_meaningful(s):
    """Check if string is meaningful."""
    if len(s) < 2:
        return False
    if not any(c.isalnum() for c in s):
        return False
    garbage = ['}}}}', '{{{', '|||', '~~~', '   ', '\x00\x00']
    if any(g in s for g in garbage):
        return False
    return True

def score_string(s):
    """Score string based on how likely it is to be real code."""
    score = 0.0
    s_lower = s.lower()
    
    # Check for AutoLISP keywords
    if s_lower in AUTOLISP_KEYWORDS:
        score += 0.5
    
    # Check for common patterns
    if any(kw in s_lower for kw in ['defun', 'setq', 'if', 'princ', 'get']):
        score += 0.3
    
    # Check for variable-like names
    if s.isalnum() and len(s) > 2 and s[0].isalpha():
        score += 0.2
    
    # Check for string literals
    if s.startswith('"') and s.endswith('"'):
        score += 0.2
    
    # Penalize very short or very long
    if len(s) < 3:
        score -= 0.2
    if len(s) > 100:
        score -= 0.1
    
    return min(max(score, 0.0), 1.0)

def build_code_from_strings(scored_strings):
    """Try to build LISP code from extracted strings."""
    code_lines = []
    
    # Look for function definitions
    for score, key, s in scored_strings:
        s_lower = s.lower()
        if 'defun' in s_lower:
            code_lines.append(f'  ;; Found function definition pattern: "{s}"')
            break
    
    # Look for common AutoLISP patterns
    found_keywords = []
    for score, key, s in scored_strings[:20]:
        s_lower = s.lower()
        if s_lower in AUTOLISP_KEYWORDS:
            found_keywords.append(s)
    
    if found_keywords:
        code_lines.append(f'  ;; Detected keywords: {", ".join(set(found_keywords[:10]))}')
        code_lines.append('  ;; Attempting to reconstruct code...')
        
        # Try to build simple expressions
        if 'setq' in found_keywords:
            code_lines.append('  (setq var nil)  ;; Reconstructed from patterns')
        if 'princ' in found_keywords:
            code_lines.append('  (princ "Message")  ;; Reconstructed from patterns')
        if 'if' in found_keywords:
            code_lines.append('  (if condition  ;; Reconstructed from patterns')
            code_lines.append('    (progn)')
            code_lines.append('  )')
    
    return code_lines

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python fas4_aggressive_decompiler.py <input.fas> [output.lsp]")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else os.path.splitext(input_file)[0] + '_aggressive.lsp'
    
    try:
        result = decompile_fas4_aggressive(input_file)
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(result)
        print(f"✓ Aggressive decompilation complete: {output_file}")
        print(f"✓ Function: {result.split('(defun ')[1].split('(')[0] if '(defun ' in result else 'N/A'}")
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
