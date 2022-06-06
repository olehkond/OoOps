# Begin_DVE_Session_Save_Info
# DVE view(Wave.1 ) session
# Saved on Wed May 18 02:17:05 2022
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Wave.1: 368 signals
# End_DVE_Session_Save_Info

# DVE version: S-2021.09-SP1_Full64
# DVE build date: Nov 30 2021 00:09:19


#<Session mode="View" path="/home/rusdac/ee478/OoOps/rtl/tests/vcs/session.OOPS.vpd.tcl" type="Debug">

#<Database>

gui_set_time_units 10ps
#</Database>

# DVE View/pane content session: 

# Begin_DVE_Session_Save_Info (Wave.1)
# DVE wave signals session
# Saved on Wed May 18 02:17:05 2022
# 368 signals
# End_DVE_Session_Save_Info

# DVE version: S-2021.09-SP1_Full64
# DVE build date: Nov 30 2021 00:09:19


#Add ncecessay scopes
gui_load_child_values {V7:OoO_top_tb.dut.instr_queue}
gui_load_child_values {V7:OoO_top_tb}
gui_load_child_values {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu}
gui_load_child_values {V7:OoO_top_tb.dut.register_file}
gui_load_child_values {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu}
gui_load_child_values {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu}
gui_load_child_values {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs}
gui_load_child_values {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu}

gui_set_time_units 10ps

set _wave_session_group_16 dut_1
if {[gui_sg_is_group -name "$_wave_session_group_16"]} {
    set _wave_session_group_16 [gui_sg_generate_new_name]
}
set Group1 "$_wave_session_group_16"

gui_sg_addsignal -group "$_wave_session_group_16" { {V7:OoO_top_tb.dut.$unit} {V7:OoO_top_tb.dut.reset_i} {V7:OoO_top_tb.dut.clk_i} {V7:OoO_top_tb.dut.instr_fetch_i} {V7:OoO_top_tb.dut.program_counter_o} {V7:OoO_top_tb.dut.iq_full} {V7:OoO_top_tb.dut.iq_empty} {V7:OoO_top_tb.dut.iq_read} {V7:OoO_top_tb.dut.iq_write} {V7:OoO_top_tb.dut.iq_instr} {V7:OoO_top_tb.dut.reg_addr1_idx} {V7:OoO_top_tb.dut.reg_addr2_idx} {V7:OoO_top_tb.dut.rstat_tag1_idx} {V7:OoO_top_tb.dut.rstat_tag2_idx} {V7:OoO_top_tb.dut.rstat_wr_tag_idx} {V7:OoO_top_tb.dut.reg_rd_wr_tag} {V7:OoO_top_tb.dut.rstat_tag1} {V7:OoO_top_tb.dut.rstat_tag2} {V7:OoO_top_tb.dut.reg_data1} {V7:OoO_top_tb.dut.reg_data2} {V7:OoO_top_tb.dut.reg_wr_en} {V7:OoO_top_tb.dut.rs_busy_bus} {V7:OoO_top_tb.dut.rs_write_en_bus} {V7:OoO_top_tb.dut.rs_val1} {V7:OoO_top_tb.dut.rs_val2} {V7:OoO_top_tb.dut.rs_tag1} {V7:OoO_top_tb.dut.rs_tag2} {V7:OoO_top_tb.dut.alu_op} {V7:OoO_top_tb.dut.fu_oper} {V7:OoO_top_tb.dut.fu_rs1_val} {V7:OoO_top_tb.dut.fu_rs2_val} {V7:OoO_top_tb.dut.fu_ready} {V7:OoO_top_tb.dut.cdb_bus} {V7:OoO_top_tb.dut.br_res_cdb} }
gui_set_radix -radix {hex} -signals {V7:OoO_top_tb.dut.instr_fetch_i}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.instr_fetch_i}
gui_set_radix -radix {binary} -signals {V7:OoO_top_tb.dut.iq_instr}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.iq_instr}
gui_set_radix -radix {decimal} -signals {V7:OoO_top_tb.dut.reg_addr1_idx}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.reg_addr1_idx}
gui_set_radix -radix {decimal} -signals {V7:OoO_top_tb.dut.reg_addr2_idx}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.reg_addr2_idx}
gui_set_radix -radix {decimal} -signals {V7:OoO_top_tb.dut.rstat_tag1_idx}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.rstat_tag1_idx}
gui_set_radix -radix {decimal} -signals {V7:OoO_top_tb.dut.rstat_tag2_idx}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.rstat_tag2_idx}
gui_set_radix -radix {decimal} -signals {V7:OoO_top_tb.dut.rstat_wr_tag_idx}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.rstat_wr_tag_idx}

