/*
    Arithmatic Logic Unit (ALU)
    
    Inputs:



    Outputs:


    Parameters:
*/


import data_types::*;

module alu_br #(
    parameter rs_tag_t TAG = ALU_0
) (
    // inputs
    input  alu_op_t             oper_i,
    input  word32_t             pc_val_i,
    input logic signed [11:0]   imm12_i,
    // outputs
    output word32_t             pc_val_o,       // if branch oper, pc value
    output logic                branch_taken_o  // was branch taken
);

    logic signed [DWIDTH-1:0] imm12_se;     // sign-extended immediate
    signed word32_t           rd_val;       // reg val in EX stage
    signed word32_t           rd_val_broad; // reg val in BROADCAST/WB stage

    word32_t                  pc_val;
    logic                     branch_taken;

    // SE immediate
    assign imm12_se = $signed(imm12_i); 

    // EX stage behavior
    always_ff @(posedge clk_i) begin
        if (~ready_i) begin
            pc_val       <= '0;
            branch_taken <= '0;
        end
        else begin
        case(oper_i)
            BEQ:    begin
                        tag    <= NO_VAL;
                        rd_idx <= '0;

                        branch_taken <= (rs1_val_i == rs2_val_i);
                        is_branch    <= '1;
                        //pc_val       <= (rs1_val_i == rs2_val_i) ? ;
                    end
            BNEQ:   begin
                        
                        
                    end
            BLT:    begin
                        
                        
                    end
            BLTU:   begin
                        
                        
                    end
            BGE:    begin
                        
                        
                    end
            BGEU:   begin
                        
                        
                    end
            JMP:    begin
                        
                        
                    end
            // NOOP
            default:begin
                        
                        
                        
                    end
        endcase
        end

        // Broadcast/WB stage behavior
        always_ff @(posedge clk_i) begin
            
            
        end
    end
