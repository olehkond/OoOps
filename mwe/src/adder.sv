
`timescale 1ns/10ps

module adder #(parameter WIDTH=64) (
    input logic [WIDTH-1:0] A, B,       // numbers to be sumed
    input logic Cin,                    // Carry in
    output logic [WIDTH-1:0] result,    // final sum
    output logic Cout,                  // Carry out
    output logic overflow               // overflow bit
);
    // WIDTH cannot be negative and a single bit adder has two issues
    //      1) a fullAdder module exists (and is used in this module)
    //      2) overflow bit requires 2 FAs
    initial assert(WIDTH > 1);
    
    // internal carry bits
    logic carry [WIDTH+1];
    
    // first carry is driven by a port
    assign carry[0] = Cin;
    
    genvar i;
    generate
        // generate bit adders
        for (i = 1; i < WIDTH+1; i++) begin : fadder
            full_adder bit_add (
                // inputs
                .A(A[i-1]),
                .B(B[i-1]),
                .Cin(carry[i-1]),
                
                // outputs
                .S(result[i-1]),
                .Cout(carry[i])
            );
        end
    endgenerate
    
    // overflow bit is xor of latest 2 carries
    xor (overflow, carry[WIDTH], carry[WIDTH-1]);
    
    // carry out is last carry
    assign Cout = carry[WIDTH];
endmodule




module adder_testbench();
    localparam WIDTH = 4;
    // inputs
    logic [WIDTH-1:0] A, B;
    logic Cin;
    // outputs
    logic [WIDTH-1:0] result;
    logic Cout, overflow;
    
    adder #(.WIDTH(WIDTH)) dut (
        // inputs
        .A, .B, .Cin,
        
        // outputs
        .result, .Cout, .overflow
    );
    
    initial begin
        Cin = 0;
        for (int i = 0; i < 2**WIDTH; i++) begin
            for (int j = 0; j < 2**WIDTH; j++) begin
                A = i;
                B = j;
                #50;
            end
        end
        
        Cin = 1;
        for (int i = 0; i < 2**WIDTH; i++) begin
            for (int j = 0; j < 2**WIDTH; j++) begin
                A = i;
                B = j;
                #50;
            end
        end
        $finish;
    end
endmodule