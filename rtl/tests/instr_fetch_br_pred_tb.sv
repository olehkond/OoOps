
import data_types::*;

`timescale 1ns/10ps

module instr_fetch_br_pred_tb();
    localparam IQ_SIZE_POW2 = 3, // instruction queue size
               HISTORY_BITS = 3,
               IMM_WIDTH    = 12;
    
    // ------------------------------------------
    // FIFO
    // ------------------------------------------
    word32_t  write_data_i;
    logic     write_i;
    logic     read_i;
    logic     reset_i;
    logic     clk_i;
    // outputs
    logic     full_o;
    logic     empty_o;
    word32_t  read_data_o;
    // ==========================================
    
    // ------------------------------------------
    // branch_pred
    // ------------------------------------------
    //input  logic            clk_i;
    //input  logic            reset_i;

    // fetch unit interface
    word32_t                program_counter_i;
    logic [IMM_WIDTH-1:0]   jump_imm_i;
    logic                   issuing_branch_i;
    word32_t                program_counter_branched_o;

    // branch alu interface
    logic                   cond_eval_i;
    logic                   corr_pred_i;

    // goes to fetch and branch alu
    logic                   br_taken_o;
    // ==========================================
    
    // ------------------------------------------
    // instr_fetch_unit
    // ------------------------------------------
    //input  logic            clk_i;
    //input  logic            reset_i;

    // ===========================
    // branch predictor interface
    word32_t                 program_counter_branched_i;
    logic [IMM_WIDTH-1:0]    jump_imm_o;
    logic                    issuing_branch_o;
    logic                    br_taken_i;
    
    assign program_counter_branched_i = program_counter_branched_o;
    assign jump_imm_i = jump_imm_o;
    assign issuing_branch_i = issuing_branch_o;

    // ===========================
    // branch alu interface
    //logic                    cond_eval_i;
    //logic                    corr_pred_i;
    

    // ===========================
    // instruction queue interface
    logic                    iq_full_i;
    logic                    iq_write_o;
    word32_t                 iq_instr_o;
    assign iq_full_i    = full_o;
    assign write_i      = iq_write_o;
    assign write_data_i = iq_instr_o;

    // ===========================
    // instruction mem interface
    word32_t                 instr_i;
    word32_t                 program_counter_o;
    
    assign program_counter_i = program_counter_o;
    // ==========================================

    localparam CLOCK_PERIOD = 10;

    // clock init
    initial begin
        clk_i <= 0;
        forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i; 
    end

    // ========================================================================
    // device under test
    instr_fetch_unit #(.IMM_WIDTH(IMM_WIDTH)                             )  dut_fetch (.*);
    fifo             #(.ENTRIES_POW2(IQ_SIZE_POW2)                       )  dut_fifo  (.*);
    branch_pred      #(.HISTORY_BITS(HISTORY_BITS), .IMM_WIDTH(IMM_WIDTH))  dut_br_pr (.*);

    localparam word32_t NOOP = 32'b00000_00000_000000000000_000_0010011;

    task reset();
        reset_i <= '1;
        repeat(2) @(posedge clk_i);
        reset_i <= '0;
    endtask

    /*
    Inputs to play with:
        instr_i   = instruction being loaded
        cond_eval = condition has been evaluated (or not if 0)
        corr_pred = predictor has made correct prediction (or not if 0)

    Floating outputs to watch:
        program_counter_o = will change depending on branches taken/not taken
        br_taken_o = whether branch is taken based on history. Check that it makes sense,
                     because we manually overwrite it (to fetch unit) in the tb
    */

    localparam logic [6:0] JMP_OPCODE = 1100111;
    localparam logic [6:0] BR_OPCODE  = 1100011;
    localparam logic [6:0] LD_OPCODE  = 0000011;
    localparam logic [6:0] ST_OPCODE  = 0100011;

    task issue_jump(input logic [24:0] num_lines, logic cond_eval, logic corr_pred);
        instr_i <= {num_lines, JMP_OPCODE};
        cond_eval_i <= cond_eval;
        corr_pred_i <= corr_pred;
        @(posedge clk_i);
        cond_eval_i <= '0;
        corr_pred_i <= '0;
    endtask

    // note this is not a valid instruction, but for the purposes of this tb
    // it doesn't matter
    task issue_branch(input logic [11:0] imm, logic cond_eval, logic corr_pred, logic br_taken);
        instr_i[6:0] <= $unsigned(BR_OPCODE);
        instr_i[16:10] <= imm[6:0];
        instr_i[31:27] <= imm[11:7];
        // dont care about rest of instruction
        instr_i[9:7] <= '0;
        instr_i[26:17] <= '0;
        br_taken_i  <= br_taken;
        cond_eval_i <= cond_eval;
        corr_pred_i <= corr_pred;
        @(posedge clk_i);
        cond_eval_i <= '0;
        corr_pred_i <= '0;
    endtask

    
    // note this is not a valid instruction, but for the purposes of this tb
    // it doesn't matter
    task issue_ls(logic cond_eval, logic corr_pred);
        instr_i <= $unsigned(LD_OPCODE); // loads and stores should be treated identically
        cond_eval_i <= cond_eval;
        corr_pred_i <= corr_pred;
        @(posedge clk_i);
        cond_eval_i <= '0;
        corr_pred_i <= '0;
    endtask

    // note this is not a valid instruction, but for the purposes of this tb
    // it doesn't matter
    task issue_other(logic cond_eval, logic corr_pred);
        instr_i <= '0;
        cond_eval_i <= cond_eval;
        corr_pred_i <= corr_pred;
        @(posedge clk_i);
        cond_eval_i <= '0;
        corr_pred_i <= '0;
    endtask


    initial begin
        $vcdpluson;
        $vcdplusmemon;
        // -----------------------------------------------
        // test sequence goes here
        // -----------------------------------------------
        read_i <= '1;
        reset();
        issue_other('0, '0);        // pc = 0
        issue_other('0, '0);        // pc = 4
        issue_other('0, '0);        // pc = 8
        issue_branch(5, '0, '0, '0);// pc = 12 (should not take branch, but should save pc=32)
        issue_other('0, '0);        // pc = 16
        issue_other('0, '0);        // pc = 20
        issue_other('1, '0);        // pc = 24
        issue_other('0, '0);        // pc = 36 (PC should be 32 + 4)
        issue_branch(-3, '0, '0, '1);// pc = 40 (should take branch, but should save pc=40)
        issue_other('0, '0);        // pc = 28
        issue_other('0, '0);        // pc = 32

        // stalling due to additional branch instruction
        issue_branch(3, '0, '0, '1);// pc = 36
        issue_branch(3, '0, '0, '1);// pc = 36
        issue_branch(3, '1, '1, '1);// pc = 36 (should take branch, but should save pc = 36)
        issue_other('0, '0);        // pc = 48
        issue_other('1, '0);        // pc = 52
        issue_other('0, '0);        // pc = 40 (PC should be 36 + 4)


        $vcdplusoff;
        $finish;
    end

endmodule
