
`timescale 1ns / 10ps
import data_types::*;

module shifter_tb();
    localparam rs_tag_t TAG = SHIFT_1;
    
    // inputs
    shift_op_t    oper_i;
    word32_t      rs1_val_i;
    word32_t      rs2_val_i;
    logic         ready_i;
    logic         clk_i;
    
    // outputs
    cdb_t        cdb_term_o;
    
    // ===========================
    // device under test
    shifter #(.TAG(TAG)) dut(.*);

    localparam CLOCK_PERIOD = 10;

    // clock init
    initial begin
        clk_i <= 0;
        forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i;
    end
    
    task wait_cycles(input int num);
        repeat(num) @(posedge clk_i);
    endtask
    
    task issue_shift(input shift_op_t op,
                           word32_t rs1,
                           word32_t rs2);
        oper_i    <= op;
        rs1_val_i <= rs1;
        rs2_val_i <= rs2;
        ready_i   <= '1;
        @(posedge clk_i);
        oper_i    <= op;
        rs1_val_i <= 'x;
        rs2_val_i <= 'x;
        ready_i   <= '0;
    endtask
    
    localparam word32_t TEST_VAL = {8'h80, 8'h40, 8'h02, 8'h01};
    
    initial begin
        wait_cycles(3);
        for (int i = 0; i < 32; ++i) begin
            issue_shift(SRL, TEST_VAL, i);
            #1; assert(cdb_term_o.val == TEST_VAL >> i);
        end
        wait_cycles(3);
        for (int i = 0; i < 32; ++i) begin
            issue_shift(SRLI, TEST_VAL, i);
            #1; assert(cdb_term_o.val == TEST_VAL >> i);
        end
        wait_cycles(3);
        for (int i = 0; i < 32; ++i) begin
            issue_shift(SRA, TEST_VAL, i);
            #1; assert(cdb_term_o.val == TEST_VAL >>> i);
        end
        wait_cycles(3);
        for (int i = 0; i < 32; ++i) begin
            issue_shift(SRAI, TEST_VAL, i);
            #1; assert(cdb_term_o.val == TEST_VAL >>> i);
        end
        // ================================================
        wait_cycles(6);
        for (int i = 0; i < 32; ++i) begin
            issue_shift(SLL, TEST_VAL, i);
            #1; assert(cdb_term_o.val == TEST_VAL << i);
        end
        wait_cycles(3);
        for (int i = 0; i < 32; ++i) begin
            issue_shift(SLLI, TEST_VAL, i);
            #1; assert(cdb_term_o.val == TEST_VAL << i);
        end
        
        // ------------------------------------------------
        /*
        wait_cycles(3);
        for (int i = 0; i < 32; ++i) begin
            issue_shift(SLA, {4'h8, 4'h4, 4'h2, 4'h1}, i);
        end
        wait_cycles(3);
        for (int i = 0; i < 32; ++i) begin
            issue_shift(SLAI, {4'h8, 4'h4, 4'h2, 4'h1}, i);
        end
        
        wait_cycles(3);
        for (int i = 0; i < 32; ++i) begin
            issue_shift(SRR, {4'h8, 4'h4, 4'h2, 4'h1}, i);
        end
        wait_cycles(3);
        for (int i = 0; i < 32; ++i) begin
            issue_shift(SRRI, {4'h8, 4'h4, 4'h2, 4'h1}, i);
        end
        wait_cycles(3);
        for (int i = 0; i < 32; ++i) begin
            issue_shift(SRL, {4'h8, 4'h4, 4'h2, 4'h1}, i);
        end
        wait_cycles(3);
        for (int i = 0; i < 32; ++i) begin
            issue_shift(SRLI, {4'h8, 4'h4, 4'h2, 4'h1}, i);
        end
        */
        $finish;
    end
    
endmodule