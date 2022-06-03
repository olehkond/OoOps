# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./adder.sv"
vlog "./alu.sv"
vlog "./bit_extend.sv"
vlog "./bitslice.sv"
vlog "./comparator5.sv"
vlog "./comparator10.sv"
vlog "./D_FF.sv"
vlog "./datamem.sv"
vlog "./decoder16.sv"
vlog "./decoder32.sv"
vlog "./fixed_shift_right.sv"
vlog "./full_adder.sv"
vlog "./instructmem.sv"
vlog "./is_zero64.sv"
vlog "./LSR.sv"
vlog "./mux.sv"
vlog "./mux_base.sv"
vlog "./mux_ex.sv"
vlog "./regfile.sv"
vlog "./register.sv"
vlog "./P5SCPU.sv"
vlog "./CPU_top.sv"
vlog "./CPU_top_tb.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work CPU_top_tb

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do CPU_top_wave.do

# Set the window types
view wave
view structure
view signals

# prevent the sim from opening file
# set PrefSource(OpenOnBreak) 0

# Run the simulation
run -all

# End
