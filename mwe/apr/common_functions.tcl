##Common procedures
set TAP_CELL TAPCELLBWP30P140
set DCAP_CELL_LIST [list DCAP16BWP30P140 DCAP32BWP30P140 DCAP4BWP30P140 DCAP64BWP30P140 DCAP8BWP30P140]

# === Fill Cells ====
set FILL_CELL_LIST [list FILL16BWP30P140 FILL2BWP30P140 FILL32BWP30P140 FILL3BWP30P140 FILL4BWP30P140 FILL64BWP30P140 FILL8BWP30P140]

# Insert filler
proc insert_my_fills { FILL_CELL_LIST } {
    insert_stdcell_filler \
	-cell_with_metal $FILL_CELL_LIST \
	-connect_to_power VDD \
	-connect_to_ground VSS \
	-respect_keepout
}

#Take a single float value and snap it to the nearest on-track location 
proc snap_route_to_track {value pitch offset} {
}

#correct placement coordinates to be compliant with a given track map
proc snap_point_to_grid {coordinate hPitch hOffset vPitch vOffset core_offsetX core_offsetY} {
    set X [lindex $coordinate 0]     
    set Y [lindex $coordinate 1]
    set h_tracks [expr {int (($Y - $hOffset - $core_offsetY)/$hPitch)}]
    set v_tracks [expr {int (($X - $vOffset - $core_offsetX)/$vPitch)}]
    set X [expr {$v_tracks * $vPitch + $vOffset} + $core_offsetX]
    set Y [expr {$h_tracks * $hPitch + $hOffset} + $core_offsetY]
    return [list $X $Y]
}


#Blockage from low to high metal inclusive
proc create_metal_blockage {low high} {
    #Need this to force zroute to honour routing blockages.
    set_route_zrt_common_options -global_max_layer_mode hard
    set_route_zrt_common_options -read_user_metal_blockage_layer true 
    set blockageLayerPrefix "metal"
    set blockageLayerSuffix "Blockage"
    for {set i $low} {$i < $high} {incr i} {
	set blockage $blockageLayerPrefix$i$blockageLayerSuffix
	echo "	create_routing_blockage -layers [get_layers -include_system  $blockage ]  -bbox [list [get_attribute [get_die_area]  bbox]]"
	create_routing_blockage -layers [get_layers -include_system  $blockage ]  -bbox [list [get_attribute [get_die_area]  bbox]]
    }

}
proc create_via_blockage {low high} {
    #Need this to force zroute to honour routing blockages.
    set_route_zrt_common_options -global_max_layer_mode hard
    set_route_zrt_common_options -read_user_metal_blockage_layer true 
    set blockageLayerPrefix "via"
    set blockageLayerSuffix "Blockage"
    for {set i $low} {$i < $high} {incr i} {
	set blockage $blockageLayerPrefix$i$blockageLayerSuffix
	echo "	create_routing_blockage -layers [get_layers -include_system  $blockage ]  -bbox [list [get_attribute [get_die_area]  bbox]]"
	create_routing_blockage -layers [get_layers -include_system  $blockage ]  -bbox [list [get_attribute [get_die_area]  bbox]] 
    }

}

