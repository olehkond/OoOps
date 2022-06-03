# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Thu Jun 2 12:00:05 2022
# Designs open: 1
#   V1: OoO_top.vpd
# Toplevel windows open: 8
# 	TopLevel.1
# 	TopLevel.2
# 	TopLevel.3
# 	TopLevel.4
# 	TopLevel.5
# 	TopLevel.6
# 	TopLevel.7
# 	TopLevel.8
#   Source.1: 
#   Wave.1: 22 signals
#   Wave.2: 16 signals
#   Wave.3: 23 signals
#   Wave.4: 84 signals
#   Wave.5: 36 signals
#   Wave.6: 25 signals
#   Wave.7: 24 signals
#   Group count = 44
#   Group register_file signal count = 3
#   Group Group1 signal count = 10
#   Group Group2 signal count = 4
#   Group ls_unit signal count = 11
#   Group Group3 signal count = 12
#   Group Group4 signal count = 7
#   Group dmem_unit signal count = 9
#   Group Group5 signal count = 7
#   Group Group6 signal count = 2
#   Group issue_stage signal count = 32
#   Group Group7 signal count = 11
#   Group Group8 signal count = 22
#   Group register_file_1 signal count = 3
#   Group Group9 signal count = 10
#   Group Group10 signal count = 4
#   Group branch_eval_unit signal count = 9
#   Group branch_predictor signal count = 5
#   Group Group11 signal count = 7
#   Group Group12 signal count = 2
#   Group Group13 signal count = 11
#   Group Group14 signal count = 2
#   Group instruction_fetch_unit signal count = 9
#   Group branch_eval_unit_1 signal count = 9
#   Group Group15 signal count = 11
#   Group Group16 signal count = 2
#   Group branch_predictor_1 signal count = 7
#   Group Group17 signal count = 7
#   Group Group18 signal count = 2
#   Group instruction_fetch_unit_1 signal count = 10
#   Group Group19 signal count = 8
#   Group Group20 signal count = 5
#   Group issue_stage_1 signal count = 46
#   Group Group21 signal count = 13
#   Group Group22 signal count = 25
#   Group ls_unit_1 signal count = 14
#   Group Group23 signal count = 15
#   Group Group24 signal count = 7
#   Group register_file_2 signal count = 8
#   Group Group25 signal count = 13
#   Group Group26 signal count = 4
#   Group dmem_rwu signal count = 5
#   Group Group27 signal count = 12
#   Group Group28 signal count = 6
#   Group Group29 signal count = 1
# End_DVE_Session_Save_Info

# DVE version: S-2021.09-SP1_Full64
# DVE build date: Nov 30 2021 00:09:19


#<Session mode="Full" path="/home/olehkond/git/OoOps/rtl/tests/vcs/sessions/session.OoO_top.vpd.tcl" type="Debug">

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
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 477]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 477
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 476} {height 779} {dock_state left} {dock_on_new_line true} {child_hier_colhier 448} {child_hier_coltype 130} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 424]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 424
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 774
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 423} {height 779} {dock_state left} {dock_on_new_line true} {child_data_colvariable 222} {child_data_colvalue 87} {child_data_coltype 226} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 174]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 2134
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 174
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 2193} {height 173} {dock_state bottom} {dock_on_new_line true}}
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
gui_show_window -window ${TopLevel.2} -show_state normal -rect {{71 74} {2190 1118}}

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
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 615} {child_wave_right 1499} {child_wave_colname 313} {child_wave_colvalue 298} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings


# Create and position top-level window: TopLevel.3

if {![gui_exist_window -window TopLevel.3]} {
    set TopLevel.3 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.3 TopLevel.3
}
gui_show_window -window ${TopLevel.3} -show_state normal -rect {{71 74} {2190 1118}}

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
gui_update_layout -id ${Wave.2} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 615} {child_wave_right 1499} {child_wave_colname 313} {child_wave_colvalue 298} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings


# Create and position top-level window: TopLevel.4

if {![gui_exist_window -window TopLevel.4]} {
    set TopLevel.4 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.4 TopLevel.4
}
gui_show_window -window ${TopLevel.4} -show_state normal -rect {{71 74} {2190 1118}}

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
gui_update_layout -id ${Wave.3} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 615} {child_wave_right 1499} {child_wave_colname 313} {child_wave_colvalue 298} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings


# Create and position top-level window: TopLevel.5

if {![gui_exist_window -window TopLevel.5]} {
    set TopLevel.5 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.5 TopLevel.5
}
gui_show_window -window ${TopLevel.5} -show_state normal -rect {{71 74} {2190 1118}}

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
gui_sync_global -id ${TopLevel.5} -option true

# MDI window settings
set Wave.4 [gui_create_window -type {Wave}  -parent ${TopLevel.5}]
gui_show_window -window ${Wave.4} -show_state maximized
gui_update_layout -id ${Wave.4} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 615} {child_wave_right 1499} {child_wave_colname 313} {child_wave_colvalue 298} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings


# Create and position top-level window: TopLevel.6

if {![gui_exist_window -window TopLevel.6]} {
    set TopLevel.6 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.6 TopLevel.6
}
gui_show_window -window ${TopLevel.6} -show_state normal -rect {{71 74} {2190 1118}}

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
gui_sync_global -id ${TopLevel.6} -option true

# MDI window settings
set Wave.5 [gui_create_window -type {Wave}  -parent ${TopLevel.6}]
gui_show_window -window ${Wave.5} -show_state maximized
gui_update_layout -id ${Wave.5} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 615} {child_wave_right 1499} {child_wave_colname 313} {child_wave_colvalue 298} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings


# Create and position top-level window: TopLevel.7

if {![gui_exist_window -window TopLevel.7]} {
    set TopLevel.7 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.7 TopLevel.7
}
gui_show_window -window ${TopLevel.7} -show_state normal -rect {{71 74} {2190 1118}}

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
gui_sync_global -id ${TopLevel.7} -option true

# MDI window settings
set Wave.6 [gui_create_window -type {Wave}  -parent ${TopLevel.7}]
gui_show_window -window ${Wave.6} -show_state maximized
gui_update_layout -id ${Wave.6} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 615} {child_wave_right 1499} {child_wave_colname 313} {child_wave_colvalue 298} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings


# Create and position top-level window: TopLevel.8

if {![gui_exist_window -window TopLevel.8]} {
    set TopLevel.8 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.8 TopLevel.8
}
gui_show_window -window ${TopLevel.8} -show_state normal -rect {{71 74} {2190 1118}}

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
gui_sync_global -id ${TopLevel.8} -option true

