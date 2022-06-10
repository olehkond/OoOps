
import data_types::*;

`timescale 1ns/10ps

module fifo_tb();
    // inputs 
    word32_t    write_data_i;
    logic       write_i;
    logic       read_i;
    logic       reset_i;
    logic       clk_i;
    // outputs
    logic       full_o;
    logic       empty_o;
    word32_t    read_data_o;

    localparam ENTRIES_POW2 = 3;
    localparam CLOCK_PERIOD = 2;

    // clock init
    initial begin
        clk_i <= 0;
        forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i;
    end


    // device under test
    fifo #(.ENTRIES_POW2(ENTRIES_POW2)) dut (.*);

    // define tasks
    // ==========================================
    task reset();
        reset_i<=1; write_i<=0; read_i<=0; @(posedge clk_i);
        reset_i<=0;
    endtask

    task write(input word32_t wdata);
        write_data_i<=wdata;  write_i<=1; read_i<=0; @(posedge clk_i);
                              write_i<=0;
    endtask

    task read();
        write_i<=0; read_i<=1; @(posedge clk_i);
                    read_i<=0;
    endtask

    task read_and_write(input word32_t wdata);
        write_data_i<=wdata;  write_i<=1; read_i<=1; @(posedge clk_i);
                              write_i<=0; read_i<=0;
    endtask
    
    task wait_cycle();
        write_i<=0; read_i<=0; @(posedge clk_i);
    endtask

    // main stimulus
    initial begin
        $vcdpluson;
        reset();
        reset();

        read(); // read on empty fifo should do nothing

        // fill fifo
        write(32'd1);
        write(32'd2);
        write(32'd3);
        write(32'd4);
        write(32'd5);
        write(32'd6);
        write(32'd7);

        repeat(4) wait_cycle();

        read();
        read();
        read();
        read();
        read();
        read();
        read();

        read(); // read should have no effect

        repeat(4) wait_cycle();

        // put some data into (not full) fifo and read and write simultaneously
        write(32'd1);
        write(32'd2);
        write(32'd3);
        read_and_write(32'd4);
        write(32'd5);

        repeat(4) wait_cycle();

        read();
        read();
        read();

        repeat(4) wait_cycle();
        $vcdplusoff;
        $finish;
    end

endmodule

