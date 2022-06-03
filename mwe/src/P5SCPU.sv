`timescale 1ns/10ps

// Pipelined 5-stage CPU
module P5SCPU (
    input logic reset, clk,

    // signals to interact with datamem
    input logic [63:0] dout,
    output logic dmem_read_cntrl_DM,
    output logic write_dmem_cntrl_DM,
    output logic [63:0] DataWrite_DM,
    output logic [63:0] DM_stage_in,

    // signals to interact with instrmem
    output logic [63:0] program_counter,
    input logic [31:0] instruction_IF
);
    logic floating [50]; // floating logic (goes nowhere)
    
    // inverted clock
    logic clk_bar;
    not #(0.05) (clk_bar, clk);
    
    // address (potentially) being written to by an instruction in the correspondng stage
    logic [4:0] Rd_EX, Rd_DM, Rd_WB;
    
    // control logic signals
    //      REG/DEC                   EX                      DMEM                        WB
    logic unconditional_cntrl;
    logic br_taken_cntrl;
    logic set_flags_cntrl,      set_flags_cntrl_EX;
    logic write_dmem_cntrl,     write_dmem_cntrl_EX;//,    write_dmem_cntrl_DM; // $$$$$$$$$$$ moved to top level
    logic reg_write_cntrl,      reg_write_cntrl_EX,     reg_write_cntrl_DM,       reg_write_cntrl_WB;
    logic shift_op_cntrl,       shift_op_cntrl_EX;
    logic alu_to_reg_cntrl,     alu_to_reg_cntrl_EX,    alu_to_reg_cntrl_DM;
    logic [2:0] alu_cntrl,      alu_cntrl_EX;
    logic [1:0] alu_b_cntrl;
    logic Rd_reg_cntrl;
    logic dmem_read_cntrl,      dmem_read_cntrl_EX;//,     dmem_read_cntrl_DM; // $$$$$$$$$$$ moved to top level
    
    // forwarding unit control signals:
    logic use_imm_flgs_cntrl; // fwding unit
    
    // forwarded values
    logic [63:0] fwded_rd1; // read data 1
    logic [63:0] fwded_rd2; // read data 2
    
    
    // <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
    // Instruction Fetch
    // <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
    // logic [63:0] program_counter, program_counter_next, program_counter_RG_DEC; // $$$$$$$$$$$ moved to top level
    logic [63:0] program_counter_next, program_counter_RG_DEC;
    
    // inctruction memory
    // logic [31:0] instruction_IF; // $$$$$$$$$$$ moved to top level
    logic [31:0] instruction_RG_DEC;
    logic [31:0] instruction_EX;
    
    // instructmem inctruction_memory (
    //     .address        ( program_counter   ),
    //     .instruction    ( instruction_IF    ),
    //     .clk
    // );
    
    
    // Registers to next stage
    register #(.WIDTH(64)) PC (.reset, .clk, .en(1'b1), .in(program_counter_next), .out(program_counter));
    
    register #(.WIDTH(64)) RC_reg (.reset, .clk, .en(1'b1), .in(program_counter), .out(program_counter_RG_DEC));
    
    register #(.WIDTH(32)) instr_reg (.reset, .clk, .en(1'b1), .in(instruction_IF), .out(instruction_RG_DEC));
    
    
    
    
    // <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
    // Reg/Decode
    // <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
    
    
    // {}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}
    // Program Counter
    // {}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}
    
    logic [63:0] PC_adder;
    mux_ex #(.WIDTH(64)) select_PC_into_adders (
        .sel(br_taken_cntrl),
        .A  ( program_counter_RG_DEC    ),
        .B  ( program_counter           ),
        .Z  ( PC_adder                  )
    );
    
    
    
    // adder computing PC + 4
    logic [63:0] PCp4;
    adder #(.WIDTH(64)) PC_plus_4 (
        // inputs
        .A          ( PC_adder      ),
        .B          ( 64'd4         ),
        .Cin        ( 1'b0          ),
        // outputs
        .result     ( PCp4          ),
        .Cout       ( floating[0]   ),
        .overflow   ( floating[1]   )
    );
    
    // sign-extending immediate 19
    logic [18:0] imm19;
    logic [63:0] imm19_64;
    assign imm19 = instruction_RG_DEC[23:5];
    bit_extend #(.SIGN("SIGN"), .IN_WIDTH(19), .OUT_WIDTH(64)) SE_imm19 (
        .in     ( imm19     ),
        .out    ( imm19_64  )
    );
    
    // sign-extending immediate 26
    logic [25:0] imm26;
    logic [63:0] imm26_64;
    assign imm26 = instruction_RG_DEC[25:0];
    bit_extend #(.SIGN("SIGN"), .IN_WIDTH(26), .OUT_WIDTH(64)) SE_imm26 (
        .in     ( imm26     ),
        .out    ( imm26_64  )
    );
    
    
    // select immediate value to add to PC
    logic [63:0] imm;
    mux_ex #(.WIDTH(64)) select_immediate (
        .sel(unconditional_cntrl),
        .A  ( imm26_64  ),
        .B  ( imm19_64  ),
        .Z  ( imm       )
    );
    
    // adder computing PC + immediates
    logic [63:0] PCpImm;
    adder #(.WIDTH(64)) PC_plus_imm (
        // inputs
        .A      ( PC_adder              ),
        .B      ( {imm[61:0], 2'b0}     ),
        .Cin    ( 1'b0                  ),  // shift selected immediate value by 2
        // outputs
        .result(PCpImm), .Cout(floating[2]), .overflow(floating[3])
    );
    
    
    mux_ex #(.WIDTH(64)) select_PC_next (
        .sel    ( br_taken_cntrl        ),
        .A      ( PCpImm                ),
        .B      ( PCp4                  ),
        .Z      ( program_counter_next  )
    );
    
    // {}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}
    // Regfile
    // {}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}
    
    logic [4:0] Rd, Rn, Rm;
    // assign register locations in instruction
    assign Rd = instruction_RG_DEC[4:0];
    assign Rn = instruction_RG_DEC[9:5];
    assign Rm = instruction_RG_DEC[20:16];
    
    // select read address 2
    logic [4:0] rr2; // read register 2
    logic [63:0] read_data_rf1, read_data_rf2, write_data_rf_WB;
    mux_ex #(.WIDTH(5)) select_read_reg2 (
        .sel    ( Rd_reg_cntrl  ),
        .A      ( Rd            ),
        .B      ( Rm            ),
        .Z      ( rr2           )
    );
    
    // reg file
    regfile register_file (
        // inputs
        .clk            ( clk_bar               ),      // inverted clk signal
        .ReadRegister1  ( Rn                    ),
        .ReadRegister2  ( rr2                   ),
        .WriteRegister  ( Rd_WB                 ),
        .WriteData      ( write_data_rf_WB      ),
        .RegWrite       ( reg_write_cntrl_WB    ),
        // outputs
        .ReadData1      ( read_data_rf1         ),
        .ReadData2      ( read_data_rf2         )
    );
    
    // zero-extending immediate 12
    logic [11:0] imm12;
    logic [63:0] imm12_64;
    assign imm12 = instruction_RG_DEC[21:10];
    bit_extend #(.SIGN("ZERO"), .IN_WIDTH(12), .OUT_WIDTH(64)) SE_imm12 (
        .in     ( imm12     ),
        .out    ( imm12_64  )
    );
    
    // sign-extending immediate 9
    logic [8:0] imm9;
    logic [63:0] imm9_64;
    assign imm9 = instruction_RG_DEC[20:12];
    bit_extend #(.SIGN("SIGN"), .IN_WIDTH(9), .OUT_WIDTH(64)) SE_imm9 (
        .in     ( imm9      ),
        .out    ( imm9_64   )
    );
    
    // select second input to ALU
    logic [63:0] alu_b_selected;
    genvar i;
    generate
        for (i = 0; i < 64; i++)
            mux #(.EXP(2)) alu_b_select (
                .sel    ( alu_b_cntrl                                           ),
                .in     ( {imm9_64[i], imm9_64[i], imm12_64[i], fwded_rd2[i]}   ),
                .out    ( alu_b_selected[i]                                     )
            );
    endgenerate
    
    // determine if register value is zero
    logic zero;
    is_zero64 is_rd_zero (
        .in     ( fwded_rd2 ),
        .zero
    );
    
    
    // ==============================================================
    // Forwarding
    // ==============================================================
    
    logic less_than;
    logic [63:0] EX_stage_out;
    logic [63:0] alu_or_dout;
    
    
    /*
    always_comb begin
        fwded_rd1 = read_data_rf1;
        
        if ((Rn == Rd_EX) & reg_write_cntrl_EX & (Rd_EX != 5'd31)) begin
            fwded_rd1 = EX_stage_out;
        end else if ((Rn == Rd_DM) & reg_write_cntrl_DM & (Rd_DM != 5'd31)) begin
            fwded_rd1 = alu_or_dout;
        end
    end
    */
    
    
    // in case register Rn being used will be written to by prev instruction
    // Box replaces commented out always_comb block above
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    // compare rn register to Rn from EX stage                                                          //
    logic Rn_equals_Rd_EX;                                                                              //
    comparator5 Rn_Rd_EX (.A(Rn), .B(Rd_EX), .equal(Rn_equals_Rd_EX), .not_equal(floating[6]));         //
                                                                                                        //
    // compare rn register to 31 from EX stage                                                          //
    logic Rd_not_equals_31_EX;                                                                          //
    comparator5 Rn_comp_31 (.A(Rd_EX), .B(5'd31), .equal(floating[7]), .not_equal(Rd_not_equals_31_EX));//
                                                                                                        //
    logic fwd_rn_EX;                                                                                    //
    // (Rn == Rd_EX) & reg_write_cntrl_EX & (Rd_EX != 5'd31)                                            //
    and #(0.05) (fwd_rn_EX, Rn_equals_Rd_EX, reg_write_cntrl_EX, Rd_not_equals_31_EX);                  //
                                                                                                        //
                                                                                                        //
                                                                                                        //
                                                                                                        //
                                                                                                        //
                                                                                                        //
    // compare rn register to Rn from DM stage                                                          //
    logic Rn_equals_Rd_DM;                                                                              //
    comparator5 Rn_Rd_DM_1 (.A(Rn), .B(Rd_DM), .equal(Rn_equals_Rd_DM), .not_equal(floating[8]));       //
                                                                                                        //
    // compare Rd_EX register to 31                                                                     //
    logic Rd_not_equals_31_DM;                                                                          //
    comparator5 Rd_comp_31_1 (.A(Rd_DM), .B(5'd31), .equal(floating[9]), .not_equal(Rd_not_equals_31_DM));
                                                                                                        //
    logic fwd_rn_DM;                                                                                    //
    // ((Rn == Rd_DM) & reg_write_cntrl_DM & (Rd_DM != 5'd31))                                          //
    and #(0.05) (fwd_rn_DM, Rn_equals_Rd_DM, reg_write_cntrl_DM, Rd_not_equals_31_DM);                  //
                                                                                                        //
    generate                                                                                            //
        for (i = 0; i < 64; i++)                                                                        //
            mux #(.EXP(2)) alu_b_select (                                                               //
                .sel    ( {fwd_rn_EX, fwd_rn_DM}                                                ),      //
                .in     ( {EX_stage_out[i], EX_stage_out[i], alu_or_dout[i], read_data_rf1[i]}  ),      //
                .out    ( fwded_rd1[i]                                                          )       //
            );                                                                                          //
    endgenerate                                                                                         //
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    
    
    /*
    always_comb begin
        fwded_rd2 = read_data_rf2;
        
        if ((rr2 == Rd_EX) & reg_write_cntrl_EX & (Rd_EX != 5'd31)) begin
            fwded_rd2 = EX_stage_out;
        end else if ((rr2 == Rd_DM) & reg_write_cntrl_DM & (Rd_DM != 5'd31)) begin
            fwded_rd2 = alu_or_dout;
        end
    end
    */
    
    // in case 2nd register being used will be written to by prev instruction
    // Box replaces commented out always_comb block above
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    // compare rr2 register to rr2 from EX stage                                                        //
    logic rr2_equals_Rd_EX;                                                                             //
    comparator5 rr2_Rd_EX (.A(rr2), .B(Rd_EX), .equal(rr2_equals_Rd_EX), .not_equal(floating[10]));     //
                                                                                                        //
    logic fwd_rr2_EX;                                                                                   //
    // ((rr2 == Rd_EX) & reg_write_cntrl_EX & (Rd_EX != 5'd31))                                         //
    and #(0.05) (fwd_rr2_EX, rr2_equals_Rd_EX, reg_write_cntrl_EX, Rd_not_equals_31_EX);                //
                                                                                                        //
                                                                                                        //
                                                                                                        //
                                                                                                        //
                                                                                                        //
                                                                                                        //
    // compare rr2 to Rn from DM stage                                                                  //
    logic rr2_equals_Rd_DM;                                                                             //
    comparator5 Rn_Rd_DM_2 (.A(rr2), .B(Rd_DM), .equal(rr2_equals_Rd_DM), .not_equal(floating[12]));    //
                                                                                                        //
    logic fwd_rr2_DM;                                                                                   //
    // ((rr2 == Rd_DM) & reg_write_cntrl_DM & (Rd_DM != 5'd31))                                         //
    and #(0.05) (fwd_rr2_DM, rr2_equals_Rd_DM, reg_write_cntrl_DM, Rd_not_equals_31_DM);                //
                                                                                                        //
    generate                                                                                            //
        for (i = 0; i < 64; i++)                                                                        //
            mux #(.EXP(2)) alu_b_select (                                                               //
                .sel    ( {fwd_rr2_EX, fwd_rr2_DM}                                              ),      //
                .in     ( {EX_stage_out[i], EX_stage_out[i], alu_or_dout[i], read_data_rf2[i]}  ),      //
                .out    ( fwded_rd2[i]                                                          )       //
            );                                                                                          //
    endgenerate                                                                                         //
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    
    /*
    always_comb begin
        casex (instruction_EX[31:21])
            11'b1X1_0101_1000:  use_imm_flgs_cntrl = '1;
            default:            use_imm_flgs_cntrl = '0;
        endcase
    end
    */
    
    // only use immediate flags for S instructions
    comparator10 imm_flag (.A({instruction_EX[31], instruction_EX[29:21]}), .B(10'b11_0101_1000), .equal(use_imm_flgs_cntrl), .not_equal(floating[13]));
    
    
    
    // Registers to EX stage from REG/DEC
    logic [63:0] alu_A_EX;      // Alu A input
    register #(.WIDTH(64)) aluA_input (.reset, .clk, .en(1'b1), .in(fwded_rd1), .out(alu_A_EX));
    
    logic [63:0] alu_B_EX;      // Alu B input
    register #(.WIDTH(64)) aluB_input (.reset, .clk, .en(1'b1), .in(alu_b_selected), .out(alu_B_EX));
    
    logic [63:0] DataWrite_EX;  // Pass along data to write in DMEM (does nothing in EX)
    register #(.WIDTH(64)) data_write_EX (.reset, .clk, .en(1'b1), .in(fwded_rd2), .out(DataWrite_EX));
    
    // Remember Rd for this instruction (for forwarding purposes)
    register #(.WIDTH(5)) Rd_save_EX (.reset, .clk, .en(1'b1), .in(Rd), .out(Rd_EX));
    
    logic [5:0] shamt;          // pass along shift amount from instruction
    register #(.WIDTH(6)) pass_SHAMT (.reset, .clk, .en(1'b1), .in(instruction_RG_DEC[15:10]), .out(shamt));
    
    // pass along instruction type (to determine whether immediate flags to be used)
    register #(.WIDTH(11)) use_imm_flag_instr (.reset, .clk, .en(1'b1), .in(instruction_RG_DEC[31:21]), .out(instruction_EX[31:21]));
    
    
    
    
    // Pass along necessary control signals (for EX and subsequent stages)
    register #(.WIDTH(1)) SFC_RD_EX (.reset, .clk, .en(1'b1), .in(set_flags_cntrl),     .out(set_flags_cntrl_EX));
    
    register #(.WIDTH(1)) SOC_RD_EX (.reset, .clk, .en(1'b1), .in(shift_op_cntrl),      .out(shift_op_cntrl_EX));
    
    register #(.WIDTH(1)) WDC_RD_EX (.reset, .clk, .en(1'b1), .in(write_dmem_cntrl),    .out(write_dmem_cntrl_EX));
    
    register #(.WIDTH(1)) RWC_RD_EX (.reset, .clk, .en(1'b1), .in(reg_write_cntrl),     .out(reg_write_cntrl_EX));
    
    register #(.WIDTH(1)) ARC_RD_EX (.reset, .clk, .en(1'b1), .in(alu_to_reg_cntrl),    .out(alu_to_reg_cntrl_EX));
    
    register #(.WIDTH(3)) ALC_RD_EX (.reset, .clk, .en(1'b1), .in(alu_cntrl),           .out(alu_cntrl_EX));
    
    register #(.WIDTH(1)) DRC_RD_EX (.reset, .clk, .en(1'b1), .in(dmem_read_cntrl),     .out(dmem_read_cntrl_EX));
    
    
    
    
    
    
    
    
    // <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
    // Execute
    // <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
    
    // lay down alu hardware
    logic [63:0] alu_out_EX;
    alu arithmatic_logic_unit (
        // inputs
        .A          ( alu_A_EX      ),
        .B          ( alu_B_EX      ),
        .cntrl      ( alu_cntrl_EX  ),
        // outputs
        .result     ( alu_out_EX    ),   // alu result
        // flags:
        .negative   ( alu_flg_neg   ),
        .zero       ( alu_flg_zero  ),
        .overflow   ( alu_flg_ovf   ),
        .carry_out  ( alu_flg_co    )
    );
    
    register #(.WIDTH(4)) flags (
        .reset,
        .clk,
        .en     ( set_flags_cntrl_EX                                    ),
        
        // reg in/out
        .in     ( {alu_flg_neg, alu_flg_zero, alu_flg_ovf, alu_flg_co}  ),
        .out    ( {flg_neg, flg_zero, flg_ovf, flg_co}                  )
    );
    
    logic flg_neg_sel, flg_ovf_sel;
    // determine whether to use the immediate alu flags or stored flags
    mux_ex #(.WIDTH(4)) use_imm_flgs (
        .sel(use_imm_flgs_cntrl),
        .A  ( {alu_flg_neg, alu_flg_zero, alu_flg_ovf, alu_flg_co}  ),
        .B  ( {flg_neg, flg_zero, flg_ovf, flg_co}                  ),
        .Z  ( {flg_neg_sel, floating[4], flg_ovf_sel, floating[5]}  )
    );
    
    // determine if flags indicate less than for the instruction
    xor #(0.05) (less_than, flg_neg_sel, flg_ovf_sel);
    
    
    // place shifter
    logic [63:0] shifted_data_EX;
    LSR #(.WIDTH(64)) shifter (
        .in     ( alu_A_EX          ),
        .shamt, // shift amount
        .out    ( shifted_data_EX   )
    );
    
    // select between shifted and alu output
    mux_ex #(.WIDTH(64)) shift_op (
        .sel    ( shift_op_cntrl_EX     ),
        .A      ( shifted_data_EX       ),
        .B      ( alu_out_EX            ),
        .Z      ( EX_stage_out          )
    );
    
    //logic [63:0] DM_stage_in;       // EX out --> DM in // $$$$$$$$$$$$ Moved to top level
    register #(.WIDTH(64)) OUT_IN_EX_DM (.reset, .clk, .en(1'b1), .in(EX_stage_out), .out(DM_stage_in));
    
    // logic [63:0] DataWrite_DM;      // Data to (potentially) be written to DMEM // $$$$$$$$$$$$ Moved to top level
    register #(.WIDTH(64)) PASS_DWrite (.reset, .clk, .en(1'b1), .in(DataWrite_EX), .out(DataWrite_DM));
    
    
    
    // Save Rd for this instruction (for forwarding purposes)
    register #(.WIDTH(5)) Rd_save_DM (.reset, .clk, .en(1'b1), .in(Rd_EX), .out(Rd_DM));
    
    
    // Pass along relevant control signals
    register #(.WIDTH(1)) WDC_EX_DM (.reset, .clk, .en(1'b1), .in(write_dmem_cntrl_EX), .out(write_dmem_cntrl_DM));
    
    register #(.WIDTH(1)) RWC_EX_DM (.reset, .clk, .en(1'b1), .in(reg_write_cntrl_EX),  .out(reg_write_cntrl_DM));
    
    register #(.WIDTH(1)) ARC_EX_DM (.reset, .clk, .en(1'b1), .in(alu_to_reg_cntrl_EX), .out(alu_to_reg_cntrl_DM));
    
    register #(.WIDTH(1)) DRC_RD_DDM (.reset, .clk, .en(1'b1), .in(dmem_read_cntrl_EX), .out(dmem_read_cntrl_DM));
    
    
    
    
    
    
    
    // <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
    // Data Memory
    // <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
    
    // data memory
    //logic [63:0] dout; // $$$$$$$$$$$$$$$$$$ Moved to top level
    // datamem data_memory (
    //     .address        ( {DM_stage_in[63:3], 3'd0}     ),
    //     .read_enable    ( dmem_read_cntrl_DM            ),
    //     .write_enable   ( write_dmem_cntrl_DM           ),
    //     .write_data     ( DataWrite_DM                  ),
    //     .clk,
    //     .xfer_size      ( 4'd8                          ), // only ever transfer 8 bytes in this ISA
    //     .read_data      ( dout                          )
    // );
    
    
    // select between dmem output and alu_output
    mux_ex #(.WIDTH(64)) select_final_out (
        .sel    ( alu_to_reg_cntrl_DM   ),
        .A      ( DM_stage_in           ),
        .B      ( dout                  ),
        .Z      ( alu_or_dout           )
    );
    
    
    register #(.WIDTH(5)) Rd_save_WB (.reset, .clk, .en(1'b1), .in(Rd_DM), .out(Rd_WB));
    
    register #(.WIDTH(64)) data_WB (.reset, .clk, .en(1'b1), .in(alu_or_dout),  .out(write_data_rf_WB));
    
    
    
    // Pass along relevant control signal
    register #(.WIDTH(1)) RWC_DM_WB (.reset, .clk, .en(1'b1), .in(reg_write_cntrl_DM),  .out(reg_write_cntrl_WB));
    
    // <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
    // Write Back
    // <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
    
    // this stage is just wires going back to the regfile write enable and write data ports.
    // signals in question: write_data_rf_WB, Rd_WB and reg_write_cntrl_WB
    
    
    
    
    
    // ====================================================================================
    // ============================== Start of Control Path ===============================
    // ====================================================================================
    
    
    logic [13:0] cntrls;
    assign {
        dmem_read_cntrl,        // a
        unconditional_cntrl,    // 9
        br_taken_cntrl,         // 8
        set_flags_cntrl,        // 7
        write_dmem_cntrl,       // 6
        reg_write_cntrl,        // 5
        shift_op_cntrl,         // 4
        alu_to_reg_cntrl,       // 3
        alu_cntrl,              // 2
        alu_b_cntrl,            // 1
        Rd_reg_cntrl            // 0
    } = cntrls;
    
    // alu_cntrl       Operation:
    // 000:            result = B
    // 010:            result = A + B
    // 011:            result = A - B
    // 100:            result = bitwise A & B
    // 101:            result = bitwise A | B
    // 110:            result = bitwise A XOR B
    
    always_comb begin
        casex ({instruction_RG_DEC[31:21], instruction_RG_DEC[4:0]})
                                                               //         ALU
                                                               // a98765432<<1<0
            16'b100_1000_100?_?????:                cntrls = {14'b??000101010010}; // ADDI
            16'b101_0101_1000_?????:                cntrls = {14'b??010101010000}; // ADDS
            16'b100_0101_0000_?????:                cntrls = {14'b??000101100000}; // AND
            16'b000_101?_????_?????:                cntrls = {14'b?11000????????}; // B
            16'b010_1010_0???_01011:                cntrls = {{2'b?0}, {less_than}, 11'b000????????}; // B.LT
            16'b101_1010_0???_?????:                cntrls = {{2'b?0}, {zero}, 11'b100??000001};  // CBZ
            16'b110_0101_0000_?????:                cntrls = {14'b??000101110000}; // EOR
            16'b111_1100_0010_?????:                cntrls = {14'b1?00010001010?}; // LDUR
            16'b110_1001_1010_?????:                cntrls = {14'b??000111??????}; // LSR
            16'b111_1100_0000_?????:                cntrls = {14'b??00100?010101}; // STUR
            16'b111_0101_1000_?????:                cntrls = {14'b??010101011000}; // SUBS
            default:                                cntrls = {14'b??0000????????}; // default
        endcase
    end
    
endmodule // P5SCPU