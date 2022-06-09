/*
    Regfile(s)
    
    Inputs:
        logic         clk_i:                system clock
        logic         reset_i:              system reset
        cdb_t         cdb_i:                common data bus (write to regfile)
        regfile_idx_t read_addr1_i:         value read port 1
        regfile_idx_t read_addr2_i:         value read port 2
        regfile_idx_t reg_tag_read_idx1_i:  tag read port 1
        regfile_idx_t reg_tag_read_idx2_i:  tag read port 2
        regfile_idx_t reg_tag_write_idx_i:  tag write index
        rs_tag_t      wr_tag_i:             tag write enable
        logic         wr_en_tag_i:          tag to be written
        logic         save_regfile_state_i: signal to enter speculation mode
        logic         cond_eval_i:          was branch condition been evaluated
        logic         corr_pred_i:          was prediction correct?

    Outputs:
        word32_t     read_data1_o:          read data 1
        word32_t     read_data2_o:          read data 2
        rs_tag_t     tag1_o:                read tag 1
        rs_tag_t     tag2_o:                read tag 2

    Description:
        Tag addressable write (from CDB) as well as index write (on tag part of regfile)
        Reads are only by index.
*/

import data_types::*;

`timescale 1ns/10ps

module regfile (
    // inputs
    input logic clk_i,
    input logic reset_i,

    // common data bus
    input cdb_t cdb_i,

    // regfile 
    input regfile_idx_t read_addr1_i,
    input regfile_idx_t read_addr2_i,
    
    // register status
    input regfile_idx_t reg_tag_read_idx1_i, 
    input regfile_idx_t reg_tag_read_idx2_i,
    input regfile_idx_t reg_tag_write_idx_i,
    input rs_tag_t      wr_tag_i,
    input logic         wr_en_tag_i,

    // speculation signal
    input logic         save_regfile_state_i,
    
    // Branch alu interface
    input  logic        cond_eval_i,
    input  logic        corr_pred_i,
    
    // outputs
    output word32_t     read_data1_o,
    output word32_t     read_data2_o,
    output rs_tag_t     tag1_o,
    output rs_tag_t     tag2_o
);
    
    enum {NORMAL, SPECULATE, MISS_PRED} state, next_state;

    // state transition behavior
    always_comb begin
        // default:
        next_state = NORMAL;
        
        case(state)
            NORMAL:     if (save_regfile_state_i)           next_state = SPECULATE;
                        else                                next_state = NORMAL;
            // ================================================================
            SPECULATE:  if (cond_eval_i & corr_pred_i)      next_state = NORMAL;
                        else if (cond_eval_i & ~corr_pred_i)next_state = MISS_PRED;
                        else                                next_state = SPECULATE;
            // ================================================================
            MISS_PRED:                                      next_state = NORMAL;
        endcase
    end

    always_ff @(posedge clk_i) begin
        if (reset_i)    state <= NORMAL;
        else            state <= next_state;
    end

    
    // ========================================================================
    // Normal Regfile
    // ========================================================================
    word32_t registers       [REGFILE_SIZE-1:0];
    rs_tag_t reg_status_unit [REGFILE_SIZE-1:0];
    word32_t registers_SP       [REGFILE_SIZE-1:0]; // SPECULATION COPIES
    rs_tag_t reg_status_unit_SP [REGFILE_SIZE-1:0]; // SPECULATION COPIES
   
   logic tag_wr_en;
   assign tag_wr_en = wr_en_tag_i & (reg_tag_write_idx_i != '0);


    // tag read outputs 
    assign tag1_o = ( tag_wr_en & (reg_tag_write_idx_i == reg_tag_read_idx1_i) & (wr_tag_i != NO_VAL)) ?
                                                                    wr_tag_i : reg_status_unit[reg_tag_read_idx1_i];

    assign tag2_o = ( tag_wr_en & (reg_tag_write_idx_i == reg_tag_read_idx2_i) & (wr_tag_i != NO_VAL)) ? 
                                                                    wr_tag_i : reg_status_unit[reg_tag_read_idx2_i];
    // data read outputs
    always_comb begin
        read_data1_o = registers[read_addr1_i];
        read_data2_o = registers[read_addr2_i];
    end

    // register 0 is hardwired to 0
    assign registers[0] = '0;
    
    // register reset and write
    always_ff @(posedge clk_i) begin
        // synchronous reset
        if (reset_i) begin
            // tags in register status structure MUST 
            // reset to NO_VAL
            for (int i = 0; i < REGFILE_SIZE; i++) begin
               reg_status_unit[i] <= NO_VAL;
            end
        end else begin
            // for each register, if it's tag 
            // matches the cdb_i's tag, write the value
            // on the cdb_i into the register w/ the matching tag
            // ---------------------------------------------------------------------
            if (state == MISS_PRED) begin
                // NOTE: Assuming after misprediction, there will be no write to 
                // regfile, issue logic functionality must support this
                for (int i = 1; i < REGFILE_SIZE; i++) begin
                    if (cdb_i.tag == reg_status_unit_SP[i] & (cdb_i.tag != NO_VAL)) begin
                        reg_status_unit[i] <= NO_VAL;
                        registers[i]       <= cdb_i.val;
                    end else begin
                        reg_status_unit[i] <= reg_status_unit_SP[i];
                        registers[i]       <= registers_SP[i];
                    end
                end
                
                // if (tag_wr_en & (wr_tag_i != NO_VAL)) begin
                //     reg_status_unit[reg_tag_write_idx_i] <=  wr_tag_i;
                // end
            // ---------------------------------------------------------------------
            // normal operation
            end else begin
                for (int i = 1; i < REGFILE_SIZE; i++) begin
                    if (cdb_i.tag == reg_status_unit[i] & (cdb_i.tag != NO_VAL)) begin
                        if (~tag_wr_en | (reg_tag_write_idx_i != i)) begin
                            reg_status_unit[i] <= NO_VAL;
                        end
                        registers[i] <= cdb_i.val;
                    end
                end
                
                if (tag_wr_en & (wr_tag_i != NO_VAL)) begin
                    reg_status_unit[reg_tag_write_idx_i] <=  wr_tag_i;
                end
            end
        end
    end



    // ========================================================================
    // State Preservation Regfile
    // (When speculatively issuing)
    // ========================================================================

    
    /*
        Act in tandum with normal regfile in normal and ignore it when
        speculating or in the case of misprediction.
        (Normal regfile will overwrite itself with this regfile in the 
        case of a misprediction)
    */
    always_ff @(posedge clk_i) begin
        case(state)
            NORMAL:     begin
                            // ------------------------------------------------------------
                            for (int i=1; i<REGFILE_SIZE; ++i) begin
                                // incorporate writes in normal mode
                                if ((cdb_i.tag == reg_status_unit[i]) & (cdb_i.tag != NO_VAL)) begin
                                    if (~tag_wr_en | (reg_tag_write_idx_i != i)) begin
                                        reg_status_unit_SP[i] <= NO_VAL;
                                    end else if (tag_wr_en & (wr_tag_i != NO_VAL)) begin
                                        reg_status_unit_SP[reg_tag_write_idx_i] <=  wr_tag_i;
                                    end
                                    registers_SP[i]         <= cdb_i.val;
                                end else begin
                                    registers_SP[i]         <= registers[i];
                                    reg_status_unit_SP[i]   <= reg_status_unit[i];
                                end
                            end
                        end
            // ================================================================
            SPECULATE:  begin
                            for (int i=1; i<REGFILE_SIZE; ++i) begin
                                if ((cdb_i.tag == reg_status_unit_SP[i]) & (cdb_i.tag != NO_VAL)) begin
                                    registers_SP[i]         <= cdb_i.val;
                                    reg_status_unit_SP[i]   <= NO_VAL;
                                end
                            end
                        end
            // ================================================================
            MISS_PRED:  begin
                            for (int i=1; i<REGFILE_SIZE; ++i) begin
                                if ((cdb_i.tag == reg_status_unit_SP[i]) & (cdb_i.tag != NO_VAL)) begin
                                    registers_SP[i]         <= cdb_i.val;
                                    reg_status_unit_SP[i]   <= NO_VAL;
                                end
                            end
                        end
        endcase
    end


endmodule
