/*
    Arithmatic Logic Unit (ALU)
    
    Inputs:



    Outputs:


    Parameters:
*/

import data_types::*;

module alu #(
    parameter rs_tag_t TAG = ALU_1
) (
    // inputs
    input  alu_op_t             oper_i,
    input  word32_t             rs1_val_i,
    input  word32_t             rs2_val_i,
    input  logic                ready_i,
    input  logic                clk_i,
    input  logic                reset_i,

    // outputs
    output cdb_t                cdb_term_o  // common data bus term
);

    rs_tag_t                  tag;          // TAG in EX stage (NO_VAL or TAG
                                            // param)
    rs_tag_t                  tag_broad;    // TAG in BROADCAST/WB stage
                                            // (NO_VAL or TAG param)
    word32_t                  rd_val;       // reg val in EX stage
    word32_t                  rd_val_broad; // reg val in BROADCAST/WB stage

    // EX stage behavior
    always_comb begin
        case(oper_i)
            // Register-Immediate types
            ADDI:   begin
                        rd_val = rs1_val_i + rs2_val_i;
                        tag    = TAG;
                    end
            SLTI:   begin
                        rd_val = ($signed(rs1_val_i) < $signed(rs2_val_i)) ? 
                                    'd1 : 'd0;
                        tag    = TAG;
                    end
            SLTUI:  begin
                        rd_val = ($unsigned(rs1_val_i) < $unsigned(rs2_val_i)) ?
                                    'd1 : 'd0;
                        tag    = TAG;
                    end
            ANDI:   begin
                        rd_val = rs1_val_i & rs2_val_i;
                        tag    = TAG;
                    end
            ORI:    begin
                        rd_val = rs1_val_i | rs2_val_i;
                        tag    = TAG;
                    end
            XORI:   begin
                        rd_val = rs1_val_i ^ rs2_val_i;
                        tag    = TAG;
                    end


            // Register-Register tpyes
            ADDR:   begin
                        rd_val = rs1_val_i + rs2_val_i;
                        tag    = TAG;
                    end
            SUBR:   begin
                        rd_val = rs1_val_i + ~rs2_val_i + 1'b1;
                        tag    = TAG;
                    end
            SLTR:   begin
                        rd_val = ($signed(rs1_val_i) < $signed(rs2_val_i)) ?
                                    'd1 : 'd0;
                        tag    = TAG;
                    end
            SLTUR:  begin
                        rd_val = ($unsigned(rs1_val_i) < $unsigned(rs2_val_i))?
                                    'd1 : 'd0;
                        tag    = TAG;
                    end
            ANDR:   begin
                        rd_val = rs1_val_i & rs2_val_i;
                        tag    = TAG;
                    end
            ORR:    begin
                        rd_val = rs1_val_i | rs2_val_i;
                        tag    = TAG;
                    end
            XORR:   begin
                        rd_val = rs1_val_i ^ rs2_val_i;
                        tag    = TAG;
                    end
            default:begin
                        rd_val = 'x;
                        tag    = NO_VAL;
                    end
        endcase
    end


    // Broadcast/WB stage behavior
    always_ff @(posedge clk_i) begin
        if (ready_i) begin
            cdb_term_o.tag  <= tag;
            cdb_term_o.val  <= rd_val;
        end else begin
            cdb_term_o.tag  <= NO_VAL;
            // rd_val can be anything, since the tag is NO_VAL, no RS
            // will use that value
        end
    end


    // term to broadcast on common data bus (either NO_VAL, or TAG param)
    // paired with calculated value and regfile index
    //assign cdb_term_o.tag = tag_broad;
    //assign cdb_term_o.val = rd_val_broad;

endmodule
