
source ./config.tcl

# Read in the design RTL
# ======================================
set_svf ./$results/$TOPLEVEL.syn.svf
define_design_lib WORK -path ./tmp/WORK

#  Set all synthesized FF's to explicity have sync reset,
#  resulting in a reset pin rather than combinational logic
#  external to the FF to drive the reset
set_app_var hdlin_ff_always_sync_set_reset true 

analyze -format sverilog $RTL_SOURCE_FILES -define $RTL_DEFINES
set_app_var template_parameter_style "%d"
elaborate $TOPLEVEL
current_design $TOPLEVEL

link
