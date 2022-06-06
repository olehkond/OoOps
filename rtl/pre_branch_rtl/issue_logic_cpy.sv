import data_types::*;

`timescale 1ns/10ps


module READ_logic (
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


    // load-store interface
    output logic     write_o,
    output logic     load_o,
    output rs_tag_t  addr_tag_o,
    output word32_t  addr_o,
    output word32_t  offset_o,

    output rs_tag_t  data_st_tag_o,
    output word32_t  data_st_o,
    input  rs_tag_t  tag_ld_i
);
/*
    logic               read_instr_last_cyc;      // boolean: have we read in a valid instruction last cycle?
    logic               immediate;                // boolean: is this an immediate instruction?
    logic               immediate_stall;
    logic [DWIDTH-1:0]  instr_imm;

    alu_op_t            alu_op;
    shift_op_t          sft_op;
    logic               load;
    logic               reg_tag_wr; // does this instr produce a value for the regfile

    logic [$clog2(DWIDTH)-1:0]  rd_idx;
    regfile_idx_t               instr_rd_idx;

    assign iq_read_o = ~iq_empty_i; // temporary, a bit more complicated

    // ===============================================================
    // read/write addresses
    assign reg_rd_addr1_o = iq_data_i[26:22]; // val read 1 address
    assign reg_rd_addr2_o = iq_data_i[21:17]; // val read 2 address

    assign reg_tag_addr1_o = iq_data_i[26:22]; // tag read 1 address
    assign reg_tag_addr2_o = iq_data_i[21:17]; // tag read 2 address
    assign instr_rd_idx = iq_data_i[31:27]; // tag write 2 address


    enum {RESET, STALL, READ, READ_WAIT, WAIT} state, next_state;

    always_ff @(posedge clk_i) begin
        if (reset_i)    read_instr_last_cyc <= '0;
        else            read_instr_last_cyc <= iq_read_o;
    end
    
    // ===============================================================
    // res station outputs
    always_ff @(posedge clk_i) begin
        if (read_instr_last_cyc) begin
            rd_idx <= instr_rd_idx;
            rs_value1_o <=  (cdb_i.tag == reg_tag1_rd_i & (cdb_i.tag != NO_VAL)) ? cdb_i.val :
                            reg_rd_data1_i;
            
            // if an immediate instruction, use sign extended immediate, otherwise
            // use value from regfile or CDB
                        // if immediate instruction, use immediate 
            rs_value2_o <= (immediate) ? instr_imm :
                            // otherwise if needed value is on cdb use it instead
                            (cdb_i.tag == reg_tag2_rd_i & (cdb_i.tag != NO_VAL)) ? cdb_i.val :
                                reg_rd_data2_i;
            rs_tag1_o <= (cdb_i.tag == reg_tag1_rd_i & (cdb_i.tag != NO_VAL)) ? NO_VAL : reg_tag1_rd_i;
            rs_tag2_o <= (cdb_i.tag == reg_tag2_rd_i & (cdb_i.tag != NO_VAL)) ? NO_VAL : reg_tag2_rd_i;
            alu_op_type_o <= alu_op;
            shift_op_type_o <= sft_op;
            
            // load store signals
            addr_tag_o  <= (cdb_i.tag == reg_tag1_rd_i & (cdb_i.tag != NO_VAL)) ? NO_VAL : reg_tag1_rd_i;
            addr_o      <= (cdb_i.tag == reg_tag1_rd_i & (cdb_i.tag != NO_VAL)) ? cdb_i.val :
                            reg_rd_data1_i;
            data_st_tag_o <= (cdb_i.tag == reg_tag2_rd_i & (cdb_i.tag != NO_VAL)) ? NO_VAL : reg_tag2_rd_i;
            data_st_o     <= (cdb_i.tag == reg_tag2_rd_i & (cdb_i.tag != NO_VAL)) ? cdb_i.val : reg_rd_data2_i;
            offset_o      <= instr_imm;
            load_o        <= load;
            immediate_stall <= immediate;
        end else if (next_state == STALL) begin
            rd_idx <= rd_idx;
            rs_value1_o <=  (cdb_i.tag == rs_tag1_o & (cdb_i.tag != NO_VAL)) ? cdb_i.val :
                            rs_value1_o;
            
            // if an immediate instruction, use sign extended immediate, otherwise
            // use value from regfile or CDB
                        // if immediate instruction, use immediate 
            rs_value2_o <= (immediate_stall) ? rs_value2_o :
                            // otherwise if needed value is on cdb use it instead
                            (cdb_i.tag == rs_tag2_o & (cdb_i.tag != NO_VAL)) ? cdb_i.val :
                                rs_value2_o;
            rs_tag1_o <= (cdb_i.tag == rs_tag1_o & (cdb_i.tag != NO_VAL)) ? NO_VAL : rs_tag1_o;
            rs_tag2_o <= (cdb_i.tag == rs_tag2_o & (cdb_i.tag != NO_VAL)) ? NO_VAL : rs_tag2_o;
            alu_op_type_o <= alu_op_type_o;
            shift_op_type_o <= shift_op_type_o;
            
            // load store signals
            addr_tag_o  <= (cdb_i.tag == addr_tag_o & (cdb_i.tag != NO_VAL)) ? NO_VAL : addr_tag_o;
            addr_o      <= (cdb_i.tag == addr_tag_o & (cdb_i.tag != NO_VAL)) ? cdb_i.val : addr_o;
            data_st_tag_o <= (cdb_i.tag == data_st_tag_o & (cdb_i.tag != NO_VAL)) ? NO_VAL : data_st_tag_o;
            data_st_o     <= (cdb_i.tag == data_st_tag_o & (cdb_i.tag != NO_VAL)) ? cdb_i.val : data_st_o;
            offset_o      <= offset_o;
            load_o        <= load_o;
            
            // 
            immediate_stall <= immediate_stall;
        end else if (next_state == READ) begin
            rd_idx <= rd_idx;
            rs_value1_o <=  (cdb_i.tag == rs_tag1_o & (cdb_i.tag != NO_VAL)) ? cdb_i.val :
                            rs_value1_o;
            
            // if an immediate instruction, use sign extended immediate, otherwise
            // use value from regfile or CDB
                        // if immediate instruction, use immediate 
            rs_value2_o <= (immediate_stall) ? rs_value2_o :
                            // otherwise if needed value is on cdb use it instead
                            (cdb_i.tag == rs_tag2_o & (cdb_i.tag != NO_VAL)) ? cdb_i.val :
                                rs_value2_o;
            rs_tag1_o <= (cdb_i.tag == rs_tag1_o & (cdb_i.tag != NO_VAL)) ? NO_VAL : rs_tag1_o;
            rs_tag2_o <= (cdb_i.tag == rs_tag2_o & (cdb_i.tag != NO_VAL)) ? NO_VAL : rs_tag2_o;
            alu_op_type_o <= alu_op_type_o;
            shift_op_type_o <= shift_op_type_o;
            
            // load store signals
            addr_tag_o  <= (cdb_i.tag == addr_tag_o & (cdb_i.tag != NO_VAL)) ? NO_VAL : addr_tag_o;
            addr_o      <= (cdb_i.tag == addr_tag_o & (cdb_i.tag != NO_VAL)) ? cdb_i.val : addr_o;
            data_st_tag_o <= (cdb_i.tag == data_st_tag_o & (cdb_i.tag != NO_VAL)) ? NO_VAL : data_st_tag_o;
            data_st_o     <= (cdb_i.tag == data_st_tag_o & (cdb_i.tag != NO_VAL)) ? cdb_i.val : data_st_o;
            offset_o      <= offset_o;
            load_o        <= load_o;
            
            // 
            immediate_stall <= immediate_stall;
        end
    end



    // ================================================================
    // reservation station freedom flags
    logic alu_free, sft_free, ls_free, rs_availible; // is there a free reservation station of specific type

    // ALU reservation station select
    logic [$clog2(NUM_ALU_RS)-1:0] alu_sel_idx;
    priority_encoder #(.N(NUM_ALU_RS)) alu_sel (
        .in_i       ( ~busy_bus_i[NUM_ALU_RS-1:0]   ), // inverted busy signal (free rs stations are logic high)
        .out_o      ( alu_sel_idx                   ), // alu index to select
        .valid_o    ( alu_free                      )  // is an alu rs free?
    );

    // SHIFT reservation station select
    logic [$clog2(NUM_SHIFT_RS)-1:0] sft_sel_idx;
    priority_encoder #(.N(NUM_SHIFT_RS)) sft_sel (
        .in_i       ( ~busy_bus_i[NUM_ALU_RS + NUM_SHIFT_RS - 1 : NUM_ALU_RS]   ),
        .out_o      ( sft_sel_idx                                               ),
        .valid_o    ( sft_free                                                  )
    );
    // NOTE: shift index to select (index of write will be + NUM_ALU_RS) when writing

    assign ls_free = ~busy_bus_i[NUM_RS-1];



    always_comb begin
        case(state)
            RESET:  state_next = STALL;
            STALL:      if (rs_availible & !iq_empty_i)     state_next = READ;
                        else if (rs_availible & iq_empty_i) state_next = READ_WAIT;
                        else                                state_next = STALL;
            // ==========================================================================
            READ:       if (rs_availible & !iq_empty_i)     state_next = READ;
                        else if (rs_availible & iq_empty_i) state_next = READ_WAIT;
                        else                                state_next = STALL;
            // ==========================================================================
            READ_WAIT:                                      state_next = WAIT;
            // ==========================================================================
            WAIT:       if (iq_empty_i)                     state_next = WAIT;
                        else 
        endcase
    end 

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            state <= RESET;
        end else begin
            state <= state_next;
        end
    end
























    

    // instruction decoding
    always_comb begin
        
        // defaults:
        reg_wr_tag_o = NO_VAL;  // tag to be written
        reg_tag_wr_en_o = '0;   // tag write enable

        immediate = '0; // is this an immediate instruction
        instr_imm = 'x;
        rs_availible = '0;
        alu_op = ADDI;
        sft_op = SLLI;
        load = '0;

        reg_tag_wr = '0; // does this instr write to regfile upon exectution

        unique casez(iq_data_i[21:0])
            // -------------------------------------
            // Branches
            // -------------------------------------
            22'b?????_???????_???_1100111: begin : JMP
                immediate = '1;
                instr_imm = $signed(iq_data_i[31:7]);
                rs_availible = '1; // NOTE: ASSUMING NO BR INSTR WILL BE READ UNTIL PRECEDING BRANCH EVALUATED THANKS TO UPSTREAM MODULE
                //brnch_op_t 
                reg_tag_wr = '0;

            end
            22'b?????_???????_000_1100011: begin : BEQ
                immediate = '1;
                instr_imm = $signed({iq_data_i[31:27], iq_data_i[16:10]});
                rs_availible = '1;
                rs_availible = '1;
                //brnch_op_t 
                reg_tag_wr = '0;

            end
            22'b?????_???????_001_1100011: begin : BNE
                immediate = '1;
                instr_imm = $signed({iq_data_i[31:27], iq_data_i[16:10]});
                rs_availible = '1;
                //brnch_op_t 
                reg_tag_wr = '0;

            end
            22'b?????_???????_100_1100011: begin : BLT
                immediate = '1;
                instr_imm = $signed({iq_data_i[31:27], iq_data_i[16:10]});
                rs_availible = '1;
                //brnch_op_t 
                reg_tag_wr = '0;

            end
            22'b?????_???????_101_1100011: begin : BGE
                immediate = '1;
                instr_imm = $signed({iq_data_i[31:27], iq_data_i[16:10]});
                rs_availible = '1;
                //brnch_op_t 
                reg_tag_wr = '0;

            end
            22'b?????_???????_110_1100011: begin : BLTU
                immediate = '1;
                instr_imm = $signed({iq_data_i[31:27], iq_data_i[16:10]});
                rs_availible = '1;
                //brnch_op_t 
                reg_tag_wr = '0;

            end
            22'b?????_???????_111_1100011: begin : BGEU
                immediate = '1;
                instr_imm = $signed({iq_data_i[31:27], iq_data_i[16:10]});
                rs_availible = '1;
                //brnch_op_t 
                reg_tag_wr = '0;

            end
            // -------------------------------------
            // Load/Store instructions
            // -------------------------------------
            22'b?????_???????_010_0000011: begin : LW
                reg_tag_wr_en_o = '1;
                instr_imm = $signed(iq_data_i[21:10]);
                rs_availible = ls_free;
                load = '1;
                reg_tag_wr = '1;

            end
            22'b?????_???????_010_0100011: begin : SW
                immediate = '1;
                instr_imm = $signed({iq_data_i[31:27], iq_data_i[16:10]});
                rs_availible = ls_free;
                load = '0;
                reg_tag_wr = '0;

            end
            // -------------------------------------
            // ALU instructions (Immediate)
            // -------------------------------------
            22'b?????_???????_000_0010011: begin : ADDI
                reg_tag_wr_en_o = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[21:10]);
                rs_availible = alu_free;
                alu_op = ADDI;
                reg_tag_wr = '1;

            end
            22'b?????_???????_100_0010011: begin : XORI
                reg_tag_wr_en_o = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[21:10]);
                rs_availible = alu_free;
                alu_op = XORI;
                reg_tag_wr = '1;

            end
            22'b?????_???????_010_0010011: begin : SLTI
                reg_tag_wr_en_o = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[21:10]);
                rs_availible = alu_free;
                alu_op = SLTI;
                reg_tag_wr = '1;

            end
            22'b?????_???????_011_0010011: begin : SLTIU
                reg_tag_wr_en_o = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[21:10]);
                rs_availible = alu_free;
                alu_op = SLTUI;
                reg_tag_wr = '1;

            end
            22'b?????_???????_110_0010011: begin : ORI
                reg_tag_wr_en_o = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[21:10]);
                rs_availible = alu_free;
                alu_op = ORI;
                reg_tag_wr = '1;

            end
            22'b?????_???????_111_0010011: begin : ANDI
                reg_tag_wr_en_o = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[21:10]);
                rs_availible = alu_free;
                alu_op = ANDI;
                reg_tag_wr = '1;

            end
            // -------------------------------------
            // ALU instructions (Register)
            // -------------------------------------
            22'b?????_0000000_000_0110011: begin : ADD
                reg_tag_wr_en_o = '1;
                rs_availible = alu_free;
                alu_op = ADDR;
                reg_tag_wr = '1;

            end
            22'b?????_1000000_000_0110011: begin : SUB
                reg_tag_wr_en_o = '1;
                rs_availible = alu_free;
                alu_op = SUBR;
                reg_tag_wr = '1;

            end
            22'b?????_0000000_010_0110011: begin : SLT
                reg_tag_wr_en_o = '1;
                rs_availible = alu_free;
                alu_op = SLTR;
                reg_tag_wr = '1;

            end
            22'b?????_0000000_011_0110011: begin : SLTU
                reg_tag_wr_en_o = '1;
                rs_availible = alu_free;
                alu_op = SLTUR;
                reg_tag_wr = '1;

            end
            22'b?????_0000000_100_0110011: begin : XOR
                reg_tag_wr_en_o = '1;
                rs_availible = alu_free;
                alu_op = XORR;
                reg_tag_wr = '1;

            end
            22'b?????_0000000_110_0110011: begin : OR
                reg_tag_wr_en_o = '1;
                rs_availible = alu_free;
                alu_op = ORR;
                reg_tag_wr = '1;

            end
            22'b?????_0000000_111_0110011: begin : AND
                reg_tag_wr_en_o = '1;
                rs_availible = alu_free;
                alu_op = ANDR;
                reg_tag_wr = '1;

            end
            //22'b?????_0000001_000_0110011: begin : MUL

            //end
            // -------------------------------------
            // Shift instructions (Immediate)
        
            // -------------------------------------
            22'b000000_??????_001_0010011: begin : SLLI
                reg_tag_wr_en_o = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[21:10]);
                rs_availible = sft_free;
                sft_op = SLLI;
                reg_tag_wr = '1;

            end
            22'b000000_??????_101_0010011: begin : SRLI
                reg_tag_wr_en_o = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[21:10]);
                rs_availible = sft_free;
                sft_op = SRLI;
                reg_tag_wr = '1;

            end
            22'b000001_??????_101_0010011: begin : SRAI
                reg_tag_wr_en_o = '1;
                immediate = '1;
                instr_imm = $signed(iq_data_i[21:10]);
                rs_availible = sft_free;
                sft_op = SRAI;
                reg_tag_wr = '1;

            end
            // -------------------------------------
            // Shift instructions (Register)
            // -------------------------------------
            22'b?????_0000000_001_0110011: begin : SLL
                reg_tag_wr_en_o = '1;
                rs_availible = sft_free;
                sft_op = SLLR;
                reg_tag_wr = '1;

            end
            22'b?????_0000000_101_0110011: begin : SRL
                reg_tag_wr_en_o = '1;
                rs_availible = sft_free;
                sft_op = SRLR;
                reg_tag_wr = '1;

            end
            22'b?????_1000000_101_0110011: begin : SRA
                reg_tag_wr_en_o = '1;
                rs_availible = sft_free;
                sft_op = SRAR;
                reg_tag_wr = '1;

            end
        endcase
        
    end
    */
endmodule