set _wave_session_group_17 issue_stage
if {[gui_sg_is_group -name "$_wave_session_group_17"]} {
    set _wave_session_group_17 [gui_sg_generate_new_name]
}
set Group2 "$_wave_session_group_17"

gui_sg_addsignal -group "$_wave_session_group_17" { {V7:OoO_top_tb.dut.issue_stage.$unit} {V7:OoO_top_tb.dut.issue_stage.clk_i} {V7:OoO_top_tb.dut.issue_stage.reset_i} {V7:OoO_top_tb.dut.issue_stage.instruc_q_data_i} {V7:OoO_top_tb.dut.issue_stage.instruc_q_full_i} {V7:OoO_top_tb.dut.issue_stage.instruc_q_empty_i} {V7:OoO_top_tb.dut.issue_stage.read_instruc_queue_o} {V7:OoO_top_tb.dut.issue_stage.read_addr1_o} {V7:OoO_top_tb.dut.issue_stage.read_addr2_o} {V7:OoO_top_tb.dut.issue_stage.read_data1_i} {V7:OoO_top_tb.dut.issue_stage.read_data2_i} {V7:OoO_top_tb.dut.issue_stage.reg_tag_rd_idx1_o} {V7:OoO_top_tb.dut.issue_stage.reg_tag_rd_idx2_o} {V7:OoO_top_tb.dut.issue_stage.noticeme} {V7:OoO_top_tb.dut.issue_stage.reg_tag_wr_idx_o} {V7:OoO_top_tb.dut.issue_stage.wr_tag_o} {V7:OoO_top_tb.dut.issue_stage.wr_en_tag_o} {V7:OoO_top_tb.dut.issue_stage.tag1_i} {V7:OoO_top_tb.dut.issue_stage.tag2_i} {V7:OoO_top_tb.dut.issue_stage.busy_bus_i} {V7:OoO_top_tb.dut.issue_stage.rs_write_en_o} {V7:OoO_top_tb.dut.issue_stage.rs_value1_o} {V7:OoO_top_tb.dut.issue_stage.rs_value2_o} {V7:OoO_top_tb.dut.issue_stage.rs_tag1_o} {V7:OoO_top_tb.dut.issue_stage.rs_tag2_o} {V7:OoO_top_tb.dut.issue_stage.alu_op_type_o} {V7:OoO_top_tb.dut.issue_stage.stall} {V7:OoO_top_tb.dut.issue_stage.res_tag} {V7:OoO_top_tb.dut.issue_stage.rd} {V7:OoO_top_tb.dut.issue_stage.rs1} {V7:OoO_top_tb.dut.issue_stage.rs2} {V7:OoO_top_tb.dut.issue_stage.imm12} {V7:OoO_top_tb.dut.issue_stage.opcode} {V7:OoO_top_tb.dut.issue_stage.func_group} {V7:OoO_top_tb.dut.issue_stage.shift_op_type} {V7:OoO_top_tb.dut.issue_stage.cdb_i} }
gui_set_radix -radix {hex} -signals {V7:OoO_top_tb.dut.issue_stage.instruc_q_data_i}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.issue_stage.instruc_q_data_i}
gui_set_radix -radix {binary} -signals {V7:OoO_top_tb.dut.issue_stage.busy_bus_i}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.issue_stage.busy_bus_i}
gui_set_radix -radix {binary} -signals {V7:OoO_top_tb.dut.issue_stage.rs_write_en_o}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.issue_stage.rs_write_en_o}
gui_set_radix -radix {decimal} -signals {V7:OoO_top_tb.dut.issue_stage.rs_value1_o}
gui_set_radix -radix {twosComplement} -signals {V7:OoO_top_tb.dut.issue_stage.rs_value1_o}
gui_set_radix -radix {decimal} -signals {V7:OoO_top_tb.dut.issue_stage.rs_value2_o}
gui_set_radix -radix {twosComplement} -signals {V7:OoO_top_tb.dut.issue_stage.rs_value2_o}

set _wave_session_group_18 {Instruction Memory}
if {[gui_sg_is_group -name "$_wave_session_group_18"]} {
    set _wave_session_group_18 [gui_sg_generate_new_name]
}
set Group3 "$_wave_session_group_18"

