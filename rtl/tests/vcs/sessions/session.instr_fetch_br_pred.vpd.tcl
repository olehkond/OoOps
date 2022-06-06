# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Sun May 29 22:18:11 2022
# Designs open: 1
#   V1: instr_fetch_br_pred.vpd
# Toplevel windows open: 4
# 	TopLevel.1
# 	TopLevel.2
# 	TopLevel.3
# 	TopLevel.4
#   Source.1: instr_fetch_br_pred_tb.dut_br_pr
#   Wave.1: 15 signals
#   Wave.2: 28 signals
#   Wave.3: 18 signals
#   Group count = 9
#   Group dut_br_pr signal count = 6
#   Group Group1 signal count = 7
#   Group Group2 signal count = 2
#   Group dut_fetch signal count = 15
#   Group Group3 signal count = 8
#   Group Group4 signal count = 5
#   Group dut_fifo signal count = 10
#   Group Group5 signal count = 5
#   Group Group6 signal count = 3
# End_DVE_Session_Save_Info

# DVE version: S-2021.09-SP1_Full64
# DVE build date: Nov 30 2021 00:09:19


#<Session mode="Full" path="/home/olehkond/git/OoOps/rtl/tests/vcs/sessions/session.instr_fetch_br_pred.vpd.tcl" type="Debug">

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
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 479]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 479
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 478} {height 777} {dock_state left} {dock_on_new_line true} {child_hier_colhier 448} {child_hier_coltype 130} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 426]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 426
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 775
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 425} {height 777} {dock_state left} {dock_on_new_line true} {child_data_colvariable 222} {child_data_colvalue 87} {child_data_coltype 226} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 176]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 2134
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 176
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 2193} {height 175} {dock_state bottom} {dock_on_new_line true}}
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
gui_show_window -window ${TopLevel.2} -show_state normal -rect {{67 70} {2190 1118}}

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
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 616} {child_wave_right 1502} {child_wave_colname 313} {child_wave_colvalue 299} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings


# Create and position top-level window: TopLevel.3

if {![gui_exist_window -window TopLevel.3]} {
    set TopLevel.3 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.3 TopLevel.3
}
gui_show_window -window ${TopLevel.3} -show_state normal -rect {{67 70} {2190 1118}}

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
gui_sync_global -id ${TopLevel.3} -option true

# MDI window settings
set Wave.2 [gui_create_window -type {Wave}  -parent ${TopLevel.3}]
gui_show_window -window ${Wave.2} -show_state maximized
gui_update_layout -id ${Wave.2} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 616} {child_wave_right 1502} {child_wave_colname 313} {child_wave_colvalue 299} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings


# Create and position top-level window: TopLevel.4

if {![gui_exist_window -window TopLevel.4]} {
    set TopLevel.4 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.4 TopLevel.4
}
gui_show_window -window ${TopLevel.4} -show_state normal -rect {{67 70} {2190 1118}}

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
gui_sync_global -id ${TopLevel.4} -option true

# MDI window settings
set Wave.3 [gui_create_window -type {Wave}  -parent ${TopLevel.4}]
gui_show_window -window ${Wave.3} -show_state maximized
gui_update_layout -id ${Wave.3} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 616} {child_wave_right 1502} {child_wave_colname 313} {child_wave_colvalue 299} {child_wave_col1 0} {child_wave_col2 1}}

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
gui_update_statusbar_target_frame ${TopLevel.3}
gui_update_statusbar_target_frame ${TopLevel.4}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { ![gui_is_db_opened -db {instr_fetch_br_pred.vpd}] } {
	gui_open_db -design V1 -file instr_fetch_br_pred.vpd -nosource
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
gui_load_child_values {instr_fetch_br_pred_tb.dut_fetch}


set _session_group_20 dut_br_pr
gui_sg_create "$_session_group_20"
set dut_br_pr "$_session_group_20"

gui_sg_addsignal -group "$_session_group_20" { instr_fetch_br_pred_tb.dut_br_pr.br_imm_se_sh instr_fetch_br_pred_tb.dut_br_pr.history instr_fetch_br_pred_tb.dut_br_pr.branch_table instr_fetch_br_pred_tb.dut_br_pr.branch_predicted instr_fetch_br_pred_tb.dut_br_pr.HISTORY_BITS instr_fetch_br_pred_tb.dut_br_pr.IMM_WIDTH }
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_br_pr.br_imm_se_sh}
gui_set_radix -radix {twosComplement} -signals {V1:instr_fetch_br_pred_tb.dut_br_pr.br_imm_se_sh}
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_br_pr.HISTORY_BITS}
gui_set_radix -radix {twosComplement} -signals {V1:instr_fetch_br_pred_tb.dut_br_pr.HISTORY_BITS}
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_br_pr.IMM_WIDTH}
gui_set_radix -radix {twosComplement} -signals {V1:instr_fetch_br_pred_tb.dut_br_pr.IMM_WIDTH}

