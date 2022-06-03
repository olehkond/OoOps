
`timescale 1ns/10ps

module alu (
    input logic  [63:0] A, B,
    input logic  [2:0]  cntrl,
    output logic [63:0] result, 
    output logic        negative, zero, overflow, carry_out
);
    logic [63:0] adder_out;
    logic [63:0] Bxor;      // conditionally flipped B
    
    genvar i;
    generate
        // if subtracting, need to flip all bits of 'B'
        for (i = 0; i < 64; i++) begin : flips
            xor #(0.05) (Bxor[i], B[i], cntrl[0]);
        end
    endgenerate
    
    // lay down adder
    adder #(.WIDTH(64)) dut (
        // inputs
        .A,
        .B(Bxor),           // note: conditionally flipped
        .Cin(cntrl[0]),
        
        // outputs
        .result(adder_out), // goes into bitslice(s)
        .Cout(carry_out),
        .overflow
    );
    
    generate
        // lay out slices
        for (i = 0; i < 64; i++) begin : slices
            bitslice bit_slice (
                // inputs
                .sum(adder_out[i]),
                .A(A[i]),
                .B(B[i]),
                .ctrl(cntrl),
        
                // outputs
                .result(result[i])
            );
        end
    endgenerate
    
    // negative is equivalent to sign bit in 2's comp
    assign negative = result[63];
    
    // determine if result is zero
    is_zero64 is_zero (
        .in(result),
        .zero
    );
    
endmodule


// Test bench for ALU
`timescale 1ns/10ps

// Meaning of signals in and out of the ALU:

// Flags:
// negative: whether the result output is negative if interpreted as 2's comp.
// zero: whether the result output was a 64-bit zero.
// overflow: on an add or subtract, whether the computation overflowed if the inputs are interpreted as 2's comp.
// carry_out: on an add or subtract, whether the computation produced a carry-out.

// cntrl            Operation                        Notes:
// 000:            result = B                        value of overflow and carry_out unimportant
// 010:            result = A + B
// 011:            result = A - B
// 100:            result = bitwise A & B        value of overflow and carry_out unimportant
// 101:            result = bitwise A | B        value of overflow and carry_out unimportant
// 110:            result = bitwise A XOR B    value of overflow and carry_out unimportant

module alustim();

    parameter delay = 100;
    
    logic [63:0]    A, B;
    logic [64:0]    C;
    logic [2:0]     cntrl;
    logic [63:0]    result;
    logic           negative, zero, overflow, carry_out ;

    parameter ALU_PASS_B=3'b000, ALU_ADD=3'b010, ALU_SUBTRACT=3'b011, ALU_AND=3'b100, ALU_OR=3'b101, ALU_XOR=3'b110;
    

    alu dut (.A, .B, .cntrl, .result, .negative, .zero, .overflow, .carry_out);

    // Force %t's to print in a nice format.
    initial $timeformat(-9, 2, " ns", 10);

    integer i;
    initial begin
        $display("%t testing PASS_B operations", $time);
        cntrl = ALU_PASS_B;
        for (i=0; i<500; i++) begin
            A = {$urandom(), $urandom()}; B = {$urandom(), $urandom()};
            #(delay);
            assert(result == B && negative == B[63] && zero == (B == '0));
        end
        
        // <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
        $display("%t testing addition", $time);
        cntrl = ALU_ADD;
        for (i=0; i<5000; i++) begin
            A = {$urandom(), $urandom()}; B = {$urandom(), $urandom()};
            if (i == 0) begin // test a specific case
                A = '0; B = '0;
            end
            C = A + B;
            #(delay);
            assert(result == C[63:0]);
            assert(negative == C[63]);
            assert(zero == (C[63:0] == '0));
            assert(carry_out == C[64]);
            assert(overflow == ((A[63] & B[63] & ~C[63]) | (~A[63] & ~B[63] & C[63])));
        end
        
        // <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
        $display("%t testing subtraction", $time);
        cntrl = ALU_SUBTRACT;
        for (i=0; i<5000; i++) begin
            A = {$urandom(), $urandom()}; B = {$urandom(), $urandom()};
            if (i == 0) begin // test a specific case
                A = '0; B = '0;
            end
            C = A + (B ^ 64'hFFFF_FFFF_FFFF_FFFF) + 1'b1;
			#(delay);
            assert(result == C[63:0]);
            assert(negative == C[63]);
            assert(zero == (C[63:0] == '0));
            assert(carry_out == C[64]);
            assert(overflow == ((A[63] & ~B[63] & ~C[63]) | (~A[63] & B[63] & C[63])));
        end
        
        // <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
        $display("%t testing ANDs", $time);
        cntrl = ALU_AND;
        for (i=0; i<500; i++) begin
            A = {$urandom(), $urandom()}; B = {$urandom(), $urandom()};
            C = A & B;
            #(delay);
            assert(result == C && negative == C[63] && zero == (C[63:0] == '0));
        end
        
        // <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
        $display("%t testing ORs", $time);
        cntrl = ALU_OR;
        for (i=0; i<500; i++) begin
            A = {$urandom(), $urandom()}; B = {$urandom(), $urandom()};
            C = A | B;
            #(delay);
            assert(result == C && negative == C[63] && zero == (C[63:0] == '0));
        end
        
        // <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
        $display("%t testing XORs", $time);
        cntrl = ALU_XOR;
        for (i=0; i<500; i++) begin
            A = {$urandom(), $urandom()}; B = {$urandom(), $urandom()};
            C = A ^ B;
            #(delay);
            assert(result == C && negative == C[63] && zero == (C[63:0] == '0));
        end
        
        $stop;
    end
endmodule
