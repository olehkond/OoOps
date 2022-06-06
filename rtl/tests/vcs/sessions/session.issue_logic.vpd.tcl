# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Fri May 27 01:31:11 2022
# Designs open: 1
#   V1: issue_logic.vpd
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Source.1: issue_logic_tb
#   Wave.1: 71 signals
#   Group count = 8
#   Group dut signal count = 23
#   Group Group1 signal count = 27
#   Group Group2 signal count = 12
#   Group Group3 signal count = 2
#   Group Group4 signal count = 1
#   Group Group5 signal count = 1
#   Group regfile_dut signal count = 17
#   Group instr_queue signal count = 9
# End_DVE_Session_Save_Info

# DVE version: S-2021.09-SP1_Full64
# DVE build date: Nov 30 2021 00:09:19


#<Session mode="Full" path="/home/olehkond/git/OoOps/rtl/tests/vcs/sessions/session.issue_logic.vpd.tcl" type="Debug">

gui_set_loading_session_type Post
gui_continuetime_set

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all

# Close all windows
gui_close_window -type Console
gui_close_window -type Wave
gui_close_window -type Source
gui_close_window -type Schematic
gui_close_window -type Data
gui_close_window -type DriverLoad
gui_close_window -type List
gui_close_window -type Memory
gui_close_window -type HSPane
gui_close_window -type DLPane
gui_close_window -type Assertion
gui_close_window -type CovHier
gui_close_window -type CoverageTable
gui_close_window -type CoverageMap
gui_close_window -type CovDetail
gui_close_window -type Local
gui_close_window -type Stack
gui_close_window -type Watch
gui_close_window -type Group
gui_close_window -type Transaction



# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.1

if {![gui_exist_window -window TopLevel.1]} {
    set TopLevel.1 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.1 TopLevel.1
}
gui_show_window -window ${TopLevel.1} -show_state maximized -rect {{0 60} {2193 1121}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_hide_toolbar -toolbar {Simulator}
gui_hide_toolbar -toolbar {Interactive Rewind}
gui_hide_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 483]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 483
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 482} {height 773} {dock_state left} {dock_on_new_line true} {child_hier_colhier 448} {child_hier_coltype 130} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 430]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 430
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 771
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 429} {height 773} {dock_state left} {dock_on_new_line true} {child_data_colvariable 222} {child_data_colvalue 87} {child_data_coltype 226} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 180]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 2134
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 180
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 2193} {height 179} {dock_state bottom} {dock_on_new_line true}}
#### Start - Readjusting docked view's offset / size
set dockAreaList { top left right bottom }
foreach dockArea $dockAreaList {
  set viewList [gui_ekki_get_window_ids -active_parent -dock_area $dockArea]
  foreach view $viewList {
      if {[lsearch -exact [gui_get_window_pref_keys -window $view] dock_width] != -1} {
        set dockWidth [gui_get_window_pref_value -window $view -key dock_width]
        set dockHeight [gui_get_window_pref_value -window $view -key dock_height]
        set offset [gui_get_window_pref_value -window $view -key dock_offset]
        if { [string equal "top" $dockArea] || [string equal "bottom" $dockArea]} {
          gui_set_window_attributes -window $view -dock_offset $offset -width $dockWidth
        } else {
          gui_set_window_attributes -window $view -dock_offset $offset -height $dockHeight
        }
      }
  }
}
#### End - Readjusting docked view's offset / size
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Source.1 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.1} -show_state maximized
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings


# Create and position top-level window: TopLevel.2

if {![gui_exist_window -window TopLevel.2]} {
    set TopLevel.2 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.2 TopLevel.2
}
gui_show_window -window ${TopLevel.2} -show_state normal -rect {{61 66} {2188 1118}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_hide_toolbar -toolbar {Simulator}
gui_hide_toolbar -toolbar {Interactive Rewind}
gui_set_toolbar_attributes -toolbar {Testbench} -dock_state top
gui_set_toolbar_attributes -toolbar {Testbench} -offset 0
gui_show_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
gui_sync_global -id ${TopLevel.2} -option true

# MDI window settings
set Wave.1 [gui_create_window -type {Wave}  -parent ${TopLevel.2}]
gui_show_window -window ${Wave.1} -show_state maximized
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 617} {child_wave_right 1505} {child_wave_colname 314} {child_wave_colvalue 299} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) none
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.1}
gui_update_statusbar_target_frame ${TopLevel.2}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { ![gui_is_db_opened -db {issue_logic.vpd}] } {
	gui_open_db -design V1 -file issue_logic.vpd -nosource
}
gui_set_precision 10ps
gui_set_time_units 10ps
#</Database>

