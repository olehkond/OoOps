# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Tue May 31 19:11:16 2022
# Designs open: 1
#   V1: issue.vpd
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Source.1: AN2D0
#   Wave.1: 853 signals
#   Group count = 2
#   Group dut signal count = 851
#   Group Group1 signal count = 2
# End_DVE_Session_Save_Info

# DVE version: S-2021.09-SP1_Full64
# DVE build date: Nov 30 2021 00:09:19


#<Session mode="Full" path="/home/rusdac/ee478/OoOps/sapr/verif/post-syn/vcs/session.issue.vpd.tcl" type="Debug">

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
gui_show_window -window ${TopLevel.1} -show_state normal -rect {{3 103} {1298 824}}

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
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 462]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 462
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 461} {height 502} {dock_state left} {dock_on_new_line true} {child_hier_colhier 352} {child_hier_coltype 101} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 446]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 446
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 504
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 445} {height 502} {dock_state left} {dock_on_new_line true} {child_data_colvariable 222} {child_data_colvalue 87} {child_data_coltype 226} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 105]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 1297
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 105
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 1295} {height 105} {dock_state bottom} {dock_on_new_line true}}
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
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 314} {child_wave_right 442} {child_wave_colname 246} {child_wave_colvalue 64} {child_wave_col1 0} {child_wave_col2 1}}

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

