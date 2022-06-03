# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Sun May 8 12:50:39 2022
# Designs open: 1
#   V1: CPU_top.vpd
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Source.1: AN2D1
#   Wave.1: 31 signals
#   Group count = 2
#   Group Group1 signal count = 31
#   Group Group2 signal count = 0
# End_DVE_Session_Save_Info

# DVE version: S-2021.09-SP1_Full64
# DVE build date: Nov 30 2021 00:09:19


#<Session mode="Full" path="/home/olehkond/git/OoOps/mwe/verif/post_synth/src/vcs/sessions/session.CPU_top.vpd.tcl" type="Debug">

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
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 510]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 510
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 509} {height 746} {dock_state left} {dock_on_new_line true} {child_hier_colhier 448} {child_hier_coltype 130} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 457]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 457
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 743
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 456} {height 746} {dock_state left} {dock_on_new_line true} {child_data_colvariable 222} {child_data_colvalue 87} {child_data_coltype 226} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 207]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 2134
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 207
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 2193} {height 206} {dock_state bottom} {dock_on_new_line true}}
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
gui_show_window -window ${TopLevel.2} -show_state normal -rect {{66 81} {2178 1118}}

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
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 613} {child_wave_right 1494} {child_wave_colname 312} {child_wave_colvalue 297} {child_wave_col1 0} {child_wave_col2 1}}

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

if { ![gui_is_db_opened -db {CPU_top.vpd}] } {
	gui_open_db -design V1 -file CPU_top.vpd -nosource
}
gui_set_precision 10ps
gui_set_time_units 10ps
#</Database>

# DVE Global setting session: 


