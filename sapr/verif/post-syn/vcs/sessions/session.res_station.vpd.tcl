# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Tue May 31 19:33:28 2022
# Designs open: 1
#   V1: res_station.vpd
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Source.1: AN2D0
#   Wave.1: 408 signals
#   Group count = 1
#   Group dut signal count = 408
# End_DVE_Session_Save_Info

# DVE version: S-2021.09-SP1_Full64
# DVE build date: Nov 30 2021 00:09:19


#<Session mode="Full" path="/home/rusdac/ee478/OoOps/sapr/verif/post-syn/vcs/session.res_station.vpd.tcl" type="Debug">

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
gui_show_window -window ${TopLevel.1} -show_state normal -rect {{6 38} {893 758}}

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
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 461]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 461
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 460} {height 478} {dock_state left} {dock_on_new_line true} {child_hier_colhier 352} {child_hier_coltype 101} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 445]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 445
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 479
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 444} {height 478} {dock_state left} {dock_on_new_line true} {child_data_colvariable 222} {child_data_colvalue 87} {child_data_coltype 226} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 105]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 888
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 105
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 887} {height 105} {dock_state bottom} {dock_on_new_line true}}
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
gui_show_window -window ${TopLevel.2} -show_state maximized -rect {{3 29} {764 758}}

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
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 240} {child_wave_right 516} {child_wave_colname 172} {child_wave_colvalue 64} {child_wave_col1 0} {child_wave_col2 1}}

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

