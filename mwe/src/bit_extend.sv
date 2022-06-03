
// sign-extend or zero-extend module. SIGN parameter can either be "SIGN" or "ZERO" to work
module bit_extend #(parameter SIGN = "SIGN", IN_WIDTH = 9, OUT_WIDTH = 64) (
    input logic [IN_WIDTH-1:0]      in,
    output logic [OUT_WIDTH-1:0]    out
);
    initial assert(OUT_WIDTH > IN_WIDTH); // cant extend to smaller value lol
    
    genvar i;
    generate
        for (i = 0; i < OUT_WIDTH; i++)
            if (SIGN == "SIGN")             // sign extend
                if (i < IN_WIDTH)
                    assign out[i] = in[i];
                else
                    assign out[i] = in[IN_WIDTH-1];
            else if (SIGN == "ZERO")        // zero extend
                if (i < IN_WIDTH)
                    assign out[i] = in[i];
                else
                    assign out[i] = '0;
    endgenerate
    
endmodule


module bit_extend_tb();
    parameter   SIGN = "SIGN",
                IN_WIDTH = 9,
                OUT_WIDTH = 64;
    logic [IN_WIDTH-1:0]    in;
    logic [OUT_WIDTH-1:0]   out;
    
    bit_extend #(.SIGN(SIGN), .IN_WIDTH(IN_WIDTH), .OUT_WIDTH(OUT_WIDTH)) dut (
        .in,
        .out
    );
    
    initial begin
        in = {1'b1, {8{'0}}}; #10;
        in = {1'b0, {8{'1}}}; #10;
        $finish;
    end
    
endmodule