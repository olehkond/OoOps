/*
    First-in First-out (FIFO) data memory
    
    Inputs:
        write_data_i:   16-bit data to be written to fifo if not full
        write_i:        write enable (adds write_data_i to fifo), does nothing
                            if fifo is full
        read_i:         read enable (removes oldest entry in fifo), reads out 
                            random garbage if empty (UNDEFINED)
        reset_i:        resets fifo pointers to empty configuration, leaves
                        random data untouched
        clk_i:          system clock

    Outputs:
        full_o:         signal indicating fifo is full (writes do nothing)
        empty_o:        signal indicating fifo is empty (reads are garbage)
        read_data_o:    16-bit data that is the oldest entry in fifo, or 
                            garbage if empty

    Parameters:
        ENTRIES_POW2:   Determines the number of entries in the fifo via
                        the following formula:
                            Entries = 2^ENTRIES_POW2 - 1
                        e.g. ENTRIES_POW2=3: 2^3-1 = 7 entries
                        Note: acceptable values are >= 1

*/


import data_types::*;

`timescale 1ns/10ps

module fifo #(
    parameter ENTRIES_POW2 = 3
) (
    // inputs
    input word32_t  write_data_i,
    input logic     write_i,
    input logic     read_i,
    input logic     reset_i,
    input logic     clk_i,
    // outputs
    output logic    full_o,
    output logic    empty_o,
    output word32_t read_data_o
);
    // Asserts
    initial assert(ENTRIES_POW2 >= 1);

    // fifo holding data
    word32_t                    fifo [2**ENTRIES_POW2];

    // pointers to head and tail of fifo
    logic [ENTRIES_POW2-1:0]    head;
    logic [ENTRIES_POW2-1:0]    head_next;
    logic [ENTRIES_POW2-1:0]    head_plus1;
    logic [ENTRIES_POW2-1:0]    tail;
    logic [ENTRIES_POW2-1:0]    tail_next;
    logic [ENTRIES_POW2-1:0]    tail_plus1;

    // operation needing to be performed
    enum {READ_WRITE, READ, WRITE, NOTHING} oper;

    // status signals
    assign full_o  = (head == tail);
    assign empty_o = (head == tail_plus1);

    // pointer increments
    assign tail_plus1 = tail + 1;
    assign head_plus1 = head + 1;

    // oper combinational logic
    always_comb begin
        unique casez({write_i, read_i, full_o, empty_o})
            'b01?0:  oper = READ;      // non-empty fifo read
            'b1110:  oper = READ;      // read+write on full fifo
            'b100?:  oper = WRITE;     // write to non-full fifo
            'b11?1:  oper = WRITE;     // read+write on empty fifo
            'b1100:  oper = READ_WRITE;// read+write on non-full non-empty fifo
            default: oper = NOTHING;   // do nothing by default
        endcase
    end

    // next pointer value logic
    always_comb begin
        unique case(oper)
            READ:       begin head_next=head;       tail_next=tail_plus1; end
            WRITE:      begin head_next=head_plus1; tail_next=tail;       end
            READ_WRITE: begin head_next=head_plus1; tail_next=tail_plus1; end
            default:    begin head_next=head;       tail_next=tail;       end
        endcase
    end

    // always reading tail
	assign read_data_o = fifo[tail];

    always_ff @(posedge clk_i) begin
        // reset behavior
        if (reset_i) begin
            head <= '0;
            tail <= '1;

        // normal behavior
        end else begin
            // update pointers
            head <= head_next;
            tail <= tail_next;
        end
    end
    
    // write if appropriate
    always_ff @(posedge clk_i) begin
        if (((oper == WRITE) | (oper == READ_WRITE)) & (~reset_i))
            fifo[head]  <= write_data_i;
    end

endmodule
