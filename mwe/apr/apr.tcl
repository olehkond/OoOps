#Notes for tyler
# 2. Migrate to NLDM for the target lib db - see the setup_65pg.tcl file and search for nldm to see what i mean. You'll have to do the same in synthesis. CCS takes too long and its annoying for small designs. 


set design_name "P5SCPU"  ;  # Name of the design

# CONFIGURATION
# ==========================================================================
set TOOL_NAME "ICC"
# directory where tcl src is located 
set SCRIPTS_DIR "."


# Configure design, libraries
# ==========================================================================
source ${SCRIPTS_DIR}/config.tcl -echo
#source ${SCRIPTS_DIR}/setup_65gp.tcl -echo
source ${SCRIPTS_DIR}/library.tcl -echo

# READ DESIGN
# ==========================================================================
# Read in the verilog, uniquify and save the CEL view.
import_designs ../syn/results/$design_name.syn.v -format verilog -top $design_name
link

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
