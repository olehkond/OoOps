import data_types::*;

`timescale 1ns/10ps

module rs_monitor_tb;

    
    logic [NUM_RS-1:0]  busy_bus_i;
    functional_group_t  func_group;
    rs_tag_t rs_tag_o;
    logic [$clog2(NUM_RS)-1:0] rs_tag_address_o;

    rs_monitor dut (.*);

    initial begin
        $vcdpluson;
        $vcdplusmemon;

        busy_bus_i = 6'b000_000;
        func_group = ALU;         #10;
        func_group = SHIFT;      

        busy_bus_i = 6'b100_000; #10;
        for (int i = 0; i < 6; i++) begin
            busy_bus_i = busy_bus_i >> 1; #10;
        end

        func_group = ALU; 

        busy_bus_i = 6'b100_000; #10;
        for (int i = 0; i < 6; i++) begin
            busy_bus_i = busy_bus_i >> 1 | busy_bus_i; #10;
        end

        busy_bus_i = '0; #10;
        func_group = SHIFT; #10;


        $vcdplusoff;
        $finish;

    end
endmodule