# Global: Bus
gui_bus_create -name EXP:reg0 {CPU_top_tb.dut.core.register_file.reg_out_0__63_ CPU_top_tb.dut.core.register_file.reg_out_0__62_ CPU_top_tb.dut.core.register_file.reg_out_0__61_ CPU_top_tb.dut.core.register_file.reg_out_0__60_ CPU_top_tb.dut.core.register_file.reg_out_0__59_ CPU_top_tb.dut.core.register_file.reg_out_0__58_ CPU_top_tb.dut.core.register_file.reg_out_0__57_ CPU_top_tb.dut.core.register_file.reg_out_0__56_ CPU_top_tb.dut.core.register_file.reg_out_0__55_ CPU_top_tb.dut.core.register_file.reg_out_0__54_ CPU_top_tb.dut.core.register_file.reg_out_0__53_ CPU_top_tb.dut.core.register_file.reg_out_0__52_ CPU_top_tb.dut.core.register_file.reg_out_0__51_ CPU_top_tb.dut.core.register_file.reg_out_0__50_ CPU_top_tb.dut.core.register_file.reg_out_0__49_ CPU_top_tb.dut.core.register_file.reg_out_0__48_ CPU_top_tb.dut.core.register_file.reg_out_0__47_ CPU_top_tb.dut.core.register_file.reg_out_0__46_ CPU_top_tb.dut.core.register_file.reg_out_0__45_ CPU_top_tb.dut.core.register_file.reg_out_0__44_ CPU_top_tb.dut.core.register_file.reg_out_0__43_ CPU_top_tb.dut.core.register_file.reg_out_0__42_ CPU_top_tb.dut.core.register_file.reg_out_0__41_ CPU_top_tb.dut.core.register_file.reg_out_0__40_ CPU_top_tb.dut.core.register_file.reg_out_0__39_ CPU_top_tb.dut.core.register_file.reg_out_0__38_ CPU_top_tb.dut.core.register_file.reg_out_0__37_ CPU_top_tb.dut.core.register_file.reg_out_0__36_ CPU_top_tb.dut.core.register_file.reg_out_0__35_ CPU_top_tb.dut.core.register_file.reg_out_0__34_ CPU_top_tb.dut.core.register_file.reg_out_0__33_ CPU_top_tb.dut.core.register_file.reg_out_0__32_ CPU_top_tb.dut.core.register_file.reg_out_0__31_ CPU_top_tb.dut.core.register_file.reg_out_0__30_ CPU_top_tb.dut.core.register_file.reg_out_0__29_ CPU_top_tb.dut.core.register_file.reg_out_0__28_ CPU_top_tb.dut.core.register_file.reg_out_0__27_ CPU_top_tb.dut.core.register_file.reg_out_0__26_ CPU_top_tb.dut.core.register_file.reg_out_0__25_ CPU_top_tb.dut.core.register_file.reg_out_0__24_ CPU_top_tb.dut.core.register_file.reg_out_0__23_ CPU_top_tb.dut.core.register_file.reg_out_0__22_ CPU_top_tb.dut.core.register_file.reg_out_0__21_ CPU_top_tb.dut.core.register_file.reg_out_0__20_ CPU_top_tb.dut.core.register_file.reg_out_0__19_ CPU_top_tb.dut.core.register_file.reg_out_0__18_ CPU_top_tb.dut.core.register_file.reg_out_0__17_ CPU_top_tb.dut.core.register_file.reg_out_0__16_ CPU_top_tb.dut.core.register_file.reg_out_0__15_ CPU_top_tb.dut.core.register_file.reg_out_0__14_ CPU_top_tb.dut.core.register_file.reg_out_0__13_ CPU_top_tb.dut.core.register_file.reg_out_0__12_ CPU_top_tb.dut.core.register_file.reg_out_0__11_ CPU_top_tb.dut.core.register_file.reg_out_0__10_ CPU_top_tb.dut.core.register_file.reg_out_0__9_ CPU_top_tb.dut.core.register_file.reg_out_0__8_ CPU_top_tb.dut.core.register_file.reg_out_0__7_ CPU_top_tb.dut.core.register_file.reg_out_0__6_ CPU_top_tb.dut.core.register_file.reg_out_0__5_ CPU_top_tb.dut.core.register_file.reg_out_0__4_ CPU_top_tb.dut.core.register_file.reg_out_0__3_ CPU_top_tb.dut.core.register_file.reg_out_0__2_ CPU_top_tb.dut.core.register_file.reg_out_0__1_ CPU_top_tb.dut.core.register_file.reg_out_0__0_}
gui_bus_create -name EXP:reg1 {CPU_top_tb.dut.core.register_file.reg_out_1__63_ CPU_top_tb.dut.core.register_file.reg_out_1__62_ CPU_top_tb.dut.core.register_file.reg_out_1__61_ CPU_top_tb.dut.core.register_file.reg_out_1__60_ CPU_top_tb.dut.core.register_file.reg_out_1__59_ CPU_top_tb.dut.core.register_file.reg_out_1__58_ CPU_top_tb.dut.core.register_file.reg_out_1__57_ CPU_top_tb.dut.core.register_file.reg_out_1__56_ CPU_top_tb.dut.core.register_file.reg_out_1__55_ CPU_top_tb.dut.core.register_file.reg_out_1__54_ CPU_top_tb.dut.core.register_file.reg_out_1__53_ CPU_top_tb.dut.core.register_file.reg_out_1__52_ CPU_top_tb.dut.core.register_file.reg_out_1__51_ CPU_top_tb.dut.core.register_file.reg_out_1__50_ CPU_top_tb.dut.core.register_file.reg_out_1__49_ CPU_top_tb.dut.core.register_file.reg_out_1__48_ CPU_top_tb.dut.core.register_file.reg_out_1__47_ CPU_top_tb.dut.core.register_file.reg_out_1__46_ CPU_top_tb.dut.core.register_file.reg_out_1__45_ CPU_top_tb.dut.core.register_file.reg_out_1__44_ CPU_top_tb.dut.core.register_file.reg_out_1__43_ CPU_top_tb.dut.core.register_file.reg_out_1__42_ CPU_top_tb.dut.core.register_file.reg_out_1__41_ CPU_top_tb.dut.core.register_file.reg_out_1__40_ CPU_top_tb.dut.core.register_file.reg_out_1__39_ CPU_top_tb.dut.core.register_file.reg_out_1__38_ CPU_top_tb.dut.core.register_file.reg_out_1__37_ CPU_top_tb.dut.core.register_file.reg_out_1__36_ CPU_top_tb.dut.core.register_file.reg_out_1__35_ CPU_top_tb.dut.core.register_file.reg_out_1__34_ CPU_top_tb.dut.core.register_file.reg_out_1__33_ CPU_top_tb.dut.core.register_file.reg_out_1__32_ CPU_top_tb.dut.core.register_file.reg_out_1__31_ CPU_top_tb.dut.core.register_file.reg_out_1__30_ CPU_top_tb.dut.core.register_file.reg_out_1__29_ CPU_top_tb.dut.core.register_file.reg_out_1__28_ CPU_top_tb.dut.core.register_file.reg_out_1__27_ CPU_top_tb.dut.core.register_file.reg_out_1__26_ CPU_top_tb.dut.core.register_file.reg_out_1__25_ CPU_top_tb.dut.core.register_file.reg_out_1__24_ CPU_top_tb.dut.core.register_file.reg_out_1__23_ CPU_top_tb.dut.core.register_file.reg_out_1__22_ CPU_top_tb.dut.core.register_file.reg_out_1__21_ CPU_top_tb.dut.core.register_file.reg_out_1__20_ CPU_top_tb.dut.core.register_file.reg_out_1__19_ CPU_top_tb.dut.core.register_file.reg_out_1__18_ CPU_top_tb.dut.core.register_file.reg_out_1__17_ CPU_top_tb.dut.core.register_file.reg_out_1__16_ CPU_top_tb.dut.core.register_file.reg_out_1__15_ CPU_top_tb.dut.core.register_file.reg_out_1__14_ CPU_top_tb.dut.core.register_file.reg_out_1__13_ CPU_top_tb.dut.core.register_file.reg_out_1__12_ CPU_top_tb.dut.core.register_file.reg_out_1__11_ CPU_top_tb.dut.core.register_file.reg_out_1__10_ CPU_top_tb.dut.core.register_file.reg_out_1__9_ CPU_top_tb.dut.core.register_file.reg_out_1__8_ CPU_top_tb.dut.core.register_file.reg_out_1__7_ CPU_top_tb.dut.core.register_file.reg_out_1__6_ CPU_top_tb.dut.core.register_file.reg_out_1__5_ CPU_top_tb.dut.core.register_file.reg_out_1__4_ CPU_top_tb.dut.core.register_file.reg_out_1__3_ CPU_top_tb.dut.core.register_file.reg_out_1__2_ CPU_top_tb.dut.core.register_file.reg_out_1__1_ CPU_top_tb.dut.core.register_file.reg_out_1__0_}
gui_bus_create -name EXP:reg2 {CPU_top_tb.dut.core.register_file.reg_out_2__63_ CPU_top_tb.dut.core.register_file.reg_out_2__62_ CPU_top_tb.dut.core.register_file.reg_out_2__61_ CPU_top_tb.dut.core.register_file.reg_out_2__60_ CPU_top_tb.dut.core.register_file.reg_out_2__59_ CPU_top_tb.dut.core.register_file.reg_out_2__58_ CPU_top_tb.dut.core.register_file.reg_out_2__57_ CPU_top_tb.dut.core.register_file.reg_out_2__56_ CPU_top_tb.dut.core.register_file.reg_out_2__55_ CPU_top_tb.dut.core.register_file.reg_out_2__54_ CPU_top_tb.dut.core.register_file.reg_out_2__53_ CPU_top_tb.dut.core.register_file.reg_out_2__52_ CPU_top_tb.dut.core.register_file.reg_out_2__51_ CPU_top_tb.dut.core.register_file.reg_out_2__50_ CPU_top_tb.dut.core.register_file.reg_out_2__49_ CPU_top_tb.dut.core.register_file.reg_out_2__48_ CPU_top_tb.dut.core.register_file.reg_out_2__47_ CPU_top_tb.dut.core.register_file.reg_out_2__46_ CPU_top_tb.dut.core.register_file.reg_out_2__45_ CPU_top_tb.dut.core.register_file.reg_out_2__44_ CPU_top_tb.dut.core.register_file.reg_out_2__43_ CPU_top_tb.dut.core.register_file.reg_out_2__42_ CPU_top_tb.dut.core.register_file.reg_out_2__41_ CPU_top_tb.dut.core.register_file.reg_out_2__40_ CPU_top_tb.dut.core.register_file.reg_out_2__39_ CPU_top_tb.dut.core.register_file.reg_out_2__38_ CPU_top_tb.dut.core.register_file.reg_out_2__37_ CPU_top_tb.dut.core.register_file.reg_out_2__36_ CPU_top_tb.dut.core.register_file.reg_out_2__35_ CPU_top_tb.dut.core.register_file.reg_out_2__34_ CPU_top_tb.dut.core.register_file.reg_out_2__33_ CPU_top_tb.dut.core.register_file.reg_out_2__32_ CPU_top_tb.dut.core.register_file.reg_out_2__31_ CPU_top_tb.dut.core.register_file.reg_out_2__30_ CPU_top_tb.dut.core.register_file.reg_out_2__29_ CPU_top_tb.dut.core.register_file.reg_out_2__28_ CPU_top_tb.dut.core.register_file.reg_out_2__27_ CPU_top_tb.dut.core.register_file.reg_out_2__26_ CPU_top_tb.dut.core.register_file.reg_out_2__25_ CPU_top_tb.dut.core.register_file.reg_out_2__24_ CPU_top_tb.dut.core.register_file.reg_out_2__23_ CPU_top_tb.dut.core.register_file.reg_out_2__22_ CPU_top_tb.dut.core.register_file.reg_out_2__21_ CPU_top_tb.dut.core.register_file.reg_out_2__20_ CPU_top_tb.dut.core.register_file.reg_out_2__19_ CPU_top_tb.dut.core.register_file.reg_out_2__18_ CPU_top_tb.dut.core.register_file.reg_out_2__17_ CPU_top_tb.dut.core.register_file.reg_out_2__16_ CPU_top_tb.dut.core.register_file.reg_out_2__15_ CPU_top_tb.dut.core.register_file.reg_out_2__14_ CPU_top_tb.dut.core.register_file.reg_out_2__13_ CPU_top_tb.dut.core.register_file.reg_out_2__12_ CPU_top_tb.dut.core.register_file.reg_out_2__11_ CPU_top_tb.dut.core.register_file.reg_out_2__10_ CPU_top_tb.dut.core.register_file.reg_out_2__9_ CPU_top_tb.dut.core.register_file.reg_out_2__8_ CPU_top_tb.dut.core.register_file.reg_out_2__7_ CPU_top_tb.dut.core.register_file.reg_out_2__6_ CPU_top_tb.dut.core.register_file.reg_out_2__5_ CPU_top_tb.dut.core.register_file.reg_out_2__4_ CPU_top_tb.dut.core.register_file.reg_out_2__3_ CPU_top_tb.dut.core.register_file.reg_out_2__2_ CPU_top_tb.dut.core.register_file.reg_out_2__1_ CPU_top_tb.dut.core.register_file.reg_out_2__0_}
gui_bus_create -name EXP:reg3 {CPU_top_tb.dut.core.register_file.reg_out_3__63_ CPU_top_tb.dut.core.register_file.reg_out_3__62_ CPU_top_tb.dut.core.register_file.reg_out_3__61_ CPU_top_tb.dut.core.register_file.reg_out_3__60_ CPU_top_tb.dut.core.register_file.reg_out_3__59_ CPU_top_tb.dut.core.register_file.reg_out_3__58_ CPU_top_tb.dut.core.register_file.reg_out_3__57_ CPU_top_tb.dut.core.register_file.reg_out_3__56_ CPU_top_tb.dut.core.register_file.reg_out_3__55_ CPU_top_tb.dut.core.register_file.reg_out_3__54_ CPU_top_tb.dut.core.register_file.reg_out_3__53_ CPU_top_tb.dut.core.register_file.reg_out_3__52_ CPU_top_tb.dut.core.register_file.reg_out_3__51_ CPU_top_tb.dut.core.register_file.reg_out_3__50_ CPU_top_tb.dut.core.register_file.reg_out_3__49_ CPU_top_tb.dut.core.register_file.reg_out_3__48_ CPU_top_tb.dut.core.register_file.reg_out_3__47_ CPU_top_tb.dut.core.register_file.reg_out_3__46_ CPU_top_tb.dut.core.register_file.reg_out_3__45_ CPU_top_tb.dut.core.register_file.reg_out_3__44_ CPU_top_tb.dut.core.register_file.reg_out_3__43_ CPU_top_tb.dut.core.register_file.reg_out_3__42_ CPU_top_tb.dut.core.register_file.reg_out_3__41_ CPU_top_tb.dut.core.register_file.reg_out_3__40_ CPU_top_tb.dut.core.register_file.reg_out_3__39_ CPU_top_tb.dut.core.register_file.reg_out_3__38_ CPU_top_tb.dut.core.register_file.reg_out_3__37_ CPU_top_tb.dut.core.register_file.reg_out_3__36_ CPU_top_tb.dut.core.register_file.reg_out_3__35_ CPU_top_tb.dut.core.register_file.reg_out_3__34_ CPU_top_tb.dut.core.register_file.reg_out_3__33_ CPU_top_tb.dut.core.register_file.reg_out_3__32_ CPU_top_tb.dut.core.register_file.reg_out_3__31_ CPU_top_tb.dut.core.register_file.reg_out_3__30_ CPU_top_tb.dut.core.register_file.reg_out_3__29_ CPU_top_tb.dut.core.register_file.reg_out_3__28_ CPU_top_tb.dut.core.register_file.reg_out_3__27_ CPU_top_tb.dut.core.register_file.reg_out_3__26_ CPU_top_tb.dut.core.register_file.reg_out_3__25_ CPU_top_tb.dut.core.register_file.reg_out_3__24_ CPU_top_tb.dut.core.register_file.reg_out_3__23_ CPU_top_tb.dut.core.register_file.reg_out_3__22_ CPU_top_tb.dut.core.register_file.reg_out_3__21_ CPU_top_tb.dut.core.register_file.reg_out_3__20_ CPU_top_tb.dut.core.register_file.reg_out_3__19_ CPU_top_tb.dut.core.register_file.reg_out_3__18_ CPU_top_tb.dut.core.register_file.reg_out_3__17_ CPU_top_tb.dut.core.register_file.reg_out_3__16_ CPU_top_tb.dut.core.register_file.reg_out_3__15_ CPU_top_tb.dut.core.register_file.reg_out_3__14_ CPU_top_tb.dut.core.register_file.reg_out_3__13_ CPU_top_tb.dut.core.register_file.reg_out_3__12_ CPU_top_tb.dut.core.register_file.reg_out_3__11_ CPU_top_tb.dut.core.register_file.reg_out_3__10_ CPU_top_tb.dut.core.register_file.reg_out_3__9_ CPU_top_tb.dut.core.register_file.reg_out_3__8_ CPU_top_tb.dut.core.register_file.reg_out_3__7_ CPU_top_tb.dut.core.register_file.reg_out_3__6_ CPU_top_tb.dut.core.register_file.reg_out_3__5_ CPU_top_tb.dut.core.register_file.reg_out_3__4_ CPU_top_tb.dut.core.register_file.reg_out_3__3_ CPU_top_tb.dut.core.register_file.reg_out_3__2_ CPU_top_tb.dut.core.register_file.reg_out_3__1_ CPU_top_tb.dut.core.register_file.reg_out_3__0_}
gui_bus_create -name EXP:reg4 {CPU_top_tb.dut.core.register_file.reg_out_4__63_ CPU_top_tb.dut.core.register_file.reg_out_4__62_ CPU_top_tb.dut.core.register_file.reg_out_4__61_ CPU_top_tb.dut.core.register_file.reg_out_4__60_ CPU_top_tb.dut.core.register_file.reg_out_4__59_ CPU_top_tb.dut.core.register_file.reg_out_4__58_ CPU_top_tb.dut.core.register_file.reg_out_4__57_ CPU_top_tb.dut.core.register_file.reg_out_4__56_ CPU_top_tb.dut.core.register_file.reg_out_4__55_ CPU_top_tb.dut.core.register_file.reg_out_4__54_ CPU_top_tb.dut.core.register_file.reg_out_4__53_ CPU_top_tb.dut.core.register_file.reg_out_4__52_ CPU_top_tb.dut.core.register_file.reg_out_4__51_ CPU_top_tb.dut.core.register_file.reg_out_4__50_ CPU_top_tb.dut.core.register_file.reg_out_4__49_ CPU_top_tb.dut.core.register_file.reg_out_4__48_ CPU_top_tb.dut.core.register_file.reg_out_4__47_ CPU_top_tb.dut.core.register_file.reg_out_4__46_ CPU_top_tb.dut.core.register_file.reg_out_4__45_ CPU_top_tb.dut.core.register_file.reg_out_4__44_ CPU_top_tb.dut.core.register_file.reg_out_4__43_ CPU_top_tb.dut.core.register_file.reg_out_4__42_ CPU_top_tb.dut.core.register_file.reg_out_4__41_ CPU_top_tb.dut.core.register_file.reg_out_4__40_ CPU_top_tb.dut.core.register_file.reg_out_4__39_ CPU_top_tb.dut.core.register_file.reg_out_4__38_ CPU_top_tb.dut.core.register_file.reg_out_4__37_ CPU_top_tb.dut.core.register_file.reg_out_4__36_ CPU_top_tb.dut.core.register_file.reg_out_4__35_ CPU_top_tb.dut.core.register_file.reg_out_4__34_ CPU_top_tb.dut.core.register_file.reg_out_4__33_ CPU_top_tb.dut.core.register_file.reg_out_4__32_ CPU_top_tb.dut.core.register_file.reg_out_4__31_ CPU_top_tb.dut.core.register_file.reg_out_4__30_ CPU_top_tb.dut.core.register_file.reg_out_4__29_ CPU_top_tb.dut.core.register_file.reg_out_4__28_ CPU_top_tb.dut.core.register_file.reg_out_4__27_ CPU_top_tb.dut.core.register_file.reg_out_4__26_ CPU_top_tb.dut.core.register_file.reg_out_4__25_ CPU_top_tb.dut.core.register_file.reg_out_4__24_ CPU_top_tb.dut.core.register_file.reg_out_4__23_ CPU_top_tb.dut.core.register_file.reg_out_4__22_ CPU_top_tb.dut.core.register_file.reg_out_4__21_ CPU_top_tb.dut.core.register_file.reg_out_4__20_ CPU_top_tb.dut.core.register_file.reg_out_4__19_ CPU_top_tb.dut.core.register_file.reg_out_4__18_ CPU_top_tb.dut.core.register_file.reg_out_4__17_ CPU_top_tb.dut.core.register_file.reg_out_4__16_ CPU_top_tb.dut.core.register_file.reg_out_4__15_ CPU_top_tb.dut.core.register_file.reg_out_4__14_ CPU_top_tb.dut.core.register_file.reg_out_4__13_ CPU_top_tb.dut.core.register_file.reg_out_4__12_ CPU_top_tb.dut.core.register_file.reg_out_4__11_ CPU_top_tb.dut.core.register_file.reg_out_4__10_ CPU_top_tb.dut.core.register_file.reg_out_4__9_ CPU_top_tb.dut.core.register_file.reg_out_4__8_ CPU_top_tb.dut.core.register_file.reg_out_4__7_ CPU_top_tb.dut.core.register_file.reg_out_4__6_ CPU_top_tb.dut.core.register_file.reg_out_4__5_ CPU_top_tb.dut.core.register_file.reg_out_4__4_ CPU_top_tb.dut.core.register_file.reg_out_4__3_ CPU_top_tb.dut.core.register_file.reg_out_4__2_ CPU_top_tb.dut.core.register_file.reg_out_4__1_ CPU_top_tb.dut.core.register_file.reg_out_4__0_}
gui_bus_create -name EXP:reg5 {CPU_top_tb.dut.core.register_file.reg_out_5__63_ CPU_top_tb.dut.core.register_file.reg_out_5__62_ CPU_top_tb.dut.core.register_file.reg_out_5__61_ CPU_top_tb.dut.core.register_file.reg_out_5__60_ CPU_top_tb.dut.core.register_file.reg_out_5__59_ CPU_top_tb.dut.core.register_file.reg_out_5__58_ CPU_top_tb.dut.core.register_file.reg_out_5__57_ CPU_top_tb.dut.core.register_file.reg_out_5__56_ CPU_top_tb.dut.core.register_file.reg_out_5__55_ CPU_top_tb.dut.core.register_file.reg_out_5__54_ CPU_top_tb.dut.core.register_file.reg_out_5__53_ CPU_top_tb.dut.core.register_file.reg_out_5__52_ CPU_top_tb.dut.core.register_file.reg_out_5__51_ CPU_top_tb.dut.core.register_file.reg_out_5__50_ CPU_top_tb.dut.core.register_file.reg_out_5__49_ CPU_top_tb.dut.core.register_file.reg_out_5__48_ CPU_top_tb.dut.core.register_file.reg_out_5__47_ CPU_top_tb.dut.core.register_file.reg_out_5__46_ CPU_top_tb.dut.core.register_file.reg_out_5__45_ CPU_top_tb.dut.core.register_file.reg_out_5__44_ CPU_top_tb.dut.core.register_file.reg_out_5__43_ CPU_top_tb.dut.core.register_file.reg_out_5__42_ CPU_top_tb.dut.core.register_file.reg_out_5__41_ CPU_top_tb.dut.core.register_file.reg_out_5__40_ CPU_top_tb.dut.core.register_file.reg_out_5__39_ CPU_top_tb.dut.core.register_file.reg_out_5__38_ CPU_top_tb.dut.core.register_file.reg_out_5__37_ CPU_top_tb.dut.core.register_file.reg_out_5__36_ CPU_top_tb.dut.core.register_file.reg_out_5__35_ CPU_top_tb.dut.core.register_file.reg_out_5__34_ CPU_top_tb.dut.core.register_file.reg_out_5__33_ CPU_top_tb.dut.core.register_file.reg_out_5__32_ CPU_top_tb.dut.core.register_file.reg_out_5__31_ CPU_top_tb.dut.core.register_file.reg_out_5__30_ CPU_top_tb.dut.core.register_file.reg_out_5__29_ CPU_top_tb.dut.core.register_file.reg_out_5__28_ CPU_top_tb.dut.core.register_file.reg_out_5__27_ CPU_top_tb.dut.core.register_file.reg_out_5__26_ CPU_top_tb.dut.core.register_file.reg_out_5__25_ CPU_top_tb.dut.core.register_file.reg_out_5__24_ CPU_top_tb.dut.core.register_file.reg_out_5__23_ CPU_top_tb.dut.core.register_file.reg_out_5__22_ CPU_top_tb.dut.core.register_file.reg_out_5__21_ CPU_top_tb.dut.core.register_file.reg_out_5__20_ CPU_top_tb.dut.core.register_file.reg_out_5__19_ CPU_top_tb.dut.core.register_file.reg_out_5__18_ CPU_top_tb.dut.core.register_file.reg_out_5__17_ CPU_top_tb.dut.core.register_file.reg_out_5__16_ CPU_top_tb.dut.core.register_file.reg_out_5__15_ CPU_top_tb.dut.core.register_file.reg_out_5__14_ CPU_top_tb.dut.core.register_file.reg_out_5__13_ CPU_top_tb.dut.core.register_file.reg_out_5__12_ CPU_top_tb.dut.core.register_file.reg_out_5__11_ CPU_top_tb.dut.core.register_file.reg_out_5__10_ CPU_top_tb.dut.core.register_file.reg_out_5__9_ CPU_top_tb.dut.core.register_file.reg_out_5__8_ CPU_top_tb.dut.core.register_file.reg_out_5__7_ CPU_top_tb.dut.core.register_file.reg_out_5__6_ CPU_top_tb.dut.core.register_file.reg_out_5__5_ CPU_top_tb.dut.core.register_file.reg_out_5__4_ CPU_top_tb.dut.core.register_file.reg_out_5__3_ CPU_top_tb.dut.core.register_file.reg_out_5__2_ CPU_top_tb.dut.core.register_file.reg_out_5__1_ CPU_top_tb.dut.core.register_file.reg_out_5__0_}
gui_bus_create -name EXP:reg6 {CPU_top_tb.dut.core.register_file.reg_out_6__63_ CPU_top_tb.dut.core.register_file.reg_out_6__62_ CPU_top_tb.dut.core.register_file.reg_out_6__61_ CPU_top_tb.dut.core.register_file.reg_out_6__60_ CPU_top_tb.dut.core.register_file.reg_out_6__59_ CPU_top_tb.dut.core.register_file.reg_out_6__58_ CPU_top_tb.dut.core.register_file.reg_out_6__57_ CPU_top_tb.dut.core.register_file.reg_out_6__56_ CPU_top_tb.dut.core.register_file.reg_out_6__55_ CPU_top_tb.dut.core.register_file.reg_out_6__54_ CPU_top_tb.dut.core.register_file.reg_out_6__53_ CPU_top_tb.dut.core.register_file.reg_out_6__52_ CPU_top_tb.dut.core.register_file.reg_out_6__51_ CPU_top_tb.dut.core.register_file.reg_out_6__50_ CPU_top_tb.dut.core.register_file.reg_out_6__49_ CPU_top_tb.dut.core.register_file.reg_out_6__48_ CPU_top_tb.dut.core.register_file.reg_out_6__47_ CPU_top_tb.dut.core.register_file.reg_out_6__46_ CPU_top_tb.dut.core.register_file.reg_out_6__45_ CPU_top_tb.dut.core.register_file.reg_out_6__44_ CPU_top_tb.dut.core.register_file.reg_out_6__43_ CPU_top_tb.dut.core.register_file.reg_out_6__42_ CPU_top_tb.dut.core.register_file.reg_out_6__41_ CPU_top_tb.dut.core.register_file.reg_out_6__40_ CPU_top_tb.dut.core.register_file.reg_out_6__39_ CPU_top_tb.dut.core.register_file.reg_out_6__38_ CPU_top_tb.dut.core.register_file.reg_out_6__37_ CPU_top_tb.dut.core.register_file.reg_out_6__36_ CPU_top_tb.dut.core.register_file.reg_out_6__35_ CPU_top_tb.dut.core.register_file.reg_out_6__34_ CPU_top_tb.dut.core.register_file.reg_out_6__33_ CPU_top_tb.dut.core.register_file.reg_out_6__32_ CPU_top_tb.dut.core.register_file.reg_out_6__31_ CPU_top_tb.dut.core.register_file.reg_out_6__30_ CPU_top_tb.dut.core.register_file.reg_out_6__29_ CPU_top_tb.dut.core.register_file.reg_out_6__28_ CPU_top_tb.dut.core.register_file.reg_out_6__27_ CPU_top_tb.dut.core.register_file.reg_out_6__26_ CPU_top_tb.dut.core.register_file.reg_out_6__25_ CPU_top_tb.dut.core.register_file.reg_out_6__24_ CPU_top_tb.dut.core.register_file.reg_out_6__23_ CPU_top_tb.dut.core.register_file.reg_out_6__22_ CPU_top_tb.dut.core.register_file.reg_out_6__21_ CPU_top_tb.dut.core.register_file.reg_out_6__20_ CPU_top_tb.dut.core.register_file.reg_out_6__19_ CPU_top_tb.dut.core.register_file.reg_out_6__18_ CPU_top_tb.dut.core.register_file.reg_out_6__17_ CPU_top_tb.dut.core.register_file.reg_out_6__16_ CPU_top_tb.dut.core.register_file.reg_out_6__15_ CPU_top_tb.dut.core.register_file.reg_out_6__14_ CPU_top_tb.dut.core.register_file.reg_out_6__13_ CPU_top_tb.dut.core.register_file.reg_out_6__12_ CPU_top_tb.dut.core.register_file.reg_out_6__11_ CPU_top_tb.dut.core.register_file.reg_out_6__10_ CPU_top_tb.dut.core.register_file.reg_out_6__9_ CPU_top_tb.dut.core.register_file.reg_out_6__8_ CPU_top_tb.dut.core.register_file.reg_out_6__7_ CPU_top_tb.dut.core.register_file.reg_out_6__6_ CPU_top_tb.dut.core.register_file.reg_out_6__5_ CPU_top_tb.dut.core.register_file.reg_out_6__4_ CPU_top_tb.dut.core.register_file.reg_out_6__3_ CPU_top_tb.dut.core.register_file.reg_out_6__2_ CPU_top_tb.dut.core.register_file.reg_out_6__1_ CPU_top_tb.dut.core.register_file.reg_out_6__0_}
gui_bus_create -name EXP:reg7 {CPU_top_tb.dut.core.register_file.reg_out_7__63_ CPU_top_tb.dut.core.register_file.reg_out_7__62_ CPU_top_tb.dut.core.register_file.reg_out_7__61_ CPU_top_tb.dut.core.register_file.reg_out_7__60_ CPU_top_tb.dut.core.register_file.reg_out_7__59_ CPU_top_tb.dut.core.register_file.reg_out_7__58_ CPU_top_tb.dut.core.register_file.reg_out_7__57_ CPU_top_tb.dut.core.register_file.reg_out_7__56_ CPU_top_tb.dut.core.register_file.reg_out_7__55_ CPU_top_tb.dut.core.register_file.reg_out_7__54_ CPU_top_tb.dut.core.register_file.reg_out_7__53_ CPU_top_tb.dut.core.register_file.reg_out_7__52_ CPU_top_tb.dut.core.register_file.reg_out_7__51_ CPU_top_tb.dut.core.register_file.reg_out_7__50_ CPU_top_tb.dut.core.register_file.reg_out_7__49_ CPU_top_tb.dut.core.register_file.reg_out_7__48_ CPU_top_tb.dut.core.register_file.reg_out_7__47_ CPU_top_tb.dut.core.register_file.reg_out_7__46_ CPU_top_tb.dut.core.register_file.reg_out_7__45_ CPU_top_tb.dut.core.register_file.reg_out_7__44_ CPU_top_tb.dut.core.register_file.reg_out_7__43_ CPU_top_tb.dut.core.register_file.reg_out_7__42_ CPU_top_tb.dut.core.register_file.reg_out_7__41_ CPU_top_tb.dut.core.register_file.reg_out_7__40_ CPU_top_tb.dut.core.register_file.reg_out_7__39_ CPU_top_tb.dut.core.register_file.reg_out_7__38_ CPU_top_tb.dut.core.register_file.reg_out_7__37_ CPU_top_tb.dut.core.register_file.reg_out_7__36_ CPU_top_tb.dut.core.register_file.reg_out_7__35_ CPU_top_tb.dut.core.register_file.reg_out_7__34_ CPU_top_tb.dut.core.register_file.reg_out_7__33_ CPU_top_tb.dut.core.register_file.reg_out_7__32_ CPU_top_tb.dut.core.register_file.reg_out_7__31_ CPU_top_tb.dut.core.register_file.reg_out_7__30_ CPU_top_tb.dut.core.register_file.reg_out_7__29_ CPU_top_tb.dut.core.register_file.reg_out_7__28_ CPU_top_tb.dut.core.register_file.reg_out_7__27_ CPU_top_tb.dut.core.register_file.reg_out_7__26_ CPU_top_tb.dut.core.register_file.reg_out_7__25_ CPU_top_tb.dut.core.register_file.reg_out_7__24_ CPU_top_tb.dut.core.register_file.reg_out_7__23_ CPU_top_tb.dut.core.register_file.reg_out_7__22_ CPU_top_tb.dut.core.register_file.reg_out_7__21_ CPU_top_tb.dut.core.register_file.reg_out_7__20_ CPU_top_tb.dut.core.register_file.reg_out_7__19_ CPU_top_tb.dut.core.register_file.reg_out_7__18_ CPU_top_tb.dut.core.register_file.reg_out_7__17_ CPU_top_tb.dut.core.register_file.reg_out_7__16_ CPU_top_tb.dut.core.register_file.reg_out_7__15_ CPU_top_tb.dut.core.register_file.reg_out_7__14_ CPU_top_tb.dut.core.register_file.reg_out_7__13_ CPU_top_tb.dut.core.register_file.reg_out_7__12_ CPU_top_tb.dut.core.register_file.reg_out_7__11_ CPU_top_tb.dut.core.register_file.reg_out_7__10_ CPU_top_tb.dut.core.register_file.reg_out_7__9_ CPU_top_tb.dut.core.register_file.reg_out_7__8_ CPU_top_tb.dut.core.register_file.reg_out_7__7_ CPU_top_tb.dut.core.register_file.reg_out_7__6_ CPU_top_tb.dut.core.register_file.reg_out_7__5_ CPU_top_tb.dut.core.register_file.reg_out_7__4_ CPU_top_tb.dut.core.register_file.reg_out_7__3_ CPU_top_tb.dut.core.register_file.reg_out_7__2_ CPU_top_tb.dut.core.register_file.reg_out_7__1_ CPU_top_tb.dut.core.register_file.reg_out_7__0_}
gui_bus_create -name EXP:reg8 {CPU_top_tb.dut.core.register_file.reg_out_8__63_ CPU_top_tb.dut.core.register_file.reg_out_8__62_ CPU_top_tb.dut.core.register_file.reg_out_8__61_ CPU_top_tb.dut.core.register_file.reg_out_8__60_ CPU_top_tb.dut.core.register_file.reg_out_8__59_ CPU_top_tb.dut.core.register_file.reg_out_8__58_ CPU_top_tb.dut.core.register_file.reg_out_8__57_ CPU_top_tb.dut.core.register_file.reg_out_8__56_ CPU_top_tb.dut.core.register_file.reg_out_8__55_ CPU_top_tb.dut.core.register_file.reg_out_8__54_ CPU_top_tb.dut.core.register_file.reg_out_8__53_ CPU_top_tb.dut.core.register_file.reg_out_8__52_ CPU_top_tb.dut.core.register_file.reg_out_8__51_ CPU_top_tb.dut.core.register_file.reg_out_8__50_ CPU_top_tb.dut.core.register_file.reg_out_8__49_ CPU_top_tb.dut.core.register_file.reg_out_8__48_ CPU_top_tb.dut.core.register_file.reg_out_8__47_ CPU_top_tb.dut.core.register_file.reg_out_8__46_ CPU_top_tb.dut.core.register_file.reg_out_8__45_ CPU_top_tb.dut.core.register_file.reg_out_8__44_ CPU_top_tb.dut.core.register_file.reg_out_8__43_ CPU_top_tb.dut.core.register_file.reg_out_8__42_ CPU_top_tb.dut.core.register_file.reg_out_8__41_ CPU_top_tb.dut.core.register_file.reg_out_8__40_ CPU_top_tb.dut.core.register_file.reg_out_8__39_ CPU_top_tb.dut.core.register_file.reg_out_8__38_ CPU_top_tb.dut.core.register_file.reg_out_8__37_ CPU_top_tb.dut.core.register_file.reg_out_8__36_ CPU_top_tb.dut.core.register_file.reg_out_8__35_ CPU_top_tb.dut.core.register_file.reg_out_8__34_ CPU_top_tb.dut.core.register_file.reg_out_8__33_ CPU_top_tb.dut.core.register_file.reg_out_8__32_ CPU_top_tb.dut.core.register_file.reg_out_8__31_ CPU_top_tb.dut.core.register_file.reg_out_8__30_ CPU_top_tb.dut.core.register_file.reg_out_8__29_ CPU_top_tb.dut.core.register_file.reg_out_8__28_ CPU_top_tb.dut.core.register_file.reg_out_8__27_ CPU_top_tb.dut.core.register_file.reg_out_8__26_ CPU_top_tb.dut.core.register_file.reg_out_8__25_ CPU_top_tb.dut.core.register_file.reg_out_8__24_ CPU_top_tb.dut.core.register_file.reg_out_8__23_ CPU_top_tb.dut.core.register_file.reg_out_8__22_ CPU_top_tb.dut.core.register_file.reg_out_8__21_ CPU_top_tb.dut.core.register_file.reg_out_8__20_ CPU_top_tb.dut.core.register_file.reg_out_8__19_ CPU_top_tb.dut.core.register_file.reg_out_8__18_ CPU_top_tb.dut.core.register_file.reg_out_8__17_ CPU_top_tb.dut.core.register_file.reg_out_8__16_ CPU_top_tb.dut.core.register_file.reg_out_8__15_ CPU_top_tb.dut.core.register_file.reg_out_8__14_ CPU_top_tb.dut.core.register_file.reg_out_8__13_ CPU_top_tb.dut.core.register_file.reg_out_8__12_ CPU_top_tb.dut.core.register_file.reg_out_8__11_ CPU_top_tb.dut.core.register_file.reg_out_8__10_ CPU_top_tb.dut.core.register_file.reg_out_8__9_ CPU_top_tb.dut.core.register_file.reg_out_8__8_ CPU_top_tb.dut.core.register_file.reg_out_8__7_ CPU_top_tb.dut.core.register_file.reg_out_8__6_ CPU_top_tb.dut.core.register_file.reg_out_8__5_ CPU_top_tb.dut.core.register_file.reg_out_8__4_ CPU_top_tb.dut.core.register_file.reg_out_8__3_ CPU_top_tb.dut.core.register_file.reg_out_8__2_ CPU_top_tb.dut.core.register_file.reg_out_8__1_ CPU_top_tb.dut.core.register_file.reg_out_8__0_}
gui_bus_create -name EXP:reg9 {CPU_top_tb.dut.core.register_file.reg_out_9__63_ CPU_top_tb.dut.core.register_file.reg_out_9__62_ CPU_top_tb.dut.core.register_file.reg_out_9__61_ CPU_top_tb.dut.core.register_file.reg_out_9__60_ CPU_top_tb.dut.core.register_file.reg_out_9__59_ CPU_top_tb.dut.core.register_file.reg_out_9__58_ CPU_top_tb.dut.core.register_file.reg_out_9__57_ CPU_top_tb.dut.core.register_file.reg_out_9__56_ CPU_top_tb.dut.core.register_file.reg_out_9__55_ CPU_top_tb.dut.core.register_file.reg_out_9__54_ CPU_top_tb.dut.core.register_file.reg_out_9__53_ CPU_top_tb.dut.core.register_file.reg_out_9__52_ CPU_top_tb.dut.core.register_file.reg_out_9__51_ CPU_top_tb.dut.core.register_file.reg_out_9__50_ CPU_top_tb.dut.core.register_file.reg_out_9__49_ CPU_top_tb.dut.core.register_file.reg_out_9__48_ CPU_top_tb.dut.core.register_file.reg_out_9__47_ CPU_top_tb.dut.core.register_file.reg_out_9__46_ CPU_top_tb.dut.core.register_file.reg_out_9__45_ CPU_top_tb.dut.core.register_file.reg_out_9__44_ CPU_top_tb.dut.core.register_file.reg_out_9__43_ CPU_top_tb.dut.core.register_file.reg_out_9__42_ CPU_top_tb.dut.core.register_file.reg_out_9__41_ CPU_top_tb.dut.core.register_file.reg_out_9__40_ CPU_top_tb.dut.core.register_file.reg_out_9__39_ CPU_top_tb.dut.core.register_file.reg_out_9__38_ CPU_top_tb.dut.core.register_file.reg_out_9__37_ CPU_top_tb.dut.core.register_file.reg_out_9__36_ CPU_top_tb.dut.core.register_file.reg_out_9__35_ CPU_top_tb.dut.core.register_file.reg_out_9__34_ CPU_top_tb.dut.core.register_file.reg_out_9__33_ CPU_top_tb.dut.core.register_file.reg_out_9__32_ CPU_top_tb.dut.core.register_file.reg_out_9__31_ CPU_top_tb.dut.core.register_file.reg_out_9__30_ CPU_top_tb.dut.core.register_file.reg_out_9__29_ CPU_top_tb.dut.core.register_file.reg_out_9__28_ CPU_top_tb.dut.core.register_file.reg_out_9__27_ CPU_top_tb.dut.core.register_file.reg_out_9__26_ CPU_top_tb.dut.core.register_file.reg_out_9__25_ CPU_top_tb.dut.core.register_file.reg_out_9__24_ CPU_top_tb.dut.core.register_file.reg_out_9__23_ CPU_top_tb.dut.core.register_file.reg_out_9__22_ CPU_top_tb.dut.core.register_file.reg_out_9__21_ CPU_top_tb.dut.core.register_file.reg_out_9__20_ CPU_top_tb.dut.core.register_file.reg_out_9__19_ CPU_top_tb.dut.core.register_file.reg_out_9__18_ CPU_top_tb.dut.core.register_file.reg_out_9__17_ CPU_top_tb.dut.core.register_file.reg_out_9__16_ CPU_top_tb.dut.core.register_file.reg_out_9__15_ CPU_top_tb.dut.core.register_file.reg_out_9__14_ CPU_top_tb.dut.core.register_file.reg_out_9__13_ CPU_top_tb.dut.core.register_file.reg_out_9__12_ CPU_top_tb.dut.core.register_file.reg_out_9__11_ CPU_top_tb.dut.core.register_file.reg_out_9__10_ CPU_top_tb.dut.core.register_file.reg_out_9__9_ CPU_top_tb.dut.core.register_file.reg_out_9__8_ CPU_top_tb.dut.core.register_file.reg_out_9__7_ CPU_top_tb.dut.core.register_file.reg_out_9__6_ CPU_top_tb.dut.core.register_file.reg_out_9__5_ CPU_top_tb.dut.core.register_file.reg_out_9__4_ CPU_top_tb.dut.core.register_file.reg_out_9__3_ CPU_top_tb.dut.core.register_file.reg_out_9__2_ CPU_top_tb.dut.core.register_file.reg_out_9__1_ CPU_top_tb.dut.core.register_file.reg_out_9__0_}
gui_bus_create -name EXP:reg20 {CPU_top_tb.dut.core.register_file.reg_out_20__63_ CPU_top_tb.dut.core.register_file.reg_out_20__62_ CPU_top_tb.dut.core.register_file.reg_out_20__61_ CPU_top_tb.dut.core.register_file.reg_out_20__60_ CPU_top_tb.dut.core.register_file.reg_out_20__59_ CPU_top_tb.dut.core.register_file.reg_out_20__58_ CPU_top_tb.dut.core.register_file.reg_out_20__57_ CPU_top_tb.dut.core.register_file.reg_out_20__56_ CPU_top_tb.dut.core.register_file.reg_out_20__55_ CPU_top_tb.dut.core.register_file.reg_out_20__54_ CPU_top_tb.dut.core.register_file.reg_out_20__53_ CPU_top_tb.dut.core.register_file.reg_out_20__52_ CPU_top_tb.dut.core.register_file.reg_out_20__51_ CPU_top_tb.dut.core.register_file.reg_out_20__50_ CPU_top_tb.dut.core.register_file.reg_out_20__49_ CPU_top_tb.dut.core.register_file.reg_out_20__48_ CPU_top_tb.dut.core.register_file.reg_out_20__47_ CPU_top_tb.dut.core.register_file.reg_out_20__46_ CPU_top_tb.dut.core.register_file.reg_out_20__45_ CPU_top_tb.dut.core.register_file.reg_out_20__44_ CPU_top_tb.dut.core.register_file.reg_out_20__43_ CPU_top_tb.dut.core.register_file.reg_out_20__42_ CPU_top_tb.dut.core.register_file.reg_out_20__41_ CPU_top_tb.dut.core.register_file.reg_out_20__40_ CPU_top_tb.dut.core.register_file.reg_out_20__39_ CPU_top_tb.dut.core.register_file.reg_out_20__38_ CPU_top_tb.dut.core.register_file.reg_out_20__37_ CPU_top_tb.dut.core.register_file.reg_out_20__36_ CPU_top_tb.dut.core.register_file.reg_out_20__35_ CPU_top_tb.dut.core.register_file.reg_out_20__34_ CPU_top_tb.dut.core.register_file.reg_out_20__33_ CPU_top_tb.dut.core.register_file.reg_out_20__32_ CPU_top_tb.dut.core.register_file.reg_out_20__31_ CPU_top_tb.dut.core.register_file.reg_out_20__30_ CPU_top_tb.dut.core.register_file.reg_out_20__29_ CPU_top_tb.dut.core.register_file.reg_out_20__28_ CPU_top_tb.dut.core.register_file.reg_out_20__27_ CPU_top_tb.dut.core.register_file.reg_out_20__26_ CPU_top_tb.dut.core.register_file.reg_out_20__25_ CPU_top_tb.dut.core.register_file.reg_out_20__24_ CPU_top_tb.dut.core.register_file.reg_out_20__23_ CPU_top_tb.dut.core.register_file.reg_out_20__22_ CPU_top_tb.dut.core.register_file.reg_out_20__21_ CPU_top_tb.dut.core.register_file.reg_out_20__20_ CPU_top_tb.dut.core.register_file.reg_out_20__19_ CPU_top_tb.dut.core.register_file.reg_out_20__18_ CPU_top_tb.dut.core.register_file.reg_out_20__17_ CPU_top_tb.dut.core.register_file.reg_out_20__16_ CPU_top_tb.dut.core.register_file.reg_out_20__15_ CPU_top_tb.dut.core.register_file.reg_out_20__14_ CPU_top_tb.dut.core.register_file.reg_out_20__13_ CPU_top_tb.dut.core.register_file.reg_out_20__12_ CPU_top_tb.dut.core.register_file.reg_out_20__11_ CPU_top_tb.dut.core.register_file.reg_out_20__10_ CPU_top_tb.dut.core.register_file.reg_out_20__9_ CPU_top_tb.dut.core.register_file.reg_out_20__8_ CPU_top_tb.dut.core.register_file.reg_out_20__7_ CPU_top_tb.dut.core.register_file.reg_out_20__6_ CPU_top_tb.dut.core.register_file.reg_out_20__5_ CPU_top_tb.dut.core.register_file.reg_out_20__4_ CPU_top_tb.dut.core.register_file.reg_out_20__3_ CPU_top_tb.dut.core.register_file.reg_out_20__2_ CPU_top_tb.dut.core.register_file.reg_out_20__1_ CPU_top_tb.dut.core.register_file.reg_out_20__0_}
gui_bus_create -name EXP:reg10 {CPU_top_tb.dut.core.register_file.reg_out_10__63_ CPU_top_tb.dut.core.register_file.reg_out_10__62_ CPU_top_tb.dut.core.register_file.reg_out_10__61_ CPU_top_tb.dut.core.register_file.reg_out_10__60_ CPU_top_tb.dut.core.register_file.reg_out_10__59_ CPU_top_tb.dut.core.register_file.reg_out_10__58_ CPU_top_tb.dut.core.register_file.reg_out_10__57_ CPU_top_tb.dut.core.register_file.reg_out_10__56_ CPU_top_tb.dut.core.register_file.reg_out_10__55_ CPU_top_tb.dut.core.register_file.reg_out_10__54_ CPU_top_tb.dut.core.register_file.reg_out_10__53_ CPU_top_tb.dut.core.register_file.reg_out_10__52_ CPU_top_tb.dut.core.register_file.reg_out_10__51_ CPU_top_tb.dut.core.register_file.reg_out_10__50_ CPU_top_tb.dut.core.register_file.reg_out_10__49_ CPU_top_tb.dut.core.register_file.reg_out_10__48_ CPU_top_tb.dut.core.register_file.reg_out_10__47_ CPU_top_tb.dut.core.register_file.reg_out_10__46_ CPU_top_tb.dut.core.register_file.reg_out_10__45_ CPU_top_tb.dut.core.register_file.reg_out_10__44_ CPU_top_tb.dut.core.register_file.reg_out_10__43_ CPU_top_tb.dut.core.register_file.reg_out_10__42_ CPU_top_tb.dut.core.register_file.reg_out_10__41_ CPU_top_tb.dut.core.register_file.reg_out_10__40_ CPU_top_tb.dut.core.register_file.reg_out_10__39_ CPU_top_tb.dut.core.register_file.reg_out_10__38_ CPU_top_tb.dut.core.register_file.reg_out_10__37_ CPU_top_tb.dut.core.register_file.reg_out_10__36_ CPU_top_tb.dut.core.register_file.reg_out_10__35_ CPU_top_tb.dut.core.register_file.reg_out_10__34_ CPU_top_tb.dut.core.register_file.reg_out_10__33_ CPU_top_tb.dut.core.register_file.reg_out_10__32_ CPU_top_tb.dut.core.register_file.reg_out_10__31_ CPU_top_tb.dut.core.register_file.reg_out_10__30_ CPU_top_tb.dut.core.register_file.reg_out_10__29_ CPU_top_tb.dut.core.register_file.reg_out_10__28_ CPU_top_tb.dut.core.register_file.reg_out_10__27_ CPU_top_tb.dut.core.register_file.reg_out_10__26_ CPU_top_tb.dut.core.register_file.reg_out_10__25_ CPU_top_tb.dut.core.register_file.reg_out_10__24_ CPU_top_tb.dut.core.register_file.reg_out_10__23_ CPU_top_tb.dut.core.register_file.reg_out_10__22_ CPU_top_tb.dut.core.register_file.reg_out_10__21_ CPU_top_tb.dut.core.register_file.reg_out_10__20_ CPU_top_tb.dut.core.register_file.reg_out_10__19_ CPU_top_tb.dut.core.register_file.reg_out_10__18_ CPU_top_tb.dut.core.register_file.reg_out_10__17_ CPU_top_tb.dut.core.register_file.reg_out_10__16_ CPU_top_tb.dut.core.register_file.reg_out_10__15_ CPU_top_tb.dut.core.register_file.reg_out_10__14_ CPU_top_tb.dut.core.register_file.reg_out_10__13_ CPU_top_tb.dut.core.register_file.reg_out_10__12_ CPU_top_tb.dut.core.register_file.reg_out_10__11_ CPU_top_tb.dut.core.register_file.reg_out_10__10_ CPU_top_tb.dut.core.register_file.reg_out_10__9_ CPU_top_tb.dut.core.register_file.reg_out_10__8_ CPU_top_tb.dut.core.register_file.reg_out_10__7_ CPU_top_tb.dut.core.register_file.reg_out_10__6_ CPU_top_tb.dut.core.register_file.reg_out_10__5_ CPU_top_tb.dut.core.register_file.reg_out_10__4_ CPU_top_tb.dut.core.register_file.reg_out_10__3_ CPU_top_tb.dut.core.register_file.reg_out_10__2_ CPU_top_tb.dut.core.register_file.reg_out_10__1_ CPU_top_tb.dut.core.register_file.reg_out_10__0_}
gui_bus_create -name EXP:reg11 {CPU_top_tb.dut.core.register_file.reg_out_11__63_ CPU_top_tb.dut.core.register_file.reg_out_11__62_ CPU_top_tb.dut.core.register_file.reg_out_11__61_ CPU_top_tb.dut.core.register_file.reg_out_11__60_ CPU_top_tb.dut.core.register_file.reg_out_11__59_ CPU_top_tb.dut.core.register_file.reg_out_11__58_ CPU_top_tb.dut.core.register_file.reg_out_11__57_ CPU_top_tb.dut.core.register_file.reg_out_11__56_ CPU_top_tb.dut.core.register_file.reg_out_11__55_ CPU_top_tb.dut.core.register_file.reg_out_11__54_ CPU_top_tb.dut.core.register_file.reg_out_11__53_ CPU_top_tb.dut.core.register_file.reg_out_11__52_ CPU_top_tb.dut.core.register_file.reg_out_11__51_ CPU_top_tb.dut.core.register_file.reg_out_11__50_ CPU_top_tb.dut.core.register_file.reg_out_11__49_ CPU_top_tb.dut.core.register_file.reg_out_11__48_ CPU_top_tb.dut.core.register_file.reg_out_11__47_ CPU_top_tb.dut.core.register_file.reg_out_11__46_ CPU_top_tb.dut.core.register_file.reg_out_11__45_ CPU_top_tb.dut.core.register_file.reg_out_11__44_ CPU_top_tb.dut.core.register_file.reg_out_11__43_ CPU_top_tb.dut.core.register_file.reg_out_11__42_ CPU_top_tb.dut.core.register_file.reg_out_11__41_ CPU_top_tb.dut.core.register_file.reg_out_11__40_ CPU_top_tb.dut.core.register_file.reg_out_11__39_ CPU_top_tb.dut.core.register_file.reg_out_11__38_ CPU_top_tb.dut.core.register_file.reg_out_11__37_ CPU_top_tb.dut.core.register_file.reg_out_11__36_ CPU_top_tb.dut.core.register_file.reg_out_11__35_ CPU_top_tb.dut.core.register_file.reg_out_11__34_ CPU_top_tb.dut.core.register_file.reg_out_11__33_ CPU_top_tb.dut.core.register_file.reg_out_11__32_ CPU_top_tb.dut.core.register_file.reg_out_11__31_ CPU_top_tb.dut.core.register_file.reg_out_11__30_ CPU_top_tb.dut.core.register_file.reg_out_11__29_ CPU_top_tb.dut.core.register_file.reg_out_11__28_ CPU_top_tb.dut.core.register_file.reg_out_11__27_ CPU_top_tb.dut.core.register_file.reg_out_11__26_ CPU_top_tb.dut.core.register_file.reg_out_11__25_ CPU_top_tb.dut.core.register_file.reg_out_11__24_ CPU_top_tb.dut.core.register_file.reg_out_11__23_ CPU_top_tb.dut.core.register_file.reg_out_11__22_ CPU_top_tb.dut.core.register_file.reg_out_11__21_ CPU_top_tb.dut.core.register_file.reg_out_11__20_ CPU_top_tb.dut.core.register_file.reg_out_11__19_ CPU_top_tb.dut.core.register_file.reg_out_11__18_ CPU_top_tb.dut.core.register_file.reg_out_11__17_ CPU_top_tb.dut.core.register_file.reg_out_11__16_ CPU_top_tb.dut.core.register_file.reg_out_11__15_ CPU_top_tb.dut.core.register_file.reg_out_11__14_ CPU_top_tb.dut.core.register_file.reg_out_11__13_ CPU_top_tb.dut.core.register_file.reg_out_11__12_ CPU_top_tb.dut.core.register_file.reg_out_11__11_ CPU_top_tb.dut.core.register_file.reg_out_11__10_ CPU_top_tb.dut.core.register_file.reg_out_11__9_ CPU_top_tb.dut.core.register_file.reg_out_11__8_ CPU_top_tb.dut.core.register_file.reg_out_11__7_ CPU_top_tb.dut.core.register_file.reg_out_11__6_ CPU_top_tb.dut.core.register_file.reg_out_11__5_ CPU_top_tb.dut.core.register_file.reg_out_11__4_ CPU_top_tb.dut.core.register_file.reg_out_11__3_ CPU_top_tb.dut.core.register_file.reg_out_11__2_ CPU_top_tb.dut.core.register_file.reg_out_11__1_ CPU_top_tb.dut.core.register_file.reg_out_11__0_}
gui_bus_create -name EXP:reg12 {CPU_top_tb.dut.core.register_file.reg_out_12__63_ CPU_top_tb.dut.core.register_file.reg_out_12__62_ CPU_top_tb.dut.core.register_file.reg_out_12__61_ CPU_top_tb.dut.core.register_file.reg_out_12__60_ CPU_top_tb.dut.core.register_file.reg_out_12__59_ CPU_top_tb.dut.core.register_file.reg_out_12__58_ CPU_top_tb.dut.core.register_file.reg_out_12__57_ CPU_top_tb.dut.core.register_file.reg_out_12__56_ CPU_top_tb.dut.core.register_file.reg_out_12__55_ CPU_top_tb.dut.core.register_file.reg_out_12__54_ CPU_top_tb.dut.core.register_file.reg_out_12__53_ CPU_top_tb.dut.core.register_file.reg_out_12__52_ CPU_top_tb.dut.core.register_file.reg_out_12__51_ CPU_top_tb.dut.core.register_file.reg_out_12__50_ CPU_top_tb.dut.core.register_file.reg_out_12__49_ CPU_top_tb.dut.core.register_file.reg_out_12__48_ CPU_top_tb.dut.core.register_file.reg_out_12__47_ CPU_top_tb.dut.core.register_file.reg_out_12__46_ CPU_top_tb.dut.core.register_file.reg_out_12__45_ CPU_top_tb.dut.core.register_file.reg_out_12__44_ CPU_top_tb.dut.core.register_file.reg_out_12__43_ CPU_top_tb.dut.core.register_file.reg_out_12__42_ CPU_top_tb.dut.core.register_file.reg_out_12__41_ CPU_top_tb.dut.core.register_file.reg_out_12__40_ CPU_top_tb.dut.core.register_file.reg_out_12__39_ CPU_top_tb.dut.core.register_file.reg_out_12__38_ CPU_top_tb.dut.core.register_file.reg_out_12__37_ CPU_top_tb.dut.core.register_file.reg_out_12__36_ CPU_top_tb.dut.core.register_file.reg_out_12__35_ CPU_top_tb.dut.core.register_file.reg_out_12__34_ CPU_top_tb.dut.core.register_file.reg_out_12__33_ CPU_top_tb.dut.core.register_file.reg_out_12__32_ CPU_top_tb.dut.core.register_file.reg_out_12__31_ CPU_top_tb.dut.core.register_file.reg_out_12__30_ CPU_top_tb.dut.core.register_file.reg_out_12__29_ CPU_top_tb.dut.core.register_file.reg_out_12__28_ CPU_top_tb.dut.core.register_file.reg_out_12__27_ CPU_top_tb.dut.core.register_file.reg_out_12__26_ CPU_top_tb.dut.core.register_file.reg_out_12__25_ CPU_top_tb.dut.core.register_file.reg_out_12__24_ CPU_top_tb.dut.core.register_file.reg_out_12__23_ CPU_top_tb.dut.core.register_file.reg_out_12__22_ CPU_top_tb.dut.core.register_file.reg_out_12__21_ CPU_top_tb.dut.core.register_file.reg_out_12__20_ CPU_top_tb.dut.core.register_file.reg_out_12__19_ CPU_top_tb.dut.core.register_file.reg_out_12__18_ CPU_top_tb.dut.core.register_file.reg_out_12__17_ CPU_top_tb.dut.core.register_file.reg_out_12__16_ CPU_top_tb.dut.core.register_file.reg_out_12__15_ CPU_top_tb.dut.core.register_file.reg_out_12__14_ CPU_top_tb.dut.core.register_file.reg_out_12__13_ CPU_top_tb.dut.core.register_file.reg_out_12__12_ CPU_top_tb.dut.core.register_file.reg_out_12__11_ CPU_top_tb.dut.core.register_file.reg_out_12__10_ CPU_top_tb.dut.core.register_file.reg_out_12__9_ CPU_top_tb.dut.core.register_file.reg_out_12__8_ CPU_top_tb.dut.core.register_file.reg_out_12__7_ CPU_top_tb.dut.core.register_file.reg_out_12__6_ CPU_top_tb.dut.core.register_file.reg_out_12__5_ CPU_top_tb.dut.core.register_file.reg_out_12__4_ CPU_top_tb.dut.core.register_file.reg_out_12__3_ CPU_top_tb.dut.core.register_file.reg_out_12__2_ CPU_top_tb.dut.core.register_file.reg_out_12__1_ CPU_top_tb.dut.core.register_file.reg_out_12__0_}
gui_bus_create -name EXP:reg13 {CPU_top_tb.dut.core.register_file.reg_out_13__63_ CPU_top_tb.dut.core.register_file.reg_out_13__62_ CPU_top_tb.dut.core.register_file.reg_out_13__61_ CPU_top_tb.dut.core.register_file.reg_out_13__60_ CPU_top_tb.dut.core.register_file.reg_out_13__59_ CPU_top_tb.dut.core.register_file.reg_out_13__58_ CPU_top_tb.dut.core.register_file.reg_out_13__57_ CPU_top_tb.dut.core.register_file.reg_out_13__56_ CPU_top_tb.dut.core.register_file.reg_out_13__55_ CPU_top_tb.dut.core.register_file.reg_out_13__54_ CPU_top_tb.dut.core.register_file.reg_out_13__53_ CPU_top_tb.dut.core.register_file.reg_out_13__52_ CPU_top_tb.dut.core.register_file.reg_out_13__51_ CPU_top_tb.dut.core.register_file.reg_out_13__50_ CPU_top_tb.dut.core.register_file.reg_out_13__49_ CPU_top_tb.dut.core.register_file.reg_out_13__48_ CPU_top_tb.dut.core.register_file.reg_out_13__47_ CPU_top_tb.dut.core.register_file.reg_out_13__46_ CPU_top_tb.dut.core.register_file.reg_out_13__45_ CPU_top_tb.dut.core.register_file.reg_out_13__44_ CPU_top_tb.dut.core.register_file.reg_out_13__43_ CPU_top_tb.dut.core.register_file.reg_out_13__42_ CPU_top_tb.dut.core.register_file.reg_out_13__41_ CPU_top_tb.dut.core.register_file.reg_out_13__40_ CPU_top_tb.dut.core.register_file.reg_out_13__39_ CPU_top_tb.dut.core.register_file.reg_out_13__38_ CPU_top_tb.dut.core.register_file.reg_out_13__37_ CPU_top_tb.dut.core.register_file.reg_out_13__36_ CPU_top_tb.dut.core.register_file.reg_out_13__35_ CPU_top_tb.dut.core.register_file.reg_out_13__34_ CPU_top_tb.dut.core.register_file.reg_out_13__33_ CPU_top_tb.dut.core.register_file.reg_out_13__32_ CPU_top_tb.dut.core.register_file.reg_out_13__31_ CPU_top_tb.dut.core.register_file.reg_out_13__30_ CPU_top_tb.dut.core.register_file.reg_out_13__29_ CPU_top_tb.dut.core.register_file.reg_out_13__28_ CPU_top_tb.dut.core.register_file.reg_out_13__27_ CPU_top_tb.dut.core.register_file.reg_out_13__26_ CPU_top_tb.dut.core.register_file.reg_out_13__25_ CPU_top_tb.dut.core.register_file.reg_out_13__24_ CPU_top_tb.dut.core.register_file.reg_out_13__23_ CPU_top_tb.dut.core.register_file.reg_out_13__22_ CPU_top_tb.dut.core.register_file.reg_out_13__21_ CPU_top_tb.dut.core.register_file.reg_out_13__20_ CPU_top_tb.dut.core.register_file.reg_out_13__19_ CPU_top_tb.dut.core.register_file.reg_out_13__18_ CPU_top_tb.dut.core.register_file.reg_out_13__17_ CPU_top_tb.dut.core.register_file.reg_out_13__16_ CPU_top_tb.dut.core.register_file.reg_out_13__15_ CPU_top_tb.dut.core.register_file.reg_out_13__14_ CPU_top_tb.dut.core.register_file.reg_out_13__13_ CPU_top_tb.dut.core.register_file.reg_out_13__12_ CPU_top_tb.dut.core.register_file.reg_out_13__11_ CPU_top_tb.dut.core.register_file.reg_out_13__10_ CPU_top_tb.dut.core.register_file.reg_out_13__9_ CPU_top_tb.dut.core.register_file.reg_out_13__8_ CPU_top_tb.dut.core.register_file.reg_out_13__7_ CPU_top_tb.dut.core.register_file.reg_out_13__6_ CPU_top_tb.dut.core.register_file.reg_out_13__5_ CPU_top_tb.dut.core.register_file.reg_out_13__4_ CPU_top_tb.dut.core.register_file.reg_out_13__3_ CPU_top_tb.dut.core.register_file.reg_out_13__2_ CPU_top_tb.dut.core.register_file.reg_out_13__1_ CPU_top_tb.dut.core.register_file.reg_out_13__0_}
gui_bus_create -name EXP:reg14 {CPU_top_tb.dut.core.register_file.reg_out_14__63_ CPU_top_tb.dut.core.register_file.reg_out_14__62_ CPU_top_tb.dut.core.register_file.reg_out_14__61_ CPU_top_tb.dut.core.register_file.reg_out_14__60_ CPU_top_tb.dut.core.register_file.reg_out_14__59_ CPU_top_tb.dut.core.register_file.reg_out_14__58_ CPU_top_tb.dut.core.register_file.reg_out_14__57_ CPU_top_tb.dut.core.register_file.reg_out_14__56_ CPU_top_tb.dut.core.register_file.reg_out_14__55_ CPU_top_tb.dut.core.register_file.reg_out_14__54_ CPU_top_tb.dut.core.register_file.reg_out_14__53_ CPU_top_tb.dut.core.register_file.reg_out_14__52_ CPU_top_tb.dut.core.register_file.reg_out_14__51_ CPU_top_tb.dut.core.register_file.reg_out_14__50_ CPU_top_tb.dut.core.register_file.reg_out_14__49_ CPU_top_tb.dut.core.register_file.reg_out_14__48_ CPU_top_tb.dut.core.register_file.reg_out_14__47_ CPU_top_tb.dut.core.register_file.reg_out_14__46_ CPU_top_tb.dut.core.register_file.reg_out_14__45_ CPU_top_tb.dut.core.register_file.reg_out_14__44_ CPU_top_tb.dut.core.register_file.reg_out_14__43_ CPU_top_tb.dut.core.register_file.reg_out_14__42_ CPU_top_tb.dut.core.register_file.reg_out_14__41_ CPU_top_tb.dut.core.register_file.reg_out_14__40_ CPU_top_tb.dut.core.register_file.reg_out_14__39_ CPU_top_tb.dut.core.register_file.reg_out_14__38_ CPU_top_tb.dut.core.register_file.reg_out_14__37_ CPU_top_tb.dut.core.register_file.reg_out_14__36_ CPU_top_tb.dut.core.register_file.reg_out_14__35_ CPU_top_tb.dut.core.register_file.reg_out_14__34_ CPU_top_tb.dut.core.register_file.reg_out_14__33_ CPU_top_tb.dut.core.register_file.reg_out_14__32_ CPU_top_tb.dut.core.register_file.reg_out_14__31_ CPU_top_tb.dut.core.register_file.reg_out_14__30_ CPU_top_tb.dut.core.register_file.reg_out_14__29_ CPU_top_tb.dut.core.register_file.reg_out_14__28_ CPU_top_tb.dut.core.register_file.reg_out_14__27_ CPU_top_tb.dut.core.register_file.reg_out_14__26_ CPU_top_tb.dut.core.register_file.reg_out_14__25_ CPU_top_tb.dut.core.register_file.reg_out_14__24_ CPU_top_tb.dut.core.register_file.reg_out_14__23_ CPU_top_tb.dut.core.register_file.reg_out_14__22_ CPU_top_tb.dut.core.register_file.reg_out_14__21_ CPU_top_tb.dut.core.register_file.reg_out_14__20_ CPU_top_tb.dut.core.register_file.reg_out_14__19_ CPU_top_tb.dut.core.register_file.reg_out_14__18_ CPU_top_tb.dut.core.register_file.reg_out_14__17_ CPU_top_tb.dut.core.register_file.reg_out_14__16_ CPU_top_tb.dut.core.register_file.reg_out_14__15_ CPU_top_tb.dut.core.register_file.reg_out_14__14_ CPU_top_tb.dut.core.register_file.reg_out_14__13_ CPU_top_tb.dut.core.register_file.reg_out_14__12_ CPU_top_tb.dut.core.register_file.reg_out_14__11_ CPU_top_tb.dut.core.register_file.reg_out_14__10_ CPU_top_tb.dut.core.register_file.reg_out_14__9_ CPU_top_tb.dut.core.register_file.reg_out_14__8_ CPU_top_tb.dut.core.register_file.reg_out_14__7_ CPU_top_tb.dut.core.register_file.reg_out_14__6_ CPU_top_tb.dut.core.register_file.reg_out_14__5_ CPU_top_tb.dut.core.register_file.reg_out_14__4_ CPU_top_tb.dut.core.register_file.reg_out_14__3_ CPU_top_tb.dut.core.register_file.reg_out_14__2_ CPU_top_tb.dut.core.register_file.reg_out_14__1_ CPU_top_tb.dut.core.register_file.reg_out_14__0_}
gui_bus_create -name EXP:reg15 {CPU_top_tb.dut.core.register_file.reg_out_15__63_ CPU_top_tb.dut.core.register_file.reg_out_15__62_ CPU_top_tb.dut.core.register_file.reg_out_15__61_ CPU_top_tb.dut.core.register_file.reg_out_15__60_ CPU_top_tb.dut.core.register_file.reg_out_15__59_ CPU_top_tb.dut.core.register_file.reg_out_15__58_ CPU_top_tb.dut.core.register_file.reg_out_15__57_ CPU_top_tb.dut.core.register_file.reg_out_15__56_ CPU_top_tb.dut.core.register_file.reg_out_15__55_ CPU_top_tb.dut.core.register_file.reg_out_15__54_ CPU_top_tb.dut.core.register_file.reg_out_15__53_ CPU_top_tb.dut.core.register_file.reg_out_15__52_ CPU_top_tb.dut.core.register_file.reg_out_15__51_ CPU_top_tb.dut.core.register_file.reg_out_15__50_ CPU_top_tb.dut.core.register_file.reg_out_15__49_ CPU_top_tb.dut.core.register_file.reg_out_15__48_ CPU_top_tb.dut.core.register_file.reg_out_15__47_ CPU_top_tb.dut.core.register_file.reg_out_15__46_ CPU_top_tb.dut.core.register_file.reg_out_15__45_ CPU_top_tb.dut.core.register_file.reg_out_15__44_ CPU_top_tb.dut.core.register_file.reg_out_15__43_ CPU_top_tb.dut.core.register_file.reg_out_15__42_ CPU_top_tb.dut.core.register_file.reg_out_15__41_ CPU_top_tb.dut.core.register_file.reg_out_15__40_ CPU_top_tb.dut.core.register_file.reg_out_15__39_ CPU_top_tb.dut.core.register_file.reg_out_15__38_ CPU_top_tb.dut.core.register_file.reg_out_15__37_ CPU_top_tb.dut.core.register_file.reg_out_15__36_ CPU_top_tb.dut.core.register_file.reg_out_15__35_ CPU_top_tb.dut.core.register_file.reg_out_15__34_ CPU_top_tb.dut.core.register_file.reg_out_15__33_ CPU_top_tb.dut.core.register_file.reg_out_15__32_ CPU_top_tb.dut.core.register_file.reg_out_15__31_ CPU_top_tb.dut.core.register_file.reg_out_15__30_ CPU_top_tb.dut.core.register_file.reg_out_15__29_ CPU_top_tb.dut.core.register_file.reg_out_15__28_ CPU_top_tb.dut.core.register_file.reg_out_15__27_ CPU_top_tb.dut.core.register_file.reg_out_15__26_ CPU_top_tb.dut.core.register_file.reg_out_15__25_ CPU_top_tb.dut.core.register_file.reg_out_15__24_ CPU_top_tb.dut.core.register_file.reg_out_15__23_ CPU_top_tb.dut.core.register_file.reg_out_15__22_ CPU_top_tb.dut.core.register_file.reg_out_15__21_ CPU_top_tb.dut.core.register_file.reg_out_15__20_ CPU_top_tb.dut.core.register_file.reg_out_15__19_ CPU_top_tb.dut.core.register_file.reg_out_15__18_ CPU_top_tb.dut.core.register_file.reg_out_15__17_ CPU_top_tb.dut.core.register_file.reg_out_15__16_ CPU_top_tb.dut.core.register_file.reg_out_15__15_ CPU_top_tb.dut.core.register_file.reg_out_15__14_ CPU_top_tb.dut.core.register_file.reg_out_15__13_ CPU_top_tb.dut.core.register_file.reg_out_15__12_ CPU_top_tb.dut.core.register_file.reg_out_15__11_ CPU_top_tb.dut.core.register_file.reg_out_15__10_ CPU_top_tb.dut.core.register_file.reg_out_15__9_ CPU_top_tb.dut.core.register_file.reg_out_15__8_ CPU_top_tb.dut.core.register_file.reg_out_15__7_ CPU_top_tb.dut.core.register_file.reg_out_15__6_ CPU_top_tb.dut.core.register_file.reg_out_15__5_ CPU_top_tb.dut.core.register_file.reg_out_15__4_ CPU_top_tb.dut.core.register_file.reg_out_15__3_ CPU_top_tb.dut.core.register_file.reg_out_15__2_ CPU_top_tb.dut.core.register_file.reg_out_15__1_ CPU_top_tb.dut.core.register_file.reg_out_15__0_}
gui_bus_create -name EXP:reg16 {CPU_top_tb.dut.core.register_file.reg_out_16__63_ CPU_top_tb.dut.core.register_file.reg_out_16__62_ CPU_top_tb.dut.core.register_file.reg_out_16__61_ CPU_top_tb.dut.core.register_file.reg_out_16__60_ CPU_top_tb.dut.core.register_file.reg_out_16__59_ CPU_top_tb.dut.core.register_file.reg_out_16__58_ CPU_top_tb.dut.core.register_file.reg_out_16__57_ CPU_top_tb.dut.core.register_file.reg_out_16__56_ CPU_top_tb.dut.core.register_file.reg_out_16__55_ CPU_top_tb.dut.core.register_file.reg_out_16__54_ CPU_top_tb.dut.core.register_file.reg_out_16__53_ CPU_top_tb.dut.core.register_file.reg_out_16__52_ CPU_top_tb.dut.core.register_file.reg_out_16__51_ CPU_top_tb.dut.core.register_file.reg_out_16__50_ CPU_top_tb.dut.core.register_file.reg_out_16__49_ CPU_top_tb.dut.core.register_file.reg_out_16__48_ CPU_top_tb.dut.core.register_file.reg_out_16__47_ CPU_top_tb.dut.core.register_file.reg_out_16__46_ CPU_top_tb.dut.core.register_file.reg_out_16__45_ CPU_top_tb.dut.core.register_file.reg_out_16__44_ CPU_top_tb.dut.core.register_file.reg_out_16__43_ CPU_top_tb.dut.core.register_file.reg_out_16__42_ CPU_top_tb.dut.core.register_file.reg_out_16__41_ CPU_top_tb.dut.core.register_file.reg_out_16__40_ CPU_top_tb.dut.core.register_file.reg_out_16__39_ CPU_top_tb.dut.core.register_file.reg_out_16__38_ CPU_top_tb.dut.core.register_file.reg_out_16__37_ CPU_top_tb.dut.core.register_file.reg_out_16__36_ CPU_top_tb.dut.core.register_file.reg_out_16__35_ CPU_top_tb.dut.core.register_file.reg_out_16__34_ CPU_top_tb.dut.core.register_file.reg_out_16__33_ CPU_top_tb.dut.core.register_file.reg_out_16__32_ CPU_top_tb.dut.core.register_file.reg_out_16__31_ CPU_top_tb.dut.core.register_file.reg_out_16__30_ CPU_top_tb.dut.core.register_file.reg_out_16__29_ CPU_top_tb.dut.core.register_file.reg_out_16__28_ CPU_top_tb.dut.core.register_file.reg_out_16__27_ CPU_top_tb.dut.core.register_file.reg_out_16__26_ CPU_top_tb.dut.core.register_file.reg_out_16__25_ CPU_top_tb.dut.core.register_file.reg_out_16__24_ CPU_top_tb.dut.core.register_file.reg_out_16__23_ CPU_top_tb.dut.core.register_file.reg_out_16__22_ CPU_top_tb.dut.core.register_file.reg_out_16__21_ CPU_top_tb.dut.core.register_file.reg_out_16__20_ CPU_top_tb.dut.core.register_file.reg_out_16__19_ CPU_top_tb.dut.core.register_file.reg_out_16__18_ CPU_top_tb.dut.core.register_file.reg_out_16__17_ CPU_top_tb.dut.core.register_file.reg_out_16__16_ CPU_top_tb.dut.core.register_file.reg_out_16__15_ CPU_top_tb.dut.core.register_file.reg_out_16__14_ CPU_top_tb.dut.core.register_file.reg_out_16__13_ CPU_top_tb.dut.core.register_file.reg_out_16__12_ CPU_top_tb.dut.core.register_file.reg_out_16__11_ CPU_top_tb.dut.core.register_file.reg_out_16__10_ CPU_top_tb.dut.core.register_file.reg_out_16__9_ CPU_top_tb.dut.core.register_file.reg_out_16__8_ CPU_top_tb.dut.core.register_file.reg_out_16__7_ CPU_top_tb.dut.core.register_file.reg_out_16__6_ CPU_top_tb.dut.core.register_file.reg_out_16__5_ CPU_top_tb.dut.core.register_file.reg_out_16__4_ CPU_top_tb.dut.core.register_file.reg_out_16__3_ CPU_top_tb.dut.core.register_file.reg_out_16__2_ CPU_top_tb.dut.core.register_file.reg_out_16__1_ CPU_top_tb.dut.core.register_file.reg_out_16__0_}
gui_bus_create -name EXP:reg17 {CPU_top_tb.dut.core.register_file.reg_out_17__63_ CPU_top_tb.dut.core.register_file.reg_out_17__62_ CPU_top_tb.dut.core.register_file.reg_out_17__61_ CPU_top_tb.dut.core.register_file.reg_out_17__60_ CPU_top_tb.dut.core.register_file.reg_out_17__59_ CPU_top_tb.dut.core.register_file.reg_out_17__58_ CPU_top_tb.dut.core.register_file.reg_out_17__57_ CPU_top_tb.dut.core.register_file.reg_out_17__56_ CPU_top_tb.dut.core.register_file.reg_out_17__55_ CPU_top_tb.dut.core.register_file.reg_out_17__54_ CPU_top_tb.dut.core.register_file.reg_out_17__53_ CPU_top_tb.dut.core.register_file.reg_out_17__52_ CPU_top_tb.dut.core.register_file.reg_out_17__51_ CPU_top_tb.dut.core.register_file.reg_out_17__50_ CPU_top_tb.dut.core.register_file.reg_out_17__49_ CPU_top_tb.dut.core.register_file.reg_out_17__48_ CPU_top_tb.dut.core.register_file.reg_out_17__47_ CPU_top_tb.dut.core.register_file.reg_out_17__46_ CPU_top_tb.dut.core.register_file.reg_out_17__45_ CPU_top_tb.dut.core.register_file.reg_out_17__44_ CPU_top_tb.dut.core.register_file.reg_out_17__43_ CPU_top_tb.dut.core.register_file.reg_out_17__42_ CPU_top_tb.dut.core.register_file.reg_out_17__41_ CPU_top_tb.dut.core.register_file.reg_out_17__40_ CPU_top_tb.dut.core.register_file.reg_out_17__39_ CPU_top_tb.dut.core.register_file.reg_out_17__38_ CPU_top_tb.dut.core.register_file.reg_out_17__37_ CPU_top_tb.dut.core.register_file.reg_out_17__36_ CPU_top_tb.dut.core.register_file.reg_out_17__35_ CPU_top_tb.dut.core.register_file.reg_out_17__34_ CPU_top_tb.dut.core.register_file.reg_out_17__33_ CPU_top_tb.dut.core.register_file.reg_out_17__32_ CPU_top_tb.dut.core.register_file.reg_out_17__31_ CPU_top_tb.dut.core.register_file.reg_out_17__30_ CPU_top_tb.dut.core.register_file.reg_out_17__29_ CPU_top_tb.dut.core.register_file.reg_out_17__28_ CPU_top_tb.dut.core.register_file.reg_out_17__27_ CPU_top_tb.dut.core.register_file.reg_out_17__26_ CPU_top_tb.dut.core.register_file.reg_out_17__25_ CPU_top_tb.dut.core.register_file.reg_out_17__24_ CPU_top_tb.dut.core.register_file.reg_out_17__23_ CPU_top_tb.dut.core.register_file.reg_out_17__22_ CPU_top_tb.dut.core.register_file.reg_out_17__21_ CPU_top_tb.dut.core.register_file.reg_out_17__20_ CPU_top_tb.dut.core.register_file.reg_out_17__19_ CPU_top_tb.dut.core.register_file.reg_out_17__18_ CPU_top_tb.dut.core.register_file.reg_out_17__17_ CPU_top_tb.dut.core.register_file.reg_out_17__16_ CPU_top_tb.dut.core.register_file.reg_out_17__15_ CPU_top_tb.dut.core.register_file.reg_out_17__14_ CPU_top_tb.dut.core.register_file.reg_out_17__13_ CPU_top_tb.dut.core.register_file.reg_out_17__12_ CPU_top_tb.dut.core.register_file.reg_out_17__11_ CPU_top_tb.dut.core.register_file.reg_out_17__10_ CPU_top_tb.dut.core.register_file.reg_out_17__9_ CPU_top_tb.dut.core.register_file.reg_out_17__8_ CPU_top_tb.dut.core.register_file.reg_out_17__7_ CPU_top_tb.dut.core.register_file.reg_out_17__6_ CPU_top_tb.dut.core.register_file.reg_out_17__5_ CPU_top_tb.dut.core.register_file.reg_out_17__4_ CPU_top_tb.dut.core.register_file.reg_out_17__3_ CPU_top_tb.dut.core.register_file.reg_out_17__2_ CPU_top_tb.dut.core.register_file.reg_out_17__1_ CPU_top_tb.dut.core.register_file.reg_out_17__0_}
gui_bus_create -name EXP:reg18 {CPU_top_tb.dut.core.register_file.reg_out_18__63_ CPU_top_tb.dut.core.register_file.reg_out_18__62_ CPU_top_tb.dut.core.register_file.reg_out_18__61_ CPU_top_tb.dut.core.register_file.reg_out_18__60_ CPU_top_tb.dut.core.register_file.reg_out_18__59_ CPU_top_tb.dut.core.register_file.reg_out_18__58_ CPU_top_tb.dut.core.register_file.reg_out_18__57_ CPU_top_tb.dut.core.register_file.reg_out_18__56_ CPU_top_tb.dut.core.register_file.reg_out_18__55_ CPU_top_tb.dut.core.register_file.reg_out_18__54_ CPU_top_tb.dut.core.register_file.reg_out_18__53_ CPU_top_tb.dut.core.register_file.reg_out_18__52_ CPU_top_tb.dut.core.register_file.reg_out_18__51_ CPU_top_tb.dut.core.register_file.reg_out_18__50_ CPU_top_tb.dut.core.register_file.reg_out_18__49_ CPU_top_tb.dut.core.register_file.reg_out_18__48_ CPU_top_tb.dut.core.register_file.reg_out_18__47_ CPU_top_tb.dut.core.register_file.reg_out_18__46_ CPU_top_tb.dut.core.register_file.reg_out_18__45_ CPU_top_tb.dut.core.register_file.reg_out_18__44_ CPU_top_tb.dut.core.register_file.reg_out_18__43_ CPU_top_tb.dut.core.register_file.reg_out_18__42_ CPU_top_tb.dut.core.register_file.reg_out_18__41_ CPU_top_tb.dut.core.register_file.reg_out_18__40_ CPU_top_tb.dut.core.register_file.reg_out_18__39_ CPU_top_tb.dut.core.register_file.reg_out_18__38_ CPU_top_tb.dut.core.register_file.reg_out_18__37_ CPU_top_tb.dut.core.register_file.reg_out_18__36_ CPU_top_tb.dut.core.register_file.reg_out_18__35_ CPU_top_tb.dut.core.register_file.reg_out_18__34_ CPU_top_tb.dut.core.register_file.reg_out_18__33_ CPU_top_tb.dut.core.register_file.reg_out_18__32_ CPU_top_tb.dut.core.register_file.reg_out_18__31_ CPU_top_tb.dut.core.register_file.reg_out_18__30_ CPU_top_tb.dut.core.register_file.reg_out_18__29_ CPU_top_tb.dut.core.register_file.reg_out_18__28_ CPU_top_tb.dut.core.register_file.reg_out_18__27_ CPU_top_tb.dut.core.register_file.reg_out_18__26_ CPU_top_tb.dut.core.register_file.reg_out_18__25_ CPU_top_tb.dut.core.register_file.reg_out_18__24_ CPU_top_tb.dut.core.register_file.reg_out_18__23_ CPU_top_tb.dut.core.register_file.reg_out_18__22_ CPU_top_tb.dut.core.register_file.reg_out_18__21_ CPU_top_tb.dut.core.register_file.reg_out_18__20_ CPU_top_tb.dut.core.register_file.reg_out_18__19_ CPU_top_tb.dut.core.register_file.reg_out_18__18_ CPU_top_tb.dut.core.register_file.reg_out_18__17_ CPU_top_tb.dut.core.register_file.reg_out_18__16_ CPU_top_tb.dut.core.register_file.reg_out_18__15_ CPU_top_tb.dut.core.register_file.reg_out_18__14_ CPU_top_tb.dut.core.register_file.reg_out_18__13_ CPU_top_tb.dut.core.register_file.reg_out_18__12_ CPU_top_tb.dut.core.register_file.reg_out_18__11_ CPU_top_tb.dut.core.register_file.reg_out_18__10_ CPU_top_tb.dut.core.register_file.reg_out_18__9_ CPU_top_tb.dut.core.register_file.reg_out_18__8_ CPU_top_tb.dut.core.register_file.reg_out_18__7_ CPU_top_tb.dut.core.register_file.reg_out_18__6_ CPU_top_tb.dut.core.register_file.reg_out_18__5_ CPU_top_tb.dut.core.register_file.reg_out_18__4_ CPU_top_tb.dut.core.register_file.reg_out_18__3_ CPU_top_tb.dut.core.register_file.reg_out_18__2_ CPU_top_tb.dut.core.register_file.reg_out_18__1_ CPU_top_tb.dut.core.register_file.reg_out_18__0_}
gui_bus_create -name EXP:reg19 {CPU_top_tb.dut.core.register_file.reg_out_19__63_ CPU_top_tb.dut.core.register_file.reg_out_19__62_ CPU_top_tb.dut.core.register_file.reg_out_19__61_ CPU_top_tb.dut.core.register_file.reg_out_19__60_ CPU_top_tb.dut.core.register_file.reg_out_19__59_ CPU_top_tb.dut.core.register_file.reg_out_19__58_ CPU_top_tb.dut.core.register_file.reg_out_19__57_ CPU_top_tb.dut.core.register_file.reg_out_19__56_ CPU_top_tb.dut.core.register_file.reg_out_19__55_ CPU_top_tb.dut.core.register_file.reg_out_19__54_ CPU_top_tb.dut.core.register_file.reg_out_19__53_ CPU_top_tb.dut.core.register_file.reg_out_19__52_ CPU_top_tb.dut.core.register_file.reg_out_19__51_ CPU_top_tb.dut.core.register_file.reg_out_19__50_ CPU_top_tb.dut.core.register_file.reg_out_19__49_ CPU_top_tb.dut.core.register_file.reg_out_19__48_ CPU_top_tb.dut.core.register_file.reg_out_19__47_ CPU_top_tb.dut.core.register_file.reg_out_19__46_ CPU_top_tb.dut.core.register_file.reg_out_19__45_ CPU_top_tb.dut.core.register_file.reg_out_19__44_ CPU_top_tb.dut.core.register_file.reg_out_19__43_ CPU_top_tb.dut.core.register_file.reg_out_19__42_ CPU_top_tb.dut.core.register_file.reg_out_19__41_ CPU_top_tb.dut.core.register_file.reg_out_19__40_ CPU_top_tb.dut.core.register_file.reg_out_19__39_ CPU_top_tb.dut.core.register_file.reg_out_19__38_ CPU_top_tb.dut.core.register_file.reg_out_19__37_ CPU_top_tb.dut.core.register_file.reg_out_19__36_ CPU_top_tb.dut.core.register_file.reg_out_19__35_ CPU_top_tb.dut.core.register_file.reg_out_19__34_ CPU_top_tb.dut.core.register_file.reg_out_19__33_ CPU_top_tb.dut.core.register_file.reg_out_19__32_ CPU_top_tb.dut.core.register_file.reg_out_19__31_ CPU_top_tb.dut.core.register_file.reg_out_19__30_ CPU_top_tb.dut.core.register_file.reg_out_19__29_ CPU_top_tb.dut.core.register_file.reg_out_19__28_ CPU_top_tb.dut.core.register_file.reg_out_19__27_ CPU_top_tb.dut.core.register_file.reg_out_19__26_ CPU_top_tb.dut.core.register_file.reg_out_19__25_ CPU_top_tb.dut.core.register_file.reg_out_19__24_ CPU_top_tb.dut.core.register_file.reg_out_19__23_ CPU_top_tb.dut.core.register_file.reg_out_19__22_ CPU_top_tb.dut.core.register_file.reg_out_19__21_ CPU_top_tb.dut.core.register_file.reg_out_19__20_ CPU_top_tb.dut.core.register_file.reg_out_19__19_ CPU_top_tb.dut.core.register_file.reg_out_19__18_ CPU_top_tb.dut.core.register_file.reg_out_19__17_ CPU_top_tb.dut.core.register_file.reg_out_19__16_ CPU_top_tb.dut.core.register_file.reg_out_19__15_ CPU_top_tb.dut.core.register_file.reg_out_19__14_ CPU_top_tb.dut.core.register_file.reg_out_19__13_ CPU_top_tb.dut.core.register_file.reg_out_19__12_ CPU_top_tb.dut.core.register_file.reg_out_19__11_ CPU_top_tb.dut.core.register_file.reg_out_19__10_ CPU_top_tb.dut.core.register_file.reg_out_19__9_ CPU_top_tb.dut.core.register_file.reg_out_19__8_ CPU_top_tb.dut.core.register_file.reg_out_19__7_ CPU_top_tb.dut.core.register_file.reg_out_19__6_ CPU_top_tb.dut.core.register_file.reg_out_19__5_ CPU_top_tb.dut.core.register_file.reg_out_19__4_ CPU_top_tb.dut.core.register_file.reg_out_19__3_ CPU_top_tb.dut.core.register_file.reg_out_19__2_ CPU_top_tb.dut.core.register_file.reg_out_19__1_ CPU_top_tb.dut.core.register_file.reg_out_19__0_}
gui_bus_create -name EXP:dmem {{CPU_top_tb.dut.data_memory.mem[79][7:0]} {CPU_top_tb.dut.data_memory.mem[78][7:0]} {CPU_top_tb.dut.data_memory.mem[77][7:0]} {CPU_top_tb.dut.data_memory.mem[76][7:0]} {CPU_top_tb.dut.data_memory.mem[75][7:0]} {CPU_top_tb.dut.data_memory.mem[74][7:0]} {CPU_top_tb.dut.data_memory.mem[73][7:0]} {CPU_top_tb.dut.data_memory.mem[72][7:0]} {CPU_top_tb.dut.data_memory.mem[71][7:0]} {CPU_top_tb.dut.data_memory.mem[70][7:0]} {CPU_top_tb.dut.data_memory.mem[69][7:0]} {CPU_top_tb.dut.data_memory.mem[68][7:0]} {CPU_top_tb.dut.data_memory.mem[67][7:0]} {CPU_top_tb.dut.data_memory.mem[66][7:0]} {CPU_top_tb.dut.data_memory.mem[65][7:0]} {CPU_top_tb.dut.data_memory.mem[64][7:0]} {CPU_top_tb.dut.data_memory.mem[63][7:0]} {CPU_top_tb.dut.data_memory.mem[62][7:0]} {CPU_top_tb.dut.data_memory.mem[61][7:0]} {CPU_top_tb.dut.data_memory.mem[60][7:0]} {CPU_top_tb.dut.data_memory.mem[59][7:0]} {CPU_top_tb.dut.data_memory.mem[58][7:0]} {CPU_top_tb.dut.data_memory.mem[57][7:0]} {CPU_top_tb.dut.data_memory.mem[56][7:0]} {CPU_top_tb.dut.data_memory.mem[55][7:0]} {CPU_top_tb.dut.data_memory.mem[54][7:0]} {CPU_top_tb.dut.data_memory.mem[53][7:0]} {CPU_top_tb.dut.data_memory.mem[52][7:0]} {CPU_top_tb.dut.data_memory.mem[51][7:0]} {CPU_top_tb.dut.data_memory.mem[50][7:0]} {CPU_top_tb.dut.data_memory.mem[49][7:0]} {CPU_top_tb.dut.data_memory.mem[48][7:0]} {CPU_top_tb.dut.data_memory.mem[47][7:0]} {CPU_top_tb.dut.data_memory.mem[46][7:0]} {CPU_top_tb.dut.data_memory.mem[45][7:0]} {CPU_top_tb.dut.data_memory.mem[44][7:0]} {CPU_top_tb.dut.data_memory.mem[43][7:0]} {CPU_top_tb.dut.data_memory.mem[42][7:0]} {CPU_top_tb.dut.data_memory.mem[41][7:0]} {CPU_top_tb.dut.data_memory.mem[40][7:0]} {CPU_top_tb.dut.data_memory.mem[39][7:0]} {CPU_top_tb.dut.data_memory.mem[38][7:0]} {CPU_top_tb.dut.data_memory.mem[37][7:0]} {CPU_top_tb.dut.data_memory.mem[36][7:0]} {CPU_top_tb.dut.data_memory.mem[35][7:0]} {CPU_top_tb.dut.data_memory.mem[34][7:0]} {CPU_top_tb.dut.data_memory.mem[33][7:0]} {CPU_top_tb.dut.data_memory.mem[32][7:0]} {CPU_top_tb.dut.data_memory.mem[31][7:0]} {CPU_top_tb.dut.data_memory.mem[30][7:0]} {CPU_top_tb.dut.data_memory.mem[29][7:0]} {CPU_top_tb.dut.data_memory.mem[28][7:0]} {CPU_top_tb.dut.data_memory.mem[27][7:0]} {CPU_top_tb.dut.data_memory.mem[26][7:0]} {CPU_top_tb.dut.data_memory.mem[25][7:0]} {CPU_top_tb.dut.data_memory.mem[24][7:0]} {CPU_top_tb.dut.data_memory.mem[23][7:0]} {CPU_top_tb.dut.data_memory.mem[22][7:0]} {CPU_top_tb.dut.data_memory.mem[21][7:0]} {CPU_top_tb.dut.data_memory.mem[20][7:0]} {CPU_top_tb.dut.data_memory.mem[19][7:0]} {CPU_top_tb.dut.data_memory.mem[18][7:0]} {CPU_top_tb.dut.data_memory.mem[17][7:0]} {CPU_top_tb.dut.data_memory.mem[16][7:0]} {CPU_top_tb.dut.data_memory.mem[15][7:0]} {CPU_top_tb.dut.data_memory.mem[14][7:0]} {CPU_top_tb.dut.data_memory.mem[13][7:0]} {CPU_top_tb.dut.data_memory.mem[12][7:0]} {CPU_top_tb.dut.data_memory.mem[11][7:0]} {CPU_top_tb.dut.data_memory.mem[10][7:0]} {CPU_top_tb.dut.data_memory.mem[9][7:0]} {CPU_top_tb.dut.data_memory.mem[8][7:0]} {CPU_top_tb.dut.data_memory.mem[7][7:0]} {CPU_top_tb.dut.data_memory.mem[6][7:0]} {CPU_top_tb.dut.data_memory.mem[5][7:0]} {CPU_top_tb.dut.data_memory.mem[4][7:0]} {CPU_top_tb.dut.data_memory.mem[3][7:0]} {CPU_top_tb.dut.data_memory.mem[2][7:0]} {CPU_top_tb.dut.data_memory.mem[1][7:0]} {CPU_top_tb.dut.data_memory.mem[0][7:0]}}

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {CPU_top_tb.dut.core}
gui_load_child_values {CPU_top_tb.dut.data_memory}


