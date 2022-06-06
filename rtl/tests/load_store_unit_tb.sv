import data_types::*;

module load_store_unit_tb();
    localparam SIZE_POW2        = 3;
    localparam DMEM_SIZE_POW2   = 5;
    localparam LATENCY          = 2;

    logic    clk_i;
    logic    reset_i;
    
    logic    write_i;
    logic    load_i; // 1 if load, 0 if store

    rs_tag_t addr_tag_i;
    word32_t addr_i;
    word32_t offset_i;
    
    rs_tag_t data_st_tag_i;
    word32_t data_st_i;

    cdb_t    cdb_i;

    // declare data load 
    cdb_t    cdb_term_o;

    // issue logic terms
    logic    full_o;
    rs_tag_t tag_ld_o; // let issue logic know what tag will be broadcast on load

    // data memory interface
    word32_t dmem_rd_data_i;
    logic    dmem_done_i;
    
    logic    dmem_read_o;
    logic    dmem_write_o;
    word32_t dmem_addr_o;
    word32_t dmem_data_o;

    // ========================================================================
    // device under test
    load_store_unit #(.SIZE_POW2(SIZE_POW2)) dut (.*);

    localparam CLOCK_PERIOD = 10;

    // clock init
    initial begin
        clk_i <= '0;
        forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i;
    end

    
    basic_dmem_model #(.LATENCY(LATENCY),
                       .SIZE_POW2(DMEM_SIZE_POW2)
                    ) data_memory (
        .clk_i          ( clk_i             ), // logic
        .reset_i        ( reset_i           ), // logic
    
        .dmem_read_i    ( dmem_read_o       ), // logic
        .dmem_write_i   ( dmem_write_o      ), // logic
        .dmem_addr_i    ( dmem_addr_o       ), // word32_t
        .dmem_data_i    ( dmem_data_o       ), // word32_t

        .dmem_rd_data_o ( dmem_rd_data_i    ), // word32_t
        .dmem_done_o    ( dmem_done_i       )  // logic
    );

    
    task reset();
        reset_i <= '1; repeat(3) @(posedge clk_i);
        reset_i <= '0;
    endtask

    task issue_load(input rs_tag_t addr_tag,
                          word32_t addr,
                          word32_t offset
                   );
        write_i         <= '1;
        load_i          <= '1; // 1 if load, 0 if store

        addr_tag_i      <= addr_tag;
        addr_i          <= addr;
        offset_i        <= offset;
    
        data_st_tag_i   <= NO_VAL;
        data_st_i       <= 'x;
        // ------------------------
        repeat(1) @(posedge clk_i);
        write_i         <= '0;
        load_i          <= 'x;

        addr_tag_i      <= NO_VAL;
        addr_i          <= 'x;
        offset_i        <= 'x;
    
        data_st_tag_i   <= NO_VAL;
        data_st_i       <= 'x;
    endtask

    task issue_store(input  rs_tag_t addr_tag,
                            word32_t addr,
                            word32_t offset,
                            rs_tag_t data_st_tag,
                            word32_t data_st
                   );
        write_i         <= '1;
        load_i          <= '0; // 1 if load, 0 if store

        addr_tag_i      <= addr_tag;
        addr_i          <= addr;
        offset_i        <= offset;
    
        data_st_tag_i   <= data_st_tag;
        data_st_i       <= data_st;
        // ------------------------
        repeat(1) @(posedge clk_i);
        write_i         <= '0;
        load_i          <= 'x;

        addr_tag_i      <= NO_VAL;
        addr_i          <= 'x;
        offset_i        <= 'x;
    
        data_st_tag_i   <= NO_VAL;
        data_st_i       <= 'x;
    endtask


    task def_cdb(input rs_tag_t tag,
                       word32_t val
                );
        cdb_i.tag <= tag;
        cdb_i.val <= val;
    endtask
    

    initial begin
        $vcdpluson;
        $vcdplusmemon;
        
        def_cdb(NO_VAL, 'x);
        reset();
        
        issue_load(NO_VAL, '0, '0);
        repeat(10) @(posedge clk_i);
        
        issue_store(NO_VAL, '0, 4, LS_4, 5);
        issue_load(NO_VAL, '0, 4);
        repeat(10) @(posedge clk_i);
        def_cdb(LS_4, '1);
        repeat(1) @(posedge clk_i);
        def_cdb(NO_VAL, 'x);
        repeat(10) @(posedge clk_i);


        $vcdplusoff;
        $finish;
    end

endmodule
