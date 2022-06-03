
`timescale 1ns/10ps

module mux #(parameter EXP=5) (
    input logic [EXP-1:0] sel,
    input logic [2**EXP-1:0] in,
    output logic out
);
    initial assert(EXP > 0);
    
    wire intermed [2**EXP];         // intermediate nets between muxes in the mux tree
    localparam BASE = 2**(EXP-1);   // number of muxes in base layer
    
    genvar i, j;
    generate
        // load the input values into the base layer of the mux tree
        for (i = 0; i < 2**(EXP-1); i++) begin : base_layer
            mux_base units (
                .sel(sel[0]), 
                .in({in[2*i+1], in[2*i]}),
                .out(intermed[2**(EXP-1)+i])
            );
        end
        
        // define mux tree pattern
        for (i = 0; i < EXP-1; i++) begin : tree
            for (j =0; j < 2**i; j++) begin : base_units
                mux_base units (
                    .sel(sel[EXP-1-i]), 
                    .in({intermed[2**(i+1)+2*j+1], intermed[2**(i+1)+2*j]}),
                    .out(intermed[2**i+j])
                );
            end
        end
        
    endgenerate
    
    // mux output is tree root
    assign out = intermed[1];
    
endmodule



module mux_testbench();
    localparam EXP = 3;
    logic [EXP - 1:0] sel;
    logic [2**EXP-1:0] in;
    logic out;
    
    mux #(.EXP(EXP)) dut (.sel, .in, .out);
    
    
    initial begin
        
        sel = 3'b000;   in ={1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; #50;
        sel = 3'b001;   in ={1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; #50;
        sel = 3'b010;   in ={1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; #50;
        sel = 3'b011;   in ={1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0}; #50;
        sel = 3'b100;   in ={1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}; #50;
        sel = 3'b101;   in ={1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0}; #50;
        sel = 3'b110;   in ={1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0}; #50;
        sel = 3'b111;   in ={1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}; #50;
        
        sel = 3'b000;   in ={1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}; #50;
        sel = 3'b001;   in ={1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0}; #50;
        sel = 3'b010;   in ={1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0}; #50;
        sel = 3'b011;   in ={1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}; #50;
        sel = 3'b100;   in ={1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0}; #50;
        sel = 3'b101;   in ={1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; #50;
        sel = 3'b110;   in ={1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; #50;
        sel = 3'b111;   in ={1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; #50;
        $stop;
    end
endmodule