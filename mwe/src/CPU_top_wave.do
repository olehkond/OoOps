onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /CPU_top_tb/dut/data_memory/mem
add wave -noupdate -radix decimal /CPU_top_tb/dut/core/register_file/reg_out
add wave -noupdate -radix decimal /CPU_top_tb/dut/core/program_counter
add wave -noupdate /CPU_top_tb/dut/core/clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5253172 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 250000
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {12165240 ps}
