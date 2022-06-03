
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
        

        unique case(state)
            IDLE:   case({lsu_empty_i, lsu_load_last, lsu_instr_ready_i})
                        3'b001:     begin 
                                        state_next = STORE;
                                        lsu_read_o = '1;
                                    end
                        3'b011:     begin
                                        state_next = LOAD;
                                        lsu_read_o = '1;
                                    end
                    endcase
            // ----------------------------------------------------------------
            LOAD:                   begin
                                        state_next = WAIT;
                                        dmem_read_o = '1;
                                        dmem_addr_o = lsu_eff_addr_i;
                                    end
            // ----------------------------------------------------------------
            STORE:                  begin
                                        state_next = WAIT;
                                        dmem_write_o = '1;
                                        dmem_addr_o = lsu_eff_addr_i;
                                        dmem_data_o = lsu_st_data_i;
                                    end
            // ----------------------------------------------------------------
            WAIT:   casez({lsu_empty_i, lsu_load_last, dmem_done_i, lsu_instr_ready_i})
                        4'b??0?:    begin
                                        state_next = WAIT;
                                    end
                        4'b1?1?:    begin
                                        state_next = IDLE;
                                        cdb_load_o.tag = load_tag;
                                        cdb_load_o.val = dmem_rd_data_i;
                                    end
                        4'b0011:    begin
                                        state_next = STORE;
                                        lsu_read_o = '1;
                                        cdb_load_o.tag = load_tag;
                                        cdb_load_o.val = dmem_rd_data_i;
                                    end
                        4'b0111:    begin
                                        state_next = LOAD;
                                        lsu_read_o = '1;
                                        cdb_load_o.tag = load_tag;
                                        cdb_load_o.val = dmem_rd_data_i;
                                    end
                        default:    begin
                                        state_next = IDLE;
                                        cdb_load_o.tag = load_tag;
                                        cdb_load_o.val = dmem_rd_data_i;
                                    end
                    endcase
        endcase
    end
    

    always_ff @(posedge clk_i) begin
        if ((state_next == LOAD)) begin
            load_tag <= lsu_ld_tag_i;
        end else if (state == STORE) begin
            load_tag <= NO_VAL;
        end

        lsu_load_last <= lsu_load_i;
    end

endmodule
