
`timescale 1ns/10ps

module full_adder (
    input logic A, B, Cin,  // A, B are numbers to be summed;   Cin = Carry in
    output logic S, Cout    // S = Sum;                         Cout = Carry out
);
    logic AB, ACin, BCin;
    
    // Cout = (A & B) | (B & Cin) | (A & Cin)
    and #(0.05) (AB,    A,  B);
    and #(0.05) (ACin,  A,  Cin);
    and #(0.05) (BCin,  B,  Cin);
    or  #(0.05) (Cout,  AB, ACin, BCin);
    
    // S = A ^ B ^ Cin
    xor #(0.05) (S, A, B, Cin);
endmodule


module full_adder_testbench();
    logic A, B, Cin, S, Cout;
    
    full_adder dut (
        // inputs
        .A,
        .B,
        .Cin,
        
        // outputs
        .S,
        .Cout
    );
    
    initial begin
        for (int i = 0; i < 8; i++) begin
            {A, B, Cin} = i; #50;
        end
        $finish;
    end
endmodule