set _session_group_21 Group1
gui_sg_create "$_session_group_21"
set Group1 "$_session_group_21"

gui_sg_addsignal -group "$_session_group_21" { instr_fetch_br_pred_tb.dut_br_pr.clk_i instr_fetch_br_pred_tb.dut_br_pr.reset_i instr_fetch_br_pred_tb.dut_br_pr.program_counter_i instr_fetch_br_pred_tb.dut_br_pr.jump_imm_i instr_fetch_br_pred_tb.dut_br_pr.issuing_branch_i instr_fetch_br_pred_tb.dut_br_pr.cond_eval_i instr_fetch_br_pred_tb.dut_br_pr.corr_pred_i }
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_br_pr.program_counter_i}
gui_set_radix -radix {unsigned} -signals {V1:instr_fetch_br_pred_tb.dut_br_pr.program_counter_i}
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_br_pr.jump_imm_i}
gui_set_radix -radix {twosComplement} -signals {V1:instr_fetch_br_pred_tb.dut_br_pr.jump_imm_i}

set _session_group_22 Group2
gui_sg_create "$_session_group_22"
set Group2 "$_session_group_22"

gui_sg_addsignal -group "$_session_group_22" { instr_fetch_br_pred_tb.dut_br_pr.program_counter_branched_o instr_fetch_br_pred_tb.dut_br_pr.br_taken_o }
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_br_pr.program_counter_branched_o}
gui_set_radix -radix {unsigned} -signals {V1:instr_fetch_br_pred_tb.dut_br_pr.program_counter_branched_o}

set _session_group_23 dut_fetch
gui_sg_create "$_session_group_23"
set dut_fetch "$_session_group_23"

gui_sg_addsignal -group "$_session_group_23" { instr_fetch_br_pred_tb.dut_fetch.program_counter_NT instr_fetch_br_pred_tb.dut_fetch.program_counter_next instr_fetch_br_pred_tb.dut_fetch.state instr_fetch_br_pred_tb.dut_fetch.next_state instr_fetch_br_pred_tb.dut_fetch.jmp_imm instr_fetch_br_pred_tb.dut_fetch.jmp_imm_se_sh instr_fetch_br_pred_tb.dut_fetch.instr_op instr_fetch_br_pred_tb.dut_fetch.jump_instr instr_fetch_br_pred_tb.dut_fetch.branch_instr instr_fetch_br_pred_tb.dut_fetch.ls_instr instr_fetch_br_pred_tb.dut_fetch.IMM_WIDTH instr_fetch_br_pred_tb.dut_fetch.JMP_OPCODE instr_fetch_br_pred_tb.dut_fetch.BR_OPCODE instr_fetch_br_pred_tb.dut_fetch.LD_OPCODE instr_fetch_br_pred_tb.dut_fetch.ST_OPCODE }
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.program_counter_NT}
gui_set_radix -radix {unsigned} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.program_counter_NT}
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.program_counter_next}
gui_set_radix -radix {unsigned} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.program_counter_next}
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.jmp_imm}
gui_set_radix -radix {twosComplement} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.jmp_imm}
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.jmp_imm_se_sh}
gui_set_radix -radix {twosComplement} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.jmp_imm_se_sh}
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.IMM_WIDTH}
gui_set_radix -radix {twosComplement} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.IMM_WIDTH}
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.JMP_OPCODE}
gui_set_radix -radix {unsigned} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.JMP_OPCODE}
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.BR_OPCODE}
gui_set_radix -radix {unsigned} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.BR_OPCODE}
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.LD_OPCODE}
gui_set_radix -radix {unsigned} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.LD_OPCODE}
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.ST_OPCODE}
gui_set_radix -radix {unsigned} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.ST_OPCODE}

