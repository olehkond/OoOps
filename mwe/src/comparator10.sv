
`timescale 1ns/10ps

// determine if A and B are equal
module comparator10 (
    input logic [9:0] A, 
    input logic [9:0] B,
    output logic equal, not_equal
);
    logic [10:0] xorz;
    
    // xor each bit
    xor #(0.05) (xorz[0], A[0], B[0]);
    xor #(0.05) (xorz[1], A[1], B[1]);
    xor #(0.05) (xorz[2], A[2], B[2]);
    xor #(0.05) (xorz[3], A[3], B[3]);
    xor #(0.05) (xorz[4], A[4], B[4]);
    xor #(0.05) (xorz[5], A[5], B[5]);
    xor #(0.05) (xorz[6], A[6], B[6]);
    xor #(0.05) (xorz[7], A[7], B[7]);
    xor #(0.05) (xorz[8], A[8], B[8]);
    xor #(0.05) (xorz[9], A[9], B[9]);
    
    // OR the xor outputs
    logic tmp1, tmp2;
    or #(0.05) (tmp1, xorz[0], xorz[1], xorz[2], xorz[3]);
    or #(0.05) (tmp2, xorz[4], xorz[5], xorz[6], xorz[7]);
    
    // if all of the xors are 0's, then A == B, else A != B
    or #(0.05) (not_equal, tmp1, tmp2, xorz[8], xorz[9]);
    nor #(0.05) (equal, tmp1, tmp2, xorz[8], xorz[9]);
    
endmodule
