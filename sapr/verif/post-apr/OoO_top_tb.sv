
//`define PRGM_FILE "prgms/alu_instr_OOO_test_1.mem"
//`define PRGM_FILE "test_program.mem"
//`define PRGM_FILE "prgms/alu_instr_only_with_noops.mem"
//`define PRGM_FILE "prgms/alu_instr_OOO_test_3.mem"
//`define PRGM_FILE "prgms/one_of_every_instr.mem
`define PRGM_FILE "prgms/for_loop.mem"

import data_types::*;

`timescale 1ns/10ps

module OoO_top_tb();
    localparam DMEM_SIZE_POW2 = 12,
               DMEM_LATENCY   = 4;
    // ==========================================
    logic     reset_i;
    logic     clk_i;

    // ==========================================
    // Instr mem interface
    word32_t  instr_fetch_i;
    word32_t  program_counter_o;

    // ==========================================
    // interface with data memory model
    word32_t  dmem_rd_data_i;
    logic     dmem_done_i;

    logic     dmem_read_o;
    logic     dmem_write_o;
    word32_t  dmem_addr_o;
    word32_t  dmem_data_o;
    
    localparam CLOCK_PERIOD = 9;

    // clock init
    initial begin
        clk_i <= 0;
        forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i; 
    end

    // ========================================================================
    // device under test
    OoO_top dut (.*);
    
    // ========================================================================
    // data memory model
    basic_dmem_model #(.LATENCY(DMEM_LATENCY), .SIZE_POW2(DMEM_SIZE_POW2)) dmem_unit (
        .clk_i          ( clk_i             ),
        .reset_i        ( reset_i           ),

        .dmem_read_i    ( dmem_read_o       ), // logic 
        .dmem_write_i   ( dmem_write_o      ), // logic
        .dmem_addr_i    ( dmem_addr_o       ), // word32_t
        .dmem_data_i    ( dmem_data_o       ), // word32_t

        .dmem_rd_data_o ( dmem_rd_data_i    ), // word32_t
        .dmem_done_o    ( dmem_done_i       )  // logic
    );


    localparam INSTRUC_MEM_SIZE = 2**10;

    logic [7:0] instr_mem [INSTRUC_MEM_SIZE];

    assign instr_fetch_i = {instr_mem[program_counter_o + 'd3],
                            instr_mem[program_counter_o + 'd2],
                            instr_mem[program_counter_o + 'd1],
                            instr_mem[program_counter_o]     };

    localparam word32_t NOOP = 32'b00000_00000_000000000000_000_0010011;

    initial begin
        $vcdpluson;
        $vcdplusmemon;
        $sdf_annotate("./OoO_top.apr.sdf",dut);

        for (int i = 0; i < INSTRUC_MEM_SIZE; i += 4) begin
            instr_mem[i+'d0] <= NOOP[7:0];
            instr_mem[i+'d1] <= NOOP[15:8];
            instr_mem[i+'d2] <= NOOP[23:16];
            instr_mem[i+'d3] <= NOOP[31:24];
        end
        #1;
        $readmemb(`PRGM_FILE, instr_mem);

        reset_i <= '1; @(posedge clk_i);
        repeat(2) @(posedge clk_i);
        reset_i <= '0;

        repeat(2000) @(posedge clk_i);

        $vcdplusoff;
        $finish;
    end

endmodule