# MDI window settings
set Wave.7 [gui_create_window -type {Wave}  -parent ${TopLevel.8}]
gui_show_window -window ${Wave.7} -show_state maximized
gui_update_layout -id ${Wave.7} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 615} {child_wave_right 1499} {child_wave_colname 313} {child_wave_colvalue 298} {child_wave_col1 0} {child_wave_col2 1}}

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
gui_update_statusbar_target_frame ${TopLevel.5}
gui_update_statusbar_target_frame ${TopLevel.6}
gui_update_statusbar_target_frame ${TopLevel.7}
gui_update_statusbar_target_frame ${TopLevel.8}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { ![gui_is_db_opened -db {OoO_top.vpd}] } {
	gui_open_db -design V1 -file OoO_top.vpd -nosource
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
gui_load_child_values {OoO_top_tb.dut.ls_unit}
gui_load_child_values {OoO_top_tb.dut.branch_predictor}
gui_load_child_values {OoO_top_tb.dut.issue_stage}
gui_load_child_values {OoO_top_tb.dut.register_file}
gui_load_child_values {OoO_top_tb.dut.branch_eval_unit}
gui_load_child_values {OoO_top_tb.dut.ls_unit.dmem_rwu}


set _session_group_577 register_file
gui_sg_create "$_session_group_577"
set register_file "$_session_group_577"

gui_sg_addsignal -group "$_session_group_577" { {OoO_top_tb.dut.register_file.$unit} OoO_top_tb.dut.register_file.registers OoO_top_tb.dut.register_file.reg_status_unit }

set _session_group_578 Group1
gui_sg_create "$_session_group_578"
set Group1 "$_session_group_578"

gui_sg_addsignal -group "$_session_group_578" { OoO_top_tb.dut.register_file.clk_i OoO_top_tb.dut.register_file.reset_i OoO_top_tb.dut.register_file.read_addr1_i OoO_top_tb.dut.register_file.read_addr2_i OoO_top_tb.dut.register_file.reg_tag_read_idx1_i OoO_top_tb.dut.register_file.reg_tag_read_idx2_i OoO_top_tb.dut.register_file.reg_tag_write_idx_i OoO_top_tb.dut.register_file.wr_tag_i OoO_top_tb.dut.register_file.wr_en_tag_i OoO_top_tb.dut.register_file.cdb_i }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.read_addr1_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.register_file.read_addr1_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.read_addr2_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.register_file.read_addr2_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_read_idx1_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_read_idx1_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_read_idx2_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_read_idx2_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_write_idx_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_write_idx_i}

set _session_group_579 Group2
gui_sg_create "$_session_group_579"
set Group2 "$_session_group_579"

gui_sg_addsignal -group "$_session_group_579" { OoO_top_tb.dut.register_file.read_data1_o OoO_top_tb.dut.register_file.read_data2_o OoO_top_tb.dut.register_file.tag1_o OoO_top_tb.dut.register_file.tag2_o }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.read_data1_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.register_file.read_data1_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.read_data2_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.register_file.read_data2_o}

set _session_group_580 ls_unit
gui_sg_create "$_session_group_580"
set ls_unit "$_session_group_580"

gui_sg_addsignal -group "$_session_group_580" { OoO_top_tb.dut.ls_unit.read OoO_top_tb.dut.ls_unit.head OoO_top_tb.dut.ls_unit.empty OoO_top_tb.dut.ls_unit.tail_plus1 OoO_top_tb.dut.ls_unit.head_next OoO_top_tb.dut.ls_unit.tail OoO_top_tb.dut.ls_unit.head_plus1 OoO_top_tb.dut.ls_unit.tail_next {OoO_top_tb.dut.ls_unit.$unit} OoO_top_tb.dut.ls_unit.oper OoO_top_tb.dut.ls_unit.buff }

set _session_group_581 Group3
gui_sg_create "$_session_group_581"
set Group3 "$_session_group_581"

gui_sg_addsignal -group "$_session_group_581" { OoO_top_tb.dut.ls_unit.cdb_i OoO_top_tb.dut.ls_unit.data_st_tag_i OoO_top_tb.dut.ls_unit.dmem_done_i OoO_top_tb.dut.ls_unit.data_st_i OoO_top_tb.dut.ls_unit.load_i OoO_top_tb.dut.ls_unit.dmem_rd_data_i OoO_top_tb.dut.ls_unit.reset_i OoO_top_tb.dut.ls_unit.write_i OoO_top_tb.dut.ls_unit.addr_tag_i OoO_top_tb.dut.ls_unit.offset_i OoO_top_tb.dut.ls_unit.clk_i OoO_top_tb.dut.ls_unit.addr_i }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.ls_unit.data_st_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.ls_unit.data_st_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_rd_data_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_rd_data_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.ls_unit.offset_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.ls_unit.offset_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.ls_unit.addr_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.ls_unit.addr_i}

set _session_group_582 Group4
gui_sg_create "$_session_group_582"
set Group4 "$_session_group_582"

gui_sg_addsignal -group "$_session_group_582" { OoO_top_tb.dut.ls_unit.dmem_read_o OoO_top_tb.dut.ls_unit.full_o OoO_top_tb.dut.ls_unit.dmem_write_o OoO_top_tb.dut.ls_unit.dmem_data_o OoO_top_tb.dut.ls_unit.cdb_term_o OoO_top_tb.dut.ls_unit.tag_ld_o OoO_top_tb.dut.ls_unit.dmem_addr_o }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_data_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_data_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_addr_o}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_addr_o}

set _session_group_583 dmem_unit
gui_sg_create "$_session_group_583"
set dmem_unit "$_session_group_583"

gui_sg_addsignal -group "$_session_group_583" { {OoO_top_tb.dmem_unit.$unit} OoO_top_tb.dmem_unit.state OoO_top_tb.dmem_unit.state_next OoO_top_tb.dmem_unit.start OoO_top_tb.dmem_unit.address OoO_top_tb.dmem_unit.data_st OoO_top_tb.dmem_unit.done_next OoO_top_tb.dmem_unit.eff_address OoO_top_tb.dmem_unit.memory }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dmem_unit.address}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dmem_unit.address}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dmem_unit.eff_address}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dmem_unit.eff_address}

set _session_group_584 Group5
gui_sg_create "$_session_group_584"
set Group5 "$_session_group_584"

gui_sg_addsignal -group "$_session_group_584" { OoO_top_tb.dmem_unit.clk_i OoO_top_tb.dmem_unit.reset_i OoO_top_tb.dmem_unit.dmem_read_i OoO_top_tb.dmem_unit.dmem_write_i OoO_top_tb.dmem_unit.dmem_addr_i OoO_top_tb.dmem_unit.dmem_data_i OoO_top_tb.dmem_unit.memory }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dmem_unit.dmem_addr_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dmem_unit.dmem_addr_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dmem_unit.dmem_data_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dmem_unit.dmem_data_i}

set _session_group_585 Group6
gui_sg_create "$_session_group_585"
set Group6 "$_session_group_585"

gui_sg_addsignal -group "$_session_group_585" { OoO_top_tb.dmem_unit.dmem_rd_data_o OoO_top_tb.dmem_unit.dmem_done_o }

set _session_group_586 issue_stage
gui_sg_create "$_session_group_586"
set issue_stage "$_session_group_586"

