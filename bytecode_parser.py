import struct
from typing import List, Dict, Any, Optional

class BytecodeParser:
    """Parses FAS4 bytecode into instructions and builds execution flow."""
    
    OPCODES = {
        0x14: "CALL",
        0x03: "VAR_OP",
        0x01: "CONST",
        0x06: "JUMP",
        0x18: "RETURN",
        0x21: "PUSH",
        0x35: "POP",
        0x00: "NIL_DELIMITER"
    }

    def __init__(self):
        self.instructions = []

    def parse(self, bytecode: bytes, strings: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
        """Parse bytecode into a list of instructions with operands."""
        self.instructions = []
        i = 0
        
        # Create an offset-to-string mapping for quick lookup
        str_map = {s['offset']: s['value'] for s in strings}
        
        while i < len(bytecode):
            opcode = bytecode[i]
            op_name = self.OPCODES.get(opcode, f"OP_{opcode:02x}")
            
            inst = {
                'offset': i,
                'opcode': opcode,
                'name': op_name,
                'operands': []
            }
            
            # Simple heuristic for operand parsing
            # FAS4 instructions often use 4-byte or 1-byte operands
            if i + 5 <= len(bytecode):
                # Try reading a 4-byte operand
                op4 = struct.unpack('<I', bytecode[i+1:i+5])[0]
                inst['operands'].append(op4)
                
                # Check if this operand points to a string
                if op4 in str_map:
                    inst['string_ref'] = str_map[op4]
                
                # Move forward (this is a guess, FAS4 is variable length)
                # For now, we move by 1 and let the logic overlap
                # In a real decompiler, we'd know the exact size per opcode
                i += 1
            else:
                i += 1
                
            self.instructions.append(inst)
            
        return self.instructions

    def identify_blocks(self, instructions: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
        """Identify functional blocks (if/while/progn)."""
        # This is a placeholder for actual control flow analysis
        # It would look for jump targets and conditional branch opcodes
        blocks = []
        current_block = []
        
        for inst in instructions:
            if inst['name'] == "CALL":
                # Flush current block
                if current_block:
                    blocks.append({'type': 'expr', 'content': current_block})
                    current_block = []
                blocks.append({'type': 'call', 'content': [inst]})
            else:
                current_block.append(inst)
                
        if current_block:
            blocks.append({'type': 'expr', 'content': current_block})
            
        return blocks
