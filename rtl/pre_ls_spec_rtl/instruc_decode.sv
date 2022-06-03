import data_types::*;

module instruc_decode #(
) (
    input logic[31:0] instruc_i,


    output alu_op_t alu_op_type_o, 
    output shift_op_t shift_op_type_o,
    output functional_group_t  func_group_o
);


    always_comb begin
        alu_op_type_o = ADDI;
        shift_op_type_o = SLLI;
        func_group_o = ALU;
        casez(instruc_i[21:0])
            //23'b??????_???????_???_0010011: begin
                //branch 
            //end

            // --------------------------
            // Register-Immediate Types
            // --------------------------
            22'b??????_??????_000_0010011: begin  // addi
                alu_op_type_o= ADDI;
                func_group_o = ALU;
            end
            22'b??????_??????_010_0010011: begin // slti
                alu_op_type_o= SLTI;
                func_group_o = ALU;
            end
            22'b??????_??????_011_0010011: begin // sltiu
                alu_op_type_o= SLTUI;
                func_group_o = ALU;
            end
            22'b??????_??????_100_0010011: begin // xori
                alu_op_type_o= XORI;
                func_group_o = ALU;
            end

            22'b000001_??????_101_0010011: begin
                shift_op_type_o = SRAI; // Arithmetic Right Shift
                func_group_o = SHIFT;
            end
            // Register-Immediate Shifts
            22'b000000_??????_101_0010011: begin
                shift_op_type_o = SRLI; // Logical Right Shift 
                func_group_o = SHIFT;
            end
            22'b000000_??????_001_0010011: begin
                shift_op_type_o = SLLI; // Logical Left Shift
                func_group_o = SHIFT;
            end

            // --------------------------
            // Register-Register Types
            // --------------------------
            22'b?????_0000000_000_0110011: begin
                alu_op_type_o = ADDR;  // rd = rs1 + rs2
                func_group_o = ALU;
            end
            22'b?????_1000000_000_0110011: begin
                alu_op_type_o = SUBR;  // rd = rs1 + ~rs2 + 1
                func_group_o = ALU;
            end
            22'b?????_0000000_010_0110011: begin
                alu_op_type_o = SLTR; // rd = (rs1 < rs2) ? 1 : 0  (treat both as SIGNED)
                func_group_o = ALU;
            end
            22'b?????_0000000_011_0110011: begin
                alu_op_type_o = SLTUR; // rd = (rs1 < rs2) ? 1 : 0  (treat both as UNSIGNED)
                func_group_o = ALU;
            end
            22'b?????_0000000_111_0110011: begin
                alu_op_type_o = ANDR; // rd = rs1 & rs2
                func_group_o = ALU;
            end
            22'b?????_0000000_110_0110011: begin
                alu_op_type_o = ORR;  // rd = rs1 | rs2
                func_group_o = ALU;
            end
            22'b?????_0000000_110_0110011: begin
                alu_op_type_o = XORR; // rd = rs1 ^ rs2
                func_group_o = ALU;
            end

            // Register-Register Shifts
            22'b?????_0000000_001_0110011: begin
                shift_op_type_o = SLLR;
                func_group_o = SHIFT;
            end
            22'b?????_0000000_101_0110011: begin
                shift_op_type_o = SRLR;
                func_group_o = SHIFT;
            end
            22'b?????_1000000_101_0110011: begin
                shift_op_type_o = SRAR;
                func_group_o = SHIFT;
            end

            default: begin
                alu_op_type_o = ADDI;
                shift_op_type_o = SLLI;
                func_group_o = ALU;
            end
        endcase
    end
endmodule



















