
`timescale 1ns/10ps

// determine if A and B are equal
module comparator5 (
    input logic [4:0] A, 
    input logic [4:0] B,
    output logic equal, not_equal
);
    logic [4:0] xorz;
    
    // xor each bit
    xor #(0.05) (xorz[0], A[0], B[0]);
    xor #(0.05) (xorz[1], A[1], B[1]);
    xor #(0.05) (xorz[2], A[2], B[2]);
    xor #(0.05) (xorz[3], A[3], B[3]);
    xor #(0.05) (xorz[4], A[4], B[4]);
    
    // OR the xor outputs
    logic tmp;
    or #(0.05) (tmp, xorz[0], xorz[1], xorz[2], xorz[3]);
    
    // if all of the xors are 0's, then A == B, else A != B
    or #(0.05) (not_equal, tmp, xorz[4]);
    nor #(0.05) (equal, tmp, xorz[4]);
    
endmodule


module comparator5_tb();
    logic [4:0] A, B;
    logic equal, not_equal;
    
    comparator5 dut (
        // inputs
        .A,
        .B,
        // outputs
        .equal,
        .not_equal
    );
    
    initial begin
        for (int i = 0; i < 2**10; i++) begin
            {A, B} = i; #1;
        end
        $stop;
    end
endmodule