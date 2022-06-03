`timescale 1ns/10ps

module is_zero64 ( // too lazy to parameterize this one... don't think I will need this again
    input logic [63:0] in,
    output logic zero
);
    localparam BASE_LAYER = 64;
    
    logic orsL1 [BASE_LAYER/4];     // layer 1 of ORs
    logic orsL2 [BASE_LAYER/4/4];   // layer 2 of ORs
    logic nor_fin;                  // nor of layer 2
    
    genvar i, j;
    generate
        // lay down ors
        for (i = 0; i < BASE_LAYER/4; i++)
            or #(0.05) (orsL1[i], in[4*i+0], in[4*i+1], in[4*i+2], in[4*i+3]);
        
        // or outputs (necessary to avoid using > 4 inputs to a single gate)
        for (i = 0; i < BASE_LAYER/4/4; i++)
            or #(0.05) (orsL2[i], orsL1[4*i+0], orsL1[4*i+1], orsL1[4*i+2], orsL1[4*i+3]);
        
        // nor layer 2 to determin if zero
        nor #(0.05) (nor_fin, orsL2[0], orsL2[1], orsL2[2], orsL2[3]);
    endgenerate
    
    // hook up output to root
    assign zero = nor_fin;
    
endmodule

module is_zero64_testbench();
    logic [63:0] in;
    logic zero;
    
    is_zero64 dut (
        .in,
        .zero
    );
    
    initial begin
        in = 64'd1;                 #50;
        in = 64'd16;                #50;
        in = 64'd0;                 #50;
        in = 64'd255;               #50;
        in = 64'hFFFFFFFFFFFFFFFF;  #50;
        in = 64'd0;                 #50;
        $finish;
    end
    
endmodule