/* 
    Reservation Station
        
    Inputs:

    Outputs:


    Parameters:


*/

import data_types::*;

`timescale 1ns/10ps

module res_station #(
    parameter rs_tag_t TAG = ALU_1
) (
    // inputs
    input logic        reset_i,
    input logic        clk_i,
    input cdb_t        cdb_i,

    // the issue logic will assert a write signal to this reservation station
    // if the RS is not busy and has "priority" in priority encoder logic
    input logic        write_i,
    input alu_op_t     alu_opcode_i,
    input shift_op_t   shift_opcode_i,
    input rs_tag_t     tag1_i,
    input rs_tag_t     tag2_i,
    input word32_t     value1_i,
    input word32_t     value2_i,

    output logic       fu_ready_o, // signal to functional unit to start computing
    output alu_op_t    fu_alu_oper_o,
    output shift_op_t  fu_shift_oper_o,
    output word32_t    fu_rs1_val_o,
    output word32_t    fu_rs2_val_o,
    output logic       busy_o
);
    // internal state-holder
    res_station_t rs;

    assign fu_rs1_val_o = rs.val1;
    assign fu_rs2_val_o = rs.val2;

    // Logic on whether overwrite stored values (only for OP_WAIT state)
    logic write_op1, write_op2;

    always_comb begin
        // defaults:
        write_op1 = '0;
        write_op2 = '0;

        if ((cdb_i.tag != NO_VAL) & (cdb_i.tag == rs.tag1)) begin
            write_op1 = '1;
        end
        if ((cdb_i.tag != NO_VAL) & (cdb_i.tag == rs.tag2)) begin
            write_op2 = '1;
        end
    end

    // detect if rs values will be up to date in the next cycle
    logic ops_ready_next_cycle;
    always_comb begin
        ops_ready_next_cycle = '0; // default

        // conditions when true:
        if ((rs.tag1 != NO_VAL) & (rs.tag2 != NO_VAL)) begin// both ops missing
            if (write_op1 & write_op2) begin
                ops_ready_next_cycle = '1;
            end
        end else if (rs.tag1 != NO_VAL) begin   // only 1st op missing
            if (write_op1) begin
                ops_ready_next_cycle = '1;
            end
        end else if (rs.tag2 != NO_VAL) begin   // only 2nd op missing
            if (write_op2) begin
                ops_ready_next_cycle = '1;
            end
        end
        // NOTE: assuming at least one operand is missing
        // if none were, we are not in OP_WAIT and don't care
    end


    enum {NO_INSTR, OP_WAIT, READY, WAIT_4_FIN} state, state_next;

    word32_t cdb_val;
    
    // state logic
    always_comb begin
        // defaults:
        fu_ready_o = '0;   // only high in READY state
        busy_o      = '1;   // only low in NO_INSTR state

        cdb_val = '0;
        case(state)
            // Reservation station doesnt have instruction and is doing nothing
            NO_INSTR:   begin
                            // without a write signal, do nothing
                            if (!write_i)
                                state_next = NO_INSTR;
                            // with write signal, check if ready to calulate
                            else if ((tag1_i == NO_VAL) && (tag2_i == NO_VAL))
                                state_next = READY;
                            // if not wait until operands appear on CDB
                            else
                                state_next = OP_WAIT;
                            busy_o = '0;
                        end
            // Reservation station has instruction but not enough info to
            // begin computation
            OP_WAIT:    begin
                            cdb_val = cdb_i.val;
                            // if operands are ready, move to READY
                            if (ops_ready_next_cycle)
                                state_next = READY;
                            // otherwise keep waiting
                            else
                                state_next = OP_WAIT;
                        end
            // All instrustion info is held, must be issued to functional unit
            READY:      begin
                            // Only ever stay in READY for 1 cycle
                            state_next = WAIT_4_FIN;
                            fu_ready_o = '1;
                        end
            // Instruction issued, waiting for it to complete (self-TAG)
            // appears on CDB. Issue logic may kickstart completion by writing
            // to reservation station before it self-detects completion
            WAIT_4_FIN: begin
                            // if written to, accept it as if in NO_INSTR
                            if (write_i) begin
                                if ((tag1_i == NO_VAL) && (tag2_i == NO_VAL))
                                    state_next = READY;
                                else
                                    state_next = OP_WAIT;
                            // otherwise check cdb for self-tag (comp finished)
                            end else if (cdb_i.tag == TAG) begin
                                state_next = NO_INSTR;
                            // else keep waiting
                            end else begin
                                state_next = WAIT_4_FIN;
                            end
                        end
            // should never find ourselves in default
            default: state_next = NO_INSTR;
        endcase
    end

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            state <= NO_INSTR;
        end else begin
            state <= state_next;
        end
    end


    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            rs.tag1 <= NO_VAL;
            rs.tag2 <= NO_VAL;
            rs.val1 <= '0;
            rs.val2 <= '0;
        end else begin
            case(state)
                // update internal state on write
                NO_INSTR:   begin
                            if (write_i) begin
                                rs.tag1 <= tag1_i;
                                rs.tag2 <= tag2_i;
                                rs.val1 <= value1_i;
                                rs.val2 <= value2_i;

                                // capture fu op type
                                fu_alu_oper_o   <= alu_opcode_i;
                                fu_shift_oper_o <= shift_opcode_i;
                            end
                        end
                // update internal state when useful info
                // appears on CDB
                OP_WAIT:    begin
                            if (write_op1) begin
                                rs.tag1 <= NO_VAL;
                                rs.val1 <= cdb_val;//cdb_i.val;
                            end
                            if (write_op2) begin
                                rs.tag2 <= NO_VAL;
                                rs.val2 <= cdb_val;//cdb_i.val;
                            end
                        end
                // no changes to internal state when issuing to FU
                READY:      ;
                // bahave as if NO_INSTR if written to
                // (issue logic flexability)
                WAIT_4_FIN: begin
                            if (write_i) begin
                                rs.tag1 <= tag1_i;
                                rs.tag2 <= tag2_i;
                                rs.val1 <= value1_i;
                                rs.val2 <= value2_i;

                                // capture fu op type
                                fu_alu_oper_o   <= alu_opcode_i;
                                fu_shift_oper_o <= shift_opcode_i;
                            end
                        end
            endcase
        end
    end
endmodule

