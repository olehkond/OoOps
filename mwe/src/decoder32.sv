
`timescale 1ns/10ps

module decoder32 ( // not sure how I would parameterize this with only gate level logic :(
    input logic [4:0] sel,
    input logic en,
    output logic [2**5-1:0] out
);
    logic [2**5-1:0] out_tmp;
    logic [4:0] sel_bar;
    
    not (sel_bar[4], sel[4]);
    
    decoder16 frst_hlf (.sel(sel[3:0]), .out(out_tmp[15:0])); // lower bits
    decoder16 scnd_hlf (.sel(sel[3:0]), .out(out_tmp[31:16])); // upper bits
    
    genvar i;
    generate
        // output enable + sel
        for (i = 0; i < 2**4; i++) begin : enable_sel
            and (out[i],    out_tmp[i],     sel_bar[4], en);
            and (out[16+i], out_tmp[16+i],  sel[4],     en);
        end
    endgenerate
    
endmodule


module decoder32_testbench();
    logic [4:0] sel;
    logic en;
    logic [2**5-1:0] out;
    
    decoder32 dut (.sel, .en, .out);
    
    
    initial begin
        en = 1;
        for(int i = 0; i < 2**5; i++) begin
            sel = i; #10;
        end
        
        en = 0;
        for(int i = 0; i < 2**5; i++) begin
            sel = i; #10;
        end
        
        $stop;
    end
endmodule