#Notes for tyler
# 2. Migrate to NLDM for the target lib db - see the setup_65pg.tcl file and search for nldm to see what i mean. You'll have to do the same in synthesis. CCS takes too long and its annoying for small designs. 


set design_name "OoO_top"  ;  # Name of the design

# CONFIGURATION
# ==========================================================================
set TOOL_NAME "ICC"
# directory where tcl src is located 
set SCRIPTS_DIR "../src/apr/"


# Configure design, libraries
# ==========================================================================
source ${SCRIPTS_DIR}/config.tcl -echo
#source ${SCRIPTS_DIR}/setup_65gp.tcl -echo
source ${SCRIPTS_DIR}/library.tcl -echo

# READ DESIGN
# ==========================================================================
# Read in the verilog, uniquify and save the CEL view.
import_designs ../syn/results/$design_name.syn.v -format verilog -top $design_name
link -force

#set_dont_touch ls_unit/dmem_rd_data_i
#set_dont_touch ls_unit/dmem_rwu/lsu_st_data_i
#set_dont_touch ls_unit/dmem_rwu/lsu_eff_addr_i
#set_dont_touch register_file/read_addr1_i
#set_dont_touch register_file/read_addr2_i
#set_dont_touch issue_stage/iq_data_i
#-set_dont_touch broadcast_station/fu_res_i 
#set_dont_touch functional_unit_1__genblk1_alu_fu/cdb_term_o_reg_tag__1_
#set_dont_touch functional_unit_4__genblk1_alu_fu/cdb_term_o_reg_tag__2_
#set_dont_touch functional_unit_4__genblk1_alu_fu/cdb_term_o_reg_tag__0_
#set_dont_touch functional_unit_2__genblk1_alu_fu/cdb_term_o_reg_tag__1_
#set_dont_touch functional_unit_2__genblk1_alu_fu/cdb_term_o_reg_tag__0_
#set_dont_touch functional_unit_3__genblk1_alu_fu/cdb_term_o_reg_tag__2_
#set_dont_touch functional_unit_0__genblk1_alu_fu/cdb_term_o_reg_tag__0_
#set_dont_touch functional_unit_7__genblk1_shifter_fu/cdb_term_o_reg_tag__3_
#set_dont_touch functional_unit_5__genblk1_alu_fu/cdb_term_o_reg_tag__2_
#set_dont_touch functional_unit_5__genblk1_alu_fu/cdb_term_o_reg_tag__1_
#set_dont_touch functional_unit_6__genblk1_shifter_fu/cdb_term_o_reg_tag__2_
#set_dont_touch functional_unit_6__genblk1_shifter_fu/cdb_term_o_reg_tag__0_
#set_dont_touch functional_unit_6__genblk1_shifter_fu/cdb_term_o_reg_tag__1_


#set_dont_touch functional_unit_1__genblk1_alu_fu/cdb_term_o
#set_dont_touch functional_unit_4__genblk1_alu_fu/cdb_term_o
#set_dont_touch functional_unit_4__genblk1_alu_fu/cdb_term_o
#set_dont_touch functional_unit_2__genblk1_alu_fu/cdb_term_o
#set_dont_touch functional_unit_2__genblk1_alu_fu/cdb_term_o
#set_dont_touch functional_unit_3__genblk1_alu_fu/cdb_term_o
#set_dont_touch functional_unit_0__genblk1_alu_fu/cdb_term_o
#set_dont_touch functional_unit_7__genblk1_shifter_fu/cdb_term_o
#set_dont_touch functional_unit_5__genblk1_alu_fu/cdb_term_o
#set_dont_touch functional_unit_5__genblk1_alu_fu/cdb_term_o
#set_dont_touch functional_unit_6__genblk1_shifter_fu/cdb_term_o
#set_dont_touch functional_unit_6__genblk1_shifter_fu/cdb_term_o
#set_dont_touch functional_unit_6__genblk1_shifter_fu/cdb_term_o


#set_dont_touch 



# TIMING CONSTRAINTS
# ==========================================================================
read_sdc ../syn/results/$design_name.syn.sdc
check_timing

# FLOORPLAN CREATION
# =========================================================================
# Create core shape and pin placement
source ${SCRIPTS_DIR}/floorplan.tcl -echo

# PHYSICAL POWER NETWORK
# ==========================================================================
save_mw_cel -as ${design_name}_prepns
source ${SCRIPTS_DIR}/power.tcl -echo

# PLACEMENT OPTIMIZATION
# ==========================================================================
save_mw_cel -as ${design_name}_preplaceopt
source ${SCRIPTS_DIR}/placeopt.tcl -echo

# CTS & CLOCK ROUTING
# ==========================================================================
save_mw_cel -as ${design_name}_preclock
source ${SCRIPTS_DIR}/clocks.tcl


# SIGNAL ROUTING
# ==========================================================================
save_mw_cel -as ${design_name}_preroute
source ${SCRIPTS_DIR}/route.tcl -echo

# GENERATE RESULT FILES
# ==========================================================================
save_mw_cel -as ${design_name}_finished
source ${SCRIPTS_DIR}/generate.tcl -echo

# REPORT DRCS AS POPUP WINDOW
# ==========================================================================
source ${SCRIPTS_DIR}/report_drcs.tcl -echo
report_drc -highlight -color green

start_gui
#report_timing