if { ![gui_is_db_opened -db {issue.vpd}] } {
	gui_open_db -design V1 -file issue.vpd -nosource
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
gui_load_child_values {issue_logic_tb.dut}
gui_load_child_values {issue_logic_tb.regfile_dut}


set _session_group_3 dut
gui_sg_create "$_session_group_3"
set dut "$_session_group_3"

gui_sg_addsignal -group "$_session_group_3" { {issue_logic_tb.dut.$unit} issue_logic_tb.dut.clk_i issue_logic_tb.dut.reset_i issue_logic_tb.dut.iq_data_i issue_logic_tb.dut.iq_empty_i issue_logic_tb.dut.iq_read_o issue_logic_tb.dut.busy_bus_i issue_logic_tb.dut.cdb_i issue_logic_tb.dut.reg_rd_addr1_o issue_logic_tb.dut.reg_rd_addr2_o issue_logic_tb.dut.reg_rd_data1_i issue_logic_tb.dut.reg_rd_data2_i issue_logic_tb.dut.reg_tag_addr1_o issue_logic_tb.dut.reg_tag_addr2_o issue_logic_tb.dut.reg_tag_wr_addr_o issue_logic_tb.dut.reg_wr_tag_o issue_logic_tb.dut.reg_tag1_rd_i issue_logic_tb.dut.reg_tag2_rd_i issue_logic_tb.dut.reg_tag_wr_en_o issue_logic_tb.dut.rs_write_en_o issue_logic_tb.dut.rs_value1_o issue_logic_tb.dut.rs_value2_o issue_logic_tb.dut.rs_tag1_o issue_logic_tb.dut.rs_tag2_o issue_logic_tb.dut.alu_op_type_o issue_logic_tb.dut.shift_op_type_o issue_logic_tb.dut.write_o issue_logic_tb.dut.load_o issue_logic_tb.dut.addr_tag_o issue_logic_tb.dut.addr_o issue_logic_tb.dut.offset_o issue_logic_tb.dut.data_st_tag_o issue_logic_tb.dut.data_st_o issue_logic_tb.dut.tag_ld_i issue_logic_tb.dut.N106 issue_logic_tb.dut.N107 issue_logic_tb.dut.instr_valid issue_logic_tb.dut.valid_instr_iq issue_logic_tb.dut.N209 issue_logic_tb.dut.N210 issue_logic_tb.dut.N211 issue_logic_tb.dut.N213 issue_logic_tb.dut.N377 issue_logic_tb.dut.N378 issue_logic_tb.dut.N409 issue_logic_tb.dut.N410 issue_logic_tb.dut.read_instr_last_cyc issue_logic_tb.dut.write_instr_last_cyc issue_logic_tb.dut.stall_last_cyc issue_logic_tb.dut.reg_tag_wr_en_stall issue_logic_tb.dut.immediate_stall issue_logic_tb.dut.N840 issue_logic_tb.dut.N841 issue_logic_tb.dut.N842 issue_logic_tb.dut.N843 issue_logic_tb.dut.N844 issue_logic_tb.dut.N845 issue_logic_tb.dut.N846 issue_logic_tb.dut.N847 issue_logic_tb.dut.N878 issue_logic_tb.dut.N879 issue_logic_tb.dut.N880 issue_logic_tb.dut.N881 issue_logic_tb.dut.N882 issue_logic_tb.dut.N883 issue_logic_tb.dut.N884 issue_logic_tb.dut.N885 issue_logic_tb.dut.N886 issue_logic_tb.dut.N887 issue_logic_tb.dut.N888 issue_logic_tb.dut.N889 issue_logic_tb.dut.N890 issue_logic_tb.dut.N891 issue_logic_tb.dut.N892 issue_logic_tb.dut.N893 issue_logic_tb.dut.N894 issue_logic_tb.dut.N895 issue_logic_tb.dut.N896 issue_logic_tb.dut.N897 issue_logic_tb.dut.N898 issue_logic_tb.dut.N899 issue_logic_tb.dut.N900 issue_logic_tb.dut.N901 issue_logic_tb.dut.N902 issue_logic_tb.dut.N903 issue_logic_tb.dut.N904 issue_logic_tb.dut.N905 issue_logic_tb.dut.N906 issue_logic_tb.dut.N907 issue_logic_tb.dut.N908 issue_logic_tb.dut.N909 issue_logic_tb.dut.N910 issue_logic_tb.dut.N911 issue_logic_tb.dut.N912 issue_logic_tb.dut.N913 issue_logic_tb.dut.N914 issue_logic_tb.dut.N915 issue_logic_tb.dut.N916 issue_logic_tb.dut.N917 issue_logic_tb.dut.N918 issue_logic_tb.dut.N919 issue_logic_tb.dut.N920 issue_logic_tb.dut.N921 issue_logic_tb.dut.N922 issue_logic_tb.dut.N923 issue_logic_tb.dut.N924 issue_logic_tb.dut.N925 issue_logic_tb.dut.N926 issue_logic_tb.dut.N927 issue_logic_tb.dut.N928 issue_logic_tb.dut.N929 issue_logic_tb.dut.N930 issue_logic_tb.dut.N931 issue_logic_tb.dut.N932 issue_logic_tb.dut.N933 issue_logic_tb.dut.N934 issue_logic_tb.dut.N935 issue_logic_tb.dut.N936 issue_logic_tb.dut.N937 issue_logic_tb.dut.N938 issue_logic_tb.dut.N939 issue_logic_tb.dut.N940 issue_logic_tb.dut.N941 issue_logic_tb.dut.N942 issue_logic_tb.dut.N943 issue_logic_tb.dut.N944 issue_logic_tb.dut.N945 issue_logic_tb.dut.N946 issue_logic_tb.dut.N947 issue_logic_tb.dut.N948 issue_logic_tb.dut.N949 issue_logic_tb.dut.N950 issue_logic_tb.dut.N951 issue_logic_tb.dut.N952 issue_logic_tb.dut.N953 issue_logic_tb.dut.N954 issue_logic_tb.dut.N955 issue_logic_tb.dut.N956 issue_logic_tb.dut.N957 issue_logic_tb.dut.N958 issue_logic_tb.dut.N959 issue_logic_tb.dut.N960 issue_logic_tb.dut.N961 issue_logic_tb.dut.N962 issue_logic_tb.dut.N963 issue_logic_tb.dut.N964 issue_logic_tb.dut.N965 issue_logic_tb.dut.N966 issue_logic_tb.dut.N967 issue_logic_tb.dut.N968 issue_logic_tb.dut.N969 issue_logic_tb.dut.N970 issue_logic_tb.dut.N971 issue_logic_tb.dut.N972 issue_logic_tb.dut.N973 }
gui_sg_addsignal -group "$_session_group_3" { issue_logic_tb.dut.N974 issue_logic_tb.dut.N975 issue_logic_tb.dut.N976 issue_logic_tb.dut.N977 issue_logic_tb.dut.N978 issue_logic_tb.dut.N979 issue_logic_tb.dut.N980 issue_logic_tb.dut.N981 issue_logic_tb.dut.N982 issue_logic_tb.dut.N983 issue_logic_tb.dut.N984 issue_logic_tb.dut.N985 issue_logic_tb.dut.N986 issue_logic_tb.dut.N987 issue_logic_tb.dut.N988 issue_logic_tb.dut.N989 issue_logic_tb.dut.N990 issue_logic_tb.dut.N991 issue_logic_tb.dut.N992 issue_logic_tb.dut.N993 issue_logic_tb.dut.N994 issue_logic_tb.dut.N995 issue_logic_tb.dut.N996 issue_logic_tb.dut.N997 issue_logic_tb.dut.N998 issue_logic_tb.dut.N999 issue_logic_tb.dut.N1000 issue_logic_tb.dut.N1001 issue_logic_tb.dut.N1002 issue_logic_tb.dut.N1003 issue_logic_tb.dut.N1004 issue_logic_tb.dut.N1005 issue_logic_tb.dut.N1006 issue_logic_tb.dut.N1007 issue_logic_tb.dut.N1008 issue_logic_tb.dut.N1009 issue_logic_tb.dut.N1038 issue_logic_tb.dut.N1039 issue_logic_tb.dut.N1040 issue_logic_tb.dut.N1070 issue_logic_tb.dut.N1071 issue_logic_tb.dut.N1072 issue_logic_tb.dut.N1073 issue_logic_tb.dut.N1074 issue_logic_tb.dut.N1075 issue_logic_tb.dut.N1076 issue_logic_tb.dut.N1077 issue_logic_tb.dut.N1078 issue_logic_tb.dut.N1079 issue_logic_tb.dut.N1080 issue_logic_tb.dut.N1081 issue_logic_tb.dut.N1082 issue_logic_tb.dut.N1083 issue_logic_tb.dut.N1084 issue_logic_tb.dut.N1085 issue_logic_tb.dut.N1086 issue_logic_tb.dut.N1087 issue_logic_tb.dut.N1088 issue_logic_tb.dut.N1089 issue_logic_tb.dut.N1090 issue_logic_tb.dut.N1091 issue_logic_tb.dut.N1092 issue_logic_tb.dut.N1093 issue_logic_tb.dut.N1094 issue_logic_tb.dut.N1095 issue_logic_tb.dut.N1096 issue_logic_tb.dut.N1097 issue_logic_tb.dut.N1098 issue_logic_tb.dut.N1099 issue_logic_tb.dut.N1100 issue_logic_tb.dut.N1101 issue_logic_tb.dut.N1102 issue_logic_tb.dut.N1103 issue_logic_tb.dut.N1104 issue_logic_tb.dut.N1105 issue_logic_tb.dut.N1106 issue_logic_tb.dut.N1107 issue_logic_tb.dut.N1108 issue_logic_tb.dut.N1109 issue_logic_tb.dut.N1110 issue_logic_tb.dut.N1111 issue_logic_tb.dut.N1112 issue_logic_tb.dut.N1113 issue_logic_tb.dut.N1114 issue_logic_tb.dut.N1115 issue_logic_tb.dut.N1116 issue_logic_tb.dut.N1117 issue_logic_tb.dut.N1118 issue_logic_tb.dut.N1119 issue_logic_tb.dut.N1120 issue_logic_tb.dut.N1121 issue_logic_tb.dut.N1122 issue_logic_tb.dut.N1123 issue_logic_tb.dut.N1124 issue_logic_tb.dut.N1125 issue_logic_tb.dut.N1126 issue_logic_tb.dut.N1127 issue_logic_tb.dut.N1128 issue_logic_tb.dut.N1129 issue_logic_tb.dut.N1130 issue_logic_tb.dut.N1131 issue_logic_tb.dut.N1132 issue_logic_tb.dut.N1133 issue_logic_tb.dut.N1134 issue_logic_tb.dut.N1135 issue_logic_tb.dut.N1136 issue_logic_tb.dut.N1137 issue_logic_tb.dut.N1138 issue_logic_tb.dut.N1139 issue_logic_tb.dut.N1140 issue_logic_tb.dut.N1141 issue_logic_tb.dut.N1142 issue_logic_tb.dut.N1143 issue_logic_tb.dut.N1144 issue_logic_tb.dut.N1145 issue_logic_tb.dut.N1146 issue_logic_tb.dut.N1147 issue_logic_tb.dut.N1148 issue_logic_tb.dut.N1149 issue_logic_tb.dut.N1150 issue_logic_tb.dut.N1151 issue_logic_tb.dut.N1152 issue_logic_tb.dut.N1153 issue_logic_tb.dut.N1154 issue_logic_tb.dut.N1155 issue_logic_tb.dut.N1156 issue_logic_tb.dut.N1157 issue_logic_tb.dut.N1158 issue_logic_tb.dut.N1159 issue_logic_tb.dut.N1160 issue_logic_tb.dut.N1161 issue_logic_tb.dut.N1162 issue_logic_tb.dut.N1163 issue_logic_tb.dut.N1164 issue_logic_tb.dut.N1165 issue_logic_tb.dut.N1166 issue_logic_tb.dut.N1167 issue_logic_tb.dut.N1181 issue_logic_tb.dut.N1182 issue_logic_tb.dut.N1183 issue_logic_tb.dut.N1184 issue_logic_tb.dut.N1185 issue_logic_tb.dut.N1186 issue_logic_tb.dut.N1187 issue_logic_tb.dut.N1188 issue_logic_tb.dut.N1323 issue_logic_tb.dut.sft_sel_idx_0_ issue_logic_tb.dut.alu_free issue_logic_tb.dut.sft_free issue_logic_tb.dut.n25 issue_logic_tb.dut.n105 issue_logic_tb.dut.n106 issue_logic_tb.dut.n107 issue_logic_tb.dut.n108 issue_logic_tb.dut.n109 issue_logic_tb.dut.n110 issue_logic_tb.dut.n624 issue_logic_tb.dut.n625 issue_logic_tb.dut.n626 issue_logic_tb.dut.n627 issue_logic_tb.dut.n628 issue_logic_tb.dut.n629 issue_logic_tb.dut.n630 }
gui_sg_addsignal -group "$_session_group_3" { issue_logic_tb.dut.n631 issue_logic_tb.dut.n632 issue_logic_tb.dut.n633 issue_logic_tb.dut.n634 issue_logic_tb.dut.n635 issue_logic_tb.dut.n636 issue_logic_tb.dut.n637 issue_logic_tb.dut.n638 issue_logic_tb.dut.n639 issue_logic_tb.dut.n640 issue_logic_tb.dut.n641 issue_logic_tb.dut.n642 issue_logic_tb.dut.n643 issue_logic_tb.dut.n644 issue_logic_tb.dut.n645 issue_logic_tb.dut.n646 issue_logic_tb.dut.n647 issue_logic_tb.dut.n648 issue_logic_tb.dut.n649 issue_logic_tb.dut.n650 issue_logic_tb.dut.n651 issue_logic_tb.dut.n652 issue_logic_tb.dut.n653 issue_logic_tb.dut.n654 issue_logic_tb.dut.n655 issue_logic_tb.dut.n656 issue_logic_tb.dut.n657 issue_logic_tb.dut.n658 issue_logic_tb.dut.n659 issue_logic_tb.dut.n660 issue_logic_tb.dut.n661 issue_logic_tb.dut.n662 issue_logic_tb.dut.n663 issue_logic_tb.dut.n664 issue_logic_tb.dut.n665 issue_logic_tb.dut.n666 issue_logic_tb.dut.n667 issue_logic_tb.dut.n668 issue_logic_tb.dut.n669 issue_logic_tb.dut.n670 issue_logic_tb.dut.n671 issue_logic_tb.dut.n757 issue_logic_tb.dut.n758 issue_logic_tb.dut.n759 issue_logic_tb.dut.n760 issue_logic_tb.dut.n761 issue_logic_tb.dut.n762 issue_logic_tb.dut.n763 issue_logic_tb.dut.n764 issue_logic_tb.dut.n765 issue_logic_tb.dut.n766 issue_logic_tb.dut.n767 issue_logic_tb.dut.n768 issue_logic_tb.dut.n769 issue_logic_tb.dut.n770 issue_logic_tb.dut.n771 issue_logic_tb.dut.n772 issue_logic_tb.dut.n773 issue_logic_tb.dut.n774 issue_logic_tb.dut.n775 issue_logic_tb.dut.n776 issue_logic_tb.dut.n777 issue_logic_tb.dut.n778 issue_logic_tb.dut.n779 issue_logic_tb.dut.n780 issue_logic_tb.dut.n781 issue_logic_tb.dut.n782 issue_logic_tb.dut.n783 issue_logic_tb.dut.n784 issue_logic_tb.dut.n785 issue_logic_tb.dut.n786 issue_logic_tb.dut.n787 issue_logic_tb.dut.n788 issue_logic_tb.dut.n789 issue_logic_tb.dut.n790 issue_logic_tb.dut.n791 issue_logic_tb.dut.n792 issue_logic_tb.dut.n793 issue_logic_tb.dut.n794 issue_logic_tb.dut.n795 issue_logic_tb.dut.n796 issue_logic_tb.dut.n797 issue_logic_tb.dut.n798 issue_logic_tb.dut.n799 issue_logic_tb.dut.n800 issue_logic_tb.dut.n801 issue_logic_tb.dut.n802 issue_logic_tb.dut.n803 issue_logic_tb.dut.n804 issue_logic_tb.dut.n805 issue_logic_tb.dut.n806 issue_logic_tb.dut.n807 issue_logic_tb.dut.n808 issue_logic_tb.dut.n809 issue_logic_tb.dut.n810 issue_logic_tb.dut.n811 issue_logic_tb.dut.n812 issue_logic_tb.dut.n813 issue_logic_tb.dut.n814 issue_logic_tb.dut.n815 issue_logic_tb.dut.n816 issue_logic_tb.dut.n817 issue_logic_tb.dut.n818 issue_logic_tb.dut.n819 issue_logic_tb.dut.n820 issue_logic_tb.dut.n821 issue_logic_tb.dut.n822 issue_logic_tb.dut.n823 issue_logic_tb.dut.n824 issue_logic_tb.dut.n825 issue_logic_tb.dut.n826 issue_logic_tb.dut.n827 issue_logic_tb.dut.n828 issue_logic_tb.dut.n829 issue_logic_tb.dut.n830 issue_logic_tb.dut.n831 issue_logic_tb.dut.n832 issue_logic_tb.dut.n833 issue_logic_tb.dut.n834 issue_logic_tb.dut.n835 issue_logic_tb.dut.n836 issue_logic_tb.dut.n837 issue_logic_tb.dut.n838 issue_logic_tb.dut.n839 issue_logic_tb.dut.n840 issue_logic_tb.dut.n841 issue_logic_tb.dut.n842 issue_logic_tb.dut.n843 issue_logic_tb.dut.n844 issue_logic_tb.dut.n845 issue_logic_tb.dut.n846 issue_logic_tb.dut.n847 issue_logic_tb.dut.n848 issue_logic_tb.dut.n849 issue_logic_tb.dut.n850 issue_logic_tb.dut.n851 issue_logic_tb.dut.n852 issue_logic_tb.dut.n853 issue_logic_tb.dut.n854 issue_logic_tb.dut.n855 issue_logic_tb.dut.n856 issue_logic_tb.dut.n857 issue_logic_tb.dut.n858 issue_logic_tb.dut.n859 issue_logic_tb.dut.n860 issue_logic_tb.dut.n861 issue_logic_tb.dut.n862 issue_logic_tb.dut.n863 issue_logic_tb.dut.n864 issue_logic_tb.dut.n865 issue_logic_tb.dut.n866 issue_logic_tb.dut.n867 issue_logic_tb.dut.n868 issue_logic_tb.dut.n869 issue_logic_tb.dut.n870 issue_logic_tb.dut.n871 issue_logic_tb.dut.n872 issue_logic_tb.dut.n873 issue_logic_tb.dut.n874 issue_logic_tb.dut.n875 issue_logic_tb.dut.n876 issue_logic_tb.dut.n877 issue_logic_tb.dut.n878 issue_logic_tb.dut.n879 issue_logic_tb.dut.n880 issue_logic_tb.dut.n881 issue_logic_tb.dut.n882 issue_logic_tb.dut.n883 }
gui_sg_addsignal -group "$_session_group_3" { issue_logic_tb.dut.n884 issue_logic_tb.dut.n885 issue_logic_tb.dut.n886 issue_logic_tb.dut.n887 issue_logic_tb.dut.n888 issue_logic_tb.dut.n889 issue_logic_tb.dut.n890 issue_logic_tb.dut.n891 issue_logic_tb.dut.n892 issue_logic_tb.dut.n893 issue_logic_tb.dut.n894 issue_logic_tb.dut.n895 issue_logic_tb.dut.n896 issue_logic_tb.dut.n897 issue_logic_tb.dut.n898 issue_logic_tb.dut.n899 issue_logic_tb.dut.n900 issue_logic_tb.dut.n901 issue_logic_tb.dut.n902 issue_logic_tb.dut.n903 issue_logic_tb.dut.n904 issue_logic_tb.dut.n905 issue_logic_tb.dut.n906 issue_logic_tb.dut.n907 issue_logic_tb.dut.n908 issue_logic_tb.dut.n909 issue_logic_tb.dut.n910 issue_logic_tb.dut.n911 issue_logic_tb.dut.n912 issue_logic_tb.dut.n913 issue_logic_tb.dut.n914 issue_logic_tb.dut.n915 issue_logic_tb.dut.n916 issue_logic_tb.dut.n917 issue_logic_tb.dut.n918 issue_logic_tb.dut.n919 issue_logic_tb.dut.n920 issue_logic_tb.dut.n921 issue_logic_tb.dut.n922 issue_logic_tb.dut.n923 issue_logic_tb.dut.n924 issue_logic_tb.dut.n925 issue_logic_tb.dut.n926 issue_logic_tb.dut.n927 issue_logic_tb.dut.n928 issue_logic_tb.dut.n929 issue_logic_tb.dut.n930 issue_logic_tb.dut.n931 issue_logic_tb.dut.n932 issue_logic_tb.dut.n933 issue_logic_tb.dut.n934 issue_logic_tb.dut.n935 issue_logic_tb.dut.n936 issue_logic_tb.dut.n937 issue_logic_tb.dut.n938 issue_logic_tb.dut.n939 issue_logic_tb.dut.n940 issue_logic_tb.dut.n941 issue_logic_tb.dut.n942 issue_logic_tb.dut.n943 issue_logic_tb.dut.n944 issue_logic_tb.dut.n945 issue_logic_tb.dut.n946 issue_logic_tb.dut.n947 issue_logic_tb.dut.n948 issue_logic_tb.dut.n949 issue_logic_tb.dut.n950 issue_logic_tb.dut.n951 issue_logic_tb.dut.n952 issue_logic_tb.dut.n953 issue_logic_tb.dut.n954 issue_logic_tb.dut.n955 issue_logic_tb.dut.n956 issue_logic_tb.dut.n957 issue_logic_tb.dut.n958 issue_logic_tb.dut.n959 issue_logic_tb.dut.n960 issue_logic_tb.dut.n961 issue_logic_tb.dut.n962 issue_logic_tb.dut.n963 issue_logic_tb.dut.n964 issue_logic_tb.dut.n965 issue_logic_tb.dut.n966 issue_logic_tb.dut.n967 issue_logic_tb.dut.n968 issue_logic_tb.dut.n969 issue_logic_tb.dut.n970 issue_logic_tb.dut.n971 issue_logic_tb.dut.n972 issue_logic_tb.dut.n973 issue_logic_tb.dut.n974 issue_logic_tb.dut.n975 issue_logic_tb.dut.n976 issue_logic_tb.dut.n977 issue_logic_tb.dut.n978 issue_logic_tb.dut.n979 issue_logic_tb.dut.n980 issue_logic_tb.dut.n981 issue_logic_tb.dut.n982 issue_logic_tb.dut.n983 issue_logic_tb.dut.n984 issue_logic_tb.dut.n985 issue_logic_tb.dut.n986 issue_logic_tb.dut.n987 issue_logic_tb.dut.n988 issue_logic_tb.dut.n989 issue_logic_tb.dut.n990 issue_logic_tb.dut.n991 issue_logic_tb.dut.n992 issue_logic_tb.dut.n993 issue_logic_tb.dut.n994 issue_logic_tb.dut.n995 issue_logic_tb.dut.n996 issue_logic_tb.dut.n997 issue_logic_tb.dut.n998 issue_logic_tb.dut.n999 issue_logic_tb.dut.n1000 issue_logic_tb.dut.n1001 issue_logic_tb.dut.n1002 issue_logic_tb.dut.n1003 issue_logic_tb.dut.n1004 issue_logic_tb.dut.n1005 issue_logic_tb.dut.n1006 issue_logic_tb.dut.n1007 issue_logic_tb.dut.n1008 issue_logic_tb.dut.n1009 issue_logic_tb.dut.n1010 issue_logic_tb.dut.n1011 issue_logic_tb.dut.n1012 issue_logic_tb.dut.n1013 issue_logic_tb.dut.n1014 issue_logic_tb.dut.n1015 issue_logic_tb.dut.n1016 issue_logic_tb.dut.n1017 issue_logic_tb.dut.n1018 issue_logic_tb.dut.n1019 issue_logic_tb.dut.n1020 issue_logic_tb.dut.n1021 issue_logic_tb.dut.n1022 issue_logic_tb.dut.n1023 issue_logic_tb.dut.n1024 issue_logic_tb.dut.n1025 issue_logic_tb.dut.n1026 issue_logic_tb.dut.n1027 issue_logic_tb.dut.n1028 issue_logic_tb.dut.n1029 issue_logic_tb.dut.n1030 issue_logic_tb.dut.n1031 issue_logic_tb.dut.n1032 issue_logic_tb.dut.n1033 issue_logic_tb.dut.n1034 issue_logic_tb.dut.n1035 issue_logic_tb.dut.n1036 issue_logic_tb.dut.n1037 issue_logic_tb.dut.n1038 issue_logic_tb.dut.n1039 issue_logic_tb.dut.n1040 issue_logic_tb.dut.n1041 issue_logic_tb.dut.n1042 issue_logic_tb.dut.n1043 issue_logic_tb.dut.n1044 issue_logic_tb.dut.n1045 issue_logic_tb.dut.n1046 issue_logic_tb.dut.n1047 issue_logic_tb.dut.n1048 issue_logic_tb.dut.n1049 }
gui_sg_addsignal -group "$_session_group_3" { issue_logic_tb.dut.n1050 issue_logic_tb.dut.n1051 issue_logic_tb.dut.n1052 issue_logic_tb.dut.n1053 issue_logic_tb.dut.n1054 issue_logic_tb.dut.n1055 issue_logic_tb.dut.n1056 issue_logic_tb.dut.n1057 issue_logic_tb.dut.n1058 issue_logic_tb.dut.n1059 issue_logic_tb.dut.n1060 issue_logic_tb.dut.n1061 issue_logic_tb.dut.n1062 issue_logic_tb.dut.n1063 issue_logic_tb.dut.n1064 issue_logic_tb.dut.n1065 issue_logic_tb.dut.n1066 issue_logic_tb.dut.n1067 issue_logic_tb.dut.n1068 issue_logic_tb.dut.n1069 issue_logic_tb.dut.n1070 issue_logic_tb.dut.n1071 issue_logic_tb.dut.n1072 issue_logic_tb.dut.n1073 issue_logic_tb.dut.n1074 issue_logic_tb.dut.n1075 issue_logic_tb.dut.n1076 issue_logic_tb.dut.n1077 issue_logic_tb.dut.n1078 issue_logic_tb.dut.n1079 issue_logic_tb.dut.n1080 issue_logic_tb.dut.n1081 issue_logic_tb.dut.n1082 issue_logic_tb.dut.n1083 issue_logic_tb.dut.n1084 issue_logic_tb.dut.n1085 issue_logic_tb.dut.n1086 issue_logic_tb.dut.n1087 issue_logic_tb.dut.n1088 issue_logic_tb.dut.n1089 issue_logic_tb.dut.n1090 issue_logic_tb.dut.n1091 issue_logic_tb.dut.n1092 issue_logic_tb.dut.n1093 issue_logic_tb.dut.n1094 issue_logic_tb.dut.n1095 issue_logic_tb.dut.n1096 issue_logic_tb.dut.n1097 issue_logic_tb.dut.n1098 issue_logic_tb.dut.n1099 issue_logic_tb.dut.n1100 issue_logic_tb.dut.n1101 issue_logic_tb.dut.n1102 issue_logic_tb.dut.n1103 issue_logic_tb.dut.n1104 issue_logic_tb.dut.n1105 issue_logic_tb.dut.n1106 issue_logic_tb.dut.n1107 issue_logic_tb.dut.n1108 issue_logic_tb.dut.n1109 issue_logic_tb.dut.n1110 issue_logic_tb.dut.n1111 issue_logic_tb.dut.n1112 issue_logic_tb.dut.n1113 issue_logic_tb.dut.n1114 issue_logic_tb.dut.n1115 issue_logic_tb.dut.n1116 issue_logic_tb.dut.n1117 issue_logic_tb.dut.n1118 issue_logic_tb.dut.n1119 issue_logic_tb.dut.n1120 issue_logic_tb.dut.n1121 issue_logic_tb.dut.n1122 issue_logic_tb.dut.n1123 issue_logic_tb.dut.n1124 issue_logic_tb.dut.n1125 issue_logic_tb.dut.n1126 issue_logic_tb.dut.n1127 issue_logic_tb.dut.n1128 issue_logic_tb.dut.n1129 issue_logic_tb.dut.n1130 issue_logic_tb.dut.n1131 issue_logic_tb.dut.n1132 issue_logic_tb.dut.n1133 issue_logic_tb.dut.n1134 issue_logic_tb.dut.n1135 issue_logic_tb.dut.n1136 issue_logic_tb.dut.n1137 issue_logic_tb.dut.n1138 issue_logic_tb.dut.n1139 issue_logic_tb.dut.n1140 issue_logic_tb.dut.n1141 issue_logic_tb.dut.n1142 issue_logic_tb.dut.n1143 issue_logic_tb.dut.n1144 issue_logic_tb.dut.n1145 issue_logic_tb.dut.n1146 issue_logic_tb.dut.n1147 issue_logic_tb.dut.n1148 issue_logic_tb.dut.n1149 issue_logic_tb.dut.n1150 issue_logic_tb.dut.n1151 issue_logic_tb.dut.n1152 issue_logic_tb.dut.n1153 issue_logic_tb.dut.n1154 issue_logic_tb.dut.n1155 issue_logic_tb.dut.n1156 issue_logic_tb.dut.n1157 issue_logic_tb.dut.n1158 issue_logic_tb.dut.n1159 issue_logic_tb.dut.n1160 issue_logic_tb.dut.n1161 issue_logic_tb.dut.n1162 issue_logic_tb.dut.n1163 issue_logic_tb.dut.n1164 issue_logic_tb.dut.n1165 issue_logic_tb.dut.n1166 issue_logic_tb.dut.n1167 issue_logic_tb.dut.n1168 issue_logic_tb.dut.n1169 issue_logic_tb.dut.n1170 issue_logic_tb.dut.n1171 issue_logic_tb.dut.n1172 issue_logic_tb.dut.n1173 issue_logic_tb.dut.n1174 issue_logic_tb.dut.n1175 issue_logic_tb.dut.n1176 issue_logic_tb.dut.n1177 issue_logic_tb.dut.n1178 issue_logic_tb.dut.n1179 issue_logic_tb.dut.n1180 issue_logic_tb.dut.n1181 issue_logic_tb.dut.n1182 issue_logic_tb.dut.n1183 issue_logic_tb.dut.n1184 issue_logic_tb.dut.n1185 issue_logic_tb.dut.n1186 issue_logic_tb.dut.n1187 issue_logic_tb.dut.n1188 issue_logic_tb.dut.n1189 issue_logic_tb.dut.n1190 issue_logic_tb.dut.n1191 issue_logic_tb.dut.n1192 issue_logic_tb.dut.n1193 issue_logic_tb.dut.n1194 issue_logic_tb.dut.n1195 issue_logic_tb.dut.n1196 issue_logic_tb.dut.n1197 issue_logic_tb.dut.n1198 issue_logic_tb.dut.n1199 issue_logic_tb.dut.n1200 issue_logic_tb.dut.n1201 issue_logic_tb.dut.n1202 issue_logic_tb.dut.n1203 issue_logic_tb.dut.n1204 issue_logic_tb.dut.n1205 issue_logic_tb.dut.n1206 issue_logic_tb.dut.n1207 issue_logic_tb.dut.n1208 issue_logic_tb.dut.n1209 issue_logic_tb.dut.n1210 issue_logic_tb.dut.n1211 }
gui_sg_addsignal -group "$_session_group_3" { issue_logic_tb.dut.n1212 issue_logic_tb.dut.n1213 issue_logic_tb.dut.n1214 issue_logic_tb.dut.n1215 issue_logic_tb.dut.n1216 issue_logic_tb.dut.n1217 issue_logic_tb.dut.n1218 issue_logic_tb.dut.n1219 issue_logic_tb.dut.n1220 issue_logic_tb.dut.n1221 issue_logic_tb.dut.n1222 issue_logic_tb.dut.n1223 issue_logic_tb.dut.n1224 issue_logic_tb.dut.n1225 issue_logic_tb.dut.n1226 issue_logic_tb.dut.n1227 issue_logic_tb.dut.n1228 issue_logic_tb.dut.n1229 issue_logic_tb.dut.n1230 issue_logic_tb.dut.n1231 issue_logic_tb.dut.n1232 issue_logic_tb.dut.n1233 issue_logic_tb.dut.n1234 issue_logic_tb.dut.n1235 issue_logic_tb.dut.n1236 issue_logic_tb.dut.n1238 issue_logic_tb.dut.state issue_logic_tb.dut.next_state issue_logic_tb.dut.reg_tag_wr_addr_pos issue_logic_tb.dut.rd_idx issue_logic_tb.dut.instr_type_stall issue_logic_tb.dut.rs_value1_pos issue_logic_tb.dut.rs_value2_pos issue_logic_tb.dut.rs_tag1_pos issue_logic_tb.dut.rs_tag2_pos issue_logic_tb.dut.addr_pos issue_logic_tb.dut.data_st_pos }

set _session_group_4 Group1
gui_sg_create "$_session_group_4"
set Group1 "$_session_group_4"

gui_sg_addsignal -group "$_session_group_4" { issue_logic_tb.regfile_dut.registers issue_logic_tb.regfile_dut.reg_status_unit }

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 12168



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
gui_list_set_filter -id ${Hier.1} -text {issue*}
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design V1
catch {gui_list_expand -id ${Hier.1} issue_logic_tb}
catch {gui_list_select -id ${Hier.1} {issue_logic_tb.regfile_dut}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {issue_logic_tb.regfile_dut}
gui_show_window -window ${Data.1}
catch { gui_list_select -id ${Data.1} {issue_logic_tb.regfile_dut.reg_status_unit }}
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
gui_wv_zoom_timerange -id ${Wave.1} 0 15192
gui_list_add_group -id ${Wave.1} -after {New Group} {dut}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group1}
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
gui_list_set_insertion_bar  -id ${Wave.1} -group Group1  -item {issue_logic_tb.regfile_dut.reg_status_unit[31:0][31:0]} -position below

gui_marker_move -id ${Wave.1} {C1} 12168
gui_view_scroll -id ${Wave.1} -vertical -set 0
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

