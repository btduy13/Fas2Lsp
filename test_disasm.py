import sys
from fas4_decompiler import Fas4Decompiler
decompiler = Fas4Decompiler()
disasm = __import__('fas4_decompiler').Disassembler()
parser = __import__('fas4_decompiler').Fas4Parser()

fas = parser.parse('PDI.fas')
insts = disasm.disassemble(fas.bytecode, fas.nsyms)

with open('disasm_output_utf8.txt', 'w', encoding='utf-8') as f:
    for inst in insts:
        if 'CALL' in inst.op_name or 'LOAD_SYM' in inst.op_name or 'PUSH' in inst.op_name:
            f.write(str(inst) + '\n')
