`timescale 1ns/10ps

module CPU_top (
    input logic reset, clk
);
    // datamem sigs
    logic [63:0] dout;
    logic dmem_read_cntrl_DM;
    logic write_dmem_cntrl_DM;
    logic [63:0] DataWrite_DM;
    logic [63:0] DM_stage_in;

    
    // signals to interact with instrmem
    logic [63:0] program_counter;
    logic [31:0] instruction_IF;

    P5SCPU core (
        .reset,
        .clk,

        // Data Mem interface
        .dout,
        .dmem_read_cntrl_DM,
        .write_dmem_cntrl_DM,
        .DataWrite_DM,
        .DM_stage_in,

        // Instr mem interface
        .program_counter,
        .instruction_IF
    );

    instructmem inctruction_memory (
        .address        ( program_counter   ),
        .instruction    ( instruction_IF    ),
        .clk
    );

    datamem data_memory (
        .address        ( {DM_stage_in[63:3], 3'd0}     ),
        .read_enable    ( dmem_read_cntrl_DM            ),
        .write_enable   ( write_dmem_cntrl_DM           ),
        .write_data     ( DataWrite_DM                  ),
        .clk,
        .xfer_size      ( 4'd8                          ), // only ever transfer 8 bytes in this ISA
        .read_data      ( dout                          )
    );
endmodule
