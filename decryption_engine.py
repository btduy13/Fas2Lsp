import struct
from typing import Dict, List, Tuple, Optional, Any, Set
import zlib

class DecryptionEngine:
    """Handles decryption and de-crunching of FAS4 files."""
    
    AUTOLISP_KEYWORDS = {
        'princ', 'setq', 'getstring', 'namedobjdict', 'wcmatch', 'dictremove',
        'strcat', 'itoa', 'if', 'progn', 'not', 'exit', 'or', 'and', 'while',
        'foreach', 'mapcar', 'apply', 'lambda', 'defun', 'cond', 'case'
    }

    def __init__(self):
        self.best_key = None
        self.best_method = None
        self.best_printable_ratio = 0.0

    def decompress_fas4(self, compressed_data: bytes) -> bytes:
        """Try multiple decompression/decryption methods on FAS4 payload."""
        
        # 1. Try zlib (standard for some FAS versions)
        try:
            return zlib.decompress(compressed_data)
        except zlib.error:
            pass

        # 2. Try the LCG XOR (as found in some reverse engineering notes)
        # key = (key * a + b) & 0xFF
        # We try common a, b values
        lcg_params = [
            (13, 7),
            (3, 1),
            (7, 5),
            (1, 1), # Simple rolling XOR (incrementing key)
        ]
        
        best_data = compressed_data
        best_score = self._calculate_score(compressed_data)
        
        for a, b in lcg_params:
            for initial_key in range(256):
                decrypted = self._lcg_xor(compressed_data, initial_key, a, b)
                score = self._calculate_score(decrypted)
                if score > best_score:
                    best_score = score
                    best_data = decrypted
                    self.best_method = f"LCG_XOR_{a}_{b}"
                    self.best_key = initial_key

        # 3. Try plain XOR with all keys
        for key in range(256):
            decrypted = bytes(b ^ key for b in compressed_data)
            score = self._calculate_score(decrypted)
            if score > best_score:
                best_score = score
                best_data = decrypted
                self.best_method = "STATIC_XOR"
                self.best_key = key

        return best_data

    def _lcg_xor(self, data: bytes, initial_key: int, a: int, b: int) -> bytes:
        result = bytearray()
        key = initial_key
        for byte in data:
            result.append(byte ^ key)
            key = (key * a + b) & 0xFF
        return bytes(result)

    def _calculate_score(self, data: bytes) -> float:
        """Score decrypted data based on printable characters and keywords."""
        if not data:
            return 0.0
        
        printable = sum(1 for b in data if (32 <= b <= 126) or (b in [9, 10, 13]))
        ratio = printable / len(data)
        
        # Bonus for keywords
        keyword_score = 0
        try:
            text = data.decode('ascii', errors='ignore').lower()
            for kw in self.AUTOLISP_KEYWORDS:
                if kw in text:
                    keyword_score += 1
        except:
            pass
            
        return ratio + (keyword_score * 0.1)

    def extract_strings(self, data: bytes) -> List[Dict[str, Any]]:
        """Extract strings from data using various heuristics."""
        strings = []
        
        # 1. ASCII scanning
        current = bytearray()
        start_pos = 0
        for i, b in enumerate(data):
            if 32 <= b <= 126:
                if not current:
                    start_pos = i
                current.append(b)
            else:
                if len(current) >= 3:
                    try:
                        s = current.decode('ascii')
                        strings.append({
                            'offset': start_pos,
                            'value': s,
                            'method': 'ascii_scan'
                        })
                    except:
                        pass
                current = bytearray()
                
        # 2. Length-prefixed strings (uint32 length)
        i = 0
        while i < len(data) - 8:
            try:
                length = struct.unpack('<I', data[i:i+4])[0]
                if 2 <= length <= 256 and i + 4 + length <= len(data):
                    s_bytes = data[i+4:i+4+length]
                    if all(32 <= b <= 126 for b in s_bytes):
                        strings.append({
                            'offset': i,
                            'value': s_bytes.decode('ascii'),
                            'method': 'len_prefix_4'
                        })
                        i += 4 + length
                        continue
            except:
                pass
            i += 1
            
        return strings
