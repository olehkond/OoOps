`timescale 1ns/10ps

module fixed_shift_right #(parameter SHAMT = 1, WIDTH = 64) (
    input logic [WIDTH-1:0]     in,
    input logic                 shift,
    output logic [WIDTH-1:0]    out
);
    initial assert(SHAMT > 0);
    initial assert(WIDTH > 0);
    initial assert(WIDTH > SHAMT);
    
    genvar i;
    generate
        for (i = 0; i < WIDTH; i++) begin : shift_muxes
            if (i + SHAMT < WIDTH)
                mux_base shifts (.sel(shift), .in({in[i + SHAMT], in[i]}), .out(out[i]));
            else
                mux_base shifts (.sel(shift), .in({1'b0,          in[i]}), .out(out[i]));
        end
    endgenerate
    
endmodule


module fixed_shift_right_tb();
    localparam SHAMT = 1, WIDTH = 4;
    logic [WIDTH-1:0]   in;
    logic               shift;
    logic [WIDTH-1:0]   out;
    
    fixed_shift_right #(.SHAMT(SHAMT), .WIDTH(WIDTH)) dut (
        .in,
        .shift,
        .out
    );
    
    initial begin
        in = 4'b1000; shift = 0; #10;
                      shift = 1; #10;
                      shift = 1; #10;
                      shift = 0; #10;
                      shift = 1; #10;
        $finish;
    end
    
endmodule