set _session_group_24 Group3
gui_sg_create "$_session_group_24"
set Group3 "$_session_group_24"

gui_sg_addsignal -group "$_session_group_24" { instr_fetch_br_pred_tb.dut_fetch.clk_i instr_fetch_br_pred_tb.dut_fetch.reset_i instr_fetch_br_pred_tb.dut_fetch.program_counter_branched_i instr_fetch_br_pred_tb.dut_fetch.br_taken_i instr_fetch_br_pred_tb.dut_fetch.cond_eval_i instr_fetch_br_pred_tb.dut_fetch.corr_pred_i instr_fetch_br_pred_tb.dut_fetch.iq_full_i instr_fetch_br_pred_tb.dut_fetch.instr_i }
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.program_counter_branched_i}
gui_set_radix -radix {unsigned} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.program_counter_branched_i}

set _session_group_25 Group4
gui_sg_create "$_session_group_25"
set Group4 "$_session_group_25"

gui_sg_addsignal -group "$_session_group_25" { instr_fetch_br_pred_tb.dut_fetch.jump_imm_o instr_fetch_br_pred_tb.dut_fetch.issuing_branch_o instr_fetch_br_pred_tb.dut_fetch.iq_write_o instr_fetch_br_pred_tb.dut_fetch.iq_instr_o instr_fetch_br_pred_tb.dut_fetch.program_counter_o }
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.jump_imm_o}
gui_set_radix -radix {twosComplement} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.jump_imm_o}
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.program_counter_o}
gui_set_radix -radix {unsigned} -signals {V1:instr_fetch_br_pred_tb.dut_fetch.program_counter_o}

set _session_group_26 dut_fifo
gui_sg_create "$_session_group_26"
set dut_fifo "$_session_group_26"

gui_sg_addsignal -group "$_session_group_26" { {instr_fetch_br_pred_tb.dut_fifo.unnamed$$_0} instr_fetch_br_pred_tb.dut_fifo.fifo instr_fetch_br_pred_tb.dut_fifo.head instr_fetch_br_pred_tb.dut_fifo.head_next instr_fetch_br_pred_tb.dut_fifo.head_plus1 instr_fetch_br_pred_tb.dut_fifo.tail instr_fetch_br_pred_tb.dut_fifo.tail_next instr_fetch_br_pred_tb.dut_fifo.tail_plus1 instr_fetch_br_pred_tb.dut_fifo.oper instr_fetch_br_pred_tb.dut_fifo.ENTRIES_POW2 }
gui_set_radix -radix {decimal} -signals {V1:instr_fetch_br_pred_tb.dut_fifo.ENTRIES_POW2}
gui_set_radix -radix {twosComplement} -signals {V1:instr_fetch_br_pred_tb.dut_fifo.ENTRIES_POW2}

set _session_group_27 Group5
gui_sg_create "$_session_group_27"
set Group5 "$_session_group_27"

gui_sg_addsignal -group "$_session_group_27" { instr_fetch_br_pred_tb.dut_fifo.write_data_i instr_fetch_br_pred_tb.dut_fifo.write_i instr_fetch_br_pred_tb.dut_fifo.read_i instr_fetch_br_pred_tb.dut_fifo.reset_i instr_fetch_br_pred_tb.dut_fifo.clk_i }

