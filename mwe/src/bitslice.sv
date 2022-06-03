
`timescale 1ns/10ps

module bitslice (
    input logic sum,                // result of addition or subtraction
                A, B,               // the numbers/bits themselves
    input logic [2:0] ctrl,         // control signal
    output logic result             // result based off of control
);
    logic [7:0] p_out; // all possible outputs
    
    // <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
    assign p_out[0] = B;            // result = B               (000)
    assign p_out[1] = 'x;           // no control signal for    (001)
    assign p_out[2] = sum;          // A + B                    (010)
    assign p_out[3] = sum;          // A - B                    (011)
    and #(0.05) (p_out[4], A, B);   // bitwise and              (100)
    or  #(0.05) (p_out[5], A, B);   // bitwise or               (101)
    xor #(0.05) (p_out[6], A, B);   // bitwise xor              (110)
    assign p_out[7] = 'x;           // no control signal for    (111)
    // <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
    
    // select among the possible outputs
    mux #(.EXP(3)) sel (
        .sel(ctrl),
        .in(p_out),
        .out(result)
    );
    
endmodule

module bitslice_testbench();
    logic sum, A, B;
    logic [2:0] ctrl;
    logic result;
    
    bitslice dut (
        // inputs
        .sum,
        .A,
        .B,
        .ctrl,
        
        // outputs
        .result
    );
    
    initial begin
        // set sums to 'z so at they are distiquishable from 1 and 7 (which are 'x)
        sum = 'z;
        ctrl = 4'h0; A = 1; B = 1; #50;
        ctrl = 4'h1;               #50;
        ctrl = 4'h2;               #50;
        ctrl = 4'h3;               #50;
        ctrl = 4'h4;               #50;
        ctrl = 4'h5;               #50;
        ctrl = 4'h6;               #50;
        ctrl = 4'h7;               #50;
        
        ctrl = 4'h0; A = 1; B = 0; #50;
        ctrl = 4'h1;               #50;
        ctrl = 4'h2;               #50;
        ctrl = 4'h3;               #50;
        ctrl = 4'h4;               #50;
        ctrl = 4'h5;               #50;
        ctrl = 4'h6;               #50;
        ctrl = 4'h7;               #50;
        $finish;
    end
endmodule