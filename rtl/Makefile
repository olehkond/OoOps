

OOO_TOP_FILES          = ../data_types.sv ../OoO_top.sv \
						 ../fifo.sv \
						 ../shifter.sv \
						 ../res_station.sv \
						 ../regfile.sv \
						 ../priority_encoder.sv \
						 ../alu.sv \
						 ../broadcast_cdb.sv \
						 ../issue_logic.sv \
						 ../basic_dmem_model.sv \
						 ../load_store_unit.sv \
						 ../dmem_read_write_unit.sv \

.PHONY: lint


lint: 
	vcs $(OOO_TOP_FILES) -debug_pp +lint=all -sverilog -full64 -timescale=1ns/10ps 
