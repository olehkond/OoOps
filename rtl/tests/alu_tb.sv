
import data_types::*;

module alu_tb();
    localparam rs_tag_t TAG = ALU_1;

    // inputs
    alu_op_t             oper_i;
    word32_t             rs1_val_i;
    word32_t             rs2_val_i;
    logic                ready_i;
    logic                clk_i;

    // outputs
    cdb_t                cdb_term_o;     // common data bus term
    
    localparam CLOCK_PERIOD = 10;
    initial begin
        clk_i <= 0;
        forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i;
    end

    // ------------------------------------------------------------------------
    // DUT
    // ------------------------------------------------------------------------
    alu #(.TAG(TAG)) dut(.*);

    task add_ri(input word32_t rs1, input logic [11:0] imm);
        rs1_val_i <= rs1;
        rs2_val_i <= $signed(imm);
        oper_i    <= ADDI;
        ready_i   <= '1;
        @(posedge clk_i);
        ready_i   <= '0;
    endtask

    task slt_ri(input word32_t rs1, input logic [11:0] imm);
        rs1_val_i <= rs1;
        rs2_val_i <= $signed(imm);
        oper_i    <= SLTI;
        ready_i   <= '1;
        @(posedge clk_i);
        ready_i   <= '0;
    endtask

    task sltu_ri(input word32_t rs1, input logic [11:0] imm);
        rs1_val_i <= rs1;
        rs2_val_i <= $signed(imm);
        oper_i    <= SLTUI;
        ready_i   <= '1;
        @(posedge clk_i);
        ready_i   <= '0;
    endtask

    task and_ri(input word32_t rs1, input logic [11:0] imm);
        rs1_val_i <= rs1;
        rs2_val_i <= $signed(imm);
        oper_i    <= ANDI;
        ready_i   <= '1;
        @(posedge clk_i);
        ready_i   <= '0;
    endtask

    task or_ri(input word32_t rs1, input logic [11:0] imm);
        rs1_val_i <= rs1;
        rs2_val_i <= $signed(imm);
        oper_i    <= ORI;
        ready_i   <= '1;
        @(posedge clk_i);
        ready_i   <= '0;
    endtask

    task xor_ri(input word32_t rs1, input logic [11:0] imm);
        rs1_val_i <= rs1;
        rs2_val_i <= $signed(imm);
        oper_i    <= XORI;
        ready_i   <= '1;
        @(posedge clk_i);
        ready_i   <= '0;
    endtask

    task add_rr(input word32_t rs1, input word32_t rs2);
        rs1_val_i <= rs1;
        rs2_val_i <= rs2;
        oper_i    <= ADDR;
        ready_i   <= '1;
        @(posedge clk_i);
        ready_i   <= '0;
    endtask

    task sub_rr(input word32_t rs1, input word32_t rs2);
        rs1_val_i <= rs1;
        rs2_val_i <= rs2;
        oper_i    <= SUBR;
        ready_i   <= '1;
        @(posedge clk_i);
        ready_i   <= '0;
    endtask

    task slt_rr(input word32_t rs1, input word32_t rs2);
        rs1_val_i <= rs1;
        rs2_val_i <= rs2;
        oper_i    <= SLTR;
        ready_i   <= '1;
        @(posedge clk_i);
        ready_i   <= '0;
    endtask

    task sltu_rr(input word32_t rs1, input word32_t rs2);
        rs1_val_i <= rs1;
        rs2_val_i <= rs2;
        oper_i    <= SLTUR;
        ready_i   <= '1;
        @(posedge clk_i);
        ready_i   <= '0;
    endtask

    task and_rr(input word32_t rs1, input word32_t rs2);
        rs1_val_i <= rs1;
        rs2_val_i <= rs2;
        oper_i    <= ANDR;
        ready_i   <= '1;
        @(posedge clk_i);
        ready_i   <= '0;
    endtask

    task or_rr(input word32_t rs1, input word32_t rs2);
        rs1_val_i <= rs1;
        rs2_val_i <= rs2;
        oper_i    <= ORR;
        ready_i   <= '1;
        @(posedge clk_i);
        ready_i   <= '0;
    endtask

    task xor_rr(input word32_t rs1, input word32_t rs2);
        rs1_val_i <= rs1;
        rs2_val_i <= rs2;
        oper_i    <= XORR;
        ready_i   <= '1;
        @(posedge clk_i);
        ready_i   <= '0;
    endtask

    task wait_cyc(input int num);
        ready_i <= '0; repeat(num) @(posedge clk_i);
    endtask



    initial begin
        $vcdpluson;
        wait_cyc(3);
        
        // register $signed(imm)ediate ops
        //     rs1  rs2
        add_ri (43, -12); // 31
        slt_ri (5,   -2); // 0
        slt_ri (5,    7); // 1
        sltu_ri(5,   -1); // 1  (-1 unsigned is maxval)
        sltu_ri(5,    1); // 0
        and_ri (3,    1); // 1
        or_ri  (1,    2); // 3
        xor_ri (0,   -1); // max_val (all 1's, basically NOT on 0)

        // wait a little
        wait_cyc(6);

        // register register ops
        //     rs1  rs2  rd
        add_rr (43, -12); // 31
        sub_rr (43, -12); // 55
        slt_rr (5,   -2); // 0
        sltu_rr(5,   -2); // 1
        and_rr (1,    3); // 1
        or_rr  (2,    1); // 3
        xor_rr (0,   -1); // max_val

        // wait
        wait_cyc(3);
        $vcdplusoff;
        $finish;
    end
endmodule