if { ![gui_is_db_opened -db {res_station.vpd}] } {
	gui_open_db -design V1 -file res_station.vpd -nosource
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


set _session_group_1 dut
gui_sg_create "$_session_group_1"
set dut "$_session_group_1"

gui_sg_addsignal -group "$_session_group_1" { res_station_tb.dut.cdb_i res_station_tb.dut.alu_opcode_i res_station_tb.dut.shift_opcode_i res_station_tb.dut.tag1_i res_station_tb.dut.tag2_i res_station_tb.dut.value1_i res_station_tb.dut.value2_i res_station_tb.dut.fu_alu_oper_o res_station_tb.dut.fu_shift_oper_o res_station_tb.dut.fu_rs1_val_o res_station_tb.dut.fu_rs2_val_o res_station_tb.dut.busy_o res_station_tb.dut.fu_ready_o res_station_tb.dut.reset_i res_station_tb.dut.clk_i res_station_tb.dut.write_i res_station_tb.dut.rs_tag1__31_ res_station_tb.dut.rs_tag1__30_ res_station_tb.dut.rs_tag1__29_ res_station_tb.dut.rs_tag1__28_ res_station_tb.dut.rs_tag1__27_ res_station_tb.dut.rs_tag1__26_ res_station_tb.dut.rs_tag1__25_ res_station_tb.dut.rs_tag1__24_ res_station_tb.dut.rs_tag1__23_ res_station_tb.dut.rs_tag1__22_ res_station_tb.dut.rs_tag1__21_ res_station_tb.dut.rs_tag1__20_ res_station_tb.dut.rs_tag1__19_ res_station_tb.dut.rs_tag1__18_ res_station_tb.dut.rs_tag1__17_ res_station_tb.dut.rs_tag1__16_ res_station_tb.dut.rs_tag1__15_ res_station_tb.dut.rs_tag1__14_ res_station_tb.dut.rs_tag1__13_ res_station_tb.dut.rs_tag1__12_ res_station_tb.dut.rs_tag1__11_ res_station_tb.dut.rs_tag1__10_ res_station_tb.dut.rs_tag1__9_ res_station_tb.dut.rs_tag1__8_ res_station_tb.dut.rs_tag1__7_ res_station_tb.dut.rs_tag1__6_ res_station_tb.dut.rs_tag1__5_ res_station_tb.dut.rs_tag1__4_ res_station_tb.dut.rs_tag1__3_ res_station_tb.dut.rs_tag1__2_ res_station_tb.dut.rs_tag1__1_ res_station_tb.dut.rs_tag1__0_ res_station_tb.dut.rs_tag2__31_ res_station_tb.dut.rs_tag2__30_ res_station_tb.dut.rs_tag2__29_ res_station_tb.dut.rs_tag2__28_ res_station_tb.dut.rs_tag2__27_ res_station_tb.dut.rs_tag2__26_ res_station_tb.dut.rs_tag2__25_ res_station_tb.dut.rs_tag2__24_ res_station_tb.dut.rs_tag2__23_ res_station_tb.dut.rs_tag2__22_ res_station_tb.dut.rs_tag2__21_ res_station_tb.dut.rs_tag2__20_ res_station_tb.dut.rs_tag2__19_ res_station_tb.dut.rs_tag2__18_ res_station_tb.dut.rs_tag2__17_ res_station_tb.dut.rs_tag2__16_ res_station_tb.dut.rs_tag2__15_ res_station_tb.dut.rs_tag2__14_ res_station_tb.dut.rs_tag2__13_ res_station_tb.dut.rs_tag2__12_ res_station_tb.dut.rs_tag2__11_ res_station_tb.dut.rs_tag2__10_ res_station_tb.dut.rs_tag2__9_ res_station_tb.dut.rs_tag2__8_ res_station_tb.dut.rs_tag2__7_ res_station_tb.dut.rs_tag2__6_ res_station_tb.dut.rs_tag2__5_ res_station_tb.dut.rs_tag2__4_ res_station_tb.dut.rs_tag2__3_ res_station_tb.dut.rs_tag2__2_ res_station_tb.dut.rs_tag2__1_ res_station_tb.dut.rs_tag2__0_ res_station_tb.dut.N147 res_station_tb.dut.N148 res_station_tb.dut.N323 res_station_tb.dut.N324 res_station_tb.dut.N325 res_station_tb.dut.N326 res_station_tb.dut.N327 res_station_tb.dut.N328 res_station_tb.dut.N329 res_station_tb.dut.N330 res_station_tb.dut.N331 res_station_tb.dut.N332 res_station_tb.dut.N333 res_station_tb.dut.N334 res_station_tb.dut.N335 res_station_tb.dut.N336 res_station_tb.dut.N337 res_station_tb.dut.N338 res_station_tb.dut.N339 res_station_tb.dut.N340 res_station_tb.dut.N341 res_station_tb.dut.N342 res_station_tb.dut.N343 res_station_tb.dut.N344 res_station_tb.dut.N345 res_station_tb.dut.N346 res_station_tb.dut.N347 res_station_tb.dut.N348 res_station_tb.dut.N349 res_station_tb.dut.N350 res_station_tb.dut.N351 res_station_tb.dut.N352 res_station_tb.dut.N353 res_station_tb.dut.N354 res_station_tb.dut.N356 res_station_tb.dut.N357 res_station_tb.dut.N358 res_station_tb.dut.N359 res_station_tb.dut.N360 res_station_tb.dut.N361 res_station_tb.dut.N362 res_station_tb.dut.N363 res_station_tb.dut.N364 res_station_tb.dut.N365 res_station_tb.dut.N366 res_station_tb.dut.N367 res_station_tb.dut.N368 res_station_tb.dut.N369 res_station_tb.dut.N370 res_station_tb.dut.N371 res_station_tb.dut.N372 res_station_tb.dut.N373 res_station_tb.dut.N374 res_station_tb.dut.N375 res_station_tb.dut.N376 res_station_tb.dut.N377 res_station_tb.dut.N378 res_station_tb.dut.N379 res_station_tb.dut.N380 res_station_tb.dut.N381 res_station_tb.dut.N382 res_station_tb.dut.N383 res_station_tb.dut.N384 res_station_tb.dut.N385 }
gui_sg_addsignal -group "$_session_group_1" { res_station_tb.dut.N386 res_station_tb.dut.N387 res_station_tb.dut.N388 res_station_tb.dut.N389 res_station_tb.dut.N390 res_station_tb.dut.N391 res_station_tb.dut.N392 res_station_tb.dut.N393 res_station_tb.dut.N394 res_station_tb.dut.N395 res_station_tb.dut.N396 res_station_tb.dut.N397 res_station_tb.dut.N398 res_station_tb.dut.N399 res_station_tb.dut.N400 res_station_tb.dut.N401 res_station_tb.dut.N402 res_station_tb.dut.N403 res_station_tb.dut.N404 res_station_tb.dut.N405 res_station_tb.dut.N406 res_station_tb.dut.N407 res_station_tb.dut.N408 res_station_tb.dut.N409 res_station_tb.dut.N410 res_station_tb.dut.N411 res_station_tb.dut.N412 res_station_tb.dut.N413 res_station_tb.dut.N414 res_station_tb.dut.N415 res_station_tb.dut.N416 res_station_tb.dut.N417 res_station_tb.dut.N418 res_station_tb.dut.N419 res_station_tb.dut.N420 res_station_tb.dut.N421 res_station_tb.dut.N422 res_station_tb.dut.N424 res_station_tb.dut.N425 res_station_tb.dut.N426 res_station_tb.dut.N427 res_station_tb.dut.N428 res_station_tb.dut.N429 res_station_tb.dut.N430 res_station_tb.dut.N431 res_station_tb.dut.N432 res_station_tb.dut.N433 res_station_tb.dut.N434 res_station_tb.dut.N435 res_station_tb.dut.N436 res_station_tb.dut.N437 res_station_tb.dut.N438 res_station_tb.dut.N439 res_station_tb.dut.N440 res_station_tb.dut.N441 res_station_tb.dut.N442 res_station_tb.dut.N443 res_station_tb.dut.N444 res_station_tb.dut.N445 res_station_tb.dut.N446 res_station_tb.dut.N447 res_station_tb.dut.N448 res_station_tb.dut.N449 res_station_tb.dut.N450 res_station_tb.dut.N451 res_station_tb.dut.N452 res_station_tb.dut.N453 res_station_tb.dut.n179 res_station_tb.dut.n180 res_station_tb.dut.n181 res_station_tb.dut.n182 res_station_tb.dut.n183 res_station_tb.dut.n184 res_station_tb.dut.n185 res_station_tb.dut.n186 res_station_tb.dut.n187 res_station_tb.dut.n188 res_station_tb.dut.n189 res_station_tb.dut.n190 res_station_tb.dut.n191 res_station_tb.dut.n192 res_station_tb.dut.n193 res_station_tb.dut.n194 res_station_tb.dut.n195 res_station_tb.dut.n196 res_station_tb.dut.n197 res_station_tb.dut.n198 res_station_tb.dut.n199 res_station_tb.dut.n200 res_station_tb.dut.n201 res_station_tb.dut.n202 res_station_tb.dut.n203 res_station_tb.dut.n204 res_station_tb.dut.n205 res_station_tb.dut.n206 res_station_tb.dut.n207 res_station_tb.dut.n208 res_station_tb.dut.n209 res_station_tb.dut.n210 res_station_tb.dut.n211 res_station_tb.dut.n212 res_station_tb.dut.n213 res_station_tb.dut.n214 res_station_tb.dut.n215 res_station_tb.dut.n216 res_station_tb.dut.n217 res_station_tb.dut.n218 res_station_tb.dut.n219 res_station_tb.dut.n220 res_station_tb.dut.n221 res_station_tb.dut.n222 res_station_tb.dut.n223 res_station_tb.dut.n224 res_station_tb.dut.n225 res_station_tb.dut.n226 res_station_tb.dut.n227 res_station_tb.dut.n228 res_station_tb.dut.n229 res_station_tb.dut.n230 res_station_tb.dut.n231 res_station_tb.dut.n232 res_station_tb.dut.n233 res_station_tb.dut.n234 res_station_tb.dut.n235 res_station_tb.dut.n236 res_station_tb.dut.n237 res_station_tb.dut.n238 res_station_tb.dut.n239 res_station_tb.dut.n240 res_station_tb.dut.n241 res_station_tb.dut.n242 res_station_tb.dut.n243 res_station_tb.dut.n244 res_station_tb.dut.n245 res_station_tb.dut.n246 res_station_tb.dut.n247 res_station_tb.dut.n248 res_station_tb.dut.n249 res_station_tb.dut.n250 res_station_tb.dut.n251 res_station_tb.dut.n252 res_station_tb.dut.n253 res_station_tb.dut.n254 res_station_tb.dut.n255 res_station_tb.dut.n256 res_station_tb.dut.n257 res_station_tb.dut.n258 res_station_tb.dut.n259 res_station_tb.dut.n260 res_station_tb.dut.n261 res_station_tb.dut.n262 res_station_tb.dut.n263 res_station_tb.dut.n264 res_station_tb.dut.n265 res_station_tb.dut.n266 res_station_tb.dut.n267 res_station_tb.dut.n268 res_station_tb.dut.n269 res_station_tb.dut.n270 res_station_tb.dut.n271 res_station_tb.dut.n272 res_station_tb.dut.n273 res_station_tb.dut.n274 res_station_tb.dut.n275 res_station_tb.dut.n276 res_station_tb.dut.n277 res_station_tb.dut.n278 res_station_tb.dut.n279 }
gui_sg_addsignal -group "$_session_group_1" { res_station_tb.dut.n280 res_station_tb.dut.n281 res_station_tb.dut.n282 res_station_tb.dut.n283 res_station_tb.dut.n284 res_station_tb.dut.n285 res_station_tb.dut.n286 res_station_tb.dut.n287 res_station_tb.dut.n288 res_station_tb.dut.n289 res_station_tb.dut.n290 res_station_tb.dut.n291 res_station_tb.dut.n292 res_station_tb.dut.n293 res_station_tb.dut.n294 res_station_tb.dut.n295 res_station_tb.dut.n296 res_station_tb.dut.n297 res_station_tb.dut.n298 res_station_tb.dut.n299 res_station_tb.dut.n300 res_station_tb.dut.n301 res_station_tb.dut.n302 res_station_tb.dut.n303 res_station_tb.dut.n304 res_station_tb.dut.n305 res_station_tb.dut.n306 res_station_tb.dut.n307 res_station_tb.dut.n308 res_station_tb.dut.n309 res_station_tb.dut.n310 res_station_tb.dut.n311 res_station_tb.dut.n312 res_station_tb.dut.n313 res_station_tb.dut.n314 res_station_tb.dut.n315 res_station_tb.dut.n316 res_station_tb.dut.n317 res_station_tb.dut.n318 res_station_tb.dut.n319 res_station_tb.dut.n320 res_station_tb.dut.n321 res_station_tb.dut.n322 res_station_tb.dut.n323 res_station_tb.dut.n324 res_station_tb.dut.n325 res_station_tb.dut.n326 res_station_tb.dut.n327 res_station_tb.dut.n328 res_station_tb.dut.n329 res_station_tb.dut.n330 res_station_tb.dut.n331 res_station_tb.dut.n332 res_station_tb.dut.n333 res_station_tb.dut.n334 res_station_tb.dut.n335 res_station_tb.dut.n336 res_station_tb.dut.n337 res_station_tb.dut.n338 res_station_tb.dut.n339 res_station_tb.dut.n340 res_station_tb.dut.n341 res_station_tb.dut.n342 res_station_tb.dut.n343 res_station_tb.dut.n344 res_station_tb.dut.n345 res_station_tb.dut.n346 res_station_tb.dut.n347 res_station_tb.dut.n348 res_station_tb.dut.n349 res_station_tb.dut.n350 res_station_tb.dut.n351 res_station_tb.dut.n352 res_station_tb.dut.n353 res_station_tb.dut.n354 res_station_tb.dut.n355 res_station_tb.dut.n356 res_station_tb.dut.n357 res_station_tb.dut.n358 res_station_tb.dut.n359 res_station_tb.dut.n360 res_station_tb.dut.n361 res_station_tb.dut.n362 res_station_tb.dut.n363 res_station_tb.dut.n364 res_station_tb.dut.n365 res_station_tb.dut.n366 res_station_tb.dut.n367 res_station_tb.dut.n368 res_station_tb.dut.n369 res_station_tb.dut.n370 res_station_tb.dut.n371 res_station_tb.dut.n372 res_station_tb.dut.n373 res_station_tb.dut.n374 res_station_tb.dut.state }
gui_set_radix -radix {decimal} -signals {V1:res_station_tb.dut.alu_opcode_i}
gui_set_radix -radix {unsigned} -signals {V1:res_station_tb.dut.alu_opcode_i}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 46179



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
gui_list_set_filter -id ${Hier.1} -text {res*}
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design V1
catch {gui_list_expand -id ${Hier.1} res_station_tb}
catch {gui_list_select -id ${Hier.1} {res_station_tb.dut}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {res_station_tb.dut}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active AN2D0 /home/lab.apps/vlsiapps/kits/tsmc/N65RF/1.0c/digital/Front_End/verilog/tcbn65gplus_140b/tcbn65gplus.v
gui_view_scroll -id ${Source.1} -vertical -set 480
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
gui_wv_zoom_timerange -id ${Wave.1} 1566 27462
gui_list_add_group -id ${Wave.1} -after {New Group} {dut}
gui_list_collapse -id ${Wave.1} dut
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
gui_list_set_insertion_bar  -id ${Wave.1} -group dut  -position in

gui_marker_move -id ${Wave.1} {C1} 46179
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.2}]} {
	gui_set_active_window -window ${TopLevel.2}
	gui_set_active_window -window ${Wave.1}
}
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
}
#</Session>

