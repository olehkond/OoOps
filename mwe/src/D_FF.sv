
`timescale 1ns/10ps

module D_FF (q, d, reset, clk);
    output reg q;
    input d, reset, clk;
    
    always_ff @(posedge clk)
        if (reset)
            q <= 0; // On reset, set to 0
        else
            q <= d; // Otherwise out = d
endmodule




module D_FF_testbench();
    logic q, d, reset, clk;
    
    localparam PERIOD = 10;
    initial begin
        clk = 0;
        forever #(PERIOD/2) clk = ~clk;
    end
    
    D_FF dut (.reset, .clk, .d, .q);
    
    initial begin
        reset = 1; d = 1'b1; @(posedge clk);
        reset = 0; d = 1'b0; @(posedge clk);
        reset = 0; d = 1'b1; @(posedge clk);
        reset = 0; d = 1'b1; @(posedge clk);
        reset = 0; d = 1'b1; @(posedge clk);
        reset = 0; d = 1'b1; @(posedge clk);
        reset = 0; d = 1'b0; @(posedge clk);
        reset = 0; d = 1'b1; @(posedge clk);
        reset = 0; d = 1'b0; @(posedge clk);
        reset = 0; d = 1'b1; @(posedge clk);
        reset = 0; d = 1'b1; @(posedge clk);
        reset = 1; d = 1'b1; @(posedge clk);
        reset = 0; d = 1'b1; @(posedge clk);
        reset = 0; d = 1'b1; @(posedge clk);
        $stop;
    end
endmodule