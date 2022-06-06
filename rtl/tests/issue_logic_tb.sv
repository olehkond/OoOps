
`define PRGM_FILE "prgms/alu_instr_OOO_test_3.mem"

import data_types::*;
`timescale 1ns/10ps

module issue_logic_tb;
    localparam word32_t NOOP = 32'b00000_00000_000000000000_000_0010011;

    // general control inputs
    // ========================================================================
    logic                 clk_i;
    logic                 reset_i;

    // common data bus interface (input)
    // ========================================================================
    cdb_t                 cdb_i;

    // instruction queue interface
    // ========================================================================
    word32_t             iq_data_i;
    logic                iq_empty_i;
    logic                iq_read_o;

    // regfile interface
    // ========================================================================
    regfile_idx_t        reg_rd_addr1_o,
                         reg_rd_addr2_o;

    word32_t             reg_rd_data1_i,
                         reg_rd_data2_i;

    // register status interface
    // ========================================================================
    regfile_idx_t        reg_tag_addr1_o,
                         reg_tag_addr2_o,
                         reg_tag_wr_addr_o;
                                
    rs_tag_t             reg_wr_tag_o;
    logic                reg_tag_wr_en_o;

    rs_tag_t             reg_tag1_rd_i,
                         reg_tag2_rd_i;

    // reservation station interface
    // ========================================================================
    
    // priority encoding logic
    logic [NUM_RS-1:0]    busy_bus_i;

    // reservation station signals
    logic [NUM_RS-1:0]   rs_write_en_o;
    word32_t             rs_value1_o,
                         rs_value2_o;

    rs_tag_t             rs_tag1_o,
                         rs_tag2_o;

    alu_op_t             alu_op_type_o;
    shift_op_t           shift_op_type_o;


    // load-store interface
    logic               write_o;
    logic               load_o;
    rs_tag_t            addr_tag_o;
    word32_t            addr_o;
    word32_t            offset_o;

    rs_tag_t            data_st_tag_o;
    word32_t            data_st_o;
    rs_tag_t            tag_ld_i;

    // ===================================================
    // Device under test
    issue_logic dut(.*);

    // ===================================================
    // regfile
    regfile     regfile_dut     (
        .clk_i                  ( clk_i             ),
        .reset_i                ( reset_i           ),
        .cdb_i                  ( cdb_i             ),

        // regfile interface
        .read_addr1_i           ( reg_rd_addr1_o    ),
        .read_addr2_i           ( reg_rd_addr2_o    ),
        .read_data1_o           ( reg_rd_data1_i    ),
        .read_data2_o           ( reg_rd_data2_i    ),
                                 
        // register status interface
        .reg_tag_read_idx1_i    ( reg_tag_addr1_o   ),
        .reg_tag_read_idx2_i    ( reg_tag_addr2_o   ),
        .reg_tag_write_idx_i    ( reg_tag_wr_addr_o ),
        .wr_tag_i               ( reg_wr_tag_o      ),
        .wr_en_tag_i            ( reg_tag_wr_en_o   ),
        .tag1_o                 ( reg_tag1_rd_i     ),
        .tag2_o                 ( reg_tag2_rd_i     )
    );

    logic iq_full, iq_write;
    word32_t instr_fetch_i;

    fifo #(.ENTRIES_POW2(3)) instr_queue (
        // inputs
        .write_data_i ( instr_fetch_i   ), // word32_t
        .write_i      ( iq_write        ), // logic
        .read_i       ( iq_read_o       ), // logic
        .reset_i      ( reset_i         ), // logic
        .clk_i        ( clk_i           ), // logic
    
        // outputs
        .full_o       ( iq_full         ), // logic
        .empty_o      ( iq_empty_i      ), // logic
        .read_data_o  ( iq_data_i       )  // word32_t
    );

    localparam CLOCK_PERIOD = 10;
        
    // clock init
    initial begin
        clk_i <= 0;
        forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i;
    end

    task reset();
        // set cdb 
        set_cdb(NO_VAL, 'x);

        // set load-store tag
        set_lsu_tag(LS_1);
        set_instr_iq(NOOP, '0);

        // reset
        reset_i       <= 1'b1; repeat(3) @(posedge clk_i);
        reset_i       <= 1'b0;
    endtask

    task set_cdb(input rs_tag_t tag, word32_t val);
        cdb_i.tag <= tag;
        cdb_i.val <= val;
    endtask


    task set_instr_iq(input word32_t instr, logic write);
        instr_fetch_i <= instr;
        iq_write      <= write;
    endtask

    task set_lsu_tag(input rs_tag_t ls_tag);
        tag_ld_i <= ls_tag;
    endtask



    task tick_state (input rs_tag_t cdb_tag, word32_t cdb_val,
                           word32_t instr, logic write,
                           rs_tag_t ls_tag);
        set_cdb(cdb_tag, cdb_val);
        set_instr_iq(instr, write);
        set_lsu_tag(ls_tag);
        @(posedge clk_i);

        set_cdb(NO_VAL, 'x);
        set_instr_iq(instr, '0);
    endtask



    localparam INSTRUC_MEM_SIZE = 2**10;

    logic [7:0] instr_mem [INSTRUC_MEM_SIZE];
    logic [31:0] full_instr_mem [INSTRUC_MEM_SIZE/4];


    always_comb begin
        for (int i = 0; i < INSTRUC_MEM_SIZE; i += 4) begin
            full_instr_mem[i/4] = {instr_mem[i+3],
                                   instr_mem[i+2],
                                   instr_mem[i+1],
                                   instr_mem[i  ]
                                  };
        end
    end

    logic [NUM_RS-1:0] new_bus;
    assign new_bus = busy_bus_i | rs_write_en_o;

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            busy_bus_i <= '0;
        end if (new_bus != busy_bus_i) begin
            busy_bus_i <= new_bus;
        end
    end

    initial begin
        $vcdpluson;
        $vcdplusmemon;

        
        for (int i = 0; i < INSTRUC_MEM_SIZE; i += 4) begin
            instr_mem[i+'d0] <= NOOP[7:0];
            instr_mem[i+'d1] <= NOOP[15:8];
            instr_mem[i+'d2] <= NOOP[23:16];
            instr_mem[i+'d3] <= NOOP[31:24];
        end
        #1;
        
        $readmemb(`PRGM_FILE, instr_mem);

        reset();
        @(posedge clk_i);
        tick_state(
            NO_VAL,             // rs_tag_t cdb_tag,
            'x,                 // word32_t cdb_val,
            full_instr_mem[0],  // word32_t instr,
            '1,                 // logic write,
            LS_1                // rs_tag_t ls_tag
        );
        tick_state(
            NO_VAL,             // rs_tag_t cdb_tag,
            'x,                 // word32_t cdb_val,
            full_instr_mem[1],  // word32_t instr,
            '1,                 // logic write,
            LS_1                // rs_tag_t ls_tag
        );
        repeat(4) @(posedge clk_i);
        set_cdb(ALU_3, -5);
        
        
        @(posedge clk_i);
        
        //release dut.busy_bus_i;
        tick_state(
            NO_VAL,             // rs_tag_t cdb_tag,
            'x,                 // word32_t cdb_val,
            full_instr_mem[2],  // word32_t instr,
            '1,                 // logic write,
            LS_1                // rs_tag_t ls_tag
        );
        
        tick_state(
            NO_VAL,             // rs_tag_t cdb_tag,
            'x,                 // word32_t cdb_val,
            full_instr_mem[11], // word32_t instr,
            '1,                 // logic write,
            LS_1                // rs_tag_t ls_tag
        );
        tick_state(
            NO_VAL,             // rs_tag_t cdb_tag,
            'x,                 // word32_t cdb_val,
            full_instr_mem[3],  // word32_t instr,
            '1,                 // logic write,
            LS_1                // rs_tag_t ls_tag
        );
        tick_state(
            NO_VAL,             // rs_tag_t cdb_tag,
            'x,                 // word32_t cdb_val,
            full_instr_mem[4],  // word32_t instr,
            '1,                 // logic write,
            LS_1                // rs_tag_t ls_tag
        );
        tick_state(
            NO_VAL,             // rs_tag_t cdb_tag,
            'x,                 // word32_t cdb_val,
            full_instr_mem[5],  // word32_t instr,
            '1,                 // logic write,
            LS_1                // rs_tag_t ls_tag
        );
        tick_state(
            NO_VAL,             // rs_tag_t cdb_tag,
            'x,                 // word32_t cdb_val,
            full_instr_mem[6],  // word32_t instr,
            '1,                 // logic write,
            LS_1                // rs_tag_t ls_tag
        );
        tick_state(
            NO_VAL,             // rs_tag_t cdb_tag,
            'x,                 // word32_t cdb_val,
            full_instr_mem[7],  // word32_t instr,
            '1,                 // logic write,
            LS_1                // rs_tag_t ls_tag
        );
        /*
        tick_state(
            NO_VAL,             // rs_tag_t cdb_tag,
            'x,                 // word32_t cdb_val,
            full_instr_mem[8],  // word32_t instr,
            '1,                 // logic write,
            LS_1                // rs_tag_t ls_tag
        );
        tick_state(
            NO_VAL,             // rs_tag_t cdb_tag,
            'x,                 // word32_t cdb_val,
            full_instr_mem[9],  // word32_t instr,
            '1,                 // logic write,
            LS_1                // rs_tag_t ls_tag
        );
        */
        
        repeat(4) @(posedge clk_i);
        force dut.busy_bus_i = '0;
        repeat(10) @(posedge clk_i);

        
        

        $vcdplusoff;
        $finish;
    end

endmodule
