import data_types::*;

`timescale 1ns/10ps

module instruc_decode_tb;

    
    logic [31:0] instruc_i;
    alu_op_t alu_op_type_o; 
    shift_op_t shift_op_type_o;
    functional_group_t  func_group_o;


    instruc_decode dut (.*);


    initial begin
        $vcdpluson;
        instruc_i = 32'b00000_00000_00000_0000000_000_0110011; // ADDR 
        #10;

        instruc_i = 32'b00000_00000_00000_0000000_100_0110011; // XOR 
        #10;
        instruc_i = 32'b000000_00000_000000_000000_001_0010011; // SLLI
        #10;
        $vcdplusoff;
        $finish;

    end



endmodule