gui_sg_addsignal -group "$_session_group_586" { {OoO_top_tb.dut.issue_stage.$unit} OoO_top_tb.dut.issue_stage.read_instr_last_cyc OoO_top_tb.dut.issue_stage.write_instr_last_cyc OoO_top_tb.dut.issue_stage.immediate OoO_top_tb.dut.issue_stage.immediate_stall OoO_top_tb.dut.issue_stage.instr_imm OoO_top_tb.dut.issue_stage.alu_op OoO_top_tb.dut.issue_stage.sft_op OoO_top_tb.dut.issue_stage.load OoO_top_tb.dut.issue_stage.reg_tag_wr_en_stall OoO_top_tb.dut.issue_stage.instr_valid OoO_top_tb.dut.issue_stage.rd_idx OoO_top_tb.dut.issue_stage.instr_rd_idx OoO_top_tb.dut.issue_stage.write_bus OoO_top_tb.dut.issue_stage.write_rs OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_tmp OoO_top_tb.dut.issue_stage.reg_tag_wr_en_tmp OoO_top_tb.dut.issue_stage.stall OoO_top_tb.dut.issue_stage.stall_last_cyc OoO_top_tb.dut.issue_stage.valid_instr_iq OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_pos OoO_top_tb.dut.issue_stage.instr_type_stall OoO_top_tb.dut.issue_stage.alu_sel_idx OoO_top_tb.dut.issue_stage.sft_sel_idx OoO_top_tb.dut.issue_stage.alu_free OoO_top_tb.dut.issue_stage.sft_free OoO_top_tb.dut.issue_stage.ls_free OoO_top_tb.dut.issue_stage.rs_free OoO_top_tb.dut.issue_stage.state OoO_top_tb.dut.issue_stage.next_state OoO_top_tb.dut.issue_stage.reg_tag_wr OoO_top_tb.dut.issue_stage.instr_type }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.instr_imm}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.issue_stage.instr_imm}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.rd_idx}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.rd_idx}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.instr_rd_idx}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.instr_rd_idx}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_tmp}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_tmp}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_pos}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_pos}

set _session_group_587 Group7
gui_sg_create "$_session_group_587"
set Group7 "$_session_group_587"

gui_sg_addsignal -group "$_session_group_587" { OoO_top_tb.dut.issue_stage.clk_i OoO_top_tb.dut.issue_stage.reset_i OoO_top_tb.dut.issue_stage.iq_data_i OoO_top_tb.dut.issue_stage.iq_empty_i OoO_top_tb.dut.issue_stage.reg_rd_data1_i OoO_top_tb.dut.issue_stage.reg_rd_data2_i OoO_top_tb.dut.issue_stage.reg_tag1_rd_i OoO_top_tb.dut.issue_stage.reg_tag2_rd_i OoO_top_tb.dut.issue_stage.busy_bus_i OoO_top_tb.dut.issue_stage.tag_ld_i OoO_top_tb.dut.issue_stage.cdb_i }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_rd_data1_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.issue_stage.reg_rd_data1_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_rd_data2_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.issue_stage.reg_rd_data2_i}

set _session_group_588 Group8
gui_sg_create "$_session_group_588"
set Group8 "$_session_group_588"

gui_sg_addsignal -group "$_session_group_588" { OoO_top_tb.dut.issue_stage.iq_read_o OoO_top_tb.dut.issue_stage.reg_rd_addr1_o OoO_top_tb.dut.issue_stage.reg_rd_addr2_o OoO_top_tb.dut.issue_stage.reg_tag_addr1_o OoO_top_tb.dut.issue_stage.reg_tag_addr2_o OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_o OoO_top_tb.dut.issue_stage.reg_wr_tag_o OoO_top_tb.dut.issue_stage.reg_tag_wr_en_o OoO_top_tb.dut.issue_stage.rs_write_en_o OoO_top_tb.dut.issue_stage.rs_value1_o OoO_top_tb.dut.issue_stage.rs_value2_o OoO_top_tb.dut.issue_stage.rs_tag1_o OoO_top_tb.dut.issue_stage.rs_tag2_o OoO_top_tb.dut.issue_stage.alu_op_type_o OoO_top_tb.dut.issue_stage.shift_op_type_o OoO_top_tb.dut.issue_stage.write_o OoO_top_tb.dut.issue_stage.load_o OoO_top_tb.dut.issue_stage.addr_tag_o OoO_top_tb.dut.issue_stage.addr_o OoO_top_tb.dut.issue_stage.offset_o OoO_top_tb.dut.issue_stage.data_st_tag_o OoO_top_tb.dut.issue_stage.data_st_o }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_rd_addr1_o}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.reg_rd_addr1_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_rd_addr2_o}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.reg_rd_addr2_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_addr1_o}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_addr1_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_addr2_o}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_addr2_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_o}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.rs_value1_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.issue_stage.rs_value1_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.rs_value2_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.issue_stage.rs_value2_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.addr_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.issue_stage.addr_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.offset_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.issue_stage.offset_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.data_st_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.issue_stage.data_st_o}

set _session_group_589 register_file_1
gui_sg_create "$_session_group_589"
set register_file_1 "$_session_group_589"

gui_sg_addsignal -group "$_session_group_589" { OoO_top_tb.dut.register_file.reg_status_unit OoO_top_tb.dut.register_file.registers {OoO_top_tb.dut.register_file.$unit} }

set _session_group_590 Group9
gui_sg_create "$_session_group_590"
set Group9 "$_session_group_590"

gui_sg_addsignal -group "$_session_group_590" { OoO_top_tb.dut.register_file.cdb_i OoO_top_tb.dut.register_file.reg_tag_read_idx2_i OoO_top_tb.dut.register_file.read_addr1_i OoO_top_tb.dut.register_file.read_addr2_i OoO_top_tb.dut.register_file.wr_en_tag_i OoO_top_tb.dut.register_file.reset_i OoO_top_tb.dut.register_file.reg_tag_write_idx_i OoO_top_tb.dut.register_file.wr_tag_i OoO_top_tb.dut.register_file.reg_tag_read_idx1_i OoO_top_tb.dut.register_file.clk_i }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_read_idx2_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_read_idx2_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.read_addr1_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.register_file.read_addr1_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.read_addr2_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.register_file.read_addr2_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_write_idx_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_write_idx_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_read_idx1_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_read_idx1_i}

set _session_group_591 Group10
gui_sg_create "$_session_group_591"
set Group10 "$_session_group_591"

gui_sg_addsignal -group "$_session_group_591" { OoO_top_tb.dut.register_file.read_data2_o OoO_top_tb.dut.register_file.tag1_o OoO_top_tb.dut.register_file.read_data1_o OoO_top_tb.dut.register_file.tag2_o }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.read_data2_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.register_file.read_data2_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.read_data1_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.register_file.read_data1_o}

set _session_group_592 branch_eval_unit
gui_sg_create "$_session_group_592"
set branch_eval_unit "$_session_group_592"

gui_sg_addsignal -group "$_session_group_592" { {OoO_top_tb.dut.branch_eval_unit.$unit} OoO_top_tb.dut.branch_eval_unit.br_op OoO_top_tb.dut.branch_eval_unit.br_taken OoO_top_tb.dut.branch_eval_unit.write_op1 OoO_top_tb.dut.branch_eval_unit.write_op2 OoO_top_tb.dut.branch_eval_unit.ops_ready_next_cycle OoO_top_tb.dut.branch_eval_unit.state OoO_top_tb.dut.branch_eval_unit.next_state OoO_top_tb.dut.branch_eval_unit.br }

set _session_group_593 branch_predictor
gui_sg_create "$_session_group_593"
set branch_predictor "$_session_group_593"

