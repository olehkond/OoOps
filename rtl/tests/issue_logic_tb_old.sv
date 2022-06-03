module issue_logic_tb;
    logic clk_i;
    logic reset_i;

    // common data bus interface (input)
    cdb_t cdb_i;

    // instruction queue interface
    word32_t      instruc_q_data_i;
    logic         instruc_q_full_i;      // may need to consider for 
    logic         instruc_q_empty_i;     // monitoring stall conditions.
    logic         read_instruc_queue_o;  // deassert this to issue stall.

    // regfile interface
    regfile_idx_t read_addr1_o, read_addr2_o;
    word32_t      read_data1_i, read_data2_i;

    // register status interface
    regfile_idx_t reg_tag_rd_idx1_o, reg_tag_rd_idx2_o,
                  reg_tag_wr_idx_o;
    rs_tag_t      wr_tag_o;
    logic         wr_en_tag_o;
    rs_tag_t      tag1_i, tag2_i;


    // reservation station interface
    //////
    // priority encoding logic
    logic [NUM_RS-1:0]  busy_bus_i;

    // reservation station signals
    logic [NUM_RS-1:0] rs_write_en_o;
    word32_t           rs_value1_o, rs_value2_o;
    rs_tag_t           rs_tag1_o, rs_tag2_o;
    alu_op_t           alu_op_type_o;
    shift_op_t         shift_op_type_o;


    issue_logic issue_logic_dut (.*);
    regfile     regfile_dut     (.clk_i, .reset_i, .cdb_i, 

                                 // regfile interface
                                 .read_addr1_i(read_addr1_o),
                                 .read_addr2_i(read_addr2_o),
                                 .read_data1_o(read_data1_i),
                                 .read_data2_o(read_data2_i),
                                 
                                 // register status interface
                                 .reg_tag_read_idx1_i(reg_tag_rd_idx1_o),
                                 .reg_tag_read_idx2_i(reg_tag_rd_idx2_o),
                                 .reg_tag_write_idx_i(reg_tag_wr_idx_o ),
                                 .wr_tag_i(wr_tag_o),
                                 .wr_en_tag_i(wr_en_tag_o),
                                 .tag1_o(tag1_i),
                                 .tag2_o(tag2_i));

    task init();
        // set cdb 
        cdb_i          <= '{NO_VAL, 0};
        
        busy_bus_i     <= '0;
        instruc_q_data_i      <= 32'b00000_00000_00000_0000000_000_0110011; // ADDR x1, x0, x0 // NOOP
        instruc_q_full_i <= '0;
        instruc_q_empty_i <= '0;
        

        // asssert reset
        reset_i       <= 1'b1; @(posedge clk_i);
        reset_i       <= 1'b0;
    endtask

    task init_instruc_queue();
    endtask

    task init_cdb();
    endtask

    task set_instruc();
    endtask

    localparam CLOCK_PERIOD =2;
        
    // clock init
    initial begin
        clk_i <= 0;
        forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i;
    end

    task ADDR_task(input logic[4:0] rd, rs1, rs2);
        instruc_q_data_i <= {rd,rs1,rs2,10'b0000000_000,7'b0110011};
    endtask

    task ADDI_task(input logic[4:0] rd, rs1, input logic [11:0] imm12);
        instruc_q_data_i <= {rd,rs1,imm12,3'b000,7'b0110011};
    endtask

    task XORI_task(input logic[4:0] rd, rs1, input logic [11:0] imm12);
        instruc_q_data_i <= {rd,rs1,imm12,3'b100,7'b0010011};
    endtask

    task SLLI_task(input logic[4:0] rd, rs1, input logic [5:0] shamt);
        instruc_q_data_i <= {rd,rs1,6'b000_000,shamt,3'b001,7'b0010011};
    endtask

    task SRLI_task(input logic[4:0] rd, rs1, input logic [5:0] shamt);
        instruc_q_data_i <= {rd,rs1,6'b000_000,shamt,3'b101,7'b0010011};
    endtask

    task SRAI_task(input logic[4:0] rd, rs1, input logic [5:0] shamt);
        instruc_q_data_i <= {rd,rs1,6'b000_001,shamt,3'b101,7'b0010011};
    endtask

    task SLL_task(input logic[4:0] rd, rs1, rs2);
        instruc_q_data_i <= {rd,rs1,rs2,6'b000_000,3'b001,7'b0110011};
    endtask

    initial begin
        $vcdpluson;
        $vcdplusmemon;
        init();                  @(posedge clk_i);
         @(posedge clk_i);

        
        // x1 tag points to ALU_3
        //instruc_q_data_i      <= 32'b00001_00001_00000_0000000_000_0110011; // ADDR x1, x0, x0 
        busy_bus_i <= 'b0_1000; 
        ADDR_task(5'd1,5'd0,5'd0); @(posedge clk_i);

        // x2 tag points to ALU_2
        busy_bus_i <= 'b00_1100; 
        ADDI_task(5'd2, 5'd0, 'd1); @(posedge clk_i);
        
        //SLLI_task(5'd3, 5'd0, 'd1);
        // x3 tag points to ALU_1
        busy_bus_i <= 'b00_1110;
        XORI_task(5'd3, 5'd0, 'd1);
                                   @(posedge clk_i);
        SLLI_task(5'd3, 5'd0, 'd1);
                                   @(posedge clk_i);
        SLL_task(5'd3, 5'd0, 'd0);
                                   @(posedge clk_i);
        SRLI_task(5'd4, 5'd0, 'd0);
                                   @(posedge clk_i);
        SRAI_task(5'd5, 5'd0, 'd0);
                                   @(posedge clk_i);
                                   @(posedge clk_i);
                                   @(posedge clk_i);
        //busy_bus_i <= 'b00_1111;
        //SLLI_task(5'd4, 5'd0, 'd1);
        //                           @(posedge clk_i);
        /*
        // write to x2 from cdb
        //cdb_i.tag   <= ALU_3;
        //cdb_i.val   <= 32'hCAFE_CAFE;

        // no rs available: x3 tag points nowhere, initiate stall
        busy_bus_i <= 'b00_0000;
        instruc_q_data_i      <= 32'b00100_00001_00010_0000000_000_0110011; // ADDR x4, x1, x2
        cdb_i.val <= 32'hCAFE_CAFE;
        cdb_i.tag <= ALU_3;
                                @(posedge clk_i);
        cdb_i.tag <= NO_VAL;
                                @(posedge clk_i);
        cdb_i.tag <= ALU_4;
        cdb_i.val <= 32'hFEEF_FEEF;
                                @(posedge clk_i);
        cdb_i.tag <= NO_VAL;
        cdb_i.val <= 32'hABCD_DCBA;
                                @(posedge clk_i);
        ADDR_task(5'd10,5'd1,5'd2);
                                @(posedge clk_i);
        cdb_i.tag <= ALU_4;                                
                                @(posedge clk_i);
        //// write to x2 from the cdb
        //cdb_i.tag   <= ALU_4;
        //cdb_i.val   <= 32'hDEAD_FEEF;
        //                         @(posedge clk_i);*/



        $vcdplusoff;
        $finish;
    end

endmodule
