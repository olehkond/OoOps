
`timescale 1ns/10ps
// A wall of muxes to select between 2 numbers of WIDTH size
// Basically a generate that is used over and over so I figure it was worth modulizing
module mux_ex #(parameter WIDTH = 64) (
    input logic                 sel,
    input logic [WIDTH-1:0] 	A, B,
    output logic [WIDTH-1:0] 	Z
);
    
    genvar i;
	for (i = 0; i < WIDTH; i++) begin
		mux_base bits (.sel, .in({A[i], B[i]}), .out(Z[i]));
	end
    
endmodule

// Test bench for Register file
`timescale 1ns/10ps
module mux_ex_tb();         
	localparam WIDTH = 5;
	
	logic [WIDTH-1:0] A, B, Z;
	logic sel, clk;
    mux #(.WIDTH(WIDTH)) dut (.sel, .A, .B, .Z);

	
    parameter ClockDelay = 500;
    initial begin // Set up the clock
        clk <= 0;
        forever #(ClockDelay/2) clk <= ~clk;
    end

    initial begin
		A = '0; B = '1; sel = 0; repeat(1) @(posedge clk);
						sel = 1; repeat(1) @(posedge clk);
						sel = 0; repeat(1) @(posedge clk);
						sel = 1; repeat(4) @(posedge clk);
						sel = 0; repeat(4) @(posedge clk);
        $stop;
    end
endmodule