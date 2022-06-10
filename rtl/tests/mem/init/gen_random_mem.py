#!/usr/bin/python3

import random as rd

def flip_bits(val, bits):
    return ((val ^ (2**bits - 1)) + 1)

dmem_size_pow2 = 12

mem_out_file = open("random.mem", "w")

for i in range(2**(dmem_size_pow2-2)):
    val = rd.randint(-300, 300)

    if (val < 0):
        val = -flip_bits(val, 32)
    
    val_str = str(format(val, '032b'))
    
    mem_out_file.write(val_str[24:32] + '\n')
    mem_out_file.write(val_str[16:24] + '\n')
    mem_out_file.write(val_str[8:16]  + '\n')
    mem_out_file.write(val_str[0:8]   + '\n')

mem_out_file.close()
