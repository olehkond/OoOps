/*
    Instruction Fetch Unit
    
    Inputs:
        logic     clk_i;        system clock
        logic     reset_i:      system reset

        logic     cond_eval_i:  branch conidtion eval flag
        logic     corr_pred_i:  was branch prediction correct
        logic     iq_full_i:    is instruction queue full
        word32_t  instr_i:      instructon fetched

    Outputs:
        logic [IMM_WIDTH-1:0] br_imm_o:             Branch immediate value
        logic                 issuing_branch_o:     flag that branch is being written to instr queue
        word32_t              program_counter_o:    current program counter value
*/

`timescale 1ns/10ps

import data_types::*;

module instr_fetch_unit #(
    parameter IMM_WIDTH = 12
) (
    // ===========================
    // general signals
    input  logic                    clk_i,
    input  logic                    reset_i,

    
    // ===========================
    // branch predictor interface
    input  word32_t                 program_counter_branched_i,
    input  logic                    br_taken_i,
    output logic [IMM_WIDTH-1:0]    br_imm_o,
    output logic                    issuing_branch_o,

    
    // ===========================
    // branch alu interface
    input  logic                    cond_eval_i,
    input  logic                    corr_pred_i,

    
    // ===========================
    // instruction queue interface
    input  logic                    iq_full_i,
    output logic                    iq_write_o,
    output word32_t                 fetched_instr_o,

    // ===========================
    // instruction mem interface
    input  word32_t                 instr_i,
    output word32_t                 program_counter_o
);
    word32_t    program_counter_NT; // program counter of branch NOT taken
    word32_t    program_counter_next;

    // Branching immediate is always in this encoding for our ISA
    assign br_imm_o = {instr_i[31:27], instr_i[16:10]};

    assign fetched_instr_o = instr_i;

    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // FSM state behavior
    enum {NORMAL, SPECULATE} state, next_state;

    // State transition behavior
    always_comb begin
        next_state = NORMAL;

        case(state)
            NORMAL:     if (issuing_branch_o)                   next_state = SPECULATE;
                        else                                    next_state = NORMAL;
            SPECULATE:  if (cond_eval_i & ~issuing_branch_o)    next_state = NORMAL;
                        else if (cond_eval_i& issuing_branch_o) next_state = SPECULATE;
                        else                                    next_state = SPECULATE;
        endcase
    end

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            state <= NORMAL;
        end else begin
            state <= next_state;
        end
    end

    // jump instruction immediate
    logic [24:0]    jmp_imm;
    word32_t        jmp_imm_se_sh; // sign-extended and left shifted 2 bits (*4)
    assign jmp_imm      = instr_i[31:7];
    assign jmp_imm_se_sh   = $signed(jmp_imm << 2);

    // basic decoding for type of logic
    logic [6:0] instr_op;
    logic jump_instr;
    logic branch_instr;
    localparam logic [6:0] JMP_OPCODE = 7'b1100111;
    localparam logic [6:0] BR_OPCODE  = 7'b1100011;

    assign instr_op = instr_i[6:0];
    assign jump_instr   = (instr_op == JMP_OPCODE);
    assign branch_instr = (instr_op == BR_OPCODE);
    




    always_comb begin
        issuing_branch_o        = '0;
        iq_write_o              = '0;
        program_counter_next    = 'x;

        case(state)
            NORMAL:     begin
                            if (branch_instr & ~iq_full_i) begin
                                issuing_branch_o    = '1;
                                iq_write_o          = '1;
                                program_counter_next= (br_taken_i) ? program_counter_branched_i :
                                                                     program_counter_o + 'd4;
                            end else if (~iq_full_i) begin
                                // jump instruction does not get issued
                                if (jump_instr) begin
                                    program_counter_next= program_counter_o + jmp_imm_se_sh;
                                end else begin
                                    program_counter_next= program_counter_o + 'd4;
                                    iq_write_o          = '1;
                                end
                            end else if (iq_full_i) begin
                                program_counter_next= program_counter_o;
                            end
                        end
            SPECULATE:  begin
                            // CORRECT prediction
                            if (cond_eval_i & corr_pred_i) begin
                                // act as if in normal state
                                if ((branch_instr) & ~iq_full_i) begin
                                    issuing_branch_o    = '1;
                                    iq_write_o          = '1;
                                    program_counter_next= (br_taken_i) ? program_counter_branched_i :
                                                                                program_counter_o + 'd4;
                                end else if (~iq_full_i) begin
                                    // jump instruction does not get issued
                                    if (jump_instr) begin
                                        program_counter_next= program_counter_o + jmp_imm_se_sh;
                                    end else begin
                                        program_counter_next= program_counter_o + 'd4;
                                        iq_write_o          = '1;
                                    end
                                end else if (iq_full_i) begin
                                    program_counter_next= program_counter_o;
                                end
                            // WRONG/mis prediction
                            end else if (cond_eval_i & ~corr_pred_i) begin
                                program_counter_next = program_counter_NT + 'd4;
                                // do not write instruction to fifo
                            end  else if (branch_instr) begin
                                // stall on branches if speculating
                                program_counter_next = program_counter_o;
                            end else if (~iq_full_i) begin
                                // jump instruction does not get issued
                                if (jump_instr) begin
                                    program_counter_next= program_counter_o + jmp_imm_se_sh;
                                end else begin
                                    program_counter_next= program_counter_o + 'd4;
                                    iq_write_o          = '1;
                                end
                            end else if (iq_full_i) begin
                                program_counter_next= program_counter_o;
                            end
                        end
        endcase
    end

    always_ff @(posedge clk_i) begin
        // reset counter to zero
        if (reset_i) begin
            program_counter_o <= '0;
        end else begin
            program_counter_o <= program_counter_next;
        end

        // store whatever path was NOT taken by predictor on branch instruction issue
        // to recover in the event of a misprediction
        if (issuing_branch_o) begin
            program_counter_NT <= (br_taken_i) ? program_counter_o : (program_counter_branched_i - 'd4);
        end
    end


endmodule
