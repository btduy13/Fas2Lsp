import struct

def write_string(f, idx, string):
    f.write(struct.pack('I', idx))  # string index
    f.write(struct.pack('I', len(string)))  # string length
    f.write(string.encode('utf-8'))  # string content

def main():
    with open('test.fas', 'wb') as f:
        # Write header
        f.write(b'FAS\x00')  # Magic bytes
        f.write(struct.pack('I', 1))  # Version

        # Write string table
        strings = ['test', 'hello', 'world', 'arg1']
        f.write(struct.pack('I', len(strings)))  # String table size
        
        for idx, string in enumerate(strings):
            write_string(f, idx, string)

        # Write symbol table
        symbols = [(0, 1, 42), (1, 3, 1)]  # (name_idx, type, value)
        f.write(struct.pack('I', len(symbols)))  # Symbol table size
        
        for name_idx, sym_type, value in symbols:
            f.write(struct.pack('I', name_idx))  # symbol name index
            f.write(struct.pack('B', sym_type))  # symbol type
            if sym_type == 1:  # Integer
                f.write(struct.pack('i', value))  # symbol value
            elif sym_type == 3:  # String
                f.write(struct.pack('I', value))  # string table index

        # Write function
        f.write(struct.pack('I', 0))  # function name index (test)
        f.write(struct.pack('I', 1))  # number of arguments
        f.write(struct.pack('I', 3))  # argument name index (arg1)
        
        # Function body
        body_items = [(3, 1), (3, 2)]  # list of (type, string_idx) pairs
        f.write(struct.pack('I', len(body_items)))  # body size
        
        for value_type, value_idx in body_items:
            f.write(struct.pack('B', value_type))  # value type
            f.write(struct.pack('I', value_idx))  # value index

if __name__ == '__main__':
    main()
    print("Created test.fas file") 