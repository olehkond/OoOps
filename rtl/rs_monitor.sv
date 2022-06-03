import data_types::*;

`timescale 1ns/10ps

module rs_monitor (
    input logic [NUM_RS-1:0]  busy_bus_i, // input FROM res. stations
    input functional_group_t  func_group, // input FROM issue logic
    output rs_tag_t rs_tag_o,             // output TO issue logic 
    output logic [$clog2(NUM_RS+1)-1:0] rs_tag_address_o
);

    logic [NUM_ALU_RS  -1:0] alu_busy_bus;
    logic [NUM_SHIFT_RS-1:0] shift_busy_bus;

    logic [$clog2(NUM_ALU_RS)  -1:0] alu_addr;
    logic alu_addr_valid;

    logic [$clog2(NUM_SHIFT_RS)-1:0] shift_addr;
    logic shift_addr_valid;

    logic [NUM_RS-1:0] busy_bus_inv;

    assign busy_bus_inv = ~busy_bus_i;

    assign alu_busy_bus   = busy_bus_inv[NUM_ALU_RS - 1:0];

    /*if ( NUM_SHIFT_RS == 0 ) 
        assign shift_busy_bus = '0;
    else*/ 
    assign shift_busy_bus = busy_bus_inv[NUM_ALU_RS + NUM_SHIFT_RS - 1:NUM_ALU_RS];

    priority_encoder #(.N(NUM_ALU_RS))  priority_ALU    (.in_i(alu_busy_bus), 
                                                         .out_o(alu_addr),
                                                         .valid_o(alu_addr_valid));

    priority_encoder #(.N(NUM_SHIFT_RS)) priority_SHIFT (.in_i(shift_busy_bus), 
                                                         .out_o(shift_addr),
                                                         .valid_o(shift_addr_valid));
    
    // this comb. block looks at the encoded address and valid bit from p. encoders
    // if the valid bit is high, the encoded address gets incremented (RS address '0
    // indicates NO_VAL, so the input 000...001 should be 00.01 not 00.00 )
    // otherwise the alu_addr is a don't care and must be set to NO_VAL ('0)
    always_comb begin
        rs_tag_address_o = '0;
        case(func_group) // based off func_group, check available RS for each function
            ALU:     if   (alu_addr_valid)   rs_tag_address_o = alu_addr    + 'd1; 
            SHIFT:   if   (shift_addr_valid) rs_tag_address_o = shift_addr  + 'd1 + NUM_ALU_RS;
        endcase
    end


    assign rs_tag_o = STATION_LIST[rs_tag_address_o];
endmodule