# DVE Global setting session: 


# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {issue_logic_tb}
gui_load_child_values {issue_logic_tb.regfile_dut}


set _session_group_485 dut
gui_sg_create "$_session_group_485"
set dut "$_session_group_485"

gui_sg_addsignal -group "$_session_group_485" { {issue_logic_tb.dut.$unit} issue_logic_tb.dut.immediate issue_logic_tb.dut.immediate_stall issue_logic_tb.dut.instr_imm issue_logic_tb.dut.alu_op issue_logic_tb.dut.sft_op issue_logic_tb.dut.load issue_logic_tb.dut.reg_tag_wr issue_logic_tb.dut.instr_valid issue_logic_tb.dut.rd_idx issue_logic_tb.dut.instr_rd_idx issue_logic_tb.dut.write_bus issue_logic_tb.dut.write_instr_last_cyc issue_logic_tb.dut.instr_type issue_logic_tb.dut.instr_type_stall issue_logic_tb.dut.alu_sel_idx issue_logic_tb.dut.sft_sel_idx issue_logic_tb.dut.alu_free issue_logic_tb.dut.sft_free issue_logic_tb.dut.ls_free issue_logic_tb.dut.rs_free issue_logic_tb.dut.state issue_logic_tb.dut.next_state }

set _session_group_486 Group1
gui_sg_create "$_session_group_486"
set Group1 "$_session_group_486"

gui_sg_addsignal -group "$_session_group_486" { issue_logic_tb.dut.stall issue_logic_tb.dut.valid_instr_iq issue_logic_tb.dut.stall_last_cyc issue_logic_tb.dut.write_rs issue_logic_tb.dut.read_instr_last_cyc issue_logic_tb.dut.iq_read_o issue_logic_tb.dut.reg_rd_addr1_o issue_logic_tb.dut.reg_rd_addr2_o issue_logic_tb.dut.reg_tag_addr1_o issue_logic_tb.dut.reg_tag_addr2_o issue_logic_tb.dut.reg_tag_wr_addr_o issue_logic_tb.dut.reg_wr_tag_o issue_logic_tb.dut.reg_tag_wr_en_o issue_logic_tb.dut.rs_write_en_o issue_logic_tb.dut.rs_value1_o issue_logic_tb.dut.rs_value2_o issue_logic_tb.dut.rs_tag1_o issue_logic_tb.dut.rs_tag2_o issue_logic_tb.dut.alu_op_type_o issue_logic_tb.dut.shift_op_type_o issue_logic_tb.dut.write_o issue_logic_tb.dut.load_o issue_logic_tb.dut.addr_tag_o issue_logic_tb.dut.addr_o issue_logic_tb.dut.offset_o issue_logic_tb.dut.data_st_tag_o issue_logic_tb.dut.data_st_o }
gui_set_radix -radix {decimal} -signals {V1:issue_logic_tb.dut.rs_value1_o}
gui_set_radix -radix {twosComplement} -signals {V1:issue_logic_tb.dut.rs_value1_o}
gui_set_radix -radix {decimal} -signals {V1:issue_logic_tb.dut.rs_value2_o}
gui_set_radix -radix {twosComplement} -signals {V1:issue_logic_tb.dut.rs_value2_o}

set _session_group_487 Group2
gui_sg_create "$_session_group_487"
set Group2 "$_session_group_487"

gui_sg_addsignal -group "$_session_group_487" { issue_logic_tb.dut.clk_i issue_logic_tb.dut.reset_i issue_logic_tb.dut.iq_data_i issue_logic_tb.dut.iq_empty_i issue_logic_tb.dut.reg_rd_data1_i issue_logic_tb.dut.reg_rd_data2_i issue_logic_tb.dut.reg_tag2_rd_i issue_logic_tb.dut.reg_tag1_rd_i issue_logic_tb.new_bus issue_logic_tb.dut.busy_bus_i issue_logic_tb.dut.tag_ld_i issue_logic_tb.dut.cdb_i }
gui_set_radix -radix {decimal} -signals {V1:issue_logic_tb.new_bus}
gui_set_radix -radix {twosComplement} -signals {V1:issue_logic_tb.new_bus}