gui_sg_addsignal -group "$_wave_session_group_18" { {V7:OoO_top_tb.instr_mem} }

set _wave_session_group_19 instr_queue
if {[gui_sg_is_group -name "$_wave_session_group_19"]} {
    set _wave_session_group_19 [gui_sg_generate_new_name]
}
set Group4 "$_wave_session_group_19"

gui_sg_addsignal -group "$_wave_session_group_19" { {V7:OoO_top_tb.dut.instr_queue.unnamed$$_0} {V7:OoO_top_tb.dut.instr_queue.$unit} {V7:OoO_top_tb.dut.instr_queue.write_data_i} {V7:OoO_top_tb.dut.instr_queue.write_i} {V7:OoO_top_tb.dut.instr_queue.read_i} {V7:OoO_top_tb.dut.instr_queue.reset_i} {V7:OoO_top_tb.dut.instr_queue.clk_i} {V7:OoO_top_tb.dut.instr_queue.full_o} {V7:OoO_top_tb.dut.instr_queue.empty_o} {V7:OoO_top_tb.dut.instr_queue.read_data_o} {V7:OoO_top_tb.dut.instr_queue.fifo} {V7:OoO_top_tb.dut.instr_queue.head} {V7:OoO_top_tb.dut.instr_queue.head_next} {V7:OoO_top_tb.dut.instr_queue.head_plus1} {V7:OoO_top_tb.dut.instr_queue.tail} {V7:OoO_top_tb.dut.instr_queue.tail_next} {V7:OoO_top_tb.dut.instr_queue.tail_plus1} {V7:OoO_top_tb.dut.instr_queue.oper} {V7:OoO_top_tb.dut.instr_queue.ENTRIES_POW2} }
gui_set_radix -radix {decimal} -signals {V7:OoO_top_tb.dut.instr_queue.ENTRIES_POW2}
gui_set_radix -radix {twosComplement} -signals {V7:OoO_top_tb.dut.instr_queue.ENTRIES_POW2}

set _wave_session_group_20 rs_monitor_unit_1
if {[gui_sg_is_group -name "$_wave_session_group_20"]} {
    set _wave_session_group_20 [gui_sg_generate_new_name]
}
set Group5 "$_wave_session_group_20"

gui_sg_addsignal -group "$_wave_session_group_20" { {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.$unit} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.busy_bus_i} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.func_group} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.rs_tag_o} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.alu_busy_bus} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.shift_busy_bus} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.alu_addr} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.alu_addr_valid} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.shift_addr} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.shift_addr_valid} }

set _wave_session_group_21 Registers
if {[gui_sg_is_group -name "$_wave_session_group_21"]} {
    set _wave_session_group_21 [gui_sg_generate_new_name]
}
set Group6 "$_wave_session_group_21"

gui_sg_addsignal -group "$_wave_session_group_21" { {V7:OoO_top_tb.dut.register_file.registers} }

set _wave_session_group_22 {Register Status}
if {[gui_sg_is_group -name "$_wave_session_group_22"]} {
    set _wave_session_group_22 [gui_sg_generate_new_name]
}
set Group7 "$_wave_session_group_22"

gui_sg_addsignal -group "$_wave_session_group_22" { {V7:OoO_top_tb.dut.register_file.reg_status_unit} }

set _wave_session_group_23 {reservation_station[3].genblk1.alu_rs}
if {[gui_sg_is_group -name "$_wave_session_group_23"]} {
    set _wave_session_group_23 [gui_sg_generate_new_name]
}
set Group8 "$_wave_session_group_23"

gui_sg_addsignal -group "$_wave_session_group_23" { {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.$unit} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.reset_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.clk_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.write_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.opcode_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.tag1_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.tag2_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.value1_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.value2_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.fu_ready_o} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.fu_oper_o} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.fu_rs1_val_o} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.fu_rs2_val_o} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.busy_o} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.write_op1} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.write_op2} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.ops_ready_next_cycle} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.state} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.state_next} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.TAG} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.cdb_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.rs} }
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.value1_i}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.value1_i}}
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.value2_i}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.value2_i}}
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.fu_rs1_val_o}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.fu_rs1_val_o}}
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.fu_rs2_val_o}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.fu_rs2_val_o}}
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.TAG}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.TAG}}

