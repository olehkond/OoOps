`timescale 1ns/10ps

module CPU_top_tb();
    logic clk, reset;
    
    localparam PERIOD = 15;
    initial begin
        clk <= 0;
        forever #(PERIOD/2) clk <= ~clk;
    end
    
    CPU_top dut (
        .clk,
        .reset
    );
    
    initial begin
	    $vcdpluson;
        $vcdplusmemon;
        //$dumpfile("test.vcd");
        //$dumpvars;
        //$sdf_annotate("./P5SCPU.syn.sdf", dut.core);
        reset <= 1; repeat(2)    @(posedge clk);
        reset <= 0; repeat(1000) @(posedge clk);
	    $vcdplusoff; #100;
        $finish;
    end
    
endmodule // CPU_top_tb
