# OoOps

## Overview:
OoOps is an Out-of-Order Execution Processor that implements a subset of RISCV (*rv32i*). The following rv32i instructions are supported:
  - **Branch Type**: BEQ, BNE, BLT, BGE, BLTU, BGEU
  - **Load-Store Type**: LW, SW
  - **ALU Immediate Type**: ADDI, XORI, SLTI, SLTIU, ORI, ANDI
  - **ALU Register-Register Type**: ADD, SUB, SLT, SLTU, XOR, OR, AND
  - **Shift Immediate Type**: SLLI, SRLI, SRAI
  - **Shift Register-Register Type**: SLL, SRL, SRA

## Directory Contents: 
- **mwe**: source code and sapr scripts for a 5-stage pipeline CPU are located here 
- **rtl**: contains OoOps RTL design 
    - **pre_branch_rtl**: OoOps design before branches ("calculator" CPU)
    - **pre_ls_spec_rtl**: OoOps design before incorporating load-store into the speculation scheme
    - **tests**: RTL verification. Contains includes top-level and module-level SystemVerilog testbenches
      - **prgms**: machine-level test programs (generated from source in *asm_gen/*)
        - **asm_gen**: contains assembly test programs and custom-RISCV assembler
- **sapr**: OoOps SAPR flow, contains scripts for synthesis, automatic place-and-route, and verification for SAPR netlists
    - **src**: contains source design, and scripts for running syn and apr   
    - **syn**: synthesis is run here, post-syn results (netlist, sdf, and sdc) and reports 
    - **apr**: automatic place-and-route is run here, post-apr (netlist, sdf, and sdc) results and reports are outputted to this directory.
    - **verif**: post-syn and post-apr verification

## Building and simulating the design 
Run `make` to generate all machine-level test programs, simulate all RTL testbenches, run the sapr flow, and run the top-level sapr testbenches.




    
 