gui_sg_addsignal -group "$_session_group_593" { {OoO_top_tb.dut.branch_predictor.$unit} OoO_top_tb.dut.branch_predictor.br_imm_se_sh OoO_top_tb.dut.branch_predictor.history OoO_top_tb.dut.branch_predictor.branch_table OoO_top_tb.dut.branch_predictor.branch_predicted }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.branch_predictor.br_imm_se_sh}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.branch_predictor.br_imm_se_sh}

set _session_group_594 Group11
gui_sg_create "$_session_group_594"
set Group11 "$_session_group_594"

gui_sg_addsignal -group "$_session_group_594" { OoO_top_tb.dut.branch_predictor.clk_i OoO_top_tb.dut.branch_predictor.reset_i OoO_top_tb.dut.branch_predictor.program_counter_i OoO_top_tb.dut.branch_predictor.br_imm_i OoO_top_tb.dut.branch_predictor.issuing_branch_i OoO_top_tb.dut.branch_predictor.cond_eval_i OoO_top_tb.dut.branch_predictor.corr_pred_i }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.branch_predictor.program_counter_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.branch_predictor.program_counter_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.branch_predictor.br_imm_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.branch_predictor.br_imm_i}

set _session_group_595 Group12
gui_sg_create "$_session_group_595"
set Group12 "$_session_group_595"

gui_sg_addsignal -group "$_session_group_595" { OoO_top_tb.dut.branch_predictor.program_counter_branched_o OoO_top_tb.dut.branch_predictor.br_taken_o }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.branch_predictor.program_counter_branched_o}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.branch_predictor.program_counter_branched_o}

set _session_group_596 Group13
gui_sg_create "$_session_group_596"
set Group13 "$_session_group_596"

gui_sg_addsignal -group "$_session_group_596" { OoO_top_tb.dut.branch_eval_unit.reset_i OoO_top_tb.dut.branch_eval_unit.clk_i OoO_top_tb.dut.branch_eval_unit.write_i OoO_top_tb.dut.branch_eval_unit.branch_op_type_i OoO_top_tb.dut.branch_eval_unit.tag1_i OoO_top_tb.dut.branch_eval_unit.tag2_i OoO_top_tb.dut.branch_eval_unit.val1_i OoO_top_tb.dut.branch_eval_unit.val2_i OoO_top_tb.dut.branch_eval_unit.br_taken_i OoO_top_tb.dut.branch_eval_unit.issuing_branch_i OoO_top_tb.dut.branch_eval_unit.cdb_i }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.branch_eval_unit.val1_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.branch_eval_unit.val1_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.branch_eval_unit.val2_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.branch_eval_unit.val2_i}

set _session_group_597 Group14
gui_sg_create "$_session_group_597"
set Group14 "$_session_group_597"

gui_sg_addsignal -group "$_session_group_597" { OoO_top_tb.dut.branch_eval_unit.cond_eval_o OoO_top_tb.dut.branch_eval_unit.corr_pred_o }

set _session_group_598 instruction_fetch_unit
gui_sg_create "$_session_group_598"
set instruction_fetch_unit "$_session_group_598"

gui_sg_addsignal -group "$_session_group_598" { {OoO_top_tb.dut.instruction_fetch_unit.$unit} OoO_top_tb.dut.instruction_fetch_unit.program_counter_NT OoO_top_tb.dut.instruction_fetch_unit.program_counter_next OoO_top_tb.dut.instruction_fetch_unit.state OoO_top_tb.dut.instruction_fetch_unit.next_state OoO_top_tb.dut.instruction_fetch_unit.jmp_imm_se_sh OoO_top_tb.dut.instruction_fetch_unit.instr_op OoO_top_tb.dut.instruction_fetch_unit.jump_instr OoO_top_tb.dut.instruction_fetch_unit.branch_instr }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.program_counter_NT}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.program_counter_NT}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.program_counter_next}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.program_counter_next}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.jmp_imm_se_sh}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.jmp_imm_se_sh}

set _session_group_599 branch_eval_unit_1
gui_sg_create "$_session_group_599"
set branch_eval_unit_1 "$_session_group_599"

gui_sg_addsignal -group "$_session_group_599" { OoO_top_tb.dut.branch_eval_unit.br_op OoO_top_tb.dut.branch_eval_unit.br_taken OoO_top_tb.dut.branch_eval_unit.write_op1 OoO_top_tb.dut.branch_eval_unit.write_op2 OoO_top_tb.dut.branch_eval_unit.br OoO_top_tb.dut.branch_eval_unit.next_state OoO_top_tb.dut.branch_eval_unit.state OoO_top_tb.dut.branch_eval_unit.ops_ready_next_cycle {OoO_top_tb.dut.branch_eval_unit.$unit} }

set _session_group_600 Group15
gui_sg_create "$_session_group_600"
set Group15 "$_session_group_600"

gui_sg_addsignal -group "$_session_group_600" { OoO_top_tb.dut.branch_eval_unit.cdb_i OoO_top_tb.dut.branch_eval_unit.br_taken_i OoO_top_tb.dut.branch_eval_unit.tag1_i OoO_top_tb.dut.branch_eval_unit.tag2_i OoO_top_tb.dut.branch_eval_unit.val1_i OoO_top_tb.dut.branch_eval_unit.val2_i OoO_top_tb.dut.branch_eval_unit.reset_i OoO_top_tb.dut.branch_eval_unit.issuing_branch_i OoO_top_tb.dut.branch_eval_unit.write_i OoO_top_tb.dut.branch_eval_unit.branch_op_type_i OoO_top_tb.dut.branch_eval_unit.clk_i }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.branch_eval_unit.val1_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.branch_eval_unit.val1_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.branch_eval_unit.val2_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.branch_eval_unit.val2_i}

set _session_group_601 Group16
gui_sg_create "$_session_group_601"
set Group16 "$_session_group_601"

gui_sg_addsignal -group "$_session_group_601" { OoO_top_tb.dut.branch_eval_unit.corr_pred_o OoO_top_tb.dut.branch_eval_unit.cond_eval_o }

set _session_group_602 branch_predictor_1
gui_sg_create "$_session_group_602"
set branch_predictor_1 "$_session_group_602"

gui_sg_addsignal -group "$_session_group_602" { OoO_top_tb.dut.branch_predictor.HISTORY_BITS OoO_top_tb.dut.branch_predictor.branch_predicted OoO_top_tb.dut.branch_predictor.branch_table OoO_top_tb.dut.branch_predictor.br_imm_se_sh OoO_top_tb.dut.branch_predictor.IMM_WIDTH {OoO_top_tb.dut.branch_predictor.$unit} OoO_top_tb.dut.branch_predictor.history }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.branch_predictor.HISTORY_BITS}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.branch_predictor.HISTORY_BITS}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.branch_predictor.br_imm_se_sh}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.branch_predictor.br_imm_se_sh}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.branch_predictor.IMM_WIDTH}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.branch_predictor.IMM_WIDTH}

set _session_group_603 Group17
gui_sg_create "$_session_group_603"
set Group17 "$_session_group_603"

gui_sg_addsignal -group "$_session_group_603" { OoO_top_tb.dut.branch_predictor.program_counter_i OoO_top_tb.dut.branch_predictor.br_imm_i OoO_top_tb.dut.branch_predictor.reset_i OoO_top_tb.dut.branch_predictor.corr_pred_i OoO_top_tb.dut.branch_predictor.issuing_branch_i OoO_top_tb.dut.branch_predictor.cond_eval_i OoO_top_tb.dut.branch_predictor.clk_i }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.branch_predictor.program_counter_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.branch_predictor.program_counter_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.branch_predictor.br_imm_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.branch_predictor.br_imm_i}