set _wave_session_group_24 {functional_unit[0].genblk1.alu_fu}
if {[gui_sg_is_group -name "$_wave_session_group_24"]} {
    set _wave_session_group_24 [gui_sg_generate_new_name]
}
set Group9 "$_wave_session_group_24"

gui_sg_addsignal -group "$_wave_session_group_24" { {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.$unit} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.oper_i} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.rs1_val_i} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.rs2_val_i} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.ready_i} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.clk_i} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.tag} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.tag_broad} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.rd_val} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.rd_val_broad} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.TAG} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.cdb_term_o} }
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.TAG}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.TAG}}

set _wave_session_group_25 {functional_unit[1].genblk1.alu_fu}
if {[gui_sg_is_group -name "$_wave_session_group_25"]} {
    set _wave_session_group_25 [gui_sg_generate_new_name]
}
set Group10 "$_wave_session_group_25"

gui_sg_addsignal -group "$_wave_session_group_25" { {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.$unit} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.oper_i} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.rs1_val_i} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.rs2_val_i} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.ready_i} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.clk_i} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.tag} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.tag_broad} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.rd_val} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.rd_val_broad} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.TAG} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.cdb_term_o} }
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.TAG}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.TAG}}

set _wave_session_group_26 {functional_unit[2].genblk1.alu_fu}
if {[gui_sg_is_group -name "$_wave_session_group_26"]} {
    set _wave_session_group_26 [gui_sg_generate_new_name]
}
set Group11 "$_wave_session_group_26"

gui_sg_addsignal -group "$_wave_session_group_26" { {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.$unit} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.oper_i} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.rs1_val_i} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.rs2_val_i} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.ready_i} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.clk_i} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.tag} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.tag_broad} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.rd_val} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.rd_val_broad} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.TAG} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.cdb_term_o} }
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.TAG}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.TAG}}

set _wave_session_group_27 $_wave_session_group_26|
append _wave_session_group_27 {functional_unit[3].genblk1.alu_fu}
set {functional_unit[2].genblk1.alu_fu|functional_unit[3].genblk1.alu_fu} "$_wave_session_group_27"

gui_sg_addsignal -group "$_wave_session_group_27" { {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.$unit} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.oper_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.rs1_val_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.rs2_val_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.ready_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.clk_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.tag} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.tag_broad} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.rd_val} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.rd_val_broad} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.TAG} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.cdb_term_o} }
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.TAG}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.TAG}}

set _wave_session_group_28 {functional_unit[3].genblk1.alu_fu}
if {[gui_sg_is_group -name "$_wave_session_group_28"]} {
    set _wave_session_group_28 [gui_sg_generate_new_name]
}
set Group12 "$_wave_session_group_28"

gui_sg_addsignal -group "$_wave_session_group_28" { {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.rd_val_broad} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.rs2_val_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.oper_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.TAG} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.tag} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.ready_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.tag_broad} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.cdb_term_o} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.rd_val} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.$unit} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.rs1_val_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.clk_i} }
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.TAG}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.TAG}}

set _wave_session_group_29 Group5
if {[gui_sg_is_group -name "$_wave_session_group_29"]} {
    set _wave_session_group_29 [gui_sg_generate_new_name]
}
set Group13 "$_wave_session_group_29"

