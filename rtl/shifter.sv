/*
    Shifter Unit (ALU)
    
    Inputs:
        shift_op_t oper_i:      Shift Operation
        word32_t rs1_val_i:     register 1 value
        word32_t rs2_val_i:     register 2 value
        logic    ready_i,:      signal to initiate computation
        logic    clk_i:         system clock


    Outputs:
        cdb_t    cdb_term_o:    common data bus term.
                                Is NO_VAL unless valid instruction
                                has been computed.


    Parameters:
        rs_tag_t TAG:           UNIQUE RS TAG
                                NOTE: MUST match shift rs tag
    
    Description:
        Funnel Shifter that performs SHIFT type instruction computations
*/

import data_types::*;

`timescale 1ns/10ps

module shifter #(
    parameter rs_tag_t TAG = SHIFT_1
)(
    // inputs
    input shift_op_t    oper_i,
    input word32_t      rs1_val_i,
    input word32_t      rs2_val_i,
    input logic         ready_i,
    input logic         clk_i,
    input logic         reset_i,
    
    // outputs
    output cdb_t        cdb_term_o
);

    rs_tag_t        tag;          // TAG in EX stage (NO_VAL or TAG
                                  // param)
    rs_tag_t        tag_broad;    // TAG in BROADCAST/WB stage
                                  // (NO_VAL or TAG param)
    word32_t        rd_val;       // reg val in EX stage
    word32_t        rd_val_broad; // reg val in BROADCAST/WB stage

    localparam SHIFT_BITWIDTH = $clog2(DWIDTH);
    logic [SHIFT_BITWIDTH-1:0]  shamt;
    logic [2*DWIDTH-2:0]        funnel_top;
    logic [2*DWIDTH-2:0]        funnel [SHIFT_BITWIDTH+1];
    logic                       left;

    logic [DWIDTH-2:0]  ft_low;     // Z[n-2:0]
    logic               ft_mid;     // Z[n-1]
    logic [DWIDTH-2:0]  ft_high;    // Z[2n-2:n]
    
    
    assign shamt                    = rs2_val_i[SHIFT_BITWIDTH-1:0];
    assign funnel[SHIFT_BITWIDTH]   = funnel_top;
    assign funnel_top               = {ft_high, ft_mid, ft_low};

    always_comb begin
        // default:
        left = '0;
        tag = TAG;
        ft_low  = 'x;
        ft_mid  = 'x;
        ft_high = 'x;

        case (oper_i)
            // logical shift right
            SRLR:    begin
                        ft_low  = rs1_val_i[DWIDTH-2:0];
                        ft_mid  = rs1_val_i[DWIDTH-1];
                        ft_high = '0;
                    end

            // logical shift right immediate
            SRLI:   begin
                        ft_low  = rs1_val_i[DWIDTH-2:0];
                        ft_mid  = rs1_val_i[DWIDTH-1];
                        ft_high = '0;
                    end

            // arithmatic shift right
            SRAR:    begin
                        ft_low  = rs1_val_i[DWIDTH-2:0];
                        ft_mid  = rs1_val_i[DWIDTH-1];
                        ft_high = $signed(rs1_val_i[DWIDTH-1]);
                    end

            // arithmatic shift right immediate
            SRAI:   begin
                        ft_low  = rs1_val_i[DWIDTH-2:0];
                        ft_mid  = rs1_val_i[DWIDTH-1];
                        ft_high = $signed(rs1_val_i[DWIDTH-1]);
                    end

            // --------------------------------------------
            // logical shift left
            SLLR:    begin
                        ft_low  = '0;
                        ft_mid  = rs1_val_i[0];
                        ft_high = rs1_val_i[DWIDTH-1:1];
                        left = '1;
                    end

            // logical shift left immediate
            SLLI:   begin
                        ft_low  = '0;
                        ft_mid  = rs1_val_i[0];
                        ft_high = rs1_val_i[DWIDTH-1:1];
                        left = '1;
                    end

            /*
            // ==================================================
            // THE REST ARE NOT RISCV INSTRUCTIONS, 
            // INLCUDED FOR THE SAKE OF COMPLETENESS
            // NOTE: NOT VERIFIED FOR CORRECTNESS
            // ==================================================
            

            // arithmatic shift left 
            SLA:    begin
                        ft_low  = $signed(rs1_val_i[0]);
                        ft_mid  = rs1_val_i[0];
                        ft_high = rs1_val_i[DWIDTH-1:1];
                        left = '1;
                    end
            
            // arithmatic shift left immediate 
            SLAI:   begin
                        ft_low  = $signed(rs1_val_i[0]);
                        ft_mid  = rs1_val_i[0];
                        ft_high = rs1_val_i[DWIDTH-1:1];
                        left = '1;
                    end

            // -----------------------------
            // rotations
            // -----------------------------

            // rotation shift right
            SRR:    begin
                        ft_low  = rs1_val_i[DWIDTH-2:0];
                        ft_mid  = rs1_val_i[DWIDTH-1];
                        ft_high = rs1_val_i[DWIDTH-2:0];
                    end

            // rotation shift right immediate
            SRRI:   begin
                        ft_low  = rs1_val_i[DWIDTH-2:0];
                        ft_mid  = rs1_val_i[DWIDTH-1];
                        ft_high = rs1_val_i[DWIDTH-2:0];
                    end

            // rotation shift left
            SLR:    begin
                        ft_low  = rs1_val_i[DWIDTH-1:1];
                        ft_mid  = rs1_val_i[0];
                        ft_high = rs1_val_i[DWIDTH-1:1];
                        left = '1;
                    end

            // rotation shift left immediate
            SLRI:   begin
                        ft_low  = rs1_val_i[DWIDTH-1:1];
                        ft_mid  = rs1_val_i[0];
                        ft_high = rs1_val_i[DWIDTH-1:1];
                        left = '1;
                    end
            */
            default:begin
                        tag = NO_VAL;
                    end
        endcase

        // funnel structure
        for (int i=SHIFT_BITWIDTH-1; i >=0; --i) begin
            funnel[i] = (shamt[i] ^ left) ? (funnel[i+1] >> (2**i)) : funnel[i+1];
        end
        
        /*
        // Unrolled 32-bit example
        funnel[4] = (shamt[4] ^ left) ? (funnel[5] >> (2**4)) : funnel[5];
        funnel[3] = (shamt[3] ^ left) ? (funnel[4] >> (2**3)) : funnel[4];
        funnel[2] = (shamt[2] ^ left) ? (funnel[3] >> (2**2)) : funnel[3];
        funnel[1] = (shamt[1] ^ left) ? (funnel[2] >> (2**1)) : funnel[2];
        funnel[0] = (shamt[0] ^ left) ? (funnel[1] >> (2**0)) : funnel[1];
        */
    end

    assign rd_val = funnel[0][DWIDTH-1:0];

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
endmodule
