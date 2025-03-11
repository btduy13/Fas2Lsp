from dataclasses import dataclass
from typing import List, Dict, Any, Optional, Tuple
import struct
import re
import zlib

@dataclass
class FasSymbol:
    index: int
    name: str
    value: Any
    position: Optional[Tuple[int, int]] = None

    def __str__(self):
        return str(self.value)

@dataclass
class FasFunction:
    name: str
    args: List[str]
    body: List[Any]
    source_position: tuple
    docstring: Optional[str] = None

class FasParser:
    def __init__(self):
        self.symbols: Dict[int, FasSymbol] = {}
        self.functions: List[FasFunction] = []
        self.string_table: Dict[int, str] = {}
        self.current_position: Tuple[int, int] = (0, 0)
        
    def parse_file(self, filepath: str) -> bool:
        """Parse a FAS file and build internal representation."""
        try:
            with open(filepath, 'rb') as f:
                # Read and skip any leading whitespace
                while True:
                    byte = f.read(1)
                    if not byte or byte not in b' \r\n\t':
                        break
                
                # Check for FAS4 format
                header = byte + f.read(9)  # "FAS4-FILE"
                if header == b'FAS4-FILE ':
                    print("Detected FAS4 format")
                    # Skip the rest of the header line
                    while f.read(1) not in b'\r\n':
                        pass
                    
                    # Read size
                    size_str = ''
                    while True:
                        byte = f.read(1)
                        if byte in b'\r\n':
                            break
                        size_str += byte.decode('ascii')
                    size = int(size_str)
                    print(f"Compressed size: {size}")
                    
                    # Read compressed data
                    compressed_data = f.read(size)
                    try:
                        # Try different decompression methods
                        try:
                            data = zlib.decompress(compressed_data)
                        except:
                            # If zlib fails, try custom decompression
                            data = self._custom_decompress(compressed_data)
                        
                        print(f"Decompressed size: {len(data)}")
                        return self._parse_fas_content(data)
                    except Exception as e:
                        print(f"Decompression failed: {e}")
                        return False
                
                # Standard FAS format
                if byte + f.read(3) != b'FAS\x00':
                    raise ValueError("Invalid FAS file format")
                
                f.seek(-4, 1)  # Go back to start
                return self._parse_fas_content(f.read())
                
        except Exception as e:
            print(f"Error parsing FAS file: {e}")
            return False
    
    def _custom_decompress(self, data: bytes) -> bytes:
        """Custom decompression for FAS4 format."""
        # TODO: Implement custom decompression algorithm
        # This is a placeholder - actual implementation would need reverse engineering
        result = bytearray()
        key = 0x55  # Example key
        
        for byte in data:
            result.append(byte ^ key)
            key = (key * 13 + 7) & 0xFF
            
        return bytes(result)
    
    def _parse_fas_content(self, data: bytes) -> bool:
        """Parse FAS file content from raw bytes."""
        try:
            # Create a memoryview for efficient slicing
            view = memoryview(data)
            pos = 0
            
            # Read header
            if view[pos:pos+4] != b'FAS\x00':
                raise ValueError("Invalid FAS file format")
            pos += 4
            
            version = struct.unpack('I', view[pos:pos+4])[0]
            print(f"Version: {version}")
            pos += 4
            
            # Read string table
            str_table_size = struct.unpack('I', view[pos:pos+4])[0]
            print(f"String table size: {str_table_size}")
            pos += 4
            
            for i in range(str_table_size):
                idx = struct.unpack('I', view[pos:pos+4])[0]
                pos += 4
                length = struct.unpack('I', view[pos:pos+4])[0]
                pos += 4
                string = view[pos:pos+length].tobytes().decode('utf-8', errors='replace')
                pos += length
                self.string_table[idx] = string
                print(f"String {i}: [{idx}] = '{string}'")
            
            # Read symbol table
            sym_table_size = struct.unpack('I', view[pos:pos+4])[0]
            print(f"Symbol table size: {sym_table_size}")
            pos += 4
            
            for i in range(sym_table_size):
                name_idx = struct.unpack('I', view[pos:pos+4])[0]
                pos += 4
                value_type = view[pos]
                pos += 1
                print(f"Symbol {i}: name_idx={name_idx}, type={value_type}")
                
                # Parse value based on type
                value, pos = self._parse_value_from_view(view, pos, value_type)
                name = self.string_table.get(name_idx, f"sym_{i}")
                
                self.symbols[i] = FasSymbol(i, name, value, (self.current_position[0], 0))
                print(f"Added symbol: {name} = {value}")
                self.current_position = (self.current_position[0] + 1, 0)
            
            # Parse functions
            print("\nParsing functions:")
            while pos < len(view):
                try:
                    func, new_pos = self._parse_function_from_view(view, pos)
                    if not func:
                        break
                    self.functions.append(func)
                    print(f"Added function: {func.name}")
                    pos = new_pos
                except EOFError:
                    break
                except Exception as e:
                    print(f"Error parsing function: {e}")
                    break
            
            return True
            
        except Exception as e:
            print(f"Error parsing FAS content: {e}")
            return False
    
    def _parse_value_from_view(self, view: memoryview, pos: int, value_type: int) -> Tuple[Any, int]:
        """Parse a value from the view and return the value and new position."""
        if value_type == 0:  # NIL
            return None, pos
        elif value_type == 1:  # Integer
            val = struct.unpack('i', view[pos:pos+4])[0]
            print(f"Parsed integer: {val}")
            return val, pos + 4
        elif value_type == 2:  # Float
            val = struct.unpack('f', view[pos:pos+4])[0]
            print(f"Parsed float: {val}")
            return val, pos + 4
        elif value_type == 3:  # String
            idx = struct.unpack('I', view[pos:pos+4])[0]
            val = self.string_table.get(idx, '')
            print(f"Parsed string: {val}")
            return val, pos + 4
        elif value_type == 4:  # Symbol
            idx = struct.unpack('I', view[pos:pos+4])[0]
            val = self.symbols.get(idx)
            print(f"Parsed symbol reference: {val}")
            return val, pos + 4
        else:
            print(f"Unknown value type: {value_type}")
            return None, pos
    
    def _parse_function_from_view(self, view: memoryview, pos: int) -> Tuple[Optional[FasFunction], int]:
        """Parse a function from the view and return the function and new position."""
        try:
            name_idx = struct.unpack('I', view[pos:pos+4])[0]
            pos += 4
            args_count = struct.unpack('I', view[pos:pos+4])[0]
            pos += 4
            print(f"\nParsing function: name_idx={name_idx}, args_count={args_count}")
            
            name = self.string_table.get(name_idx, 'unknown_function')
            args = []
            for i in range(args_count):
                arg_idx = struct.unpack('I', view[pos:pos+4])[0]
                pos += 4
                arg_name = self.string_table.get(arg_idx, f'arg{i}')
                args.append(arg_name)
                print(f"Function arg {i}: {arg_name}")
            
            # Parse function body
            body_size = struct.unpack('I', view[pos:pos+4])[0]
            pos += 4
            print(f"Function body size: {body_size}")
            body = []
            start_pos = self.current_position
            
            for i in range(body_size):
                value_type = view[pos]
                pos += 1
                value, pos = self._parse_value_from_view(view, pos, value_type)
                body.append(value)
                print(f"Body item {i}: {value}")
            
            return FasFunction(name, args, body, start_pos), pos
            
        except EOFError:
            return None, pos
        except Exception as e:
            print(f"Error parsing function: {e}")
            return None, pos
    
    def decompile_function(self, func: FasFunction) -> str:
        """Convert a FAS function back to LISP code."""
        args_str = ' '.join(func.args)
        body_str = self._decompile_body(func.body)
        
        if func.docstring:
            return f'(defun {func.name} ({args_str})\n  "{func.docstring}"\n  {body_str})\n'
        else:
            return f'(defun {func.name} ({args_str})\n  {body_str})\n'
    
    def _decompile_body(self, body: List[Any]) -> str:
        """Convert function body to LISP code."""
        result = []
        for item in body:
            if isinstance(item, FasSymbol):
                result.append(item.name)
            elif isinstance(item, str):
                result.append(f'"{item}"')
            elif item is None:
                result.append('nil')
            else:
                result.append(str(item))
        return ' '.join(result)
    
    def get_symbol_at_position(self, position: tuple) -> Optional[FasSymbol]:
        """Get symbol information at a given position."""
        line, col = position
        for symbol in self.symbols.values():
            if symbol.position and symbol.position[0] == line:
                return symbol
        return None
    
    def get_definition_location(self, symbol_name: str) -> Optional[tuple]:
        """Get the definition location for a symbol."""
        # Look in symbol table
        for symbol in self.symbols.values():
            if symbol.name == symbol_name and symbol.position:
                return symbol.position
        
        # Look in functions
        for func in self.functions:
            if func.name == symbol_name:
                return func.source_position
        
        return None 