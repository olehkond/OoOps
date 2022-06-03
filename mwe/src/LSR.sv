`timescale 1ns/10ps

module LSR #(parameter WIDTH = 64) (
    input logic [WIDTH-1:0]         in,
    input logic [$clog2(WIDTH)-1:0] shamt, // shift amount
    output logic [WIDTH-1:0]        out
);
    initial assert(WIDTH > 1);
    localparam NUM_SHIFTERS = $bits(shamt);
    logic [WIDTH-1:0] inouts [NUM_SHIFTERS];
    
    genvar i;
    generate
        // lay down sequential fixed shifters
        for (i = 0; i < NUM_SHIFTERS; i++) begin
            fixed_shift_right #(.SHAMT(2**i), .WIDTH(WIDTH)) fsr (
                .in((i == 0) ? in : inouts[i-1]),
                .shift(shamt[i]),
                .out(inouts[i])
            );
        end
    endgenerate
    
    assign out = inouts[NUM_SHIFTERS-1];
    
endmodule




module LSR_tb();
    localparam WIDTH = 16;
    logic [WIDTH-1:0]           in;
    logic [$clog2(WIDTH)-1:0]   shamt; // shift amount
    logic [WIDTH-1:0]           out;
    
    LSR #(.WIDTH(WIDTH)) dut (
        .in,
        .shamt,
        .out
    );
    
    initial begin
        in = 16'hF000;
        for (int i = 0; i < WIDTH; i++) begin
            shamt = i; #10;
        end
        $finish;
    end
endmodule