
import data_types::*;

module OoO_top (
    // ==========================================
    input logic     reset_i,
    input logic     clk_i,

    // ==========================================
    // Instr mem interface
    input word32_t  instr_fetch_i,
    output word32_t program_counter_o,

    // ==========================================
    // interface with data memory model
    input word32_t  dmem_rd_data_i,
    input logic     dmem_done_i,

    output logic    dmem_read_o,
    output logic    dmem_write_o,
    output word32_t dmem_addr_o,
    output word32_t dmem_data_o
);
    // Global Common Data Bus
    cdb_t cdb_bus;
    




    // ========================================================================
    // Branch Predictor
    // ========================================================================
    logic [11:0]    br_imm;
    word32_t        program_counter_branched;
    logic           if_issuing_branch;
    logic           bru_cond_eval; // condition evaluated?
    logic           bru_corr_pred; // correct predition?
    logic           bp_br_taken;

    branch_pred #(.HISTORY_BITS(8), .IMM_WIDTH(12)) branch_predictor (
        .clk_i                      ( clk_i), // logic
        .reset_i                    ( reset_i), // logic

        // fetch unit interface
        .program_counter_i          ( program_counter_o), // word32_t
        .br_imm_i                   ( br_imm), // logic [IMM_WIDTH-1:0]
        .issuing_branch_i           ( if_issuing_branch), // logic
        .program_counter_branched_o ( program_counter_branched), // word32_t

        // branch alu interface
        .cond_eval_i                ( bru_cond_eval), // logic
        .corr_pred_i                ( bru_corr_pred), // logic

        // goes to fetch and branch alu
        .br_taken_o                 ( bp_br_taken)  // logic
    );

















    // ========================================================================
    // Instruction fetch and queue
    // ========================================================================
    logic           iq_full;
    logic           iq_read;
    logic           iq_empty;
    logic           iq_write;
    word32_t        fetched_instr;


    instr_fetch_unit #(.IMM_WIDTH(12)) instruction_fetch_unit (
        // ===========================
        // general signals
        .clk_i                      ( clk_i                     ), // logic
        .reset_i                    ( reset_i                   ), // logic

        
        // ===========================
        // branch predictor interface
        .program_counter_branched_i ( program_counter_branched  ), // word32_t
        .br_taken_i                 ( bp_br_taken               ), // logic
        .br_imm_o                   ( br_imm                    ), // logic [IMM_WIDTH-1:0]
        .issuing_branch_o           ( if_issuing_branch         ), // logic

        
        // ===========================
        // branch alu interface
        .cond_eval_i                ( bru_cond_eval             ), // logic
        .corr_pred_i                ( bru_corr_pred             ), // logic

        
        // ===========================
        // instruction queue interface
        .iq_full_i                  ( iq_full                   ), // logic
        .iq_write_o                 ( iq_write                  ), // logic
        .fetched_instr_o            ( fetched_instr             ), // word32_t

        // ===========================
        // instruction mem interface
        .instr_i                    ( instr_fetch_i             ), // word32_t
        .program_counter_o          ( program_counter_o         )  // word32_t
    );


    logic mispred_flush_rst;

    // reset fifo if branch was mispredicted
    assign mispred_flush_rst = bru_cond_eval & ~bru_corr_pred;

    word32_t    iq_instr;
    fifo #(.ENTRIES_POW2(3)) instr_queue (
        // inputs
        .write_data_i ( fetched_instr               ), // word32_t
        .write_i      ( iq_write                    ), // logic
        .read_i       ( iq_read                     ), // logic

        .reset_i      ( reset_i | mispred_flush_rst ), // logic
        .clk_i        ( clk_i                       ), // logic
    
        // outputs
        .full_o       ( iq_full                     ), // logic
        .empty_o      ( iq_empty                    ), // logic
        .read_data_o  ( iq_instr                    )  // word32_t
    );







    // ========================================================================
    // Issue/Decode/Regfile Stage
    // ========================================================================

    // regfile and reg status signals 
    regfile_idx_t reg_addr1_idx,        // read address 1
                  reg_addr2_idx,        // read address 2
                  rstat_tag1_idx,       // corresponding tag for addr 1
                  rstat_tag2_idx,       // corresponding tag for addr 2
                  rstat_wr_tag_idx;     // index of tag to write
    rs_tag_t      reg_rd_wr_tag,        // tag to be written to reg status
                  rstat_tag1,           // tag1 read from reg status
                  rstat_tag2;           // tag2 read from reg status
    word32_t      reg_data1,            // value1 read from regfile
                  reg_data2;            // value2 read from regfile
    logic         reg_wr_en;            // regfile write enable
    logic         spec;                 // flag for specultative instruction
    logic         save_regfile_state;   // issuing a branch, preserve regfile
                                        // state in case of misprediction

    // reservation station logic
    logic [NUM_RS-1:0] rs_busy_bus;     // busy signals from rs stations
    assign rs_busy_bus[NUM_RS-2] = '0;  // never issue 2 branchs, so is always free 
    logic [NUM_RS-1:0] rs_write_en_bus; // one-hot write enable to rs stations
    word32_t           rs_val1,         // value1 to be written to rs station
                       rs_val2;         // value2 to be written to rs station
    rs_tag_t           rs_tag1,         // tag1 to be written to rs station
                       rs_tag2;         // tag2 to be written to rs station
    alu_op_t           alu_op;          // alu operation decoded for rs station
    shift_op_t         shift_op;        // shift operation decoded for rs station

    // load store interface signals
    logic    ls_write, ls_load;
    rs_tag_t ls_addr_tag;
    word32_t ls_addr,  ls_offset;
    rs_tag_t ls_data_st_tag;
    word32_t ls_data_st;
    rs_tag_t ls_tag_ld;

    // branch evaluation unit
    branch_op_t bru_branch_type;


    regfile register_file (
        // inputs
        .clk_i              ( clk_i             ), // logic
        .reset_i            ( reset_i           ), // logic

        // common data bus
        .cdb_i              ( cdb_bus           ), // cdb_t

        // regfile 
        .read_addr1_i       ( reg_addr1_idx     ), // regfile_idx_t
        .read_addr2_i       ( reg_addr2_idx     ), // regfile_idx_t
    
        // register status
        .reg_tag_read_idx1_i( rstat_tag1_idx    ), // regfile_idx_t
        .reg_tag_read_idx2_i( rstat_tag2_idx    ), // regfile_idx_t
        .reg_tag_write_idx_i( rstat_wr_tag_idx  ), // regfile_idx_t
        .wr_tag_i           ( reg_rd_wr_tag     ), // rs_tag_t
        .wr_en_tag_i        ( reg_wr_en         ), // logic
        
        // speculation signal
        .save_regfile_state_i(save_regfile_state), // logic
        
        // Branch alu interface
        .cond_eval_i        ( bru_cond_eval     ), // logic
        .corr_pred_i        ( bru_corr_pred     ), // logic
    
        // outputs
        .read_data1_o       ( reg_data1         ), // word32_t
        .read_data2_o       ( reg_data2         ), // word32_t
        .tag1_o             ( rstat_tag1        ), // rs_tag_t
        .tag2_o             ( rstat_tag2        ) // rs_tag_t
    );


    issue_logic issue_stage (
        // general control inputs
        .clk_i              ( clk_i             ),
        .reset_i            ( reset_i           ),

        // common data bus interface (input)
        .cdb_i              ( cdb_bus           ), // cdb_t

        // instruction queue interface
        .iq_data_i          ( iq_instr          ), // word32_t
        .iq_empty_i         ( iq_empty          ), // logic
        .iq_read_o          ( iq_read           ), // logic

        // regfile interface
        .reg_rd_addr1_o     ( reg_addr1_idx     ), // regfile_idx_t
        .reg_rd_addr2_o     ( reg_addr2_idx     ), // regfile_idx_t
        .reg_rd_data1_i     ( reg_data1         ), // word_32_t
        .reg_rd_data2_i     ( reg_data2         ), // word_32_t
        .save_regfile_state_o(save_regfile_state), // logic

        // register status interface
        .reg_tag_addr1_o    ( rstat_tag1_idx    ), // regfile_idx_t
        .reg_tag_addr2_o    ( rstat_tag2_idx    ), // regfile_idx_t 
        .reg_tag_wr_addr_o  ( rstat_wr_tag_idx  ), // regfile_idx_t
        .reg_wr_tag_o       ( reg_rd_wr_tag     ), // rs_tag_t
        .reg_tag_wr_en_o    ( reg_wr_en         ), // logic
        .reg_tag1_rd_i      ( rstat_tag1        ), // rs_tag_t
        .reg_tag2_rd_i      ( rstat_tag2        ), // rs_tag_t


        // res. station priority encoding logic
        .busy_bus_i         ( rs_busy_bus       ), // logic [NUM_RS-1:0]

        // reservation station signals
        .rs_write_en_o      ( rs_write_en_bus   ), // logic [NUM_RS-1:0]
        .rs_value1_o        ( rs_val1           ), // word32_t
        .rs_value2_o        ( rs_val2           ), // word32_t
        .rs_tag1_o          ( rs_tag1           ), // rs_tag_t
        .rs_tag2_o          ( rs_tag2           ), // rs_tag_t
        .alu_op_type_o      ( alu_op            ), // alu_op_t
        .shift_op_type_o    ( shift_op          ),  // shift_op_t
        .branch_op_type_o   ( bru_branch_type   ), // branch_op_t
        .spec_o             ( spec              ), // logic

        // Branch alu interface
        .cond_eval_i        ( bru_cond_eval     ), // logic
        .corr_pred_i        ( bru_corr_pred     ), // logic

        // load-store interface
        .write_o            ( ls_write          ), // logic 
        .load_o             ( ls_load           ), // logic
        .addr_tag_o         ( ls_addr_tag       ), // rs_tag_t
        .addr_o             ( ls_addr           ), // word32_t
        .offset_o           ( ls_offset         ), // word32_t

        .data_st_tag_o      ( ls_data_st_tag    ), // rs_tag_t
        .data_st_o          ( ls_data_st        ), // word32_t
        .tag_ld_i           ( ls_tag_ld         )  // rs_tag_t
    );








    // ========================================================================
    // Branch Evaluation Unit
    // ========================================================================


    branch_unit branch_eval_unit (
        // general signals
        .reset_i            ( reset_i), // logic
        .clk_i              ( clk_i), // logic
        .cdb_i              ( cdb_bus), // cdb_t

        // Issue Logic interface
        .write_i            ( rs_write_en_bus[NUM_RS-2]), // logic
        .branch_op_type_i   ( bru_branch_type), // branch_op_t
        .tag1_i             ( rs_tag1), // rs_tag_t
        .tag2_i             ( rs_tag2), // rs_tag_t
        .val1_i             ( rs_val1), // word32_t
        .val2_i             ( rs_val2), // word32_t
        
        // Branch predictor interface
        .br_taken_i         ( bp_br_taken), // logic
        .cond_eval_o        ( bru_cond_eval), // logic
        .corr_pred_o        ( bru_corr_pred), // logic

        // Instruction Fetch
        .issuing_branch_i   ( if_issuing_branch)  // logic
    );


















    // ========================================================================
    // Reservation Station(s) Stage
    // ========================================================================

    // functional unit logic
    logic       fu_ready       [NUM_RS];      // signal FU to start computation
    alu_op_t    fu_alu_oper    [NUM_ALU_RS];  // configure ALU FU operation
    shift_op_t  fu_shift_oper  [NUM_SHIFT_RS];// configure SHIFT FU operaiton
    word32_t    fu_rs1_val     [NUM_RS],      // value 1 of computation
                fu_rs2_val     [NUM_RS];      // value 2 of computation

    genvar i;
    generate
        for (i = 0; i < NUM_RS; ++i) begin : reservation_station
            if (i < NUM_ALU_RS) begin
                res_station #(.TAG(ALU_RS_STATION[i])) alu_rs (
                    // inputs
                    .reset_i          ( reset_i               ), // logic
                    .clk_i            ( clk_i                 ), // logic
                    .cdb_i            ( cdb_bus               ), // cdb_t

                    .write_i          ( rs_write_en_bus[i]    ), // logic
                    .alu_opcode_i     ( alu_op                ), // alu_op_t
                    .shift_opcode_i   (                       ), // shift_op_t
                    .tag1_i           ( rs_tag1               ), // rs_tag_t
                    .tag2_i           ( rs_tag2               ), // rs_tag_t
                    .value1_i         ( rs_val1               ), // word32_t
                    .value2_i         ( rs_val2               ), // word32_t

                    // speculation instruction
                    .spec_i           ( spec), // logic

                    // Branch alu interface
                    .cond_eval_i      ( bru_cond_eval         ), // logic
                    .corr_pred_i      ( bru_corr_pred         ), // logic

                    // outputs
                    .fu_ready_o       ( fu_ready[i]           ), // logic
                    .fu_alu_oper_o    ( fu_alu_oper[i]        ), // alu_op_t
                    .fu_shift_oper_o  (                       ), // shift_op_t
                    .fu_rs1_val_o     ( fu_rs1_val[i]         ), // word32_t
                    .fu_rs2_val_o     ( fu_rs2_val[i]         ), // word32_t
                    .busy_o           ( rs_busy_bus[i]        )  // logic
                );
            end else if (i < NUM_ALU_RS + NUM_SHIFT_RS) begin
                res_station #(.TAG(SHIFT_RS_STATION[i-NUM_ALU_RS])) shift_rs (
                    // inputs
                    .reset_i          ( reset_i                     ), // logic
                    .clk_i            ( clk_i                       ), // logic
                    .cdb_i            ( cdb_bus                     ), // cdb_t

                    .write_i          ( rs_write_en_bus[i]          ), // logic
                    .alu_opcode_i     (                             ), // alu_op_t
                    .shift_opcode_i   ( shift_op                    ), // shift_op_t
                    .tag1_i           ( rs_tag1                     ), // rs_tag_t
                    .tag2_i           ( rs_tag2                     ), // rs_tag_t
                    .value1_i         ( rs_val1                     ), // word32_t
                    .value2_i         ( rs_val2                     ), // word32_t

                    // speculation instruction
                    .spec_i           ( spec                        ), // logic

                    // Branch alu interface
                    .cond_eval_i      ( bru_cond_eval               ), // logic
                    .corr_pred_i      ( bru_corr_pred               ), // logic

                    // outputs
                    .fu_ready_o       ( fu_ready[i]                 ), // logic
                    .fu_alu_oper_o    (                             ), // alu_op_t
                    .fu_shift_oper_o  ( fu_shift_oper[i-NUM_ALU_RS] ), // shift_op_t
                    .fu_rs1_val_o     ( fu_rs1_val[i]               ), // word32_t
                    .fu_rs2_val_o     ( fu_rs2_val[i]               ), // word32_t
                    .busy_o           ( rs_busy_bus[i]              )  // logic
                );
            end
        end : reservation_station
    endgenerate


    // ========================================================================
    // Load-Store Unit 
    // ========================================================================

    cdb_t [NUM_RS-1:0] br_res_cdb; // cdb term scheduled for broadcast
    logic ls_full;

    // branches never produce broadcastable values
    assign br_res_cdb[NUM_RS-2].tag = NO_VAL;

    load_store_unit #(.SIZE_POW2(3)) ls_unit (
        .clk_i          ( clk_i                 ),
        .reset_i        ( reset_i               ),
        .write_i        ( ls_write              ), // logic 

        .load_i         ( ls_load               ), // logic

        .addr_tag_i     ( ls_addr_tag           ), // rs_tag_t
        .addr_i         ( ls_addr               ), // word32_t
        .offset_i       ( ls_offset             ), // word32_t

        .data_st_tag_i  ( ls_data_st_tag        ), // rs_tag_t
        .data_st_i      ( ls_data_st            ), // word32_t 
        
        // speculation instruction
        .spec_i         ( spec                  ), // logic
        
        // Branch alu interface
        .cond_eval_i    ( bru_cond_eval         ), // logic
        .corr_pred_i    ( bru_corr_pred         ), // logic

        .cdb_i          ( cdb_bus               ), // cdb_t   
        .cdb_term_o     ( br_res_cdb [NUM_RS-1] ), // cdb_t   
        
        // issue logic terms
        .full_o         ( rs_busy_bus[NUM_RS-1] ), // logic
        .tag_ld_o       ( ls_tag_ld             ), // rs_tag_t

        // data memory interface
        .dmem_rd_data_i ( dmem_rd_data_i        ), // word32_t
        .dmem_done_i    ( dmem_done_i           ), // logic 

        .dmem_read_o    ( dmem_read_o           ), // logic
        .dmem_write_o   ( dmem_write_o          ), // logic
        .dmem_addr_o    ( dmem_addr_o           ), // word32_t
        .dmem_data_o    ( dmem_data_o           )  // word32_t
    );









    // ========================================================================
    // Execution stage
    // ========================================================================

    
    generate
        for (i = 0; i < NUM_RS; ++i) begin : functional_unit
            if (i < NUM_ALU_RS) begin
                alu #(.TAG(ALU_RS_STATION[i])) alu_fu (
                    // inputs
                    .oper_i     ( fu_alu_oper[i] ), // alu_op_t
                    .rs1_val_i  ( fu_rs1_val[i]  ), // word32_t
                    .rs2_val_i  ( fu_rs2_val[i]  ), // word32_t
                    .ready_i    ( fu_ready[i]    ), // logic
                    .clk_i      ( clk_i          ), // logic

                    // outputs
                    .cdb_term_o ( br_res_cdb[i]  )  // cdb_t
                );
            end else if (i < NUM_ALU_RS + NUM_SHIFT_RS) begin
                shifter #(.TAG(SHIFT_RS_STATION[i-NUM_ALU_RS])) shifter_fu (
                    .oper_i     ( fu_shift_oper[i-NUM_ALU_RS] ), // shift_op_t
                    .rs1_val_i  ( fu_rs1_val[i]               ), // word32_t
                    .rs2_val_i  ( fu_rs2_val[i]               ), // word32_t
                    .ready_i    ( fu_ready[i]                 ), // logic
                    .clk_i      ( clk_i                       ), // logic

                    // outputs
                    .cdb_term_o ( br_res_cdb[i]               )  // cdb_t
                );
            end
        end : functional_unit
    endgenerate










    // ========================================================================
    // Broadcasting stage
    // ========================================================================
    broadcast_cdb #(.NUM_RS_STATIONS(NUM_RS)) broadcast_station (
        .fu_res_i   ( br_res_cdb    ), // cdb_t [NUM_RS-1:0]
        .clk_i      ( clk_i         ), // logic
        .RST_i      ( reset_i       ), // logic
        .broadcast_o( cdb_bus       )  // cdb_t
    );



endmodule
