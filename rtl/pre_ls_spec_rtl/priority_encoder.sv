
// Parameterizable-Width MSB Priority Encoder
module priority_encoder #(
    parameter N = 8
) (
    input  logic [N-1:0]         in_i,
    output logic [$clog2(N)-1:0] out_o, 
    output logic                 valid_o
); 

    
    assign valid_o = |in_i;

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


