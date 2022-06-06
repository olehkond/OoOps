module priority_encoder_tb;

    localparam N = 8;

    logic [N-1:0] in_i;
    logic [$clog2(N)-1:0] out_o;
    logic valid_o; 


    priority_encoder #(.N(N)) dut (.*);

    initial begin
        $vcdpluson;

        for (int i = 0; i < 2**N; i++) begin
            in_i = i; #10;
        end
        $vcdplusoff;
        $finish;
    end

endmodule
