

import data_types::*;

module basic_dmem_model #(
    parameter LATENCY   = 1,
              SIZE_POW2 = 20
) (
    input logic     clk_i,
    input logic     reset_i,
    
    input logic     dmem_read_i,
    input logic     dmem_write_i,
    input word32_t  dmem_addr_i,
    input word32_t  dmem_data_i,

    output word32_t dmem_rd_data_o,
    output logic    dmem_done_o
);
    
    logic [7:0] memory [2**SIZE_POW2];

    enum { IDLE, STORE, LOAD } state, state_next;

    logic start;
    assign start = dmem_read_i | dmem_write_i;
    
    logic [SIZE_POW2-1:0]   address;
    word32_t                data_st;
    logic                   done_next;

    counter #(.COUNT(LATENCY)) counter (
        .clk_i      ( clk_i         ), // logic
        .reset_i    ( reset_i       ), // logic
        .start_i    ( start         ), // logic

        .done_next_o( done_next     ), // logic
        .done_o     ( dmem_done_o   ) // logic
    );

    always_comb begin
        case (state)
            IDLE:       if      (dmem_read_i)  state_next = LOAD;
                        else if (dmem_write_i) state_next = STORE;
                        else                   state_next = IDLE;
            // ----------------------------------------------------------------
            STORE:      if (dmem_done_o)       state_next = IDLE;
                        else                   state_next = STORE;
            // ----------------------------------------------------------------
            LOAD:       if (dmem_done_o)       state_next = IDLE;
                        else                   state_next = LOAD;
            // ----------------------------------------------------------------
            default:                           state_next = IDLE;
        endcase
    end

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            state <= IDLE;
        end else begin
            state <= state_next;
        end
    end

    logic [SIZE_POW2-1:0] eff_address;
    assign eff_address = dmem_addr_i[SIZE_POW2-3:0] << 2; //{dmem_addr_i[SIZE_POW2-1:2], 2'd0};

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            for (int i=0; i<2**SIZE_POW2; ++i) begin
                memory[i] <= '0;
            end
        end else begin
            if (LATENCY == 1) begin
                if (dmem_read_i) begin
                    dmem_rd_data_o <= {memory[eff_address + 3],
                                       memory[eff_address + 2],
                                       memory[eff_address + 1],
                                       memory[eff_address    ]};
                end else if (dmem_write_i) begin
                    memory[eff_address + 'd3] <= data_st[31:24];
                    memory[eff_address + 'd2] <= data_st[23:16];
                    memory[eff_address + 'd1] <= data_st[15:8 ];
                    memory[eff_address      ] <= data_st[ 7:0 ];
                end
            end else begin
                case (state)
                IDLE:   if (start) begin
                            address <= eff_address;
                            data_st <= dmem_data_i;
                        end
                LOAD:   if (done_next) begin
                            dmem_rd_data_o <= {memory[address + 3],
                                               memory[address + 2],
                                               memory[address + 1],
                                               memory[address    ]};
                        end
                STORE:  if (done_next) begin
                            memory[address + 'd3] <= data_st[31:24];
                            memory[address + 'd2] <= data_st[23:16];
                            memory[address + 'd1] <= data_st[15:8 ];
                            memory[address      ] <= data_st[ 7:0 ];
                        end
                endcase
            end
        end
    end


endmodule


module counter #(
    parameter COUNT = 1
) (
    input logic     clk_i,
    input logic     reset_i,
    input logic     start_i,

    output logic    done_next_o,
    output logic    done_o
);
    logic [$clog2(COUNT):0] val;
    logic [$clog2(COUNT):0] val_plus1;
    assign val_plus1 = val + 1;

    enum { IDLE, COUNTING } state, state_next;

    localparam logic [$clog2(COUNT)-1:0] TOP_VAL = COUNT - 1;
    assign done_o      = (val       == TOP_VAL) & (state == COUNTING);
    assign done_next_o = (val_plus1 == TOP_VAL) & (state == COUNTING);

    always_comb begin
        // default
        state_next = IDLE;

        case (state)
            IDLE:       if (start_i)        state_next = COUNTING;
                        else                state_next = IDLE;
            // ----------------------------------------------------------------
            COUNTING:   if (val == COUNT-1) state_next = IDLE;
                        else                state_next = COUNTING;
        endcase
    end

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            state <= IDLE;
            val <= '0;
        end else begin
            state <= state_next;
            case (state)
                IDLE:       val <= '0;
                COUNTING:   val <= val_plus1;
            endcase
        end
    end

endmodule