set _session_group_3 Group1
gui_sg_create "$_session_group_3"
set Group1 "$_session_group_3"

gui_sg_addsignal -group "$_session_group_3" { CPU_top_tb.dut.core.program_counter CPU_top_tb.dut.data_memory.mem EXP:dmem EXP:reg0 EXP:reg1 EXP:reg2 EXP:reg3 EXP:reg4 EXP:reg5 EXP:reg6 EXP:reg7 EXP:reg8 EXP:reg9 EXP:reg10 EXP:reg11 EXP:reg12 EXP:reg13 EXP:reg14 EXP:reg15 EXP:reg16 EXP:reg17 EXP:reg18 EXP:reg19 EXP:reg20 CPU_top_tb.dut.core.register_file.ReadRegister1 CPU_top_tb.dut.core.register_file.ReadRegister2 CPU_top_tb.dut.core.register_file.WriteRegister CPU_top_tb.dut.core.register_file.WriteData CPU_top_tb.dut.core.register_file.ReadData1 CPU_top_tb.dut.core.register_file.ReadData2 CPU_top_tb.dut.core.register_file.RegWrite }
gui_set_radix -radix {decimal} -signals {V1:CPU_top_tb.dut.core.program_counter}
gui_set_radix -radix {unsigned} -signals {V1:CPU_top_tb.dut.core.program_counter}
gui_set_radix -radix {decimal} -signals {EXP:reg0}
gui_set_radix -radix {unsigned} -signals {EXP:reg0}
gui_set_radix -radix {decimal} -signals {EXP:reg1}
gui_set_radix -radix {unsigned} -signals {EXP:reg1}
gui_set_radix -radix {decimal} -signals {EXP:reg2}
gui_set_radix -radix {unsigned} -signals {EXP:reg2}
gui_set_radix -radix {decimal} -signals {EXP:reg3}
gui_set_radix -radix {unsigned} -signals {EXP:reg3}
gui_set_radix -radix {decimal} -signals {EXP:reg4}
gui_set_radix -radix {unsigned} -signals {EXP:reg4}
gui_set_radix -radix {decimal} -signals {EXP:reg5}
gui_set_radix -radix {unsigned} -signals {EXP:reg5}
gui_set_radix -radix {decimal} -signals {EXP:reg6}
gui_set_radix -radix {unsigned} -signals {EXP:reg6}
gui_set_radix -radix {decimal} -signals {EXP:reg7}
gui_set_radix -radix {unsigned} -signals {EXP:reg7}
gui_set_radix -radix {decimal} -signals {EXP:reg8}
gui_set_radix -radix {unsigned} -signals {EXP:reg8}
gui_set_radix -radix {decimal} -signals {EXP:reg9}
gui_set_radix -radix {unsigned} -signals {EXP:reg9}
gui_set_radix -radix {decimal} -signals {EXP:reg10}
gui_set_radix -radix {unsigned} -signals {EXP:reg10}
gui_set_radix -radix {decimal} -signals {EXP:reg11}
gui_set_radix -radix {unsigned} -signals {EXP:reg11}
gui_set_radix -radix {decimal} -signals {EXP:reg12}
gui_set_radix -radix {unsigned} -signals {EXP:reg12}
gui_set_radix -radix {decimal} -signals {EXP:reg13}
gui_set_radix -radix {unsigned} -signals {EXP:reg13}
gui_set_radix -radix {decimal} -signals {EXP:reg14}
gui_set_radix -radix {unsigned} -signals {EXP:reg14}
gui_set_radix -radix {decimal} -signals {EXP:reg15}
gui_set_radix -radix {unsigned} -signals {EXP:reg15}
gui_set_radix -radix {decimal} -signals {EXP:reg16}
gui_set_radix -radix {unsigned} -signals {EXP:reg16}
gui_set_radix -radix {decimal} -signals {EXP:reg17}
gui_set_radix -radix {unsigned} -signals {EXP:reg17}
gui_set_radix -radix {decimal} -signals {EXP:reg18}
gui_set_radix -radix {unsigned} -signals {EXP:reg18}
gui_set_radix -radix {decimal} -signals {EXP:reg19}
gui_set_radix -radix {unsigned} -signals {EXP:reg19}
gui_set_radix -radix {decimal} -signals {EXP:reg20}
gui_set_radix -radix {unsigned} -signals {EXP:reg20}
gui_set_radix -radix {decimal} -signals {V1:CPU_top_tb.dut.core.register_file.ReadRegister1}
gui_set_radix -radix {unsigned} -signals {V1:CPU_top_tb.dut.core.register_file.ReadRegister1}
gui_set_radix -radix {decimal} -signals {V1:CPU_top_tb.dut.core.register_file.ReadRegister2}
gui_set_radix -radix {unsigned} -signals {V1:CPU_top_tb.dut.core.register_file.ReadRegister2}
gui_set_radix -radix {decimal} -signals {V1:CPU_top_tb.dut.core.register_file.WriteRegister}
gui_set_radix -radix {unsigned} -signals {V1:CPU_top_tb.dut.core.register_file.WriteRegister}
gui_set_radix -radix {decimal} -signals {V1:CPU_top_tb.dut.core.register_file.WriteData}
gui_set_radix -radix {unsigned} -signals {V1:CPU_top_tb.dut.core.register_file.WriteData}
gui_set_radix -radix {decimal} -signals {V1:CPU_top_tb.dut.core.register_file.ReadData1}
gui_set_radix -radix {unsigned} -signals {V1:CPU_top_tb.dut.core.register_file.ReadData1}
gui_set_radix -radix {decimal} -signals {V1:CPU_top_tb.dut.core.register_file.ReadData2}
gui_set_radix -radix {unsigned} -signals {V1:CPU_top_tb.dut.core.register_file.ReadData2}

