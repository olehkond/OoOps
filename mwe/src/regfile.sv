
`timescale 1ns/10ps

module regfile (
    input logic	 [4:0]  ReadRegister1, ReadRegister2, WriteRegister,
    input logic  [63:0]	WriteData,
    input logic         RegWrite, clk,
    output logic [63:0]	ReadData1, ReadData2
);
    logic [31:0] write_en; // write enable signals (goes to the enable port of registers)
    logic [63:0] reg_out [32]; // register outputs
    logic [31:0] bit_group [64]; // transpose of reg_out (makes the mux select syntax simpler) is effectivly a second name for the same net(s)
    
    // decoder for determining write register
    decoder32 reg_select (.sel(WriteRegister), .en(RegWrite), .out(write_en));
    
    
    genvar i, j;
    generate
        // generate 32 64-bit registers (no reset signal at the top level? hardwired reset to zero)
        for (i = 0; i < 31; i++) begin : reg_gen // note: stop at 30 since register 31 is unique
            register #(.WIDTH(64)) dut (.reset(1'b0), .clk, .en(write_en[i]), .in(WriteData), .out(reg_out[i]));
        end
        
        // rename the transpose/rearrangment of register bits by grouping
        for (i = 0; i < 64; i++) begin
            for (j = 0; j < 32; j++) begin
                assign bit_group[i][j] = reg_out[j][i];
            end
        end
        
        // read muxes
        for (i = 0; i < 64; i++) begin : read_muxes
            mux #(.EXP(5)) rd_out1 (.sel(ReadRegister1), .in(bit_group[i]), .out(ReadData1[i]));
            mux #(.EXP(5)) rd_out2 (.sel(ReadRegister2), .in(bit_group[i]), .out(ReadData2[i]));
        end
    endgenerate
    
    // reg 31 is always zero (reset tied to high), hopefully synthesis (if we were to run it) optimizes this out entirely
    register #(.WIDTH(64)) dut (.reset(1'b1), .clk, .en(1'b0), .in('0), .out(reg_out[31]));
    
endmodule





// Test bench for Register file
`timescale 1ns/10ps

module regstim(); 		

	parameter ClockDelay = 5000;

	logic	[4:0] 	ReadRegister1, ReadRegister2, WriteRegister;
	logic [63:0]	WriteData;
	logic 			RegWrite, clk;
	logic [63:0]	ReadData1, ReadData2;

	integer i;

	// Your register file MUST be named "regfile".
	// Also you must make sure that the port declarations
	// match up with the module instance in this stimulus file.
	regfile dut (.ReadData1, .ReadData2, .WriteData, 
					 .ReadRegister1, .ReadRegister2, .WriteRegister,
					 .RegWrite, .clk);

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	initial begin
		// Try to write the value 0xA0 into register 31.
		// Register 31 should always be at the value of 0.
		RegWrite <= 5'd0;
		ReadRegister1 <= 5'd0;
		ReadRegister2 <= 5'd0;
		WriteRegister <= 5'd31;
		WriteData <= 64'h00000000000000A0;
		@(posedge clk);
		
		$display("%t Attempting overwrite of register 31, which should always be 0", $time);
		RegWrite <= 1;
		@(posedge clk);

		// Write a value into each  register.
		$display("%t Writing pattern to all registers.", $time);
		for (i=0; i<31; i=i+1) begin
			RegWrite <= 0;
			ReadRegister1 <= i-1;
			ReadRegister2 <= i;
			WriteRegister <= i;
			WriteData <= i*64'h0000010204080001;
			@(posedge clk);
			
			RegWrite <= 1;
			@(posedge clk);
		end

		// Go back and verify that the registers
		// retained the data.
		$display("%t Checking pattern.", $time);
		for (i=0; i<32; i=i+1) begin
			RegWrite <= 0;
			ReadRegister1 <= i-1;
			ReadRegister2 <= i;
			WriteRegister <= i;
			WriteData <= i*64'h0000000000000100+i;
			@(posedge clk);
		end
		$stop;
	end
endmodule