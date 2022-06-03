import data_types::*;

`timescale 1ns/10ps

module regfile #(
    
) (
    // inputs
    input logic clk_i,
    input logic reset_i,

    // common data bus
    input cdb_t cdb_i,

    // regfile 
    input regfile_idx_t read_addr1_i, read_addr2_i, // (wow only read ports!!)
    
    // register status
    input regfile_idx_t reg_tag_read_idx1_i, 
                        reg_tag_read_idx2_i,
                        reg_tag_write_idx_i,
    input rs_tag_t      wr_tag_i,
    input logic         wr_en_tag_i,
    
    // outputs
    output word32_t     read_data1_o, read_data2_o,
    output rs_tag_t     tag1_o, tag2_o 
);
    
    word32_t registers [REGFILE_SIZE-1:0];
    rs_tag_t reg_status_unit [REGFILE_SIZE-1:0];
   
   logic tag_wr_en;
   assign tag_wr_en = wr_en_tag_i & (reg_tag_write_idx_i != '0);


    // tag read outputs 
    assign tag1_o = ( tag_wr_en & (reg_tag_write_idx_i == reg_tag_read_idx1_i)) ?
                                                                    wr_tag_i : reg_status_unit[reg_tag_read_idx1_i];

    assign tag2_o = ( tag_wr_en & (reg_tag_write_idx_i == reg_tag_read_idx2_i)) ? 
                                                                    wr_tag_i : reg_status_unit[reg_tag_read_idx2_i];
    // data read outputs
    always_comb begin
        read_data1_o = registers[read_addr1_i];
        read_data2_o = registers[read_addr2_i];
    end

    // register 0 is hardwired to 0
    assign registers[0] = '0;
    
    // register reset and write
    always_ff @(posedge clk_i) begin
        // synchronous reset
        if (reset_i) begin
            // tags in register status structure MUST 
            // reset to NO_VAL
            for (int i = 0; i < REGFILE_SIZE; i++) begin
               reg_status_unit[i] <= NO_VAL;
            end
        end else begin
            // for each register, if it's tag 
            // matches the cdb_i's tag, write the value
            // on the cdb_i into the register w/ the matching tag

            // each register gets a comparator....
            for (int i = 1; i < REGFILE_SIZE; i++) begin
                if (cdb_i.tag == reg_status_unit[i] & (cdb_i.tag != NO_VAL)) begin
                    if (~tag_wr_en || reg_tag_write_idx_i != i)
                        registers[i]  <= cdb_i.val;
                        reg_status_unit[i] <= NO_VAL;
                end
            end
            
            if (tag_wr_en) begin
                reg_status_unit[reg_tag_write_idx_i] <=  wr_tag_i;
            end
        end
    end

endmodule
