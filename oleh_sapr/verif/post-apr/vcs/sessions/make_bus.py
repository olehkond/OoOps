#!/bin/python3

lines_to_add = []
module_prefix = "OoO_top_tb.dut.register_file.registers_reg_{}__{}_.Q"
for reg_idx in range(32):
    bus_str = "gui_bus_create -name EXP:x"+str(reg_idx)+" {"

    for bit in range(31,-1,-1):
        bus_str += module_prefix.format(reg_idx,bit) + " " 

    bus_str += "}\n"
    lines_to_add.append(bus_str)
    #print(bus_str)

lines_to_write = []
with open("session.OoO_top.vpd.tcl","r") as f:
    for line in f.readlines():
        lines_to_write.append(line)
        #print(line)
        #print("OK")
        if "# Global: Bus" in line:
            print("ok")
            for new_line in lines_to_add:
                print(new_line)
                lines_to_write.append(new_line)

            #print(lines_to_write)
with open("test.tcl","w") as f:
    f.writelines(lines_to_write)
        
            


