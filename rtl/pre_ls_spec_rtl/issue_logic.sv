import data_types::*;

`timescale 1ns/10ps


module issue_logic (
    // general control inputs
    // ========================================================================
    input logic                 clk_i,
    input logic                 reset_i,

    // common data bus interface (input)
    // ========================================================================
    input cdb_t                 cdb_i,

    // instruction queue interface
    // ========================================================================
    input  word32_t             iq_data_i,
    input  logic                iq_empty_i,
    output logic                iq_read_o,

    // regfile interface
    // ========================================================================
    output regfile_idx_t        reg_rd_addr1_o,
                                reg_rd_addr2_o,
    input  word32_t             reg_rd_data1_i,
                                reg_rd_data2_i,
    output logic                save_regfile_state_o,

    // register status interface
    // ========================================================================
    output regfile_idx_t        reg_tag_addr1_o,
                                reg_tag_addr2_o,
                                reg_tag_wr_addr_o,
    output rs_tag_t             reg_wr_tag_o,
    output logic                reg_tag_wr_en_o,
    input  rs_tag_t             reg_tag1_rd_i,
                                reg_tag2_rd_i,


    // reservation station interface
    // ========================================================================
    
    // priority encoding logic
    input logic [NUM_RS-1:0]    busy_bus_i,

    // reservation station signals
    output logic [NUM_RS-1:0]   rs_write_en_o,
    output word32_t             rs_value1_o,
                                rs_value2_o,
    output rs_tag_t             rs_tag1_o,
                                rs_tag2_o,
    output alu_op_t             alu_op_type_o,
    output shift_op_t           shift_op_type_o,
    output branch_op_t          branch_op_type_o,

    output logic                spec_o,


    // Branch alu interface
    // ========================================================================
    input  logic                cond_eval_i,
    input  logic                corr_pred_i,

    // load-store interface
    // ========================================================================
    output logic                write_o,
    output logic                load_o,
    output rs_tag_t             addr_tag_o,
    output word32_t             addr_o,
    output word32_t             offset_o,

    output rs_tag_t             data_st_tag_o,
    output word32_t             data_st_o,
    input  rs_tag_t             tag_ld_i
);
    logic                       read_instr_last_cyc;      // boolean: have we read in a valid instruction last cycle?
    logic                       write_instr_last_cyc;     // boolean: have we read in a valid instruction last cycle?
    logic                       immediate;                // boolean: is this an immediate instruction?
    logic                       immediate_stall;
    logic [DWIDTH-1:0]          instr_imm;

    alu_op_t                    alu_op;
    shift_op_t                  sft_op;
    branch_op_t                 br_op;
    logic                       load;
    logic                       reg_tag_wr; // does this instr produce a value for the regfile
    logic                       reg_tag_wr_en_stall;
    logic                       instr_valid; // is the current latched instruction valid

    logic [$clog2(DWIDTH)-1:0]  rd_idx;
    regfile_idx_t               instr_rd_idx;
    
    logic [NUM_RS-1:0]          write_bus; // write logic
    logic [NUM_RS-1:0]          rs_write_en_pbr;
    logic                       write_rs;
    regfile_idx_t               reg_tag_wr_addr_tmp;
    logic                       reg_tag_wr_en_tmp;
    logic                       stall;
    logic                       stall_last_cyc;
    logic                       valid_instr_iq;
    regfile_idx_t               reg_tag_wr_addr_pos;

    enum {ALU, SFT, BRH, LS} instr_type, instr_type_stall;

    // ===============================================================
    // instruction index select
    logic [$clog2(NUM_ALU_RS)-1:0] alu_sel_idx;
    logic [$clog2(NUM_SHIFT_RS)-1:0] sft_sel_idx;

    // ===============================================================
    // reservation station freedom flags
    logic alu_free, sft_free, ls_free, rs_free; // is there a free reservation station of specific type

    // ===============================================================
    // read/write addresses
    assign reg_tag_addr1_o = iq_data_i[26:22]; // tag read 1 address
    assign reg_rd_addr1_o  = iq_data_i[26:22]; // val read 1 address

    assign reg_tag_addr2_o = iq_data_i[21:17]; // tag read 2 address
    assign reg_rd_addr2_o  = iq_data_i[21:17]; // val read 2 address

    assign instr_rd_idx    = iq_data_i[31:27]; // tag write 2 address


    // SPECULATION fsm states
    enum {NORMAL, SPECULATE, SQUASH} sp_state, sp_state_next;

    // ===============================================================
    // Components: Read, Issue, Not Read, Not Issue
    enum {NR_NI, R_NI, NR_I, R_I, STALL} state, next_state;

    assign stall = (state == STALL) | (next_state == STALL);// ((state == NR_I) | (state == R_I)) & (rs_write_en_pbr == '0);

    always_comb begin
        iq_read_o = '0;
        write_rs = '0;
        next_state = NR_NI;

        case(state)
            NR_NI:  begin
                if      (iq_empty_i & instr_valid & rs_free ) next_state = NR_I;
                else if (!iq_empty_i & instr_valid & rs_free) next_state = R_I;
                else if (!iq_empty_i & !instr_valid         ) next_state = R_NI;
                else                                          next_state = NR_NI;
            end
            R_NI:   begin
                if      (             !rs_free              ) next_state = NR_NI;
                else if (iq_empty_i  & rs_free              ) next_state = NR_I;
                else if (!iq_empty_i & rs_free              ) next_state = R_I;
            end
            NR_I:   begin
                if      (rs_write_en_pbr == '0              ) next_state = STALL;
                else if (iq_empty_i                         ) next_state = NR_NI;
                else                                          next_state = R_NI;
            end
            R_I:    begin
                if      (rs_write_en_pbr == '0              ) next_state = STALL;
                else if (             !rs_free              ) next_state = NR_NI;
                else if (iq_empty_i  & rs_free              ) next_state = NR_I;
                else if (!iq_empty_i & rs_free              ) next_state = R_I;
            end
            STALL:  begin
                if      (rs_write_en_pbr == '0              ) next_state = STALL;
                else if (valid_instr_iq & !iq_empty_i       ) next_state = R_I;
                else if (valid_instr_iq & iq_empty_i        ) next_state = NR_I;
                else if (iq_empty_i                         ) next_state = NR_NI;
                else if (!iq_empty_i                        ) next_state = R_NI;
            end
        endcase

        case(next_state)
            NR_NI:  begin iq_read_o = '0; write_rs = '0; end
            R_NI:   begin iq_read_o = '1; write_rs = '0; end
            NR_I:   begin iq_read_o = '0; write_rs = '1; end
            R_I:    begin iq_read_o = '1; write_rs = '1; end
            STALL:  begin iq_read_o = '0; write_rs = '1; end
        endcase
    end

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            state       <= NR_NI;
            instr_valid <= '0;
        end else begin
            state <= next_state;

            case(state)
            NR_NI:  begin // ========================================================= next_state:
                if      (iq_empty_i & instr_valid & rs_free ) instr_valid <= '0;          // NR_I
                else if (!iq_empty_i & instr_valid & rs_free) instr_valid <= '1;          // R_I
                else if (!iq_empty_i & !instr_valid         ) instr_valid <= '1;          // R_NI
                else                                          instr_valid <= instr_valid; // NR_NI
            end
            R_NI:   begin
                if      (             !rs_free              ) instr_valid <= '1;          // NR_NI;
                else if (iq_empty_i  & rs_free              ) instr_valid <= '0;          // NR_I;
                else if (!iq_empty_i & rs_free              ) instr_valid <= '1;          // R_I;
            end
            NR_I:   begin
                if      (rs_write_en_pbr == '0              ) instr_valid <= '1;          // STALL;
                else if (iq_empty_i                         ) instr_valid <= '0;          // NR_NI;
                else                                          instr_valid <= '1;          // R_NI;
            end
            R_I:    begin
                if      (rs_write_en_pbr == '0                ) instr_valid <= '1;          // STALL;
                else if (             !rs_free              ) instr_valid <= '1;          // NR_NI;
                else if (iq_empty_i  & rs_free              ) instr_valid <= '0;          // NR_I;
                else if (!iq_empty_i & rs_free              ) instr_valid <= '1;          // R_I;
            end
            STALL:  begin
                if      (rs_write_en_pbr == '0                ) instr_valid <= '1;          // STALL;
                else if (valid_instr_iq & !iq_empty_i       ) instr_valid <= '1;          // R_I;
                else if (valid_instr_iq & iq_empty_i        ) instr_valid <= '1;          // NR_I;
                else if (iq_empty_i                         ) instr_valid <= '0;          // NR_NI;
                else if (!iq_empty_i                        ) instr_valid <= '1;          // R_NI;
            end
        endcase
        end
    end



















    word32_t rs_value1_pos;
    word32_t rs_value2_pos;

    rs_tag_t rs_tag1_pos;
    rs_tag_t rs_tag2_pos;


    rs_tag_t addr_tag_pos;
    word32_t addr_pos;
    rs_tag_t data_st_tag_pos;
    word32_t data_st_pos;

    // ===============================================================
    // res station outputs
    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            read_instr_last_cyc <= '0;
            write_instr_last_cyc <= '0;
            stall_last_cyc <= '0;
            reg_tag_wr_addr_pos <= '0;


        end else begin
            // save if read was asserted last cycle
            read_instr_last_cyc <= iq_read_o;
            write_instr_last_cyc <= write_rs;
            stall_last_cyc      <= stall;



            if ((read_instr_last_cyc & ~stall) | (valid_instr_iq & (next_state != STALL) | (rs_write_en_pbr != '0 & (state == STALL)))) begin
                // ==================================================================================================
                // Misc Signals
                rd_idx          <= instr_rd_idx;
                reg_tag_wr_en_stall<= reg_tag_wr;
                instr_type_stall<= instr_type;
                
                // ==================================================================================================
                // Generic Reservation station signals
                rs_value1_pos     <= (cdb_i.tag == reg_tag1_rd_i & (cdb_i.tag != NO_VAL)) ? cdb_i.val : reg_rd_data1_i;
                // Second RS value will occaisionally be an immediate instruction, which does not get updated
                // by any value on the CDB
                rs_value2_pos     <= (immediate) ? instr_imm :
                                   (cdb_i.tag == reg_tag2_rd_i & (cdb_i.tag != NO_VAL)) ? cdb_i.val : reg_rd_data2_i;

                rs_tag1_pos       <= (cdb_i.tag == reg_tag1_rd_i & (cdb_i.tag != NO_VAL)) ? NO_VAL    : reg_tag1_rd_i;
                rs_tag2_pos       <= (cdb_i.tag == reg_tag2_rd_i & (cdb_i.tag != NO_VAL)) ? NO_VAL    : reg_tag2_rd_i;
                alu_op_type_o   <= alu_op;
                shift_op_type_o <= sft_op;
                branch_op_type_o<= br_op;
            
                // ==================================================================================================
                // Load Store signals
                // addr_tag_pos      <= (cdb_i.tag == reg_tag1_rd_i & (cdb_i.tag != NO_VAL)) ? NO_VAL    : reg_tag1_rd_i;
                addr_pos          <= (cdb_i.tag == reg_tag1_rd_i & (cdb_i.tag != NO_VAL)) ? cdb_i.val : reg_rd_data1_i;
                // data_st_tag_pos   <= (cdb_i.tag == reg_tag2_rd_i & (cdb_i.tag != NO_VAL)) ? NO_VAL    : reg_tag2_rd_i;
                data_st_pos       <= (cdb_i.tag == reg_tag2_rd_i & (cdb_i.tag != NO_VAL)) ? cdb_i.val : reg_rd_data2_i;
                offset_o        <= instr_imm;
                load_o          <= load;
                immediate_stall <= immediate;
            end else begin
                // ==================================================================================================
                // Misc Signals
                rd_idx          <= rd_idx;
                reg_tag_wr_en_stall<= reg_tag_wr_en_stall;
                instr_type_stall<= instr_type_stall;
                
                // ==================================================================================================
                // Generic Reservation station signals
                rs_value1_pos     <= (cdb_i.tag == rs_tag1_pos & (cdb_i.tag != NO_VAL)) ? cdb_i.val : rs_value1_pos;//reg_rd_data1_i;
                // Second RS value will occaisionally be an immediate instruction, which does not get updated
                // by any value on the CDB
                rs_value2_pos     <= (immediate_stall) ? rs_value2_pos :
                                   (cdb_i.tag == rs_tag2_pos & (cdb_i.tag != NO_VAL)) ? cdb_i.val : rs_value2_pos;//reg_rd_data2_i;

                rs_tag1_pos       <= (cdb_i.tag == rs_tag1_pos & (cdb_i.tag != NO_VAL)) ? NO_VAL    : rs_tag1_pos;
                rs_tag2_pos       <= (cdb_i.tag == rs_tag2_pos & (cdb_i.tag != NO_VAL)) ? NO_VAL    : rs_tag2_pos;
                alu_op_type_o   <= alu_op_type_o;
                shift_op_type_o <= shift_op_type_o;
                branch_op_type_o<= branch_op_type_o;
            
                // ==================================================================================================
                // Load Store signals
                // addr_tag_pos      <= (cdb_i.tag == rs_tag1_pos & (cdb_i.tag != NO_VAL)) ? NO_VAL    : addr_tag_pos;
                addr_pos          <= (cdb_i.tag == rs_tag1_pos & (cdb_i.tag != NO_VAL)) ? cdb_i.val : addr_pos;
                // data_st_tag_pos   <= (cdb_i.tag == rs_tag2_pos & (cdb_i.tag != NO_VAL)) ? NO_VAL    : data_st_tag_pos;
                data_st_pos       <= (cdb_i.tag == rs_tag2_pos & (cdb_i.tag != NO_VAL)) ? cdb_i.val : data_st_pos;
                offset_o        <= offset_o;
                load_o          <= load_o;
                immediate_stall <= immediate_stall;
            end


            if ((write_rs & ~stall) | (valid_instr_iq & (next_state != STALL))) begin
                reg_tag_wr_addr_pos <= (read_instr_last_cyc) ? instr_rd_idx : rd_idx;
            end else begin
                reg_tag_wr_addr_pos <= reg_tag_wr_addr_pos;
            end
        end
    end

    // ====================================================================================================
    // ====================================================================================================
    
    assign rs_value1_o     = (cdb_i.tag == rs_tag1_pos & (cdb_i.tag != NO_VAL)) ? cdb_i.val : rs_value1_pos;
    // Second RS value will occaisionally be an immediate instruction, which does not get updated
    // by any value on the CDB
    assign rs_value2_o     = (immediate_stall) ? rs_value2_pos :
                           (cdb_i.tag == rs_tag2_pos & (cdb_i.tag != NO_VAL)) ? cdb_i.val : rs_value2_pos;

    assign rs_tag1_o       = (cdb_i.tag == rs_tag1_pos & (cdb_i.tag != NO_VAL)) ? NO_VAL    : rs_tag1_pos;
    assign rs_tag2_o       = (cdb_i.tag == rs_tag2_pos & (cdb_i.tag != NO_VAL)) ? NO_VAL    : rs_tag2_pos;

    // ====================================================================================================


    assign addr_tag_o      = rs_tag1_o;     //(cdb_i.tag == rs_tag1_pos & (cdb_i.tag != NO_VAL)) ? NO_VAL    : addr_tag_pos;
    assign addr_o          = (cdb_i.tag == rs_tag1_pos & (cdb_i.tag != NO_VAL)) ? cdb_i.val : addr_pos;
    assign data_st_tag_o   = rs_tag2_o;     //(cdb_i.tag == rs_tag2_pos & (cdb_i.tag != NO_VAL)) ? NO_VAL    : data_st_tag_pos;
    assign data_st_o       = (cdb_i.tag == rs_tag2_pos & (cdb_i.tag != NO_VAL)) ? cdb_i.val : data_st_pos;


    // ====================================================================================================
    // ====================================================================================================





    assign reg_tag_wr_en_o   = (rs_write_en_pbr == '0)              ? '0 :
                               (cond_eval_i & ~corr_pred_i)         ? '0 :
                               (sp_state == SQUASH)                 ? '0 :
                               (instr_type_stall == LS & load_o)    ? '1 :
                               (instr_type_stall == LS & ~load_o)   ? '0 : reg_tag_wr_en_stall;
    
    assign reg_tag_wr_addr_o = (stall_last_cyc & (next_state != STALL)) ? rd_idx : reg_tag_wr_addr_pos;


    always_ff @(posedge clk_i) begin
        if (read_instr_last_cyc & (next_state == STALL)) begin
            valid_instr_iq <= '1;
        end else if (next_state != STALL) begin
            valid_instr_iq <= '0;
        end
    end

    always_comb begin
        reg_wr_tag_o = NO_VAL;
        write_bus = '0;

        // tag value will be broadcast on completion of instruction
        case(instr_type_stall)
            ALU:    begin
                reg_wr_tag_o                        = ALU_RS_STATION[alu_sel_idx];
                write_bus[alu_sel_idx]              = '1;
            end
            // ===========================================
            SFT:    begin
                reg_wr_tag_o                        = SHIFT_RS_STATION[sft_sel_idx];
                write_bus[sft_sel_idx + NUM_ALU_RS] = '1;
            end
            // ===========================================
            BRH:    begin
                ; // branches do not write to regfile
                write_bus[NUM_RS-2]                 = '1;
            end
            // ===========================================
            LS:     begin
                reg_wr_tag_o                        = tag_ld_i;
                write_bus[NUM_RS-1]                 = '1;
            end
        endcase
    end

    logic needed_rs_free;
    always_comb begin
        needed_rs_free = '0;
        case(instr_type_stall)
            ALU:    needed_rs_free = alu_free;
            SFT:    needed_rs_free = sft_free;
            BRH:    needed_rs_free = '1;
            LS:     needed_rs_free = ls_free;
        endcase
    end

    // if we initiated a write last cycle, but it turns out the reservation station
    // that was availible last turn no longer is, FSM will stall, but we
    // need to kill write
    assign rs_write_en_pbr  = (write_instr_last_cyc & needed_rs_free) ? write_bus : '0;

    // if condition is evaluated we need to squash incorrect speculative instruction
    // in the issue logic
    // also squash if alu instruction writing to index zero in regfile
    // ---------------------------------------------------------------------------------------------
    assign rs_write_en_o    = ((sp_state == SQUASH) |
                               (cond_eval_i & ~corr_pred_i) |
                               ((reg_tag_wr_addr_o == '0) & (instr_type_stall != BRH) & (instr_type_stall != LS))) ?
                                                                '0 : rs_write_en_pbr;
    // ---------------------------------------------------------------------------------------------
    // assign rs_write_en_o    = (sp_state == SQUASH) ? '0 : rs_write_en_pbr; // temporary
    assign write_o          = rs_write_en_o[NUM_RS-1];











    // ================================================================
    // reservation station freedom flags

    // ALU reservation station select
    priority_encoder #(.N(NUM_ALU_RS)) alu_sel (
        .in_i       ( ~busy_bus_i[NUM_ALU_RS-1:0]   ), // inverted busy signal (free rs stations are logic high)
        .out_o      ( alu_sel_idx                   ), // alu index to select
        .valid_o    ( alu_free                      )  // is an alu rs free?
    );

    // SHIFT reservation station select
    priority_encoder #(.N(NUM_SHIFT_RS)) sft_sel (
        .in_i       ( ~busy_bus_i[NUM_ALU_RS + NUM_SHIFT_RS - 1 : NUM_ALU_RS]   ),
        .out_o      ( sft_sel_idx                                               ),
        .valid_o    ( sft_free                                                  )
    );
    // NOTE: shift index to select (index of write will be + NUM_ALU_RS) when writing

    assign ls_free = ~busy_bus_i[NUM_RS-1];









    // ================================================================================
    // Speculation Logic
    // ================================================================================
    assign save_regfile_state_o = (instr_type_stall == BRH) & rs_write_en_o[NUM_RS-2];

    always_comb begin
        sp_state_next = NORMAL;

        case(sp_state)
            NORMAL:     if ((instr_type_stall == BRH & rs_write_en_o[NUM_RS-2]))                    sp_state_next = SPECULATE;
                        else                                            sp_state_next = NORMAL;
            // -----------------------------------------------------------
            SPECULATE:  if ((cond_eval_i) & (corr_pred_i | 
                                            ((state == NR_NI) & ~instr_valid) | 
                                            (rs_write_en_pbr != '0)))   sp_state_next = NORMAL;
                        else if (~cond_eval_i)                          sp_state_next = SPECULATE;
                        else if (cond_eval_i)                           sp_state_next = SQUASH;
            // -----------------------------------------------------------
            SQUASH:     if (rs_write_en_pbr != '0)                      sp_state_next = NORMAL;
                        else                                            sp_state_next = SQUASH;
        endcase
    end

    assign spec_o = ((sp_state == SPECULATE) & ~(cond_eval_i & corr_pred_i)) ? '1 : '0;

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            sp_state <= NORMAL;
        end else begin
            sp_state <= sp_state_next;
        end
    end




    // ================================================================================
    // ================================================================================


































    logic store_instr;

    // instruction decoding
    always_comb begin
        reg_tag_wr  = '0; // does this instr write to regfile upon exectution

        immediate   = '0; // is this an immediate instruction
        instr_imm   = 'x;
        rs_free     = '0;
        alu_op      = ADDI;
        sft_op      = SLLI;
        br_op       = BEQ;
        instr_type  = ALU; // type of instruction
        load        = '0;
        store_instr = '0;
        unique casez(iq_data_i[21:0])
            // -------------------------------------
            // Branches
            // -------------------------------------
            
            // 22'b?????_???????_???_1100111: begin : _JMP // NOTE: WILL NEVER SEE THIS INSTR
            //     immediate = '0;
            //     instr_imm = $signed(iq_data_i[31:7]);
            //     rs_free = '1;
            //     //brnch_op_t 
            //     reg_tag_wr = '0;
            //     instr_type = BRH;

            // end
            22'b?????_???????_000_1100011: begin : _BEQ
                immediate = '0;
                // instr_imm = $signed({iq_data_i[31:27], iq_data_i[16:10]});
                rs_free = '1; // NOTE: ASSUMING NO BR INSTR WILL BE READ UNTIL PRECEDING BRANCH EVALUATED THANKS TO UPSTREAM MODULE
                br_op = BEQ;
                reg_tag_wr = '0;
                instr_type = BRH;

            end
            22'b?????_???????_001_1100011: begin : _BNE
                immediate = '0;
                // instr_imm = $signed({iq_data_i[31:27], iq_data_i[16:10]});
                rs_free = '1;
                br_op = BNE;
                reg_tag_wr = '0;
                instr_type = BRH;

            end
            22'b?????_???????_100_1100011: begin : _BLT
                immediate = '0;
                // instr_imm = $signed({iq_data_i[31:27], iq_data_i[16:10]});
                rs_free = '1;
                br_op = BLT;
                reg_tag_wr = '0;
                instr_type = BRH;

            end
            22'b?????_???????_101_1100011: begin : _BGE
                immediate = '0;
                // instr_imm = $signed({iq_data_i[31:27], iq_data_i[16:10]});
                rs_free = '1;
                br_op = BGE;
                reg_tag_wr = '0;
                instr_type = BRH;

            end
            22'b?????_???????_110_1100011: begin : _BLTU
                immediate = '0;
                // instr_imm = $signed({iq_data_i[31:27], iq_data_i[16:10]});
                rs_free = '1;
                br_op = BLTU;
                reg_tag_wr = '0;
                instr_type = BRH;

            end
            22'b?????_???????_111_1100011: begin : _BGEU
                immediate = '0;
                // instr_imm = $signed({iq_data_i[31:27], iq_data_i[16:10]});
                rs_free = '1;
                br_op = BGEU;
                reg_tag_wr = '0;
                instr_type = BRH;

            end
            // -------------------------------------
            // Load/Store instructions
            // -------------------------------------
            22'b?????_???????_010_0000011: begin : _LW
                reg_tag_wr = '1;
                instr_imm = $signed(iq_data_i[21:10]);
                rs_free = ls_free;
                load = '1;
                reg_tag_wr = '1;
                instr_type = LS;

            end
            22'b?????_???????_010_0100011: begin : _SW
                immediate = '1;
                instr_imm = $signed({iq_data_i[31:27], iq_data_i[16:10]});
                rs_free = ls_free;
                load = '0;
                reg_tag_wr = '0;
                instr_type = LS;
                store_instr = '1;

            end
            // -------------------------------------
            // ALU instructions (Immediate)
            // -------------------------------------
            22'b?????_???????_000_0010011: begin : _ADDI
                reg_tag_wr = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[21:10]);
                rs_free = alu_free;
                alu_op = ADDI;
                reg_tag_wr = '1;
                instr_type = ALU;

            end
            22'b?????_???????_100_0010011: begin : _XORI
                reg_tag_wr = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[21:10]);
                rs_free = alu_free;
                alu_op = XORI;
                reg_tag_wr = '1;
                instr_type = ALU;

            end
            22'b?????_???????_010_0010011: begin : _SLTI
                reg_tag_wr = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[21:10]);
                rs_free = alu_free;
                alu_op = SLTI;
                reg_tag_wr = '1;
                instr_type = ALU;

            end
            22'b?????_???????_011_0010011: begin : _SLTIU
                reg_tag_wr = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[21:10]);
                rs_free = alu_free;
                alu_op = SLTUI;
                reg_tag_wr = '1;
                instr_type = ALU;

            end
            22'b?????_???????_110_0010011: begin : _ORI
                reg_tag_wr = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[21:10]);
                rs_free = alu_free;
                alu_op = ORI;
                reg_tag_wr = '1;
                instr_type = ALU;

            end
            22'b?????_???????_111_0010011: begin : _ANDI
                reg_tag_wr = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[21:10]);
                rs_free = alu_free;
                alu_op = ANDI;
                reg_tag_wr = '1;
                instr_type = ALU;

            end
            // -------------------------------------
            // ALU instructions (Register)
            // -------------------------------------
            22'b?????_0000000_000_0110011: begin : _ADD
                reg_tag_wr = '1;
                rs_free = alu_free;
                alu_op = ADDR;
                reg_tag_wr = '1;
                instr_type = ALU;

            end
            22'b?????_1000000_000_0110011: begin : _SUB
                reg_tag_wr = '1;
                rs_free = alu_free;
                alu_op = SUBR;
                reg_tag_wr = '1;
                instr_type = ALU;

            end
            22'b?????_0000000_010_0110011: begin : _SLT
                reg_tag_wr = '1;
                rs_free = alu_free;
                alu_op = SLTR;
                reg_tag_wr = '1;
                instr_type = ALU;

            end
            22'b?????_0000000_011_0110011: begin : _SLTU
                reg_tag_wr = '1;
                rs_free = alu_free;
                alu_op = SLTUR;
                reg_tag_wr = '1;
                instr_type = ALU;

            end
            22'b?????_0000000_100_0110011: begin : _XOR
                reg_tag_wr = '1;
                rs_free = alu_free;
                alu_op = XORR;
                reg_tag_wr = '1;
                instr_type = ALU;

            end
            22'b?????_0000000_110_0110011: begin : _OR
                reg_tag_wr = '1;
                rs_free = alu_free;
                alu_op = ORR;
                reg_tag_wr = '1;
                instr_type = ALU;

            end
            22'b?????_0000000_111_0110011: begin : _AND
                reg_tag_wr = '1;
                rs_free = alu_free;
                alu_op = ANDR;
                reg_tag_wr = '1;
                instr_type = ALU;

            end
            /*22'b?????_0000001_000_0110011: begin : _MUL

            end*/
            // -------------------------------------
            // Shift instructions (Immediate)
            // -------------------------------------
            22'b000000_??????_001_0010011: begin : _SLLI
                reg_tag_wr = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[15:10]);
                rs_free = sft_free;
                sft_op = SLLI;
                reg_tag_wr = '1;
                instr_type = SFT;

            end
            22'b000000_??????_101_0010011: begin : _SRLI
                reg_tag_wr = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[15:10]);
                rs_free = sft_free;
                sft_op = SRLI;
                reg_tag_wr = '1;
                instr_type = SFT;

            end
            22'b000001_??????_101_0010011: begin : _SRAI
                reg_tag_wr = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[15:10]);
                rs_free = sft_free;
                sft_op = SRAI;
                reg_tag_wr = '1;
                instr_type = SFT;

            end
            // -------------------------------------
            // Shift instructions (Register)
            // -------------------------------------
            22'b?????_0000000_001_0110011: begin : _SLL
                reg_tag_wr = '1;
                rs_free = sft_free;
                sft_op = SLLR;
                reg_tag_wr = '1;
                instr_type = SFT;

            end
            22'b?????_0000000_101_0110011: begin : _SRL
                reg_tag_wr = '1;
                rs_free = sft_free;
                sft_op = SRLR;
                reg_tag_wr = '1;
                instr_type = SFT;

            end
            22'b?????_1000000_101_0110011: begin : _SRA
                reg_tag_wr = '1;
                rs_free = sft_free;
                sft_op = SRAR;
                reg_tag_wr = '1;
                instr_type = SFT;

            end
            default: begin
                // defaults:
                reg_tag_wr  = '0; // does this instr write to regfile upon exectution

                immediate   = '0; // is this an immediate instruction
                instr_imm   = 'x;
                rs_free     = '0;
                alu_op      = ADDI;
                sft_op      = SLLI;
                br_op       = BEQ;
                instr_type  = ALU; // type of instruction
                load        = '0;
                store_instr = '0;
            end
        endcase
    end

endmodule

