
`timescale 1ns/10ps

// >>> NOT AN ENABLE DECODER (THIS IS USED TO BUILD THE 32-OUTPUT ENABLE DECODER)
module decoder16 ( // not sure how I would parameterize this with only gate level logic :(
    input logic [3:0] sel,
    output logic [2**4-1:0] out
);
    logic [3:0] sel_bar;
    
    not (sel_bar[0], sel[0]);
    not (sel_bar[1], sel[1]);
    not (sel_bar[2], sel[2]);
    not (sel_bar[3], sel[3]);
    
    // limited to gates with 4 inputs
    and (out[0],     sel_bar[3],     sel_bar[2],     sel_bar[1],     sel_bar[0]);
    and (out[1],     sel_bar[3],     sel_bar[2],     sel_bar[1],     sel[0]);
    and (out[2],     sel_bar[3],     sel_bar[2],     sel[1],         sel_bar[0]);
    and (out[3],     sel_bar[3],     sel_bar[2],     sel[1],         sel[0]);
    and (out[4],     sel_bar[3],     sel[2],         sel_bar[1],     sel_bar[0]);
    and (out[5],     sel_bar[3],     sel[2],         sel_bar[1],     sel[0]);
    and (out[6],     sel_bar[3],     sel[2],         sel[1],         sel_bar[0]);
    and (out[7],     sel_bar[3],     sel[2],         sel[1],         sel[0]);
    
    and (out[8],     sel[3],         sel_bar[2],     sel_bar[1],     sel_bar[0]);
    and (out[9],     sel[3],         sel_bar[2],     sel_bar[1],     sel[0]);
    and (out[10],    sel[3],         sel_bar[2],     sel[1],         sel_bar[0]);
    and (out[11],    sel[3],         sel_bar[2],     sel[1],         sel[0]);
    and (out[12],    sel[3],         sel[2],         sel_bar[1],     sel_bar[0]);
    and (out[13],    sel[3],         sel[2],         sel_bar[1],     sel[0]);
    and (out[14],    sel[3],         sel[2],         sel[1],         sel_bar[0]);
    and (out[15],    sel[3],         sel[2],         sel[1],         sel[0]);
    
endmodule