gui_sg_addsignal -group "$_wave_session_group_29" { {V7:OoO_top_tb.dut.$unit} {V7:OoO_top_tb.dut.reset_i} {V7:OoO_top_tb.dut.clk_i} {V7:OoO_top_tb.dut.instr_fetch_i} {V7:OoO_top_tb.dut.program_counter_o} {V7:OoO_top_tb.dut.iq_full} {V7:OoO_top_tb.dut.iq_empty} {V7:OoO_top_tb.dut.iq_read} {V7:OoO_top_tb.dut.iq_write} {V7:OoO_top_tb.dut.iq_instr} {V7:OoO_top_tb.dut.reg_addr1_idx} {V7:OoO_top_tb.dut.reg_addr2_idx} {V7:OoO_top_tb.dut.rstat_tag1_idx} {V7:OoO_top_tb.dut.rstat_tag2_idx} {V7:OoO_top_tb.dut.rstat_wr_tag_idx} {V7:OoO_top_tb.dut.reg_rd_wr_tag} {V7:OoO_top_tb.dut.rstat_tag1} {V7:OoO_top_tb.dut.rstat_tag2} {V7:OoO_top_tb.dut.reg_data1} {V7:OoO_top_tb.dut.reg_data2} {V7:OoO_top_tb.dut.reg_wr_en} {V7:OoO_top_tb.dut.rs_busy_bus} {V7:OoO_top_tb.dut.rs_write_en_bus} {V7:OoO_top_tb.dut.rs_val1} {V7:OoO_top_tb.dut.rs_val2} {V7:OoO_top_tb.dut.rs_tag1} {V7:OoO_top_tb.dut.rs_tag2} {V7:OoO_top_tb.dut.alu_op} {V7:OoO_top_tb.dut.fu_oper} {V7:OoO_top_tb.dut.fu_rs1_val} {V7:OoO_top_tb.dut.fu_rs2_val} {V7:OoO_top_tb.dut.fu_ready} {V7:OoO_top_tb.dut.cdb_bus} {V7:OoO_top_tb.dut.br_res_cdb} }
gui_set_radix -radix {hex} -signals {V7:OoO_top_tb.dut.instr_fetch_i}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.instr_fetch_i}
gui_set_radix -radix {binary} -signals {V7:OoO_top_tb.dut.iq_instr}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.iq_instr}
gui_set_radix -radix {decimal} -signals {V7:OoO_top_tb.dut.reg_addr1_idx}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.reg_addr1_idx}
gui_set_radix -radix {decimal} -signals {V7:OoO_top_tb.dut.reg_addr2_idx}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.reg_addr2_idx}
gui_set_radix -radix {decimal} -signals {V7:OoO_top_tb.dut.rstat_tag1_idx}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.rstat_tag1_idx}
gui_set_radix -radix {decimal} -signals {V7:OoO_top_tb.dut.rstat_tag2_idx}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.rstat_tag2_idx}
gui_set_radix -radix {decimal} -signals {V7:OoO_top_tb.dut.rstat_wr_tag_idx}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.rstat_wr_tag_idx}

set _wave_session_group_30 Group6
if {[gui_sg_is_group -name "$_wave_session_group_30"]} {
    set _wave_session_group_30 [gui_sg_generate_new_name]
}
set Group14 "$_wave_session_group_30"

gui_sg_addsignal -group "$_wave_session_group_30" { {V7:OoO_top_tb.dut.issue_stage.$unit} {V7:OoO_top_tb.dut.issue_stage.clk_i} {V7:OoO_top_tb.dut.issue_stage.reset_i} {V7:OoO_top_tb.dut.issue_stage.instruc_q_data_i} {V7:OoO_top_tb.dut.issue_stage.instruc_q_full_i} {V7:OoO_top_tb.dut.issue_stage.instruc_q_empty_i} {V7:OoO_top_tb.dut.issue_stage.read_instruc_queue_o} {V7:OoO_top_tb.dut.issue_stage.read_addr1_o} {V7:OoO_top_tb.dut.issue_stage.read_addr2_o} {V7:OoO_top_tb.dut.issue_stage.read_data1_i} {V7:OoO_top_tb.dut.issue_stage.read_data2_i} {V7:OoO_top_tb.dut.issue_stage.reg_tag_rd_idx1_o} {V7:OoO_top_tb.dut.issue_stage.reg_tag_rd_idx2_o} {V7:OoO_top_tb.dut.issue_stage.noticeme} {V7:OoO_top_tb.dut.issue_stage.reg_tag_wr_idx_o} {V7:OoO_top_tb.dut.issue_stage.wr_tag_o} {V7:OoO_top_tb.dut.issue_stage.wr_en_tag_o} {V7:OoO_top_tb.dut.issue_stage.tag1_i} {V7:OoO_top_tb.dut.issue_stage.tag2_i} {V7:OoO_top_tb.dut.issue_stage.busy_bus_i} {V7:OoO_top_tb.dut.issue_stage.rs_write_en_o} {V7:OoO_top_tb.dut.issue_stage.rs_value1_o} {V7:OoO_top_tb.dut.issue_stage.rs_value2_o} {V7:OoO_top_tb.dut.issue_stage.rs_tag1_o} {V7:OoO_top_tb.dut.issue_stage.rs_tag2_o} {V7:OoO_top_tb.dut.issue_stage.alu_op_type_o} {V7:OoO_top_tb.dut.issue_stage.stall} {V7:OoO_top_tb.dut.issue_stage.res_tag} {V7:OoO_top_tb.dut.issue_stage.rd} {V7:OoO_top_tb.dut.issue_stage.rs1} {V7:OoO_top_tb.dut.issue_stage.rs2} {V7:OoO_top_tb.dut.issue_stage.imm12} {V7:OoO_top_tb.dut.issue_stage.opcode} {V7:OoO_top_tb.dut.issue_stage.func_group} {V7:OoO_top_tb.dut.issue_stage.shift_op_type} {V7:OoO_top_tb.dut.issue_stage.cdb_i} }
gui_set_radix -radix {hex} -signals {V7:OoO_top_tb.dut.issue_stage.instruc_q_data_i}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.issue_stage.instruc_q_data_i}
gui_set_radix -radix {binary} -signals {V7:OoO_top_tb.dut.issue_stage.busy_bus_i}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.issue_stage.busy_bus_i}
gui_set_radix -radix {binary} -signals {V7:OoO_top_tb.dut.issue_stage.rs_write_en_o}
gui_set_radix -radix {unsigned} -signals {V7:OoO_top_tb.dut.issue_stage.rs_write_en_o}
gui_set_radix -radix {decimal} -signals {V7:OoO_top_tb.dut.issue_stage.rs_value1_o}
gui_set_radix -radix {twosComplement} -signals {V7:OoO_top_tb.dut.issue_stage.rs_value1_o}
gui_set_radix -radix {decimal} -signals {V7:OoO_top_tb.dut.issue_stage.rs_value2_o}
gui_set_radix -radix {twosComplement} -signals {V7:OoO_top_tb.dut.issue_stage.rs_value2_o}

