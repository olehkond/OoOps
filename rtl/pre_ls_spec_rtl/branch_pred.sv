
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
    assign br_taken_o = branch_table[history];

    // if branch taken jump PC by value in immediate, else go to next instruction
    assign program_counter_branched_o = (program_counter_i + br_imm_se_sh);

    
    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            // initialize with simple rule that if history contains more 1's than 0's
            // then take that branch
            for (int i = 0; i < 2**HISTORY_BITS; ++i) begin
                branch_table[i] <= majority1(i, HISTORY_BITS);
            end

            // reset history to alternating 1's and 0's
            for (int i = 0; i < HISTORY_BITS; ++i) begin
                history[i] <= i[0];
            end
        end else begin
            if (issuing_branch_i) begin
                branch_predicted <= br_taken_o;
            end

            // if prediction was correct
            if (cond_eval_i & corr_pred_i) begin
                branch_table[history] <= branch_predicted;
                history <= {history[HISTORY_BITS-2:0], branch_predicted};
            end

            // if prediction was wrong
            if (cond_eval_i & ~corr_pred_i) begin
                branch_table[history] <= ~branch_predicted;
                history <= {history[HISTORY_BITS-2:0], ~branch_predicted};
            end
        end
    end



endmodule

function automatic logic majority1(input word32_t val, input int width);
    int num1s;

    for (int i = 0; i < width; ++i) begin
        if (val[i] == '1) ++num1s;
    end
    return (num1s > (width/2)) ? '1 : '0;
endfunction