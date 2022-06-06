package data_types;

// basic data type in CPU
parameter DWIDTH = 32;
typedef logic signed [DWIDTH-1:0] word32_t;




// All possible ALU operations
typedef enum logic [3:0] {
    // Register-Immediate types
    ADDI, // rd = rs1 + SE(imm12)
    SLTI, // rd = (rs1 < SE(imm12)) ? 1 : 0  (treat both as SIGNED)
    SLTUI,// rd = (rs1 < SE(imm12)) ? 1 : 0  (treat both as UNSIGNED)
    ANDI, // rd = rs1 & SE(imm12)
    ORI,  // rd = rs1 | SE(imm12)
    XORI, // rd = rs1 ^ SE(imm12) (use imm = -1 for logical NOT)

    // Register-Register tpyes
    ADDR, // rd = rs1 + rs2
    SUBR, // rd = rs1 + ~rs2 + 1
    SLTR, // rd = (rs1 < rs2) ? 1 : 0  (treat both as SIGNED)
    SLTUR,// rd = (rs1 < rs2) ? 1 : 0  (treat both as UNSIGNED)
    ANDR, // rd = rs1 & rs2
    ORR,  // rd = rs1 | rs2
    XORR  // rd = rs1 ^ rs2
} alu_op_t;

// All Possible Shift operations


typedef enum logic [2:0] {
    // immediate type shifts
    SRLI, // Logical Right Shift 
    SLLI, // Logical Left Shift
    SRAI, // Arithmetic Right Shift
    
    // register type shifts
    SLLR,  
    SRLR,  
    SRAR
    // No operation
} shift_op_t;


typedef enum logic [2:0] {
    // Branch types
    BEQ,  // PC = (rs1 == rs2) ? PC + SE(imm12) : PC + 4
    BNE,  // PC = (rs1 != rs2) ? PC + SE(imm12) : PC + 4
    BLT,  // PC = (rs1 <  rs2) ? PC + SE(imm12) : PC + 4 (SIGNED COMP)
    BLTU, // PC = (rs1 <  rs2) ? PC + SE(imm12) : PC + 4 (UNSIGNED COMP)
    BGE,  // PC = (rs1 >= rs2) ? PC + SE(imm12) : PC + 4 (SIGNED COMP)
    BGEU  // PC = (rs1 >= rs2) ? PC + SE(imm12) : PC + 4 (UNSIGNED COMP)
    // Note: By reversing operands, can get the conditons of BGT[U] and BLE[U]
} branch_op_t;







parameter NUM_ALU_RS = 6;
parameter NUM_SHIFT_RS = 2;
// + 1 to include LD/ST Unit and another + 1 to include branch alu
parameter NUM_RS = NUM_ALU_RS + NUM_SHIFT_RS + 2;

parameter LS_ENTRIES_POW2 = 3;

parameter NUM_TAGS = NUM_ALU_RS + NUM_SHIFT_RS + (2**LS_ENTRIES_POW2) + 1; // +1 for NO_VAL

// Tags for reservation stations/functional units
// Additional tags can be added or removed as necessary
typedef enum logic[$clog2(NUM_TAGS)-1:0] {
    NO_VAL = '0, // No value has been calculated this clk cycle
    ALU_1,       // ALU 1
    ALU_2,       // ALU 2
    ALU_3,       // ALU 3
    ALU_4,       // ALU 4
    ALU_5,       // ALU 5
    ALU_6,       // ALU 6
    SHIFT_1,     // Shifter 1
    SHIFT_2,     // Shifter 2
    LS_1,
    LS_2,
    LS_3,
    LS_4,
    LS_5,
    LS_6,
    LS_7,
    LS_8
} rs_tag_t;



parameter rs_tag_t  LS_RS_STATION [2**LS_ENTRIES_POW2] =
                            '{LS_1, LS_2, LS_3, LS_4, LS_5, LS_6, LS_7, LS_8};

parameter rs_tag_t  ALU_RS_STATION [NUM_ALU_RS]
                                = '{ALU_1, ALU_2, ALU_3, ALU_4, ALU_5, ALU_6};

parameter rs_tag_t  SHIFT_RS_STATION [NUM_SHIFT_RS]
                                              = '{SHIFT_1, SHIFT_2};


// number of entries in regfile
parameter REGFILE_SIZE = 32;
typedef logic [$clog2(REGFILE_SIZE)-1:0] regfile_idx_t;


// type/format to broadcast on common data bus
// CDB will be of type:
//      cdb_t cdb [NUM_RS];
typedef struct packed {
    rs_tag_t		tag;
    word32_t        val;
} cdb_t;


// Reservation Station Datatypes
parameter OPCODE_SIZE = 7; // from our custom RISCV document

// Reservation Station data structure type definitions
typedef struct packed {
    // reservation station tags that will produce result RS needs
    // or NO_VAL if ready
    rs_tag_t    tag1, tag2;
    word32_t    val1, val2;
    logic       speculative;
} res_station_t;


// Instruction Group Types
// (riscv opcode decodings)
/*typedef enum logic [2:0] {
    OP,     // = 7'b011_0011;
    OP_IMM, // = 7'b001_0011;
    LOAD,   //  = 7'b000_0011;
    STORE,  //  = 7'b010_0011;
    BRANCH //  = 7'b110_0011; // unconditional branch
} instruc_group_t;*/

// Functional Group Type (alternative to using Instruction Group Types)
typedef enum logic [1:0] {
    ALU,
    SHIFT,
    BRANCH
} functional_group_t;

typedef struct packed {
    // each entry should have unique tag
    rs_tag_t  tag;

    // address for entry
    rs_tag_t  addr_tag;
    word32_t  addr;
    word32_t  offset;
    
    // data for entry (only for store types)
    rs_tag_t  data_st_tag;
    word32_t  data_st;

    logic     load; // 1 if load, 0 if store
    word32_t  eff_addr;
    logic     ready;
    logic     locked;

    // speculation flags
    logic     speculative;
    logic     cond_evaluated;
    logic     corr_pred;
} ls_t;

endpackage