set _session_group_604 Group18
gui_sg_create "$_session_group_604"
set Group18 "$_session_group_604"

gui_sg_addsignal -group "$_session_group_604" { OoO_top_tb.dut.branch_predictor.program_counter_branched_o OoO_top_tb.dut.branch_predictor.br_taken_o }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.branch_predictor.program_counter_branched_o}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.branch_predictor.program_counter_branched_o}

set _session_group_605 instruction_fetch_unit_1
gui_sg_create "$_session_group_605"
set instruction_fetch_unit_1 "$_session_group_605"

gui_sg_addsignal -group "$_session_group_605" { OoO_top_tb.dut.instruction_fetch_unit.program_counter_NT OoO_top_tb.dut.instruction_fetch_unit.jump_instr OoO_top_tb.dut.instruction_fetch_unit.branch_instr OoO_top_tb.dut.instruction_fetch_unit.state OoO_top_tb.dut.instruction_fetch_unit.next_state OoO_top_tb.dut.instruction_fetch_unit.instr_op OoO_top_tb.dut.instruction_fetch_unit.jmp_imm OoO_top_tb.dut.instruction_fetch_unit.program_counter_next OoO_top_tb.dut.instruction_fetch_unit.jmp_imm_se_sh {OoO_top_tb.dut.instruction_fetch_unit.$unit} }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.program_counter_NT}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.program_counter_NT}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.jmp_imm}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.jmp_imm}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.program_counter_next}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.program_counter_next}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.jmp_imm_se_sh}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.jmp_imm_se_sh}

set _session_group_606 Group19
gui_sg_create "$_session_group_606"
set Group19 "$_session_group_606"

gui_sg_addsignal -group "$_session_group_606" { OoO_top_tb.dut.instruction_fetch_unit.program_counter_branched_i OoO_top_tb.dut.instruction_fetch_unit.br_taken_i OoO_top_tb.dut.instruction_fetch_unit.iq_full_i OoO_top_tb.dut.instruction_fetch_unit.instr_i OoO_top_tb.dut.instruction_fetch_unit.reset_i OoO_top_tb.dut.instruction_fetch_unit.cond_eval_i OoO_top_tb.dut.instruction_fetch_unit.corr_pred_i OoO_top_tb.dut.instruction_fetch_unit.clk_i }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.program_counter_branched_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.program_counter_branched_i}

set _session_group_607 Group20
gui_sg_create "$_session_group_607"
set Group20 "$_session_group_607"

gui_sg_addsignal -group "$_session_group_607" { OoO_top_tb.dut.instruction_fetch_unit.program_counter_o OoO_top_tb.dut.instruction_fetch_unit.fetched_instr_o OoO_top_tb.dut.instruction_fetch_unit.br_imm_o OoO_top_tb.dut.instruction_fetch_unit.iq_write_o OoO_top_tb.dut.instruction_fetch_unit.issuing_branch_o }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.program_counter_o}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.program_counter_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.br_imm_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.instruction_fetch_unit.br_imm_o}

set _session_group_608 issue_stage_1
gui_sg_create "$_session_group_608"
set issue_stage_1 "$_session_group_608"

gui_sg_addsignal -group "$_session_group_608" { OoO_top_tb.dut.issue_stage.reg_tag_wr OoO_top_tb.dut.issue_stage.valid_instr_iq OoO_top_tb.dut.issue_stage.addr_tag_pos OoO_top_tb.dut.issue_stage.sft_free OoO_top_tb.dut.issue_stage.instr_type OoO_top_tb.dut.issue_stage.stall OoO_top_tb.dut.issue_stage.rs_value1_pos OoO_top_tb.dut.issue_stage.rd_idx OoO_top_tb.dut.issue_stage.addr_pos OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_tmp OoO_top_tb.dut.issue_stage.rs_value2_pos OoO_top_tb.dut.issue_stage.sft_op OoO_top_tb.dut.issue_stage.alu_sel_idx OoO_top_tb.dut.issue_stage.stall_last_cyc OoO_top_tb.dut.issue_stage.immediate OoO_top_tb.dut.issue_stage.load OoO_top_tb.dut.issue_stage.write_rs OoO_top_tb.dut.issue_stage.read_instr_last_cyc OoO_top_tb.dut.issue_stage.reg_tag_wr_en_tmp OoO_top_tb.dut.issue_stage.instr_imm OoO_top_tb.dut.issue_stage.write_instr_last_cyc OoO_top_tb.dut.issue_stage.data_st_pos OoO_top_tb.dut.issue_stage.instr_valid OoO_top_tb.dut.issue_stage.state OoO_top_tb.dut.issue_stage.instr_rd_idx OoO_top_tb.dut.issue_stage.rs_write_en_pbr OoO_top_tb.dut.issue_stage.sp_state_next OoO_top_tb.dut.issue_stage.write_bus OoO_top_tb.dut.issue_stage.reg_tag_wr_en_stall OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_pos OoO_top_tb.dut.issue_stage.alu_free OoO_top_tb.dut.issue_stage.rs_tag1_pos OoO_top_tb.dut.issue_stage.sft_sel_idx OoO_top_tb.dut.issue_stage.ls_free OoO_top_tb.dut.issue_stage.data_st_tag_pos OoO_top_tb.dut.issue_stage.sp_state OoO_top_tb.dut.issue_stage.rs_tag2_pos OoO_top_tb.dut.issue_stage.immediate_stall OoO_top_tb.dut.issue_stage.alu_op OoO_top_tb.dut.issue_stage.store_instr OoO_top_tb.dut.issue_stage.needed_rs_free OoO_top_tb.dut.issue_stage.next_state {OoO_top_tb.dut.issue_stage.$unit} OoO_top_tb.dut.issue_stage.br_op OoO_top_tb.dut.issue_stage.instr_type_stall OoO_top_tb.dut.issue_stage.rs_free }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.rd_idx}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.rd_idx}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_tmp}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_tmp}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.instr_imm}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.issue_stage.instr_imm}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.instr_rd_idx}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.instr_rd_idx}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_pos}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_pos}

set _session_group_609 Group21
gui_sg_create "$_session_group_609"
set Group21 "$_session_group_609"

gui_sg_addsignal -group "$_session_group_609" { OoO_top_tb.dut.issue_stage.iq_empty_i OoO_top_tb.dut.issue_stage.iq_data_i OoO_top_tb.dut.issue_stage.cdb_i OoO_top_tb.dut.issue_stage.reg_tag1_rd_i OoO_top_tb.dut.issue_stage.reg_tag2_rd_i OoO_top_tb.dut.issue_stage.reg_rd_data1_i OoO_top_tb.dut.issue_stage.reg_rd_data2_i OoO_top_tb.dut.issue_stage.cond_eval_i OoO_top_tb.dut.issue_stage.corr_pred_i OoO_top_tb.dut.issue_stage.tag_ld_i OoO_top_tb.dut.issue_stage.reset_i OoO_top_tb.dut.issue_stage.busy_bus_i OoO_top_tb.dut.issue_stage.clk_i }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_rd_data1_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.issue_stage.reg_rd_data1_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_rd_data2_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.issue_stage.reg_rd_data2_i}