set _session_group_4 Group2
gui_sg_create "$_session_group_4"
set Group2 "$_session_group_4"


# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 1358452



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
catch {gui_list_expand -id ${Hier.1} CPU_top_tb}
catch {gui_list_expand -id ${Hier.1} CPU_top_tb.dut}
catch {gui_list_expand -id ${Hier.1} CPU_top_tb.dut.core}
catch {gui_list_expand -id ${Hier.1} CPU_top_tb.dut.core.register_file}
catch {gui_list_select -id ${Hier.1} {CPU_top_tb.dut.core.register_file.reg_gen_0__dut}}
gui_view_scroll -id ${Hier.1} -vertical -set 20816
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {CPU_top_tb.dut.core.register_file.reg_gen_0__dut}
gui_show_window -window ${Data.1}
catch { gui_list_select -id ${Data.1} {CPU_top_tb.dut.core.register_file.reg_gen_0__dut.out }}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 20816
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active AN2D1 /home/lab.apps/vlsiapps/kits/tsmc/N65RF/1.0c/digital/Front_End/verilog/tcbn65gplus_140b/tcbn65gplus.v
gui_view_scroll -id ${Source.1} -vertical -set 784
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
gui_wv_zoom_timerange -id ${Wave.1} 0 1412100
gui_list_add_group -id ${Wave.1} -after {New Group} {Group1}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group2}
gui_list_select -id ${Wave.1} {EXP:dmem }
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
gui_list_set_insertion_bar  -id ${Wave.1} -group Group1  -item EXP:dmem -position below

gui_marker_move -id ${Wave.1} {C1} 1358452
gui_view_scroll -id ${Wave.1} -vertical -set 50
gui_show_grid -id ${Wave.1} -enable false
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
	gui_set_active_window -window ${DLPane.1}
}
if {[gui_exist_window -window ${TopLevel.2}]} {
	gui_set_active_window -window ${TopLevel.2}
	gui_set_active_window -window ${Wave.1}
}
#</Session>

