
import data_types::*;

module dmem_read_write_unit_tb();
    logic     clk_i;
    logic     reset_i;

    // load store unit interface
    logic     lsu_empty_i;
    word32_t  lsu_eff_addr_i;
    word32_t  lsu_st_data_i;
    rs_tag_t  lsu_ld_tag_i;
    logic     lsu_load_i; // 1 if load, 0 if store
    logic     lsu_instr_ready_i;

    logic     lsu_read_o;
    cdb_t     cdb_load_o;

    // dmem interface
    word32_t  dmem_rd_data_i;
    logic     dmem_done_i;
    
    logic     dmem_read_o;
    logic     dmem_write_o;
    word32_t  dmem_addr_o;
    word32_t  dmem_data_o;

    // ------------------------------------
    // device under test
    dmem_read_write_unit dut (.*);

    localparam CLOCK_PERIOD = 10;

    // clock init
    initial begin
        clk_i <= '0;
        forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i;
    end

    task reset();
        lsu_empty_i <= '1;
        reset_i     <= '1;
        dmem_done_i <= '0;
        repeat(2) @(posedge clk_i);
        reset_i     <= '0;
    endtask


    task dispatch_store(input word32_t eff_addr, word32_t data);
        lsu_empty_i         <= '0;
        lsu_eff_addr_i      <= 'x;
        lsu_st_data_i       <= 'x;
        lsu_ld_tag_i        <= NO_VAL;
        lsu_load_i          <= '0; // 1 if load, 0 if store
        lsu_instr_ready_i   <= '1;

        // dmem interface
        dmem_rd_data_i      <= 'x;
        dmem_done_i         <= '0;

        @(posedge clk_i);
        
        lsu_empty_i         <= '1;
        lsu_eff_addr_i      <= eff_addr;
        lsu_st_data_i       <= data;
        lsu_ld_tag_i        <= NO_VAL;
        lsu_load_i          <= '0; // 1 if load, 0 if store
        lsu_instr_ready_i   <= '0;

        // dmem interface
        dmem_rd_data_i      <= 'x;
        dmem_done_i         <= '0;
        repeat(5) @(posedge clk_i);
        dmem_done_i         <= '1;
        @(posedge clk_i);
        dmem_done_i         <= '0;
    endtask

    task dispatch_load(input word32_t eff_addr, rs_tag_t ld_tag);
        lsu_empty_i         <= '0;
        lsu_eff_addr_i      <= 'x;
        lsu_st_data_i       <= 'x;
        lsu_ld_tag_i        <= NO_VAL;
        lsu_load_i          <= '1; // 1 if load, 0 if store
        lsu_instr_ready_i   <= '1;

        // dmem interface
        dmem_rd_data_i      <= 'x;
        dmem_done_i         <= '0;

        @(posedge clk_i);
        
        lsu_empty_i         <= '1;
        lsu_eff_addr_i      <= eff_addr;
        lsu_st_data_i       <= 'x;
        lsu_ld_tag_i        <= ld_tag;
        lsu_load_i          <= '1; // 1 if load, 0 if store
        lsu_instr_ready_i   <= '0;

        // dmem interface
        dmem_rd_data_i      <= 'x;
        dmem_done_i         <= '0;
        repeat(5) @(posedge clk_i);
        dmem_done_i         <= '1;
        dmem_rd_data_i      <= 'd500;
        @(posedge clk_i);
        dmem_done_i         <= '0;
    endtask




    initial begin
        $vcdpluson;
        $vcdplusmemon;

        reset();
        repeat(5) @(posedge clk_i);

        dispatch_store('d2, '0);
        repeat(5) @(posedge clk_i);

        dispatch_load('d2, LS_1);
        repeat(5) @(posedge clk_i);

        $vcdplusoff;
        $finish;
    end
endmodule
