/*
    Branch Prediction Unit
    
    Inputs:
        logic                 clk_i:                System Clock
        logic                 reset_i:              System Reset
        
        word32_t              program_counter_i:    Current Program Counter being fetched
        logic [IMM_WIDTH-1:0] br_imm_i:             Branch immediate value (encoded in fetched instruction)
        logic                 issuing_branch_i:     Is the fetch unit issuing a branch to instr queue

        logic                 cond_eval_i:          Has a branch condition been evaluated
        logic                 corr_pred_i:          Was the prediction correct

    Outputs:
        word32_t                 program_counter_branched_o:    Assuming branch was taken, what is the new PC
        logic                    br_taken_o:                    branch prediction (1 if taken, 0 if not)


    Parameters:
        HISTORY_BITS:   Number of History Bits
        IMM_WIDTH:      Width of immediate in branch encoded instruction
    
    Description:
        Global Corrolated Branch Predictor with variable history bits
*/

`timescale 1ns/10ps

import data_types::*;

module branch_pred #(
    parameter HISTORY_BITS = 8,
    parameter IMM_WIDTH = 12
) (
    input  logic                    clk_i,
    input  logic                    reset_i,

    // fetch unit interface
    input  word32_t                 program_counter_i,
    input  logic [IMM_WIDTH-1:0]    br_imm_i,
    input  logic                    issuing_branch_i,
    output word32_t                 program_counter_branched_o,

    // branch alu interface
    input  logic                    cond_eval_i,
    input  logic                    corr_pred_i,

    // goes to fetch and branch alu
    output logic                    br_taken_o
);
    word32_t                    br_imm_se_sh;
    logic [HISTORY_BITS-1:0]    history;
    logic [2**HISTORY_BITS-1:0] branch_table;

    logic                       branch_predicted;

    // sign extend jump immediate value
    assign br_imm_se_sh = $signed(br_imm_i << 2);

    // decide whether to take branch by referencing branch history table
    // against the current pattern.
    always_comb begin
        br_taken_o = branch_table[history];
    end

    // If the branch is taken what would be the next program counter
    assign program_counter_branched_o = (program_counter_i + br_imm_se_sh);

    
    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            // reset history and branch table to zero
            branch_table <= '0;
            history <= '0;
        end else begin
            // When fetch unit writes a branch instruction to the instr queue,
            // remeber prediction given to fetch unit
            if (issuing_branch_i) begin
                branch_predicted <= br_taken_o;
            end

            // if prediction was correct, update history
            if (cond_eval_i & corr_pred_i) begin
                branch_table[history] <= branch_predicted;
                history <= {history[HISTORY_BITS-2:0], branch_predicted};
            end

            // if prediction was wrong, update history and branch table
            if (cond_eval_i & ~corr_pred_i) begin
                branch_table[history] <= ~branch_predicted;
                history <= {history[HISTORY_BITS-2:0], ~branch_predicted};
            end
        end
    end



endmodule

