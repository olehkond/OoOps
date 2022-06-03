
`timescale 1ns/10ps

module register #(parameter WIDTH=32) (
    input logic reset, clk, en,
    input logic [WIDTH-1:0] in,
    output logic [WIDTH-1:0] out
);
    logic [WIDTH-1:0] in_en;
    
    genvar i;
    generate
        // mux that loads in new value when enable is high
        for (i =0; i < WIDTH; i++) begin : input_enable
            mux_base dut (.sel(en), .in({in[i], out[i]}), .out(in_en[i]));
        end
        
        // lay down FFs for desired length
        for (i =0; i < WIDTH; i++) begin : reg_bits
            D_FF FF (.q(out[i]), .d(in_en[i]), .reset, .clk);
        end
    endgenerate
    
endmodule



module register_testbench();
    localparam WIDTH = 4;
    logic reset, clk, en;
    logic [WIDTH-1:0] in;
    logic [WIDTH-1:0] out;
    
    localparam PERIOD = 10;
    initial begin
        clk = 0;
        forever #(PERIOD/2) clk = ~clk;
    end
    
    register #(.WIDTH(WIDTH)) dut (.reset, .clk, .en, .in, .out);
    
    initial begin
        en = 0; reset = 1; in = 4'd0; repeat(5) @(posedge clk);
                reset = 0;            repeat(1) @(posedge clk);
        en = 1;            in = 4'd1; repeat(1) @(posedge clk);
        en = 1;            in = 4'd2; repeat(1) @(posedge clk);
        en = 1;            in = 4'd1; repeat(1) @(posedge clk);
        en = 1;            in = 4'd3; repeat(3) @(posedge clk);
        en = 0;            in = 4'd2; repeat(4) @(posedge clk);
        en = 1;                       repeat(1) @(posedge clk);
        en = 0;                       repeat(3) @(posedge clk);
        $stop;
    end
endmodule