set _session_group_488 Group3
gui_sg_create "$_session_group_488"
set Group3 "$_session_group_488"

gui_sg_addsignal -group "$_session_group_488" { issue_logic_tb.instr_mem issue_logic_tb.full_instr_mem }

set _session_group_489 Group4
gui_sg_create "$_session_group_489"
set Group4 "$_session_group_489"

gui_sg_addsignal -group "$_session_group_489" { issue_logic_tb.new_bus }
gui_set_radix -radix {decimal} -signals {V1:issue_logic_tb.new_bus}
gui_set_radix -radix {twosComplement} -signals {V1:issue_logic_tb.new_bus}

set _session_group_490 Group5
gui_sg_create "$_session_group_490"
set Group5 "$_session_group_490"

gui_sg_addsignal -group "$_session_group_490" { issue_logic_tb.new_bus }
gui_set_radix -radix {decimal} -signals {V1:issue_logic_tb.new_bus}
gui_set_radix -radix {twosComplement} -signals {V1:issue_logic_tb.new_bus}

set _session_group_491 regfile_dut
gui_sg_create "$_session_group_491"
set regfile_dut "$_session_group_491"

gui_sg_addsignal -group "$_session_group_491" { {issue_logic_tb.regfile_dut.$unit} issue_logic_tb.regfile_dut.clk_i issue_logic_tb.regfile_dut.reset_i issue_logic_tb.regfile_dut.read_addr1_i issue_logic_tb.regfile_dut.read_addr2_i issue_logic_tb.regfile_dut.reg_tag_read_idx1_i issue_logic_tb.regfile_dut.reg_tag_read_idx2_i issue_logic_tb.regfile_dut.reg_tag_write_idx_i issue_logic_tb.regfile_dut.wr_tag_i issue_logic_tb.regfile_dut.wr_en_tag_i issue_logic_tb.regfile_dut.read_data1_o issue_logic_tb.regfile_dut.read_data2_o issue_logic_tb.regfile_dut.tag1_o issue_logic_tb.regfile_dut.tag2_o issue_logic_tb.regfile_dut.registers issue_logic_tb.regfile_dut.reg_status_unit issue_logic_tb.regfile_dut.cdb_i }

set _session_group_492 instr_queue
gui_sg_create "$_session_group_492"
set instr_queue "$_session_group_492"

gui_sg_addsignal -group "$_session_group_492" { {issue_logic_tb.instr_queue.unnamed$$_0} {issue_logic_tb.instr_queue.$unit} issue_logic_tb.instr_queue.write_data_i issue_logic_tb.instr_queue.write_i issue_logic_tb.instr_queue.read_i issue_logic_tb.instr_queue.clk_i issue_logic_tb.instr_queue.full_o issue_logic_tb.instr_queue.empty_o issue_logic_tb.instr_queue.read_data_o }

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 18978



# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*}
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design V1
catch {gui_list_expand -id ${Hier.1} issue_logic_tb}
catch {gui_list_select -id ${Hier.1} {issue_logic_tb.dut}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {val*}
gui_list_show_data -id ${Data.1} {issue_logic_tb.dut}
gui_show_window -window ${Data.1}
catch { gui_list_select -id ${Data.1} {issue_logic_tb.dut.valid_instr_iq }}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active issue_logic_tb ../issue_logic_tb.sv
gui_view_scroll -id ${Source.1} -vertical -set 168
gui_src_set_reusable -id ${Source.1}

# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 0 30500
gui_list_add_group -id ${Wave.1} -after {New Group} {dut}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group1}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group2}
gui_list_add_group -id ${Wave.1} -after {New Group} {instr_queue}
gui_list_select -id ${Wave.1} {issue_logic_tb.dut.reg_tag_wr_addr_o }
gui_seek_criteria -id ${Wave.1} {Any Edge}



gui_set_env TOGGLE::DEFAULT_WAVE_WINDOW ${Wave.1}
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
gui_list_set_insertion_bar  -id ${Wave.1} -group Group1  -item issue_logic_tb.dut.valid_instr_iq -position below

gui_marker_move -id ${Wave.1} {C1} 18978
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
	gui_set_active_window -window ${HSPane.1}
}
if {[gui_exist_window -window ${TopLevel.2}]} {
	gui_set_active_window -window ${TopLevel.2}
	gui_set_active_window -window ${Wave.1}
}
#</Session>

