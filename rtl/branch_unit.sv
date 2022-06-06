/*
    Branch Unit (ALU)
    
    Inputs:



    Outputs:


    Parameters:
*/


import data_types::*;

module branch_unit (
    // 
    input logic        reset_i,
    input logic        clk_i,
    input cdb_t        cdb_i,

    // Issue Logic interface
    // ========================================================================
    // the issue logic will assert a write signal to this reservation station
    // if the br is not busy and has "priority" in priority encoder logic
    input logic        write_i,
    input branch_op_t  branch_op_type_i,
    input rs_tag_t     tag1_i,
    input rs_tag_t     tag2_i,
    input word32_t     val1_i,
    input word32_t     val2_i,

    // Branch predictor interface
    // ========================================================================
    input logic        br_taken_i,
    output logic       cond_eval_o,
    output logic       corr_pred_o,

    // Instruction Fetch
    // ========================================================================
    input logic        issuing_branch_i
);
    res_station_t   br;
    branch_op_t     br_op;
    logic           br_taken;

    // comparators (evaluating condition)
    always_comb begin
        corr_pred_o = '0;
        case(br_op)
            BNE:    corr_pred_o = (( br.val1            != br.val2            ) == br_taken); // (rs1 != rs2)?
            BLT:    corr_pred_o = (( $signed(br.val1)   <  $signed(br.val2)   ) == br_taken); // (rs1 <  rs2)? (SIGNED)
            BLTU:   corr_pred_o = (( $unsigned(br.val1) <  $unsigned(br.val2) ) == br_taken); // (rs1 <  rs2)? (UNSIGNED)
            BGE:    corr_pred_o = (( $signed(br.val1)   >= $signed(br.val2)   ) == br_taken); // (rs1 >= rs2)? (SIGNED)
            BGEU:   corr_pred_o = (( $unsigned(br.val1) >= $unsigned(br.val2) ) == br_taken); // (rs1 >= rs2)? (UNSIGNED)
        endcase
    end

    // Logic on whether overwrite stored values (only for OP_WAIT state)
    logic write_op1, write_op2;

    always_comb begin
        // defaults:
        write_op1 = '0;
        write_op2 = '0;

        if ((cdb_i.tag != NO_VAL) & (cdb_i.tag == br.tag1)) begin
            write_op1 = '1;
        end
        if ((cdb_i.tag != NO_VAL) & (cdb_i.tag == br.tag2)) begin
            write_op2 = '1;
        end
    end

    // detect if br values will be up to date in the next cycle
    logic ops_ready_next_cycle;
    always_comb begin
        ops_ready_next_cycle = '0; // default

        // conditions when true:
        if ((br.tag1 != NO_VAL) & (br.tag2 != NO_VAL)) begin// both ops missing
            if (write_op1 & write_op2) begin
                ops_ready_next_cycle = '1;
            end
        end else if (br.tag1 != NO_VAL) begin   // only 1st op missing
            if (write_op1) begin
                ops_ready_next_cycle = '1;
            end
        end else if (br.tag2 != NO_VAL) begin   // only 2nd op missing
            if (write_op2) begin
                ops_ready_next_cycle = '1;
            end
        end
        // NOTE: assuming at least one operand is missing
        // if none were, we are not in OP_WAIT and don't care
    end

    enum {NO_BR, OP_WAIT, READY} state, next_state;

    assign cond_eval_o = (state == READY);
    always_comb begin
        next_state = NO_BR;

        case (state)
            NO_BR:      if (~write_i)                                     next_state = NO_BR;
                        else if ((tag1_i == NO_VAL) & (tag1_i == NO_VAL)) next_state = READY;
                        else                                              next_state = OP_WAIT;
            // --------------------------------------------------------------------------
            OP_WAIT:    if (ops_ready_next_cycle)                         next_state = READY;
                        else                                              next_state = OP_WAIT;
            // --------------------------------------------------------------------------
            READY:                                                        next_state = NO_BR;
        endcase
    end

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            state <= NO_BR;
        end else begin
            state <= next_state;
        end
    end

    always_ff @(posedge clk_i) begin
        if (issuing_branch_i) begin
            br_taken <= br_taken_i;
        end

        case (state)
            NO_BR:      if (write_i) begin
                            br.tag1 <= tag1_i;
                            br.tag2 <= tag2_i;
                            br.val1 <= val1_i;
                            br.val2 <= val2_i;
                            br_op   <= branch_op_type_i;
                        end
            OP_WAIT:    begin
                            if (write_op1) begin
                                br.tag1         <= NO_VAL;
                                br.val1         <= cdb_i.val;
                            end
                            if (write_op2) begin
                                br.tag2         <= NO_VAL;
                                br.val2         <= cdb_i.val;
                            end
                        end
            READY:      ;
        endcase
    end

endmodule
