import data_types::*;

`timescale 1ns/10ps

module res_station_tb();
    localparam rs_tag_t TAG = ALU_1;
    // inputs
    logic     reset_i;
    logic     clk_i;
    cdb_t     cdb_i;

    // the issue logic will assert a write signal to this reservation station
    // if the RS is not busy and has "priority" in priority encoder logic
    logic     write_i;
    alu_op_t  alu_opcode_i;
    shift_op_t shift_opcode_i;
    rs_tag_t  tag1_i;
    rs_tag_t  tag2_i;
    word32_t  value1_i;
    word32_t  value2_i;

    logic    fu_ready_o; // signal to functional unit to start computing
    alu_op_t fu_alu_oper_o;
    shift_op_t fu_shift_oper_o;
    word32_t fu_rs1_val_o;
    word32_t fu_rs2_val_o;
    logic    busy_o;

    localparam CLOCK_PERIOD = 10;

    // clock init
    initial begin
        clk_i <= 0;
        forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i;
    end

    // ---------------------------------
    // device under test
    res_station #(.TAG(TAG)) dut (.*);

    task load_instr_cdb(input logic      wr_en,
                              alu_op_t   oper,
                              rs_tag_t   tag1,
                              rs_tag_t   tag2,
                              word32_t   val1,
                              word32_t   val2,
                              rs_tag_t   cdb_tag,
                              word32_t   cdb_val
                       );
        // instr issued
        write_i   <= wr_en;
        alu_opcode_i  <= oper;
        tag1_i    <= tag1;
        tag2_i    <= tag2;
        value1_i  <= val1;
        value2_i  <= val2;

        // cdb
        cdb_i.tag <= cdb_tag;
        cdb_i.val <= cdb_val;
        @(posedge clk_i);

        // clean up inputs
        cdb_i.tag <= NO_VAL;
        write_i   <= '0;
        alu_opcode_i  <= ADDI;
        tag1_i    <= NO_VAL;
        tag2_i    <= NO_VAL;
        value1_i  <= 'x;
        value2_i  <= 'x;
    endtask

    task load_ready_instr(input alu_op_t   oper,
                                word32_t   val1,
                                word32_t   val2
                         );
        load_instr_cdb(
            '1,
            oper,
            NO_VAL,
            NO_VAL,
            val1,
            val2,
            NO_VAL,
            'x
        );
    endtask
    

    task load_not_ready_instr(input alu_op_t   oper,
                                    rs_tag_t   tag1,
                                    rs_tag_t   tag2,
                                    word32_t   val1,
                                    word32_t   val2
                         );
        if ((tag1 == NO_VAL) & (tag2 == NO_VAL)) begin
            $display("TB WARNING: Issuing ready instruction");
        end
        
        load_instr_cdb(
            '1,
            oper,
            tag1,
            tag2,
            val1,
            val2,
            NO_VAL,
            'x
        );
    endtask

    task load_cdb_only(input rs_tag_t   cdb_tag,
                             word32_t   cdb_val
                      );
        load_instr_cdb(
            '0,
            ADDI,
            NO_VAL,
            NO_VAL,
            'x,
            'x,
            cdb_tag,
            cdb_val
        );
    endtask

    task reset();
        cdb_i.tag <= NO_VAL;
        cdb_i.val <= 'x;
        write_i   <= '0;
        shift_opcode_i <= SLLI;
        reset_i <= 1'b1; repeat(2) @(posedge clk_i); reset_i <= 1'b0;
    endtask

    task wait_cycles( int num_cycles);
        cdb_i.tag <= NO_VAL;
        cdb_i.val <= 'x;
        write_i   <= '0;
        repeat(num_cycles) @(posedge clk_i);
    endtask 


    // main stimulus
    initial begin
        $vcdpluson;
        // ------------------------------------------------
        // test 1: issue ready instruction and finish computation
        reset();
        load_ready_instr( ADDI, 43, 7 );
        wait_cycles(3);
        load_cdb_only(ALU_2, 858); // some other tag appears on CDB
        wait_cycles(3);
        load_cdb_only(TAG, 50); // this RS's tag appears on CDB
        wait_cycles(3);

        // ------------------------------------------------
        // test 2: issue instruction with single missing value
        load_not_ready_instr( SUBR, NO_VAL, ALU_2, 40, 4 );
        wait_cycles(3);
        load_cdb_only(ALU_2, 50); // missing info arrives
        wait_cycles(3);
        load_cdb_only(TAG, -10); // this RS's tag appears on CDB
        wait_cycles(3);

        // ------------------------------------------------
        // test 3: issue instruction with two missing values
        load_not_ready_instr( ADDR, ALU_3, ALU_2, 13, 12 );
        wait_cycles(3);
        load_cdb_only(ALU_3, 30); // missing info arrives
        wait_cycles(3);
        load_cdb_only(ALU_2, 20); // missing info arrives
        wait_cycles(3);
        load_cdb_only(TAG, 50); // this RS's tag appears on CDB
        wait_cycles(3);

        // ------------------------------------------------
        // test 4: issue instruction with two missing values of the same kind
        load_not_ready_instr( ORR, ALU_2, ALU_2, 43, 7 );
        wait_cycles(3);
        load_cdb_only(ALU_2, 5); // missing info arrives
        wait_cycles(3);
        load_cdb_only(TAG, 5); // this RS's tag appears on CDB
        wait_cycles(3);

        // ------------------------------------------------
        // test 5: issue instruction with as previous instr finishes
        load_not_ready_instr( XORR, ALU_2, ALU_2, 43, 7 );
        wait_cycles(3);
        load_cdb_only(ALU_2, 5); // missing info arrives
        wait_cycles(3);
        // write to res station early
        load_instr_cdb(
        '1,     // wr_en
        ADDI,   // oper
        NO_VAL, // tag1
        NO_VAL, // tag2
        20,     // val1
        2,      // val2
        TAG,    // cdb_tag // IMPORTANT: MUST be issued as previous result is
        0       // cdb_val // announced on CDB
        );
        wait_cycles(3);
        load_cdb_only(TAG, 22); // this RS's tag appears on CDB
        wait_cycles(3);

        // ------------------------------------------------
        // test 6: issue instruction with as previous instr finishes (again)
        load_not_ready_instr( XORR, ALU_2, ALU_2, 43, 7 );
        wait_cycles(3);
        load_cdb_only(ALU_2, 5); // missing info arrives
        wait_cycles(3);
        // write to res station early
        load_instr_cdb(
        '1,     // wr_en
        ADDI,   // oper
        NO_VAL, // tag1
        ALU_3,  // tag2
        20,     // val1
        2,      // val2
        TAG,    // cdb_tag // IMPORTANT: MUST be issued as previous result is
        0       // cdb_val // announced on CDB
        );
        wait_cycles(3);
        load_cdb_only(ALU_3, 5);
        wait_cycles(3);
        load_cdb_only(TAG, 25); // this RS's tag appears on CDB
        wait_cycles(3);

        $vcdplusoff;
        $finish;
    end

endmodule
