#!/usr/bin/python3

from nis import match
import re
import sys

def flip_bits(val, bits):
    return ((val ^ (2**bits - 1)) + 1)

def determine_reg( x_reg_string ):
    return {
        'x0'  : '00000',
        'x1'  : '00001',
        'x2'  : '00010',
        'x3'  : '00011',
        'x4'  : '00100',
        'x5'  : '00101',
        'x6'  : '00110',
        'x7'  : '00111',
        'x8'  : '01000',
        'x9'  : '01001',
        'x10' : '01010',
        'x11' : '01011',
        'x12' : '01100',
        'x13' : '01101',
        'x14' : '01110',
        'x15' : '01111',
        'x16' : '10000',
        'x17' : '10001',
        'x18' : '10010',
        'x19' : '10011',
        'x20' : '10100',
        'x21' : '10101',
        'x22' : '10110',
        'x23' : '10111',
        'x24' : '11000',
        'x25' : '11001',
        'x26' : '11010',
        'x27' : '11011',
        'x28' : '11100',
        'x29' : '11101',
        'x30' : '11110',
        'x31' : '11111'
    }.get(x_reg_string, '')

def determine_opcode( opcode_string ):
    return {
        'addi'  : "0010011",
        'add'   : "0110011",
        'sub'   : "0110011",
        'slli'  : "0010011",
        'srli'  : "0010011",
        'srai'  : "0010011",
        'sll'   : "0110011",
        'srl'   : "0110011",
        'sra'   : "0110011",
        'slt'   : "0110011",
        'sltu'  : "0110011",
        'slti'  : "0010011",
        'sltiu' : "0010011",

        'andi'  : "0010011",
        'xori'  : "0010011",
        'ori'   : "0010011",
        
        'and'   : "0110011",
        'xor'   : "0110011",
        'or'    : "0110011",

        'j'     : "1100111",
        'beq'   : "1100011",
        'bne'   : "1100011",
        'blt'   : "1100011",
        'bge'   : "1100011",
        'bltu'  : "1100011",
        'bgeu'  : "1100011",
        
        'lw'    : "0000011",
        'sw'    : "0100011"
    }.get(opcode_string, '')


def determine_func( opcode_string):
    return {
        'addi'  : "000",
        'add'   : "0000000000",
        'sub'   : "1000000000",
        'slli'  : "000000001",
        'srli'  : "000000101",
        'srai'  : "000001101",
        'sll'   : "0000000001",
        'srl'   : "0000000101",
        'sra'   : "1000000101",
        'slt'   : "0000000010",
        'sltu'  : "0000000011",
        'slti'  : "010",
        'sltiu' : "011",

        'andi'  : "111",
        'xori'  : "100",
        'ori'   : "110",
        
        'and'   : "0000000111",
        'xor'   : "0000000100",
        'or'    : "0000000110",

        'j'     : "",
        'beq'   : "000",
        'bne'   : "001",
        'blt'   : "100",
        'bge'   : "101",
        'bltu'  : "110",
        'bgeu'  : "111",
        
        'lw'    : "010",
        'sw'    : "010"
    }.get(opcode_string, '')


def determine_encoding_type( opcode_string ):
    return {
        'addi'  : "I",
        'add'   : "R",
        'sub'   : "R",
        'slli'  : "IS",
        'srli'  : "IS",
        'srai'  : "IS",
        'sll'   : "R",
        'srl'   : "R",
        'sra'   : "R",
        'slt'   : "R",
        'sltu'  : "R",
        'slti'  : "I",
        'sltiu' : "I",

        'andi'  : "I",
        'xori'  : "I",
        'ori'   : "I",
        
        'and'   : "R",
        'xor'   : "R",
        'or'    : "R",

        'j'     : "J",
        'beq'   : "B",
        'bne'   : "B",
        'blt'   : "B",
        'bge'   : "B",
        'bltu'  : "B",
        'bgeu'  : "B",
        
        'lw'    : "I",
        'sw'    : "B"
    }.get(opcode_string, '')

def determine_imm12( imm_string ):
    try:
        val = int(imm_string)
    except ValueError:
        raise ValueError("ERROR: Invalid immediate value")
    
    if (val < 0):
        val = -flip_bits(val, 12)
    val = str(format(val, '012b'))
    return val

def determine_imm25( imm_string ):
    try:
        val = int(imm_string)
    except ValueError:
        raise ValueError("ERROR: Invalid immediate value")
    
    if (val < 0):
        val = -flip_bits(val, 25)
    val = str(format(val, '025b'))
    return val

def determine_imm6( imm_string ):
    try:
        val = int(imm_string)
    except ValueError:
        raise ValueError("ERROR: Invalid immediate value")
    
    if (val < 0):
        val = -flip_bits(val, 6)
    val = str(format(val, '06b'))
    return val

def get_instr_encoding( instr_string ):
    instr_string = re.split(r',|//', instr_string.lower().replace(" ","").replace("\n",""))
    
    op_code = determine_opcode(instr_string[0])
    func = determine_func(instr_string[0])
    rd = ''
    rs1 = ''
    rs2 = ''
    imm12 = ''
    shamt = ''
    jmp_targ = ''
    bin_instr = ''
    
    en_type = determine_encoding_type(instr_string[0])


    if (en_type == 'I'):
        rd = determine_reg(instr_string[1])
        rs1 = determine_reg(instr_string[2])
        imm12 = determine_imm12(instr_string[3])

        if (rd == ''):
            raise ValueError("ERROR: Dest Resister invalid")
        if (rs1 == ''):
            raise ValueError("ERROR: RS1 Resister invalid")
        bin_instr = rd + rs1 + imm12 + func + op_code
    elif (en_type == 'R'):
        rd = determine_reg(instr_string[1])
        rs1 = determine_reg(instr_string[2])
        rs2 = determine_reg(instr_string[3])

        if (rd == ''):
            raise ValueError("ERROR: Dest Resister invalid")
        if (rs1 == ''):
            raise ValueError("ERROR: RS1 Resister invalid")
        if (rs2 == ''):
            raise ValueError("ERROR: RS2 Resister invalid")
        bin_instr = rd + rs1 + rs2 + func + op_code
    elif (en_type == 'B'):
        rs1 = determine_reg(instr_string[1])
        rs2 = determine_reg(instr_string[2])
        imm12 = determine_imm12(instr_string[3])
        
        if (rs1 == ''):
            raise ValueError("ERROR: RS1 Resister invalid")
        if (rs2 == ''):
            raise ValueError("ERROR: RS2 Resister invalid")
        bin_instr = imm12[0:5] + rs1 + rs2 + imm12[5:12] + func + op_code
    elif (en_type == 'J'):
        imm25 = determine_imm25(instr_string[1])
        bin_instr = imm25 + op_code
    elif (en_type == 'IS'):
        rd = determine_reg(instr_string[1])
        rs1 = determine_reg(instr_string[2])
        shamt = determine_imm6(instr_string[3])

        if (rd == ''):
            raise ValueError("ERROR: Dest Resister invalid")
        if (rs1 == ''):
            raise ValueError("ERROR: RS1 Resister invalid")
        if (shamt == ''):
            raise ValueError("ERROR: SHAMT invalid")
        bin_instr = rd + rs1 + func[0:6] + shamt + func[6:9] + op_code

    else:
        raise ValueError("ERROR: not a recognized instruction")
    
    if (len(bin_instr) != 32):
        raise ValueError("ERROR: Incorrect instruction encoding (bug)")
    return bin_instr
    