set _session_group_610 Group22
gui_sg_create "$_session_group_610"
set Group22 "$_session_group_610"

gui_sg_addsignal -group "$_session_group_610" { OoO_top_tb.dut.issue_stage.iq_read_o OoO_top_tb.dut.issue_stage.spec_o OoO_top_tb.dut.issue_stage.branch_op_type_o OoO_top_tb.dut.issue_stage.shift_op_type_o OoO_top_tb.dut.issue_stage.alu_op_type_o OoO_top_tb.dut.issue_stage.save_regfile_state_o OoO_top_tb.dut.issue_stage.rs_tag1_o OoO_top_tb.dut.issue_stage.rs_tag2_o OoO_top_tb.dut.issue_stage.reg_tag_addr1_o OoO_top_tb.dut.issue_stage.reg_tag_addr2_o OoO_top_tb.dut.issue_stage.reg_wr_tag_o OoO_top_tb.dut.issue_stage.reg_tag_wr_en_o OoO_top_tb.dut.issue_stage.rs_write_en_o OoO_top_tb.dut.issue_stage.rs_value1_o OoO_top_tb.dut.issue_stage.rs_value2_o OoO_top_tb.dut.issue_stage.reg_rd_addr1_o OoO_top_tb.dut.issue_stage.reg_rd_addr2_o OoO_top_tb.dut.issue_stage.write_o OoO_top_tb.dut.issue_stage.addr_tag_o OoO_top_tb.dut.issue_stage.load_o OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_o OoO_top_tb.dut.issue_stage.data_st_tag_o OoO_top_tb.dut.issue_stage.data_st_o OoO_top_tb.dut.issue_stage.addr_o OoO_top_tb.dut.issue_stage.offset_o }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_addr1_o}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_addr1_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_addr2_o}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_addr2_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.rs_value1_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.issue_stage.rs_value1_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.rs_value2_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.issue_stage.rs_value2_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_rd_addr1_o}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.reg_rd_addr1_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_rd_addr2_o}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.reg_rd_addr2_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_o}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.issue_stage.reg_tag_wr_addr_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.data_st_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.issue_stage.data_st_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.addr_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.issue_stage.addr_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.issue_stage.offset_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.issue_stage.offset_o}

set _session_group_611 ls_unit_1
gui_sg_create "$_session_group_611"
set ls_unit_1 "$_session_group_611"

gui_sg_addsignal -group "$_session_group_611" { OoO_top_tb.dut.ls_unit.SIZE_POW2 OoO_top_tb.dut.ls_unit.head OoO_top_tb.dut.ls_unit.empty OoO_top_tb.dut.ls_unit.ld_ready_cond OoO_top_tb.dut.ls_unit.st_ready_cond OoO_top_tb.dut.ls_unit.tail_plus1 OoO_top_tb.dut.ls_unit.head_next OoO_top_tb.dut.ls_unit.tail OoO_top_tb.dut.ls_unit.buff OoO_top_tb.dut.ls_unit.head_plus1 OoO_top_tb.dut.ls_unit.tail_next {OoO_top_tb.dut.ls_unit.$unit} OoO_top_tb.dut.ls_unit.oper OoO_top_tb.dut.ls_unit.read }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.ls_unit.SIZE_POW2}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.ls_unit.SIZE_POW2}

set _session_group_612 Group23
gui_sg_create "$_session_group_612"
set Group23 "$_session_group_612"

gui_sg_addsignal -group "$_session_group_612" { OoO_top_tb.dut.ls_unit.cdb_i OoO_top_tb.dut.ls_unit.write_i OoO_top_tb.dut.ls_unit.spec_i OoO_top_tb.dut.ls_unit.load_i OoO_top_tb.dut.ls_unit.data_st_tag_i OoO_top_tb.dut.ls_unit.data_st_i OoO_top_tb.dut.ls_unit.addr_tag_i OoO_top_tb.dut.ls_unit.addr_i OoO_top_tb.dut.ls_unit.offset_i OoO_top_tb.dut.ls_unit.cond_eval_i OoO_top_tb.dut.ls_unit.corr_pred_i OoO_top_tb.dut.ls_unit.dmem_done_i OoO_top_tb.dut.ls_unit.dmem_rd_data_i OoO_top_tb.dut.ls_unit.reset_i OoO_top_tb.dut.ls_unit.clk_i }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.ls_unit.data_st_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.ls_unit.data_st_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.ls_unit.addr_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.ls_unit.addr_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.ls_unit.offset_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.ls_unit.offset_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_rd_data_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_rd_data_i}

set _session_group_613 Group24
gui_sg_create "$_session_group_613"
set Group24 "$_session_group_613"

gui_sg_addsignal -group "$_session_group_613" { OoO_top_tb.dut.ls_unit.full_o OoO_top_tb.dut.ls_unit.tag_ld_o OoO_top_tb.dut.ls_unit.cdb_term_o OoO_top_tb.dut.ls_unit.dmem_read_o OoO_top_tb.dut.ls_unit.dmem_write_o OoO_top_tb.dut.ls_unit.dmem_data_o OoO_top_tb.dut.ls_unit.dmem_addr_o }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_data_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_data_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_addr_o}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_addr_o}

set _session_group_614 register_file_2
gui_sg_create "$_session_group_614"
set register_file_2 "$_session_group_614"

gui_sg_addsignal -group "$_session_group_614" { OoO_top_tb.dut.register_file.registers_SP OoO_top_tb.dut.register_file.reg_status_unit_SP OoO_top_tb.dut.register_file.registers OoO_top_tb.dut.register_file.reg_status_unit {OoO_top_tb.dut.register_file.$unit} OoO_top_tb.dut.register_file.tag_wr_en OoO_top_tb.dut.register_file.state OoO_top_tb.dut.register_file.next_state }

set _session_group_615 Group25
gui_sg_create "$_session_group_615"
set Group25 "$_session_group_615"

gui_sg_addsignal -group "$_session_group_615" { OoO_top_tb.dut.register_file.cdb_i OoO_top_tb.dut.register_file.save_regfile_state_i OoO_top_tb.dut.register_file.reg_tag_write_idx_i OoO_top_tb.dut.register_file.wr_tag_i OoO_top_tb.dut.register_file.wr_en_tag_i OoO_top_tb.dut.register_file.reg_tag_read_idx1_i OoO_top_tb.dut.register_file.reg_tag_read_idx2_i OoO_top_tb.dut.register_file.read_addr1_i OoO_top_tb.dut.register_file.read_addr2_i OoO_top_tb.dut.register_file.cond_eval_i OoO_top_tb.dut.register_file.corr_pred_i OoO_top_tb.dut.register_file.clk_i OoO_top_tb.dut.register_file.reset_i }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_write_idx_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_write_idx_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_read_idx1_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_read_idx1_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_read_idx2_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.register_file.reg_tag_read_idx2_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.read_addr1_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.register_file.read_addr1_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.read_addr2_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.register_file.read_addr2_i}

set _session_group_616 Group26
gui_sg_create "$_session_group_616"
set Group26 "$_session_group_616"

