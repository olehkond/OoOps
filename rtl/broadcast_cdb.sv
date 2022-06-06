
`timescale 1ns/10ps

import data_types::*;

module broadcast_cdb #(
    parameter NUM_RS_STATIONS = 5
) (
    input cdb_t [NUM_RS_STATIONS-1:0]   fu_res_i,
    input logic                         clk_i,
    input logic                         RST_i,
    output cdb_t                        broadcast_o
);
    
    // holding registers from functional units
    cdb_t [NUM_RS_STATIONS-1:0]  rs_stations;

    // signals detailing when to overwrite and whether reg holds a useful value
    logic [NUM_RS_STATIONS-1:0]  overwrite;
    logic [NUM_RS_STATIONS-1:0]  valid;

    // combinational flags logic
    always_comb begin
        for (integer i = 0; i < NUM_RS_STATIONS; ++i) begin
            // Default to low
            overwrite[i] = '0;
            valid[i]     = '0;


            // if functional unit is producing valid result, overwrite
            if (fu_res_i[i].tag != NO_VAL) begin
                overwrite[i] = '1;
            end

            // if the rs station holds a non-NO_VAL tag, it holds a value that
            // needs to be broadcast
            if (rs_stations[i].tag != NO_VAL) begin
                valid[i] = '1;
            end

            // NOTE: we assume functional unit will never overwrite a valid
            // rs station register since the RS station does not dispatch an
            // instruction until it sees it's own tag on the CDB
        end
    end

    // --------------------------------------------------
    logic valid_broadcast;
    logic [$clog2(NUM_RS_STATIONS)-1:0]  broad_sel;

    // selects an rs value to broadcast 
    priority_encoder #(.N(NUM_RS_STATIONS)) broad_priority_sel (
        .in_i       ( valid             ),
        .out_o      ( broad_sel         ),
        .valid_o    ( valid_broadcast   )
    );

    // register and broadcast logic
    always_ff @(posedge clk_i) begin
        // For every register define write behavior
        for (integer i = 0; i < NUM_RS_STATIONS; ++i) begin
            // On reset set tag to NO_VAL and dont care about data
            if (RST_i) begin
                rs_stations[i].tag <= NO_VAL;
                rs_stations[i].val <= 'x;
            end else begin
                // NOTE: Assuming overwrite will never overwrite a non-NO_VAL
                // tagged register
                if (overwrite[i]) begin
                    rs_stations[i] <= fu_res_i[i];
                end else if (valid_broadcast && (i == broad_sel)) begin
                    rs_stations[i].tag <= NO_VAL;
                    rs_stations[i].val <= 'x;
                end else begin
                    rs_stations[i] <= rs_stations[i];
                end
            end
        end
        
        // -------------------------------
        // CDB reset behavior
        if (RST_i) begin
            broadcast_o.tag <= NO_VAL;
        
        // With valid data in registers, select one to broacast
        end else if (valid_broadcast) begin
            broadcast_o <= rs_stations[broad_sel];
        
        // With no useful data in registers broadcast NO_VAL
        // (data not important)
        end else begin
            broadcast_o.tag <= NO_VAL;
        end
    end


endmodule
