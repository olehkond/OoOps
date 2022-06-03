
import data_types::*;

`timescale 1ns/10ps

module regfile_tb;
    // inputs
    logic clk_i;
    logic reset_i;
    
    // common data bus
    cdb_t cdb_i;

    // regfile 
    regfile_idx_t read_addr1_i, read_addr2_i;
    
    // register status
    regfile_idx_t reg_tag_idx_i;
    rs_tag_t      wr_tag_i;
    logic         wr_en_tag_i;
    
    // outputs
    word32_t     read_data1_o, read_data2_o;
    rs_tag_t     tag_o; 

    // instantiate regfile under test    
    regfile dut (.*);

    localparam CLOCK_PERIOD =2;
        
    // clock init
    initial begin
        clk_i <= 0;
        forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i;
    end

    task init();
        // set cdb 
        cdb_i          <= '{NO_VAL, 0, 0};

        // set regfile inputs
        read_addr1_i <= 5'd0;
        read_addr2_i <= 5'd2;
        
        // set register status inputs
        reg_tag_idx_i <= 0;
        wr_tag_i      <= NO_VAL;
        wr_en_tag_i   <= 1'b0;
        
        // asssert reset
        reset_i       <= 1'b1; @(posedge clk_i);
        reset_i       <= 1'b0;
    endtask

    task read_port1(input regfile_idx_t read_addr);
        read_addr1_i <= read_addr; //@(posedge clk_i);
    endtask
    
    task read_port2(input regfile_idx_t read_addr);
        read_addr2_i <= read_addr; //@(posedge clk_i);
    endtask
    
    task read_ports(input regfile_idx_t read_addr1,
                    input regfile_idx_t read_addr2);
        read_addr1_i <= read_addr1;
        read_addr2_i <= read_addr2; //@(posedge clk_i);
    endtask
        
    task check_tags_init();
        wr_en_tag_i <= 1'b0;
        for (int i = 0; i < REGFILE_SIZE; i++) begin
            reg_tag_idx_i <= i; @(posedge clk_i);
            assert (tag_o == NO_VAL);
        end
    endtask



    task write_tag(input regfile_idx_t rd, input rs_tag_t tag);
        // write_tag SIMULATES BEHAVIOR FROM THE ISSUE LOGIC 
        // -------------------------------------------------
        // An issue should overwrite the tag 
        // associated with register rd (the destination 
        // register)
        //
        reg_tag_idx_i <= rd;
        wr_tag_i      <= tag;
        wr_en_tag_i   <= 1'b1; @(posedge clk_i);
        wr_en_tag_i   <= 1'b0; @(posedge clk_i);
    endtask

    task set_cdb(input rs_tag_t tag, input word32_t val);
        // set_cdb SIMULATES WRITING DATA TO THE COMMON DATA BUS
        cdb_i.tag <= tag;
        cdb_i.val <= val; @(posedge clk_i);
    endtask

    task check_cdb_case_1();
        // TEST: check_cdb_case_1
        // -------------------------------------------------
        // this task checks whether setting the CDB
        // to NO_VAL results in an error where the
        // cdb tag matches each register status 
        // tag (all init'd to NO_VAL), causing the 
        // cdb to overwrite the entire regfile

        cdb_i.tag <= NO_VAL;
        cdb_i.val <= 32'hFEEF_FEEF;
        repeat(2) @(posedge clk_i);

        for (int i = 0; i < REGFILE_SIZE; i++) begin
            assert(dut.registers[i] != 32'hFEEF_FEEF);
        end
    endtask

    task cdb_write_1();
        // TEST: cdb_write_1
        // -------------------------------------------------
        // this tasks write to a regfile from the cdb
      
        // issue logic points x10's value to be generated
        // from ALU_1
        write_tag(5'd10, ALU_1); @(posedge clk_i);

        // check that the previously written tag wrote in
        // properly
        assert (tag_o == ALU_1);

        // common data bus broadcasts ALU_1's result
        read_addr1_i    <= 5'd10;
        cdb_i.tag       <= ALU_1;  
        cdb_i.val       <= 32'hCAFE_CAFE; @(posedge clk_i);

        // cdb is now broadcasting..
        // regfile sees this and updates reg_status[rd] to NO_VAL
        // and reg[rd] to 32'hCAFE_CAFE on next clk edge
                                          @(posedge clk_i);
        // check register state 
        assert(dut.registers[10] == 32'hCAFE_CAFE );
        assert(dut.reg_status_unit[10] == NO_VAL  );
                                   @(posedge clk_i);

    endtask

    task test2();
        // TEST: test2
        // ----------------------------------------------
        // this task tests the case where both the ISSUE LOGIC and 
        // cdb  wants to write a tag to register rd.
        //
        // the cdb writes back a value to the regfile where rd's current
        // tag matches the cdb's tag. the cdb would normally
        // set the matching register's tags to NO_VAL.
        //
        // Here in this test case, rd's tag matches cdb's tag
        // and rd is the destination of the current instruction being 
        // issued. cdb wants to write rd's tag to NO_VAL while the ISSUE LOGIC
        // wants to write rd's tag to whatever RS is available. We want 
        // issue logic to take priority here to maintain proper program flow

        // a shift instruction's tag is issue to the status instruction 
        // by issue logic for reg x20
        write_tag(5'd20, SHIFT_1);
        read_addr1_i <= 5'd20;     @(posedge clk_i);

        // in this clock cycle, the SHIFT_1 unit finishes and broadcasts its value
        // on the next clock edge
        cdb_i.tag  <= SHIFT_1;
        cdb_i.val  <= 32'hBEEB_BABA;

        // on the next clock edge, the issue logic wants to issue another instruction
        // writing to x20, the tag ALU_2 should overwrite SHIFT_1
        reg_tag_idx_i <= 5'd20;
        wr_tag_i      <= ALU_2;
        wr_en_tag_i   <= 1'b1; @(posedge clk_i);
        wr_en_tag_i   <= 1'b0;

        // regfile sees changes, write internal state on next clock edge
                               @(posedge clk_i);
        assert(dut.registers[20] == 32'hBEEB_BABA);                       
        assert(dut.reg_status_unit[20] == ALU_2);
        
        @(posedge clk_i);
    endtask


    task simulate_write(input word32_t      test_value,
                        input regfile_idx_t rd, 
                        input rs_tag_t      tag);

        // simulates a regfile write through all the "proper channels"
        // regfile write is read through port 1
        write_tag(rd,tag);
        set_cdb(tag, test_value);
        read_port1(rd);
        @(posedge clk_i);

        wr_en_tag_i <= 1'b0;
        $display("%h %h",test_value, dut.registers[rd]);
        if ( rd != '0 )
            assert(dut.registers[rd] == test_value);
        else
            assert(dut.registers[rd] == 0);
    endtask

    initial begin
        $vcdpluson;
        $vcdplusmemon;
        
        init();    @(posedge clk_i);
        // reset should initialize registers to 0
        
        cdb_write_1();

        // add a cycle of delay between tests
        @(posedge clk_i);

        test2();

        // add a cycle of delay between tests
        @(posedge clk_i);

        simulate_write(32'hFFFF_FFFF, 5'd0, ALU_1); // check that x0 and its tag cannot change
        simulate_write(32'hABAB_ABAB, 5'd1, ALU_2); // check general write and read case
        
        @(posedge clk_i);
        $vcdplusoff;
        $finish;
    end

endmodule
