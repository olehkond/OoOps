/*
    Parameterizable-Width MSB Priority Encoder
    
    Inputs:
        logic [N-1:0]         in_i:     input val to be encoded

    Outputs:
        logic [$clog2(N)-1:0] out_o:    index of highest HIGH bit in 'in_i'
        logic                 valid_o:  there is at least 1 HIGH bit in 'in_i' if valid

    Parameters:
        N:  Number of bits in in_i
*/

`timescale 1ns/10ps

module priority_encoder #(
    parameter N = 8
) (
    input  logic [N-1:0]         in_i,
    output logic [$clog2(N)-1:0] out_o,
    output logic                 valid_o
); 
    // is any one bit in valid_o HIGH?
    assign valid_o = |in_i;

    // Find highest HIGH bit in 'in_i'
    always_comb begin
        // default
        out_o = 'x;

        for (int i = 0; i < N; i++) begin
            if ( in_i[i] == '1 ) begin
                out_o = i; 
            end
        end
    end
endmodule