set _session_group_28 Group6
gui_sg_create "$_session_group_28"
set Group6 "$_session_group_28"

gui_sg_addsignal -group "$_session_group_28" { instr_fetch_br_pred_tb.dut_fifo.full_o instr_fetch_br_pred_tb.dut_fifo.empty_o instr_fetch_br_pred_tb.dut_fifo.read_data_o }

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 10074



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
catch {gui_list_expand -id ${Hier.1} instr_fetch_br_pred_tb}
catch {gui_list_select -id ${Hier.1} {instr_fetch_br_pred_tb.dut_fifo}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {instr_fetch_br_pred_tb.dut_fifo}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active instr_fetch_br_pred_tb.dut_br_pr /home/olehkond/git/OoOps/rtl/branch_pred.sv
gui_view_scroll -id ${Source.1} -vertical -set 84
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
gui_wv_zoom_timerange -id ${Wave.1} 0 18500
gui_list_add_group -id ${Wave.1} -after {New Group} {dut_br_pr}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group1}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group2}
gui_list_select -id ${Wave.1} {instr_fetch_br_pred_tb.dut_br_pr.br_imm_se_sh }
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
gui_list_set_insertion_bar  -id ${Wave.1} -group Group2  -item instr_fetch_br_pred_tb.dut_br_pr.br_taken_o -position below

gui_marker_move -id ${Wave.1} {C1} 10074
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false

# View 'Wave.2'
gui_wv_sync -id ${Wave.2} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.2}  C1
gui_wv_zoom_timerange -id ${Wave.2} 0 18500
gui_list_add_group -id ${Wave.2} -after {New Group} {dut_fetch}
gui_list_add_group -id ${Wave.2} -after {New Group} {Group3}
gui_list_add_group -id ${Wave.2} -after {New Group} {Group4}
gui_list_select -id ${Wave.2} {instr_fetch_br_pred_tb.dut_fetch.iq_instr_o }
gui_seek_criteria -id ${Wave.2} {Any Edge}


gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.2} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.2} -text {*}
gui_list_set_insertion_bar  -id ${Wave.2} -group Group4  -item {instr_fetch_br_pred_tb.dut_fetch.program_counter_o[31:0]} -position below

gui_marker_move -id ${Wave.2} {C1} 10074
gui_view_scroll -id ${Wave.2} -vertical -set 10
gui_show_grid -id ${Wave.2} -enable false

# View 'Wave.3'
gui_wv_sync -id ${Wave.3} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.3}  C1
gui_wv_zoom_timerange -id ${Wave.3} 0 18500
gui_list_add_group -id ${Wave.3} -after {New Group} {dut_fifo}
gui_list_add_group -id ${Wave.3} -after {New Group} {Group5}
gui_list_add_group -id ${Wave.3} -after {New Group} {Group6}
gui_seek_criteria -id ${Wave.3} {Any Edge}



gui_set_env TOGGLE::DEFAULT_WAVE_WINDOW ${Wave.3}
gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.3} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.3} -text {*}
gui_list_set_insertion_bar  -id ${Wave.3} -group Group6  -item {instr_fetch_br_pred_tb.dut_fifo.read_data_o[31:0]} -position below

gui_marker_move -id ${Wave.3} {C1} 10074
gui_view_scroll -id ${Wave.3} -vertical -set 0
gui_show_grid -id ${Wave.3} -enable false
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.3}]} {
	gui_set_active_window -window ${TopLevel.3}
	gui_set_active_window -window ${Wave.2}
}
if {[gui_exist_window -window ${TopLevel.4}]} {
	gui_set_active_window -window ${TopLevel.4}
	gui_set_active_window -window ${Wave.3}
}
if {[gui_exist_window -window ${TopLevel.2}]} {
	gui_set_active_window -window ${TopLevel.2}
	gui_set_active_window -window ${Wave.1}
}
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
	gui_set_active_window -window ${HSPane.1}
}
#</Session>