set _wave_session_group_31 Group7
if {[gui_sg_is_group -name "$_wave_session_group_31"]} {
    set _wave_session_group_31 [gui_sg_generate_new_name]
}
set Group15 "$_wave_session_group_31"

gui_sg_addsignal -group "$_wave_session_group_31" { {V7:OoO_top_tb.instr_mem} }

set _wave_session_group_32 Group8
if {[gui_sg_is_group -name "$_wave_session_group_32"]} {
    set _wave_session_group_32 [gui_sg_generate_new_name]
}
set Group16 "$_wave_session_group_32"

gui_sg_addsignal -group "$_wave_session_group_32" { {V7:OoO_top_tb.dut.instr_queue.unnamed$$_0} {V7:OoO_top_tb.dut.instr_queue.$unit} {V7:OoO_top_tb.dut.instr_queue.write_data_i} {V7:OoO_top_tb.dut.instr_queue.write_i} {V7:OoO_top_tb.dut.instr_queue.read_i} {V7:OoO_top_tb.dut.instr_queue.reset_i} {V7:OoO_top_tb.dut.instr_queue.clk_i} {V7:OoO_top_tb.dut.instr_queue.full_o} {V7:OoO_top_tb.dut.instr_queue.empty_o} {V7:OoO_top_tb.dut.instr_queue.read_data_o} {V7:OoO_top_tb.dut.instr_queue.fifo} {V7:OoO_top_tb.dut.instr_queue.head} {V7:OoO_top_tb.dut.instr_queue.head_next} {V7:OoO_top_tb.dut.instr_queue.head_plus1} {V7:OoO_top_tb.dut.instr_queue.tail} {V7:OoO_top_tb.dut.instr_queue.tail_next} {V7:OoO_top_tb.dut.instr_queue.tail_plus1} {V7:OoO_top_tb.dut.instr_queue.oper} {V7:OoO_top_tb.dut.instr_queue.ENTRIES_POW2} }
gui_set_radix -radix {decimal} -signals {V7:OoO_top_tb.dut.instr_queue.ENTRIES_POW2}
gui_set_radix -radix {twosComplement} -signals {V7:OoO_top_tb.dut.instr_queue.ENTRIES_POW2}

set _wave_session_group_33 Group9
if {[gui_sg_is_group -name "$_wave_session_group_33"]} {
    set _wave_session_group_33 [gui_sg_generate_new_name]
}
set Group17 "$_wave_session_group_33"

gui_sg_addsignal -group "$_wave_session_group_33" { {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.$unit} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.busy_bus_i} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.func_group} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.rs_tag_o} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.alu_busy_bus} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.shift_busy_bus} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.alu_addr} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.alu_addr_valid} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.shift_addr} {V7:OoO_top_tb.dut.issue_stage.rs_monitor_unit.shift_addr_valid} }

