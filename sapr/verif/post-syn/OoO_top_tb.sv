
//`define PRGM_FILE "prgms/addi_instr_only.mem"
//`define PRGM_FILE "prgms/alu_instr_OOO_test_1.mem"
//`define PRGM_FILE "test_program.mem"
//`define PRGM_FILE "prgms/alu_instr_only_with_noops.mem"
//`define PRGM_FILE "prgms/alu_instr_OOO_test_3.mem"
//`define PRGM_FILE "prgms/one_of_every_instr.mem"
//`define PRGM_FILE "prgms/reg_reg_instr.mem"
//`define PRGM_FILE "prgms/interweave_instr_types.mem"
//`define PRGM_FILE "prgms/basic_branch_test.mem"
//`define PRGM_FILE "prgms/for_loop.mem"
`define PRGM_FILE "prgms/bubble_sort.mem"
//`define PRGM_FILE "prgms/basic_for_loop.mem"
//`define PRGM_FILE "prgms/fibonacci.mem"


`define MEM_INIT_FILE "mem/init/random.mem"
`define MEM_START_FILE "mem/sim_res/mem_start_state.mem"
`define MEM_END_FILE "mem/sim_res/mem_end_state.mem"
`define REG_END_FILE "mem/sim_res/reg_end_state.mem"


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
    
    localparam CLOCK_PERIOD = 10;

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
    basic_dmem_model #(.LATENCY(DMEM_LATENCY),
                       .SIZE_POW2(DMEM_SIZE_POW2),
                       .MEM_INIT_FILE(`MEM_INIT_FILE)) dmem_unit (
        .clk_i          ( clk_i             ),
        .reset_i        ( reset_i           ),

        .dmem_read_i    ( dmem_read_o       ), // logic 
        .dmem_write_i   ( dmem_write_o      ), // logic
        .dmem_addr_i    ( dmem_addr_o       ), // word32_t
        .dmem_data_i    ( dmem_data_o       ), // word32_t

        .dmem_rd_data_o ( dmem_rd_data_i    ), // word32_t
        .dmem_done_o    ( dmem_done_i       )  // logic
    );


    localparam INSTRUC_MEM_SIZE = 2**12;

    logic [7:0] instr_mem [INSTRUC_MEM_SIZE];

    assign instr_fetch_i = {instr_mem[program_counter_o + 'd3],
                            instr_mem[program_counter_o + 'd2],
                            instr_mem[program_counter_o + 'd1],
                            instr_mem[program_counter_o]     };

    localparam word32_t NOOP = 32'b00000_00000_000000000000_000_0010011;

    integer mem_start_file;
    integer mem_end_file;
    integer reg_end_file;
    integer concat;

    initial begin
        $vcdpluson;
        $vcdplusmemon;
        $sdf_annotate("./OoO_top.syn.sdf",dut);

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

        // write memory content at start to file
        mem_start_file = $fopen(`MEM_START_FILE, "w");
        for (int i = 0; i < 2**DMEM_SIZE_POW2; i = i + 4) begin
            concat = {  dmem_unit.memory[i+3],
                        dmem_unit.memory[i+2],
                        dmem_unit.memory[i+1],
                        dmem_unit.memory[i  ]};
            $fdisplay(mem_start_file, "%d", concat);
        end
        $fclose(mem_start_file);

        
        // ====================================================================
        // RUN PROGRAM
        // ====================================================================
        repeat(300000) @(posedge clk_i);
        // ====================================================================
        // ====================================================================

        // write memory content at end to file
        mem_end_file = $fopen(`MEM_END_FILE, "w");
        for (int i = 0; i < 2**DMEM_SIZE_POW2; i = i + 4) begin
            concat = {  dmem_unit.memory[i+3],
                        dmem_unit.memory[i+2],
                        dmem_unit.memory[i+1],
                        dmem_unit.memory[i  ]};
            $fdisplay(mem_end_file, "%d", concat);
        end
        $fclose(mem_end_file);
        
        $vcdplusoff;
        $finish;
    end

endmodule
