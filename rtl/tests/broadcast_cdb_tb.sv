
`timescale 1ns/10ps

import data_types::*;

module broadcast_cdb_tb();
    parameter NUM_RS_STATIONS = 6;

    cdb_t [NUM_RS_STATIONS-1:0]  fu_res_i;
    logic               clk_i;
    logic               RST_i;
    cdb_t               broadcast_o;

    localparam CLOCK_PERIOD = 10;
    initial begin
        clk_i <= '0;
        forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i;
    end

    // ------------------------------------------
    // device under state
    broadcast_cdb #(.NUM_RS_STATIONS(NUM_RS_STATIONS)) dut (.*);

    task reset();
        RST_i <= '1;
        for (int i = 0; i < NUM_RS_STATIONS; ++i) begin
            fu_res_i[i].tag <= NO_VAL;
            fu_res_i[i].val <= 'x;
        end
        @(posedge clk_i);
        @(posedge clk_i);
        RST_i <= '0;
    endtask

    task wait_cyc(int num_cyc);
        repeat(num_cyc) @(posedge clk_i);
    endtask

    // define an index in fu_res_i (a result a functional unit has calulated)
    task define_fu_res(rs_tag_t tag, regfile_idx_t idx,
                       word32_t val, int fu_idx);
        fu_res_i[fu_idx].tag <= tag;
        fu_res_i[fu_idx].val <= tag;
    endtask

    task load_fu_res();
        @(posedge clk_i);
        for (int i = 0; i < NUM_RS_STATIONS; ++i) begin
            fu_res_i[i].tag <= NO_VAL;
            fu_res_i[i].val <= 'x;
        end
    endtask


    initial begin
        $vcdpluson;
        $vcdplusmemon;
        
        reset();
        wait_cyc(3);
        // ------------------------------
        define_fu_res(ALU_3, 3, 55, 2);
        load_fu_res();
        
        // ------------------------------
        define_fu_res(SHIFT_1,  2,  99, 4);
        define_fu_res(ALU_1,   12,  -4, 0);
        define_fu_res(ALU_2,   23, -77, 1);
        load_fu_res();
        
        // ------------------------------
        define_fu_res(ALU_3,   32,  69, 2);
        load_fu_res();

        wait_cyc(6);

        $vcdplusoff;
        $finish;
    end
endmodule
