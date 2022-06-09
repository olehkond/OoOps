/*
    Data memory interface unit (for reading and writing)
    
    Inputs:
        logic     clk_i:              System clock
        logic     reset_i:            System reset

        logic     lsu_empty_i:        Is load store unit empty
        word32_t  lsu_eff_addr_i:     LS entry effective address (address + offset)
        word32_t  lsu_st_data_i:      LS entry data to store (if a store)
        rs_tag_t  lsu_ld_tag_i:       LS entry tag to broadcast on load
        logic     lsu_load_i:         1 if entry is load, 0 when store
        logic     lsu_instr_ready_i:  is LS entry ready to be read/written
        logic     lsu_specultative_i: Was LS entry issued speculatively
        logic     lsu_corr_pred_i:    Was the prediction correct
        
        word32_t  dmem_rd_data_i:     Data read out of memory
        logic     dmem_done_i:        memory is done with load/store operation

    Outputs:
    
    Description:
        logic    lsu_read_o:          Read signal to load-store unit
        cdb_t    cdb_load_o:          CDB value to be broadcast (on a load)
        logic    dmem_read_o:         read signal to memory
        logic    dmem_write_o:        write signal to memory
        word32_t dmem_addr_o:         address to read or write to
        word32_t dmem_data_o:         data to be written to memory (on store)
    
*/

`timescale 1ns/10ps

import data_types::*;


module dmem_read_write_unit (
    input logic     clk_i,
    input logic     reset_i,

    // load store unit interface
    input logic     lsu_empty_i,
    input word32_t  lsu_eff_addr_i,
    input word32_t  lsu_st_data_i,
    input rs_tag_t  lsu_ld_tag_i,
    input logic     lsu_load_i, // 1 if load, 0 if store
    input logic     lsu_instr_ready_i,
    input logic     lsu_specultative_i,
    input logic     lsu_corr_pred_i,

    output logic    lsu_read_o,
    output cdb_t    cdb_load_o,

    // dmem interface
    input word32_t  dmem_rd_data_i,
    input logic     dmem_done_i,
    
    output logic    dmem_read_o,
    output logic    dmem_write_o,
    output word32_t dmem_addr_o,
    output word32_t dmem_data_o
);

    enum { IDLE, LOAD, STORE, WAIT } state, state_next;
    
    rs_tag_t load_tag;
    logic lsu_load_last;

    always_ff @(posedge clk_i) begin
        if (reset_i)    state <= IDLE;
        else            state <= state_next;
    end
    
    // state logic
    always_comb begin
        // default:
        state_next = IDLE;
        lsu_read_o = '0;
        cdb_load_o.tag = NO_VAL;
        cdb_load_o.val = 'x;

        // load-only signals
        dmem_read_o = '0;

        // store-only signals
        dmem_write_o = '0;
        dmem_data_o = 'x;

        // address to write to on store
        // address to read from on load
        dmem_addr_o = 'x;
        
        // State behavior
        case(state)
            IDLE:   case({lsu_empty_i, lsu_load_i, lsu_instr_ready_i})
                        3'b001:     begin 
                                        if (lsu_specultative_i & ~lsu_corr_pred_i) begin
                                            state_next = IDLE;
                                        end else begin
                                            state_next = STORE;
                                        end
                                        lsu_read_o = '1;
                                    end
                        3'b011:     begin
                                        if (lsu_specultative_i & ~lsu_corr_pred_i) begin
                                            state_next = IDLE;
                                        end else begin
                                            state_next = LOAD;
                                        end
                                        lsu_read_o = '1;
                                    end
                        default:    begin
                                        // default:
                                        state_next = IDLE;
                                        lsu_read_o = '0;
                                        cdb_load_o.tag = NO_VAL;
                                        cdb_load_o.val = 'x;

                                        // load-only signals
                                        dmem_read_o = '0;

                                        // store-only signals
                                        dmem_write_o = '0;
                                        dmem_data_o = 'x;

                                        // address to write to on store
                                        // address to read from on load
                                        dmem_addr_o = 'x;
                                    end
                    endcase
            // ----------------------------------------------------------------
            LOAD:   begin
                        state_next = WAIT;
                        dmem_read_o = '1;
                        dmem_addr_o = lsu_eff_addr_i;
                    end
            // ----------------------------------------------------------------
            STORE:  begin
                        state_next = WAIT;
                        dmem_write_o = '1;
                        dmem_addr_o = lsu_eff_addr_i;
                        dmem_data_o = lsu_st_data_i;
                    end
            // ----------------------------------------------------------------
            WAIT:   begin
                        if (~dmem_done_i) begin
                            state_next = WAIT;
                        end else if (lsu_empty_i & dmem_done_i) begin
                            state_next = IDLE;
                            cdb_load_o.tag = load_tag;
                            cdb_load_o.val = dmem_rd_data_i;
                        end else if (~lsu_empty_i & ~lsu_load_i & dmem_done_i & lsu_instr_ready_i) begin
                            if (lsu_specultative_i & ~lsu_corr_pred_i) begin
                                state_next = IDLE;
                            end else begin
                                state_next = STORE;
                            end
                            lsu_read_o = '1;
                            cdb_load_o.tag = load_tag;
                            cdb_load_o.val = dmem_rd_data_i;
                        end else if (~lsu_empty_i & lsu_load_i & dmem_done_i & lsu_instr_ready_i) begin
                            if (lsu_specultative_i & ~lsu_corr_pred_i) begin
                                state_next = IDLE;
                            end else begin
                                state_next = LOAD;
                            end
                            lsu_read_o = '1;
                            cdb_load_o.tag = load_tag;
                            cdb_load_o.val = dmem_rd_data_i;
                        end else begin
                            // defaults
                            state_next = IDLE;
                            cdb_load_o.tag = load_tag;
                            cdb_load_o.val = dmem_rd_data_i;
                            
                            lsu_read_o = '0;

                            // load-only signals
                            dmem_read_o = '0;

                            // store-only signals
                            dmem_write_o = '0;
                            dmem_data_o = 'x;

                            // address to write to on store
                            // address to read from on load
                            dmem_addr_o = 'x;
                        end
                    end
        endcase
    end
    

    // Remember load tag when reading in load instruction
    always_ff @(posedge clk_i) begin
        if ((state_next == LOAD)) begin
            load_tag <= lsu_ld_tag_i;
        end else if (state == STORE) begin
            load_tag <= NO_VAL;
        end

        lsu_load_last <= lsu_load_i;
    end

endmodule