gui_sg_addsignal -group "$_session_group_616" { OoO_top_tb.dut.register_file.tag1_o OoO_top_tb.dut.register_file.tag2_o OoO_top_tb.dut.register_file.read_data1_o OoO_top_tb.dut.register_file.read_data2_o }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.read_data1_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.register_file.read_data1_o}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.register_file.read_data2_o}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.register_file.read_data2_o}

set _session_group_617 dmem_rwu
gui_sg_create "$_session_group_617"
set dmem_rwu "$_session_group_617"

gui_sg_addsignal -group "$_session_group_617" { {OoO_top_tb.dut.ls_unit.dmem_rwu.$unit} OoO_top_tb.dut.ls_unit.dmem_rwu.state OoO_top_tb.dut.ls_unit.dmem_rwu.state_next OoO_top_tb.dut.ls_unit.dmem_rwu.load_tag OoO_top_tb.dut.ls_unit.dmem_rwu.lsu_load_last }

set _session_group_618 Group27
gui_sg_create "$_session_group_618"
set Group27 "$_session_group_618"

gui_sg_addsignal -group "$_session_group_618" { OoO_top_tb.dut.ls_unit.dmem_rwu.clk_i OoO_top_tb.dut.ls_unit.dmem_rwu.reset_i OoO_top_tb.dut.ls_unit.dmem_rwu.lsu_empty_i OoO_top_tb.dut.ls_unit.dmem_rwu.lsu_eff_addr_i OoO_top_tb.dut.ls_unit.dmem_rwu.lsu_st_data_i OoO_top_tb.dut.ls_unit.dmem_rwu.lsu_ld_tag_i OoO_top_tb.dut.ls_unit.dmem_rwu.lsu_load_i OoO_top_tb.dut.ls_unit.dmem_rwu.lsu_instr_ready_i OoO_top_tb.dut.ls_unit.dmem_rwu.lsu_specultative_i OoO_top_tb.dut.ls_unit.dmem_rwu.lsu_corr_pred_i OoO_top_tb.dut.ls_unit.dmem_rwu.dmem_rd_data_i OoO_top_tb.dut.ls_unit.dmem_rwu.dmem_done_i }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_rwu.lsu_eff_addr_i}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_rwu.lsu_eff_addr_i}
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_rwu.lsu_st_data_i}
gui_set_radix -radix {twosComplement} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_rwu.lsu_st_data_i}

set _session_group_619 Group28
gui_sg_create "$_session_group_619"
set Group28 "$_session_group_619"

gui_sg_addsignal -group "$_session_group_619" { OoO_top_tb.dut.ls_unit.dmem_rwu.lsu_read_o OoO_top_tb.dut.ls_unit.dmem_rwu.dmem_read_o OoO_top_tb.dut.ls_unit.dmem_rwu.dmem_write_o OoO_top_tb.dut.ls_unit.dmem_rwu.dmem_addr_o OoO_top_tb.dut.ls_unit.dmem_rwu.dmem_data_o OoO_top_tb.dut.ls_unit.dmem_rwu.cdb_load_o }
gui_set_radix -radix {decimal} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_rwu.dmem_addr_o}
gui_set_radix -radix {unsigned} -signals {V1:OoO_top_tb.dut.ls_unit.dmem_rwu.dmem_addr_o}

set _session_group_620 Group29
gui_sg_create "$_session_group_620"
set Group29 "$_session_group_620"

gui_sg_addsignal -group "$_session_group_620" { OoO_top_tb.dmem_unit.memory }

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 27901



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
catch {gui_list_expand -id ${Hier.1} OoO_top_tb}
catch {gui_list_select -id ${Hier.1} {OoO_top_tb.dmem_unit}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {OoO_top_tb.dmem_unit}
gui_show_window -window ${Data.1}
catch { gui_list_select -id ${Data.1} {OoO_top_tb.dmem_unit.memory }}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_view_scroll -id ${Source.1} -vertical -set 0
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
gui_wv_zoom_timerange -id ${Wave.1} 0 41120
gui_list_add_group -id ${Wave.1} -after {New Group} {branch_eval_unit_1}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group15}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group16}
gui_list_expand -id ${Wave.1} OoO_top_tb.dut.branch_eval_unit.br
gui_list_select -id ${Wave.1} {OoO_top_tb.dut.branch_eval_unit.val1_i }
gui_set_radix -radix unsigned -signal OoO_top_tb.dut.branch_eval_unit.br.val1
gui_set_radix -radix decimal -signal OoO_top_tb.dut.branch_eval_unit.br.val1
gui_set_radix -radix twosComplement -signal OoO_top_tb.dut.branch_eval_unit.br.val1
gui_set_radix -radix unsigned -signal OoO_top_tb.dut.branch_eval_unit.br.val2
gui_set_radix -radix decimal -signal OoO_top_tb.dut.branch_eval_unit.br.val2
gui_set_radix -radix twosComplement -signal OoO_top_tb.dut.branch_eval_unit.br.val2
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
gui_list_set_insertion_bar  -id ${Wave.1} -group Group15  -item {OoO_top_tb.dut.branch_eval_unit.tag2_i[31:0]} -position below

gui_marker_move -id ${Wave.1} {C1} 27901
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
gui_wv_zoom_timerange -id ${Wave.2} 0 64990
gui_list_add_group -id ${Wave.2} -after {New Group} {branch_predictor_1}
gui_list_add_group -id ${Wave.2} -after {New Group} {Group17}
gui_list_add_group -id ${Wave.2} -after {New Group} {Group18}
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
gui_list_set_insertion_bar  -id ${Wave.2} -group Group18  -item OoO_top_tb.dut.branch_predictor.br_taken_o -position below

gui_marker_move -id ${Wave.2} {C1} 27901
gui_view_scroll -id ${Wave.2} -vertical -set 0
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
gui_wv_zoom_timerange -id ${Wave.3} 0 64990
gui_list_add_group -id ${Wave.3} -after {New Group} {instruction_fetch_unit_1}
gui_list_add_group -id ${Wave.3} -after {New Group} {Group19}
gui_list_add_group -id ${Wave.3} -after {New Group} {Group20}
gui_seek_criteria -id ${Wave.3} {Any Edge}


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
gui_list_set_insertion_bar  -id ${Wave.3} -group Group19  -item OoO_top_tb.dut.instruction_fetch_unit.cond_eval_i -position below

gui_marker_move -id ${Wave.3} {C1} 27901
gui_view_scroll -id ${Wave.3} -vertical -set 0
gui_show_grid -id ${Wave.3} -enable false

# View 'Wave.4'
gui_wv_sync -id ${Wave.4} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.4}  C1
gui_wv_zoom_timerange -id ${Wave.4} 0 525335
gui_list_add_group -id ${Wave.4} -after {New Group} {issue_stage_1}
gui_list_add_group -id ${Wave.4} -after {New Group} {Group21}
gui_list_add_group -id ${Wave.4} -after {New Group} {Group22}
gui_list_select -id ${Wave.4} {OoO_top_tb.dut.issue_stage.rs_write_en_o }
gui_seek_criteria -id ${Wave.4} {Any Edge}


gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.4} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.4} -text {*}
gui_list_set_insertion_bar  -id ${Wave.4} -group issue_stage_1  -item OoO_top_tb.dut.issue_stage.rs_free -position below