set _wave_session_group_34 Group10
if {[gui_sg_is_group -name "$_wave_session_group_34"]} {
    set _wave_session_group_34 [gui_sg_generate_new_name]
}
set Group18 "$_wave_session_group_34"

gui_sg_addsignal -group "$_wave_session_group_34" { {V7:OoO_top_tb.dut.register_file.registers} }

set _wave_session_group_35 Group11
if {[gui_sg_is_group -name "$_wave_session_group_35"]} {
    set _wave_session_group_35 [gui_sg_generate_new_name]
}
set Group19 "$_wave_session_group_35"

gui_sg_addsignal -group "$_wave_session_group_35" { {V7:OoO_top_tb.dut.register_file.reg_status_unit} }

set _wave_session_group_36 Group12
if {[gui_sg_is_group -name "$_wave_session_group_36"]} {
    set _wave_session_group_36 [gui_sg_generate_new_name]
}
set Group20 "$_wave_session_group_36"

gui_sg_addsignal -group "$_wave_session_group_36" { {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.$unit} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.reset_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.clk_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.write_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.opcode_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.tag1_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.tag2_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.value1_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.value2_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.fu_ready_o} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.fu_oper_o} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.fu_rs1_val_o} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.fu_rs2_val_o} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.busy_o} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.write_op1} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.write_op2} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.ops_ready_next_cycle} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.state} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.state_next} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.TAG} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.cdb_i} {V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.rs} }
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.value1_i}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.value1_i}}
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.value2_i}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.value2_i}}
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.fu_rs1_val_o}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.fu_rs1_val_o}}
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.fu_rs2_val_o}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.fu_rs2_val_o}}
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.TAG}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.reservation_station[3].genblk1.alu_rs.TAG}}

set _wave_session_group_37 Group13
if {[gui_sg_is_group -name "$_wave_session_group_37"]} {
    set _wave_session_group_37 [gui_sg_generate_new_name]
}
set Group21 "$_wave_session_group_37"

gui_sg_addsignal -group "$_wave_session_group_37" { {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.$unit} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.oper_i} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.rs1_val_i} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.rs2_val_i} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.ready_i} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.clk_i} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.tag} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.tag_broad} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.rd_val} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.rd_val_broad} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.TAG} {V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.cdb_term_o} }
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.TAG}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.functional_unit[0].genblk1.alu_fu.TAG}}

set _wave_session_group_38 Group14
if {[gui_sg_is_group -name "$_wave_session_group_38"]} {
    set _wave_session_group_38 [gui_sg_generate_new_name]
}
set Group22 "$_wave_session_group_38"

gui_sg_addsignal -group "$_wave_session_group_38" { {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.$unit} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.oper_i} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.rs1_val_i} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.rs2_val_i} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.ready_i} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.clk_i} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.tag} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.tag_broad} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.rd_val} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.rd_val_broad} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.TAG} {V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.cdb_term_o} }
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.TAG}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.functional_unit[1].genblk1.alu_fu.TAG}}

set _wave_session_group_39 Group15
if {[gui_sg_is_group -name "$_wave_session_group_39"]} {
    set _wave_session_group_39 [gui_sg_generate_new_name]
}
set Group23 "$_wave_session_group_39"

gui_sg_addsignal -group "$_wave_session_group_39" { {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.$unit} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.oper_i} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.rs1_val_i} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.rs2_val_i} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.ready_i} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.clk_i} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.tag} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.tag_broad} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.rd_val} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.rd_val_broad} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.TAG} {V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.cdb_term_o} }
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.TAG}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.functional_unit[2].genblk1.alu_fu.TAG}}

set _wave_session_group_40 $_wave_session_group_39|
append _wave_session_group_40 {functional_unit[3].genblk1.alu_fu}
set {Group15|functional_unit[3].genblk1.alu_fu} "$_wave_session_group_40"

gui_sg_addsignal -group "$_wave_session_group_40" { {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.$unit} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.oper_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.rs1_val_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.rs2_val_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.ready_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.clk_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.tag} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.tag_broad} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.rd_val} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.rd_val_broad} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.TAG} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.cdb_term_o} }
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.TAG}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.TAG}}

set _wave_session_group_41 Group16
if {[gui_sg_is_group -name "$_wave_session_group_41"]} {
    set _wave_session_group_41 [gui_sg_generate_new_name]
}
set Group24 "$_wave_session_group_41"

