
import data_types::*;

module basic_dmem_model_tb();
    localparam  LATENCY   = 3,
                SIZE_POW2 = 12;

    logic     clk_i;
    logic     reset_i;
    
    logic     dmem_read_i;
    logic     dmem_write_i;
    word32_t  dmem_addr_i;
    word32_t  dmem_data_i;

    word32_t  dmem_rd_data_o;
    logic     dmem_done_o;

    basic_dmem_model #(.LATENCY(LATENCY), .SIZE_POW2(SIZE_POW2)) dut (.*);

    localparam CLOCK_PERIOD = 10;

    // clock init
    initial begin
        clk_i <= '0;
        forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i;
    end

    task reset();
        reset_i         <= '1;
        dmem_read_i     <= '0;
        dmem_write_i    <= '0;
        dmem_addr_i     <= '0;
        dmem_data_i     <= '0;
        repeat(2) @(posedge clk_i);
        reset_i         <= '0;
    endtask

    initial begin
        $vcdpluson;
        $vcdplusmemon;

        reset();
        repeat(5) @(posedge clk_i);

        $vcdplusoff;
        $finish;
    end
endmodule