gui_marker_move -id ${Wave.4} {C1} 27901
gui_view_scroll -id ${Wave.4} -vertical -set 1275
gui_show_grid -id ${Wave.4} -enable false

# View 'Wave.5'
gui_wv_sync -id ${Wave.5} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.5}  C1
gui_wv_zoom_timerange -id ${Wave.5} 0 2002500
gui_list_add_group -id ${Wave.5} -after {New Group} {ls_unit_1}
gui_list_add_group -id ${Wave.5} -after {New Group} {Group23}
gui_list_add_group -id ${Wave.5} -after {New Group} {Group24}
gui_list_expand -id ${Wave.5} OoO_top_tb.dut.ls_unit.st_ready_cond
gui_list_expand -id ${Wave.5} OoO_top_tb.dut.ls_unit.buff
gui_list_expand -id ${Wave.5} {OoO_top_tb.dut.ls_unit.buff[6]}
gui_list_expand -id ${Wave.5} OoO_top_tb.dut.ls_unit.cdb_i
gui_list_expand -id ${Wave.5} OoO_top_tb.dut.ls_unit.cdb_term_o
gui_list_select -id ${Wave.5} {OoO_top_tb.dut.ls_unit.cond_eval_i }
gui_set_radix -radix unsigned -signal OoO_top_tb.dut.ls_unit.cdb_i.val
gui_set_radix -radix decimal -signal OoO_top_tb.dut.ls_unit.cdb_i.val
gui_set_radix -radix twosComplement -signal OoO_top_tb.dut.ls_unit.cdb_i.val
gui_set_radix -radix unsigned -signal OoO_top_tb.dut.ls_unit.cdb_term_o.val
gui_set_radix -radix decimal -signal OoO_top_tb.dut.ls_unit.cdb_term_o.val
gui_set_radix -radix twosComplement -signal OoO_top_tb.dut.ls_unit.cdb_term_o.val
gui_seek_criteria -id ${Wave.5} {Any Edge}


gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.5} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.5} -text {*}
gui_list_set_insertion_bar  -id ${Wave.5} -group ls_unit_1  -item OoO_top_tb.dut.ls_unit.read -position below

gui_marker_move -id ${Wave.5} {C1} 27901
gui_view_scroll -id ${Wave.5} -vertical -set 589
gui_show_grid -id ${Wave.5} -enable false

# View 'Wave.6'
gui_wv_sync -id ${Wave.6} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.6}  C1
gui_wv_zoom_timerange -id ${Wave.6} 0 2002500
gui_list_add_group -id ${Wave.6} -after {New Group} {register_file_2}
gui_list_add_group -id ${Wave.6} -after {New Group} {Group25}
gui_list_add_group -id ${Wave.6} -after {New Group} {Group26}
gui_list_expand -id ${Wave.6} OoO_top_tb.dut.register_file.registers
gui_list_expand -id ${Wave.6} OoO_top_tb.dut.register_file.cdb_i
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[31]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[31]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[31]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[30]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[30]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[30]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[29]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[29]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[29]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[28]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[28]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[28]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[27]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[27]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[27]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[26]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[26]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[26]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[25]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[25]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[25]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[24]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[24]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[24]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[23]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[23]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[23]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[22]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[22]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[22]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[21]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[21]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[21]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[20]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[20]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[20]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[19]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[19]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[19]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[18]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[18]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[18]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[17]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[17]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[17]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[16]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[16]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[16]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[15]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[15]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[15]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[14]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[14]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[14]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[13]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[13]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[13]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[12]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[12]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[12]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[11]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[11]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[11]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[10]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[10]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[10]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[9]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[9]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[9]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[8]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[8]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[8]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[7]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[7]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[7]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[6]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[6]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[6]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[5]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[5]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[5]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[4]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[4]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[4]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[3]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[3]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[3]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[2]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[2]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[2]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[1]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[1]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[1]}}
gui_set_radix -radix unsigned -signal {{OoO_top_tb.dut.register_file.registers[0]}}
gui_set_radix -radix decimal -signal {{OoO_top_tb.dut.register_file.registers[0]}}
gui_set_radix -radix twosComplement -signal {{OoO_top_tb.dut.register_file.registers[0]}}
gui_set_radix -radix unsigned -signal OoO_top_tb.dut.register_file.cdb_i.val
gui_set_radix -radix decimal -signal OoO_top_tb.dut.register_file.cdb_i.val
gui_set_radix -radix twosComplement -signal OoO_top_tb.dut.register_file.cdb_i.val
gui_seek_criteria -id ${Wave.6} {Any Edge}


gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.6} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.6} -text {*}
gui_list_set_insertion_bar  -id ${Wave.6} -group register_file_2  -item {OoO_top_tb.dut.register_file.reg_status_unit_SP[31:0][31:0]} -position below

gui_marker_move -id ${Wave.6} {C1} 27901
gui_view_scroll -id ${Wave.6} -vertical -set 489
gui_show_grid -id ${Wave.6} -enable false

# View 'Wave.7'
gui_wv_sync -id ${Wave.7} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.7}  C1
gui_wv_zoom_timerange -id ${Wave.7} 0 578139
gui_list_add_group -id ${Wave.7} -after {New Group} {dmem_rwu}
gui_list_add_group -id ${Wave.7} -after {New Group} {Group27}
gui_list_add_group -id ${Wave.7} -after {New Group} {Group28}
gui_list_add_group -id ${Wave.7} -after {New Group} {Group29}
gui_list_expand -id ${Wave.7} OoO_top_tb.dut.ls_unit.dmem_rwu.cdb_load_o
gui_list_expand -id ${Wave.7} OoO_top_tb.dmem_unit.memory
gui_list_select -id ${Wave.7} {OoO_top_tb.dut.ls_unit.dmem_rwu.lsu_specultative_i OoO_top_tb.dut.ls_unit.dmem_rwu.lsu_read_o }
gui_seek_criteria -id ${Wave.7} {Any Edge}



gui_set_env TOGGLE::DEFAULT_WAVE_WINDOW ${Wave.7}
gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.7} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.7} -text {*}
gui_list_set_insertion_bar  -id ${Wave.7} -group Group29  -item {OoO_top_tb.dmem_unit.memory[4095][7:0]} -position below

gui_marker_move -id ${Wave.7} {C1} 27901
gui_view_scroll -id ${Wave.7} -vertical -set 0
gui_show_grid -id ${Wave.7} -enable false
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
	gui_set_active_window -window ${DLPane.1}
}
if {[gui_exist_window -window ${TopLevel.6}]} {
	gui_set_active_window -window ${TopLevel.6}
	gui_set_active_window -window ${Wave.5}
}
if {[gui_exist_window -window ${TopLevel.7}]} {
	gui_set_active_window -window ${TopLevel.7}
	gui_set_active_window -window ${Wave.6}
}
if {[gui_exist_window -window ${TopLevel.8}]} {
	gui_set_active_window -window ${TopLevel.8}
	gui_set_active_window -window ${Wave.7}
}
if {[gui_exist_window -window ${TopLevel.5}]} {
	gui_set_active_window -window ${TopLevel.5}
	gui_set_active_window -window ${Wave.4}
}
#</Session>

