#!/usr/bin/python3

# ==========================================
# Run AFTER vcs simulation
# ==========================================

import sys

elements_to_sort = 30


mem = open("mem/sim_res/mem_end_state.mem", 'r')
res = open("bubble_sort_result.log", 'w')

# Assuming no memory values are lower than -999
last = -999

res.write("READING SIMULATION RESULT MEMORY:\n")

for i in range(elements_to_sort):
    string = mem.readline().replace(" ", '')
    val = int(string)
    res.write("\t" + str(val) + '\n')
    if (val < last):
        res.write("ERROR: ELEMENTS NOT SORTED IN ACCENDING ORDER + '\n'")
        sys.exit()

res.write("\n\n =================================\n")
res.write("            TEST PASSED\n")
res.write(" =================================")
