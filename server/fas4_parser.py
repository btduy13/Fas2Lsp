import struct
from typing import List, Dict, Any, Optional, Tuple
import zlib
from dataclasses import dataclass

@dataclass
class Fas4Symbol:
    index: int
    name: str
    value: Any

@dataclass
class Fas4Function:
    name: str
    args: List[str]
    body: List[Any]

class Fas4Parser:
    def __init__(self):
        self.data = None
        self.size = 0
        self.decoded_data = bytearray()
        self.functions: List[Fas4Function] = []
        self.string_table: Dict[int, str] = {}
        self.symbols: Dict[int, Fas4Symbol] = {}
        self.decompressed_data: Optional[bytes] = None
        
    def parse_file(self, filename: str) -> Optional[bytes]:
        """Parse a FAS4 file and return decompiled LISP code."""
        try:
            with open(filename, 'rb') as f:
                self.data = f.read()
                self.size = len(self.data)
            
            # Check for FAS4 format header - original code checked for '\r\n FAS4-FILE'
            # Try multiple header patterns
            header_pos = -1
            
            # Check for the exact pattern from original code
            if self.data.startswith(b'\r\n FAS4-FILE'):
                header_pos = 2  # After '\r\n '
            else:
                # Try other patterns
                for i in range(min(20, len(self.data))):
                    if i + 13 <= len(self.data) and self.data[i:i+13] == b'\r\n FAS4-FILE':
                        header_pos = i + 2  # After '\r\n '
                        break
                    elif i + 11 <= len(self.data) and self.data[i:i+11] == b'FAS4-FILE ':
                        header_pos = i
                        break
            
            if header_pos == -1:
                # Try to find FAS4-FILE anywhere in first 100 bytes
                try:
                    header_pos = self.data.index(b'FAS4-FILE')
                except ValueError:
                    return None
            
            # Find the end of "FAS4-FILE" text
            if header_pos + 10 <= len(self.data) and self.data[header_pos:header_pos+10] == b'FAS4-FILE':
                pos = header_pos + 10  # After "FAS4-FILE"
            else:
                # If we found it at a different position, adjust
                pos = header_pos + 10 if header_pos + 10 <= len(self.data) else header_pos
            
            # Skip whitespace and header line
            while pos < len(self.data) and self.data[pos] in b' \r\n\t':
                pos += 1
            
            # Find the size line (next line after header)
            size_start = pos
            while pos < len(self.data) and self.data[pos] not in b'\r\n':
                pos += 1
            size_line = self.data[size_start:pos].decode('ascii', errors='ignore').strip()
            
            # Move past newline
            while pos < len(self.data) and self.data[pos] in b'\r\n':
                pos += 1
            
            # Try to parse size
            try:
                compressed_size = int(size_line)
            except ValueError:
                # If we can't parse size, try to use remaining data
                compressed_size = len(self.data) - pos
            
            # Extract compressed data
            if pos + compressed_size > len(self.data):
                compressed_data = self.data[pos:]
            else:
                compressed_data = self.data[pos:pos + compressed_size]
            
            # Decompress the data
            self.decompressed_data = self._decompress_data(compressed_data)
            
            if not self.decompressed_data:
                return self._generate_error_output("Failed to decompress FAS4 data")
            
            # Try to use standard FAS parser if decompressed data looks like standard FAS
            if self.decompressed_data.startswith(b'FAS\x00'):
                # Use standard FAS parser logic
                standard_result = self._parse_with_standard_parser()
                if standard_result:
                    return standard_result
                # If standard parser fails, fall through to custom parser
            
            # Parse the decompressed FAS content with our custom parser
            if not self._parse_fas_content(self.decompressed_data):
                return self._generate_error_output("Failed to parse decompressed FAS content")
            
            # Generate LISP output from parsed data
            return self._generate_lisp_output()
            
        except Exception as e:
            return self._generate_error_output(f"Error parsing FAS4 file: {str(e)}")
    
    def _parse_with_standard_parser(self) -> Optional[bytes]:
        """Try to use the standard FAS parser after decompression."""
        try:
            # Import here to avoid circular dependency
            from server.fas_parser import FasParser
            
            # Create a temporary file with decompressed data
            import tempfile
            import os
            
            with tempfile.NamedTemporaryFile(delete=False, suffix='.fas') as tmp:
                tmp.write(self.decompressed_data)
                tmp_path = tmp.name
            
            try:
                # Use standard FAS parser
                parser = FasParser()
                if parser.parse_file(tmp_path):
                    # Generate output from standard parser
                    output = bytearray()
                    output.extend(b';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n')
                    output.extend(b';; Decompiled from FAS4 format (using standard FAS parser)\n')
                    output.extend(b';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n\n')
                    
                    # Write symbols
                    if parser.symbols:
                        for sym in parser.symbols.values():
                            if isinstance(sym.value, (int, float)):
                                output.extend(f'(setq {sym.name} {sym.value})\n'.encode('ascii'))
                            elif isinstance(sym.value, str):
                                output.extend(f'(setq {sym.name} "{sym.value}")\n'.encode('ascii'))
                            elif sym.value is None:
                                output.extend(f'(setq {sym.name} nil)\n'.encode('ascii'))
                        output.extend(b'\n')
                    
                    # Write functions
                    if parser.functions:
                        for func in parser.functions:
                            output.extend(parser.decompile_function(func).encode('ascii'))
                            output.extend(b'\n')
                    else:
                        output.extend(b';; No functions could be extracted.\n\n')
                    
                    return bytes(output)
            finally:
                # Clean up temp file
                try:
                    os.unlink(tmp_path)
                except:
                    pass
            
            return None
        except Exception as e:
            # If standard parser fails, fall back to custom parser
            print(f"Standard parser failed: {e}")
            return None
    
    def _decompress_data(self, compressed_data: bytes) -> Optional[bytes]:
        """Try various decompression methods."""
        if not compressed_data:
            return None
        
        # Try zlib decompression
        try:
            # Try standard zlib
            return zlib.decompress(compressed_data)
        except:
            pass
        
        try:
            # Try zlib with different window bits
            return zlib.decompress(compressed_data, -zlib.MAX_WBITS)
        except:
            pass
        
        try:
            # Try raw deflate
            decomp = zlib.decompressobj(-zlib.MAX_WBITS)
            return decomp.decompress(compressed_data) + decomp.flush()
        except:
            pass
        
        # If decompression fails, return raw data (might already be decompressed)
        return compressed_data
    
    def _parse_fas_content(self, data: bytes) -> bool:
        """Parse decompressed FAS content."""
        if not data or len(data) < 8:
            return False
        
        try:
            view = memoryview(data)
            pos = 0
            
            # Check for FAS header
            if len(view) >= 4 and view[pos:pos+4] == b'FAS\x00':
                pos += 4
                # This is standard FAS format - use similar parsing
                return self._parse_standard_fas(view, pos)
            else:
                # Try to parse as raw FAS4 format
                return self._parse_raw_fas4(data)
                
        except Exception as e:
            print(f"Error in _parse_fas_content: {e}")
            return False
    
    def _parse_standard_fas(self, view: memoryview, start_pos: int) -> bool:
        """Parse standard FAS format from memoryview."""
        try:
            pos = start_pos
            
            if pos + 4 > len(view):
                return False
            
            version = struct.unpack('<I', view[pos:pos+4])[0]
            pos += 4
            
            # Read string table
            if pos + 4 > len(view):
                return False
            str_table_size = struct.unpack('<I', view[pos:pos+4])[0]
            pos += 4
            
            for i in range(min(str_table_size, 1000)):  # Limit to prevent infinite loops
                if pos + 8 > len(view):
                    break
                
                idx = struct.unpack('<I', view[pos:pos+4])[0]
                pos += 4
                length = struct.unpack('<I', view[pos:pos+4])[0]
                pos += 4
                
                if pos + length > len(view):
                    break
                
                try:
                    string = view[pos:pos+length].tobytes().decode('utf-8', errors='replace')
                    self.string_table[idx] = string
                    pos += length
                except:
                    break
            
            # Try to parse functions - this is simplified
            # Real FAS parsing is more complex
            return True
            
        except Exception as e:
            print(f"Error parsing standard FAS: {e}")
            return False
    
    def _parse_raw_fas4(self, data: bytes) -> bool:
        """Try to extract strings and patterns from raw FAS4 data."""
        # Look for readable strings that might be function names or symbols
        readable_strings = []
        current_string = bytearray()
        
        for byte in data:
            if 32 <= byte <= 126:  # Printable ASCII
                current_string.append(byte)
            else:
                if len(current_string) >= 3:  # At least 3 chars
                    try:
                        s = current_string.decode('ascii')
                        if s.isalnum() or '_' in s or '-' in s:
                            readable_strings.append(s)
                    except:
                        pass
                current_string.clear()
        
        # Add final string if exists
        if len(current_string) >= 3:
            try:
                s = current_string.decode('ascii')
                if s.isalnum() or '_' in s or '-' in s:
                    readable_strings.append(s)
            except:
                pass
        
        # Store unique strings
        for idx, s in enumerate(set(readable_strings)):
            self.string_table[idx] = s
        
        return len(self.string_table) > 0
    
    def _generate_lisp_output(self) -> bytes:
        """Generate LISP code from parsed data."""
        self.decoded_data = bytearray()
        
        # Add header comments
        self.decoded_data.extend(b';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n')
        self.decoded_data.extend(b';; Decompiled from FAS4 format\n')
        self.decoded_data.extend(b';; Note: Decompilation may be incomplete\n')
        self.decoded_data.extend(b';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n\n')
        
        # Generate output based on what we found
        if self.functions:
            # If we have functions, generate them
            for func in self.functions:
                self._write_function(func)
        elif self.string_table:
            # If we have strings but no functions, try to reconstruct something
            self._generate_from_strings()
        else:
            # Fallback: indicate parsing occurred but no content extracted
            self.decoded_data.extend(b';; Note: File was parsed but no recoverable LISP code could be extracted.\n')
            self.decoded_data.extend(b';; This may indicate an encrypted or obfuscated FAS4 file.\n\n')
        
        return bytes(self.decoded_data)
    
    def _write_function(self, func: Fas4Function):
        """Write a function definition."""
        args_str = ' '.join(func.args) if func.args else ''
        self.decoded_data.extend(f'(defun {func.name} ({args_str})\n'.encode('ascii'))
        
        # Write body (simplified)
        if func.body:
            body_str = ' '.join(str(item) for item in func.body[:10])  # Limit body length
            self.decoded_data.extend(f'  {body_str}\n'.encode('ascii'))
        
        self.decoded_data.extend(b')\n\n')
    
    def _generate_from_strings(self):
        """Try to generate LISP code from extracted strings."""
        # Look for function-like names (starting with c: or common patterns)
        function_names = [s for s in self.string_table.values() 
                         if s.startswith('c:') or s.isupper() or '_' in s]
        
        if function_names:
            # Generate a simple function stub for each potential function name
            for name in function_names[:5]:  # Limit to first 5
                self.decoded_data.extend(f'(defun {name} ( / )\n'.encode('ascii'))
                self.decoded_data.extend(b'  ;; Function body could not be fully recovered\n')
                self.decoded_data.extend(b'  (princ)\n')
                self.decoded_data.extend(b')\n\n')
        else:
            # Just list the strings we found
            self.decoded_data.extend(b';; Extracted strings from file:\n')
            for idx, s in sorted(self.string_table.items()):
                if len(s) > 1:
                    self.decoded_data.extend(f';; [{idx}] {s}\n'.encode('ascii'))
            self.decoded_data.extend(b'\n')
    
    def _generate_error_output(self, error_msg: str) -> bytes:
        """Generate error output with message."""
        output = bytearray()
        output.extend(b';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n')
        output.extend(b';; Error decompiling FAS4 file\n'.encode('ascii'))
        output.extend(f';; {error_msg}\n'.encode('ascii'))
        output.extend(b';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n\n')
        output.extend(b';; The file could not be properly decompiled.\n')
        output.extend(b';; This may indicate:\n')
        output.extend(b';; - Encrypted or obfuscated FAS4 file\n')
        output.extend(b';; - Unsupported FAS4 variant\n')
        output.extend(b';; - Corrupted file\n')
        return bytes(output)
        
    def get_decoded_data(self) -> Optional[bytes]:
        """Get the decoded data if available."""
        return bytes(self.decoded_data) if self.decoded_data else None 