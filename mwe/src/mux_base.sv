`timescale 1ns/10ps

// small mux unit (larger muxes are made as a tree of this mux)
module mux_base (
    input logic sel,
    input logic [1:0] in,
    output logic out
);
    logic sel_bar, tmp1, tmp0;
    //          tmp1              tmp0
    // out = (sel & in[1]) | (~sel & in[0])
    
    not #(0.05) (sel_bar, sel);
    and #(0.05) (tmp0, sel_bar, in[0]);
    and #(0.05) (tmp1, sel, in[1]);
    or #(0.05) (out, tmp0, tmp1);
    
endmodule


module mux_base_testbench();
    logic sel;
    logic [1:0] in;
    logic out;
    logic test;
    
    mux_base dut (.sel, .in, .out);
    
    initial begin
        for (int i = 0; i < 8; i++) begin
            {sel, in} = i; #50;
        end
        $stop;
    end
endmodule