gui_sg_addsignal -group "$_wave_session_group_41" { {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.rd_val_broad} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.rs2_val_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.oper_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.TAG} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.tag} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.ready_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.tag_broad} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.cdb_term_o} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.rd_val} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.$unit} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.rs1_val_i} {V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.clk_i} }
gui_set_radix -radix {decimal} -signals {{V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.TAG}}
gui_set_radix -radix {twosComplement} -signals {{V7:OoO_top_tb.dut.functional_unit[3].genblk1.alu_fu.TAG}}
if {![info exists useOldWindow]} { 
	set useOldWindow true
}
if {$useOldWindow && [string first "Wave" [gui_get_current_window -view]]==0} { 
	set Wave.1 [gui_get_current_window -view] 
} else {
	set Wave.1 [lindex [gui_get_window_ids -type Wave] 0]
if {[string first "Wave" ${Wave.1}]!=0} {
gui_open_window Wave
set Wave.1 [ gui_get_current_window -view ]
}
}

set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 29475 55634
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group1}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group2}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group3}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group4}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group5}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group6}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group7}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group8}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group9}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group10}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group11}]
gui_list_add_group -id ${Wave.1}  -after ${Group11} [list ${functional_unit[2].genblk1.alu_fu|functional_unit[3].genblk1.alu_fu}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group12}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group13}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group14}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group15}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group16}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group17}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group18}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group19}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group20}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group21}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group22}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group23}]
gui_list_add_group -id ${Wave.1}  -after ${Group23} [list ${Group15|functional_unit[3].genblk1.alu_fu}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group24}]
gui_list_collapse -id ${Wave.1} ${Group1}
gui_list_collapse -id ${Wave.1} ${Group2}
gui_list_collapse -id ${Wave.1} ${Group3}
gui_list_collapse -id ${Wave.1} ${Group4}
gui_list_collapse -id ${Wave.1} ${Group5}
gui_list_collapse -id ${Wave.1} ${Group6}
gui_list_collapse -id ${Wave.1} ${Group7}
gui_list_collapse -id ${Wave.1} ${Group8}
gui_list_collapse -id ${Wave.1} ${Group9}
gui_list_collapse -id ${Wave.1} ${Group10}
gui_list_collapse -id ${Wave.1} ${Group11}
gui_list_collapse -id ${Wave.1} ${Group12}
gui_list_collapse -id ${Wave.1} ${Group13}
gui_list_collapse -id ${Wave.1} ${Group14}
gui_list_collapse -id ${Wave.1} ${Group15}
gui_list_collapse -id ${Wave.1} ${Group16}
gui_list_collapse -id ${Wave.1} ${Group17}
gui_list_collapse -id ${Wave.1} ${Group19}
gui_list_collapse -id ${Wave.1} ${Group20}
gui_list_collapse -id ${Wave.1} ${Group21}
gui_list_collapse -id ${Wave.1} ${Group22}
gui_list_collapse -id ${Wave.1} ${Group23}
gui_list_collapse -id ${Wave.1} ${Group24}
gui_list_expand -id ${Wave.1} V7:OoO_top_tb.dut.register_file.registers
gui_list_select -id ${Wave.1} {{V7:OoO_top_tb.dut.register_file.registers[31]} }
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[31]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[31]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[30]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[30]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[29]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[29]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[28]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[28]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[27]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[27]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[26]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[26]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[25]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[25]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[24]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[24]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[23]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[23]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[22]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[22]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[21]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[21]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[20]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[20]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[19]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[19]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[18]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[18]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[17]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[17]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[16]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[16]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[15]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[15]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[14]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[14]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[13]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[13]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[12]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[12]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[11]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[11]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[10]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[10]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[9]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[9]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[8]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[8]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[7]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[7]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[6]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[6]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[5]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[5]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[4]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[4]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[3]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[3]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[2]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[2]}}
gui_set_radix -radix unsigned -signal {{V7:OoO_top_tb.dut.register_file.registers[1]}}
gui_set_radix -radix decimal -signal {{V7:OoO_top_tb.dut.register_file.registers[1]}}
gui_seek_criteria -id ${Wave.1} {Any Edge}


gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group ${Group24}  -position in

gui_marker_move -id ${Wave.1} {C1} 38686
gui_view_scroll -id ${Wave.1} -vertical -set 375
gui_show_grid -id ${Wave.1} -enable false
#</Session>

