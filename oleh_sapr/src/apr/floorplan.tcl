# ==========================================================================
# GENERAL ROUTING PARAMETERS
# ==========================================================================
# Set Min/Max Routing Layers and routing directions


#Then, once routing layer preferences have been established, place pins.
# set_fp_pin_constraints -hard_constraints {layer location} -block_level -use_physical_constraints on
#  set_pin_physical_constraints [all_inputs] \
#                   -side 1 \
#                   -width 0.1 \
#                   -depth 0.1 \
#                   -layers {M2}

#  set_pin_physical_constraints [all_outputs] \
#                   -side 3 \
#                   -width 0.1 \
#                   -depth 0.1 \
#                   -layers {M2}

set_preferred_routing_direction \
    -layers $HORIZONTAL_ROUTING_LAYERS \
    -direction horizontal

set_preferred_routing_direction \
    -layers $VERTICAL_ROUTING_LAYERS \
    -direction vertical

if { $MAX_ROUTING_LAYER != ""} {set_ignored_layers -max_routing_layer $MAX_ROUTING_LAYER }

if { $MIN_ROUTING_LAYER != ""} {set_ignored_layers -min_routing_layer $MIN_ROUTING_LAYER }

derive_pg_connection -power_net VDD -power_pin VDD -ground_net VSS -ground_pin VSS
derive_pg_connection

if {[file isfile pin_placement.txt]} {
    exec python $SCRIPTS_DIR/gen_pin_placement.py -t pin_placement.txt -o pin_placement.tcl
    }

if {[file isfile pin_placement.tcl]} {
    # Fix the pin metal layer change problem
    set_fp_pin_constraints -hard_constraints {layer location} -block_level -use_physical_constraints on
    source pin_placement.tcl
}

#### SET FLOORPLAN VARIABLES ######
set CELL_HEIGHT 1.8
set CORE_WIDTH_IN_CELL_HEIGHTS  300
set CORE_HEIGHT_IN_CELL_HEIGHTS 300
set POWER_RING_CHANNEL_WIDTH [expr 10*$CELL_HEIGHT]

set CORE_WIDTH  [expr $CORE_WIDTH_IN_CELL_HEIGHTS * $CELL_HEIGHT]
set CORE_HEIGHT [expr $CORE_HEIGHT_IN_CELL_HEIGHTS * $CELL_HEIGHT]

create_floorplan -control_type width_and_height \
                 -core_width  $CORE_WIDTH \
                 -core_height $CORE_HEIGHT \
                 -left_io2core $POWER_RING_CHANNEL_WIDTH \
                 -right_io2core $POWER_RING_CHANNEL_WIDTH \
                 -top_io2core $POWER_RING_CHANNEL_WIDTH \
                 -bottom_io2core $POWER_RING_CHANNEL_WIDTH \
                 -flip_first_row

#create_floorplan -control_type aspect_ratio \
#				 -core_aspect_ratio 1.0 \
#                 -left_io2core $POWER_RING_CHANNEL_WIDTH \
#                 -right_io2core $POWER_RING_CHANNEL_WIDTH \
#                 -top_io2core $POWER_RING_CHANNEL_WIDTH \
#                 -bottom_io2core $POWER_RING_CHANNEL_WIDTH \
#                 -flip_first_row



# Power straps are not created on the very top and bottom edges of the core, so to
# prevent cells (especially filler) from being placed there, later to create LVS
# errors, remove all the rows and then re-add them with offsets
cut_row -all
add_row \
   -within [get_attribute [get_core_area] bbox] \
   -top_offset $CELL_HEIGHT \
   -bottom_offset $CELL_HEIGHT
   #-flip_first_row \

#### ADD STUFF HERE FOR THE MACRO PLACEMENT.
###### PLACING YOUR RAM AND DERIVING CELL INFO######
########### set RAM_16B_512 "ramInst0"
###########
########### # Get height and width of RAM
########### set RAM_16B_512_HEIGHT [get_attribute $RAM_16B_512 height]
########### set RAM_16B_512_WIDTH  [get_attribute $RAM_16B_512 width] 
###########
########### # Set Origin of RAM
########### set RAM_16B_512_LLX [expr 30*$CELL_HEIGHT ]
########### set RAM_16B_512_LLY [expr 30*$CELL_HEIGHT ]
########### # Derive URX and URY corner for placement blockage. "Width" and "Height" are along wrong axes because we rotated the RAM.
########### set RAM_16B_512_URX [expr $RAM_16B_512_LLX + $RAM_16B_512_HEIGHT]
########### set RAM_16B_512_URY [expr $RAM_16B_512_LLY + $RAM_16B_512_WIDTH]
###########
########### set GUARD_SPACING [expr 2*$CELL_HEIGHT]
###########
########### set_attribute $RAM_16B_512 orientation "E"
###########
########### set_cell_location \
###########    -coordinates [list [expr $RAM_16B_512_LLX ] [expr $RAM_16B_512_LLY]] \
###########    -fixed \
###########    $RAM_16B_512
###########
########### # Create blockage for filler-cell placement. 
########### create_placement_blockage \
###########    -bbox [list [expr $RAM_16B_512_LLX - $GUARD_SPACING] [expr $RAM_16B_512_LLY - $GUARD_SPACING] \
###########                [expr $RAM_16B_512_URX + $GUARD_SPACING] [expr $RAM_16B_512_URY + $GUARD_SPACING]] \
###########    -type hard
###########
###########
