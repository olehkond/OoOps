
import data_types::*;


module load_store_unit #(
    parameter SIZE_POW2 = 3
) (
    input logic     clk_i,
    input logic     reset_i,
    input logic     write_i,
    input logic     load_i, // 1 if load, 0 if store

    input rs_tag_t  addr_tag_i,
    input word32_t  addr_i,
    input word32_t  offset_i,
    
    input rs_tag_t  data_st_tag_i,
    input word32_t  data_st_i,
    
    // speculation instruction
    input  logic    spec_i,
    
    // Branch alu interface
    input  logic    cond_eval_i,
    input  logic    corr_pred_i,

    input cdb_t     cdb_i,

    // declare data load 
    output cdb_t    cdb_term_o,

    // issue logic terms
    output logic    full_o,
    output rs_tag_t tag_ld_o, // let issue logic know what tag will be broadcast on load

    // data memory interface
    input word32_t  dmem_rd_data_i,
    input logic     dmem_done_i,
    
    output logic    dmem_read_o,
    output logic    dmem_write_o,
    output word32_t dmem_addr_o,
    output word32_t dmem_data_o
);
    
    // buffer holding data
    ls_t                    buff [2**SIZE_POW2];
    

    // pointers to head and tail of buff
    logic [SIZE_POW2-1:0]   head;
    logic [SIZE_POW2-1:0]   head_next;
    logic [SIZE_POW2-1:0]   head_plus1;
    logic [SIZE_POW2-1:0]   tail;
    logic [SIZE_POW2-1:0]   tail_next;
    logic [SIZE_POW2-1:0]   tail_plus1;
    logic                   empty;
    logic                   read;

    // operation needing to be performed
    enum {READ_WRITE, READ, WRITE, NOTHING} oper;

    // status signals
    assign full_o = (head == tail) | buff[head].locked;
    assign empty  = (head == tail_plus1);

    // pointer increments
    assign tail_plus1 = tail + 'd1;
    assign head_plus1 = head + 'd1;

    // oper combinational logic
    always_comb begin
        unique casez({write_i, read, full_o, empty})
            'b01?0:  oper = READ;      // non-empty buff read
            'b1110:  oper = READ;      // read+write on full buff
            'b100?:  oper = WRITE;     // write to non-full buff
            'b11?1:  oper = WRITE;     // read+write on empty buff
            'b1100:  oper = READ_WRITE;// read+write on non-full non-empty buff
            default: oper = NOTHING;   // do nothing by default
        endcase
    end

    // always broadcast tag to issue logic
    // this is so the issue logic knows where the memory val
    // from a load will come from
    assign tag_ld_o = buff[head].tag;

    // next pointer value logic
    always_comb begin
        unique case(oper)
            READ:       begin head_next=head;       tail_next=tail_plus1; end
            WRITE:      begin head_next=head_plus1; tail_next=tail;       end
            READ_WRITE: begin head_next=head_plus1; tail_next=tail_plus1; end
            default:    begin head_next=head;       tail_next=tail;       end
        endcase
    end

    always_ff @(posedge clk_i) begin
        // reset behavior
        if (reset_i) begin
            head <= '0;
            tail <= '1;

        // normal behavior
        end else begin
            // update pointers
            head <= head_next;
            tail <= tail_next;
        end
    end



    word32_t  dmem_rd_data;
    word32_t  cdb_val;
    always_comb begin
        dmem_rd_data = dmem_rd_data_i;
        cdb_val = cdb_i.val;
    end


    



    // ========================================================================
    // Speculation flags
    // ========================================================================

    // NOTE: speculation flag set/released in general behavior always_ff block
    always_ff @(posedge clk_i) begin
        for (int i = 0; i < 2**SIZE_POW2; ++i) begin
            if (reset_i) begin
                buff[i].cond_evaluated <= '0;
            end else begin
                // release condition evaluation flag on read
                if (read & (i == tail_plus1)) begin
                    buff[i].cond_evaluated <= '0;

                end else if (((oper == WRITE) | (oper == READ_WRITE)) & (i == head)) begin
                    buff[i].cond_evaluated <= '0;

                // set condition evaluation flag when seen (do not overwrite a set flag)
                end else if (cond_eval_i & (buff[i].cond_evaluated != '1)) begin
                    buff[i].cond_evaluated <= '1;
                    buff[i].corr_pred      <= corr_pred_i;
                end
            end
        end
    end




    // ========================================================================
    // ========================================================================


    // calculating the effective address and whether instr is ready to send to
    // memory
    logic [2**SIZE_POW2-1:0] ld_ready_cond;
    logic [2**SIZE_POW2-1:0] st_ready_cond;
    always_comb begin
        for (int i = 0; i < 2**SIZE_POW2; ++i) begin
            // effective address
            buff[i].eff_addr = buff[i].addr + buff[i].offset;

            // -------------------------------------------------
            // default:
            buff[i].ready = '0;

            ld_ready_cond[i] =(buff[i].addr_tag    == NO_VAL)
                            & (buff[i].locked      == '0)
                            & (~buff[i].speculative | (buff[i].speculative & (buff[i].cond_evaluated == '1)));
            st_ready_cond[i] =(buff[i].addr_tag    == NO_VAL)
                            & (buff[i].data_st_tag == NO_VAL)
                            & (buff[i].locked      == '0)
                            & (~buff[i].speculative | (buff[i].speculative & (buff[i].cond_evaluated == '1)));
            // load instr ready condition
            if (ld_ready_cond[i] & buff[i].load) begin
                buff[i].ready = '1;
            
            // store instr ready condition
            end else if (st_ready_cond[i] & ~buff[i].load) begin
                buff[i].ready = '1;
            end
        end
    end
    
    // write if appropriate
    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            for (int i = 0; i < 2**SIZE_POW2; ++i) begin
                buff[i].tag             <= LS_RS_STATION[i];
                buff[i].locked          <= '0;
                buff[i].speculative     <= '0;
            end
        end else begin
            for (int i = '0; i < 2**SIZE_POW2; ++i) begin
                if (((oper == WRITE) | (oper == READ_WRITE)) & (i == head)) begin
                    // address info
                    buff[head].addr_tag     <= addr_tag_i;
                    buff[head].addr         <= addr_i;
                    buff[head].offset       <= offset_i;
                
                    // data info (store only)
                    buff[head].data_st_tag  <= data_st_tag_i;
                    buff[head].data_st      <= data_st_i;
                
                    // whether instruction is load or store
                    buff[head].load         <= load_i;

                    // speculation capture
                    buff[head].speculative  <= spec_i;
                end else begin
                    if ((buff[i].addr_tag == cdb_i.tag) & (cdb_i.tag != NO_VAL)) begin
                        buff[i].addr_tag    <= NO_VAL;
                        buff[i].addr        <= cdb_val;
                    end
                    if ((buff[i].data_st_tag == cdb_i.tag) & (cdb_i.tag != NO_VAL)) begin
                        buff[i].data_st_tag <= NO_VAL;
                        buff[i].data_st     <= cdb_val;
                    end

                    // speculation release
                    if (read & (i == tail_plus1)) begin
                        buff[tail_plus1].speculative <= '0;
                    end
                end

                // locking behavior:
                if (read & (i == tail_plus1) & buff[tail_plus1].load & (buff[tail_plus1].locked != '1)) begin
                    if (buff[i].speculative & ~buff[i].corr_pred) begin
                        buff[i].locked <= '0;
                    end else begin
                        buff[i].locked <= '1;
                    end
                end else if ((cdb_i.tag != NO_VAL) & (cdb_i.tag == buff[i].tag)) begin
                    buff[i].locked <= '0;
                end
            end
        end
    end


    


    // ========================================================================
    // data memory read/write unit
    // ========================================================================
    dmem_read_write_unit dmem_rwu (
        .clk_i              ( clk_i                         ),
        .reset_i            ( reset_i                       ),
        // load store unit interface
        .lsu_empty_i        ( empty                         ), // logic
        .lsu_eff_addr_i     ( buff[tail].eff_addr           ), // word32_t
        .lsu_st_data_i      ( buff[tail].data_st            ), // word32_t
        .lsu_ld_tag_i       ( buff[tail_plus1].tag          ), // rs_tag_t
        .lsu_load_i         ( buff[tail_plus1].load         ), // logic (1 if load, 0 if store)
        .lsu_instr_ready_i  ( buff[tail_plus1].ready        ), // logic
        .lsu_specultative_i ( buff[tail_plus1].speculative  ), // logic
        .lsu_corr_pred_i    ( buff[tail_plus1].corr_pred    ), // logic

        .lsu_read_o         ( read                          ), // logic

        // load broadcast term
        .cdb_load_o         ( cdb_term_o                    ), // cdb_t

        // dmem interface
        .dmem_rd_data_i     ( dmem_rd_data                  ), // word32_t
        .dmem_done_i        ( dmem_done_i                   ), // logic
    
        .dmem_read_o        ( dmem_read_o                   ), // logic
        .dmem_write_o       ( dmem_write_o                  ), // logic
        .dmem_addr_o        ( dmem_addr_o                   ), // word32_t
        .dmem_data_o        ( dmem_data_o                   )  // word32_t
    );


endmodule
