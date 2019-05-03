
set all_left_drivers   [sort_collection [get_cells -filter "design_type==pad && orientation==R0   && ref_name=~*_H && ref_name!~*BRK* && ref_name!~*BIAS*"] {boundary_bounding_box.ll_y}]
set all_top_drivers    [sort_collection [get_cells -filter "design_type==pad && orientation==R180 && ref_name=~*_V && ref_name!~*BRK* && ref_name!~*BIAS*"] {boundary_bounding_box.ll_x}]
set all_right_drivers  [sort_collection [get_cells -filter "design_type==pad && orientation==R180 && ref_name=~*_H && ref_name!~*BRK* && ref_name!~*BIAS*"] {boundary_bounding_box.ll_y}]
set all_bottom_drivers [sort_collection [get_cells -filter "design_type==pad && orientation==R0   && ref_name=~*_V && ref_name!~*BRK* && ref_name!~*BIAS*"] {boundary_bounding_box.ll_x}]

#===============================================================================
# LEFT
#===============================================================================

set counter 0
foreach_in_collection io $all_left_drivers {
  set name     [get_attribute $io name]
  set origin   [get_attribute $io origin]
  set origin_x [lindex $origin 0]
  set origin_y [lindex $origin 1]
  set pad [create_cell ${name}_PAD */IN14LPP_GPIO33_13M9S30P_48x84_LBStag]
  if { $counter % 2 == 0 } {
    set_attribute $pad orientation MXR90
    move_objects $pad -to "[expr $origin_x-13.707] [expr $origin_y-9]"
  } else {
    set_attribute $pad orientation R90
    move_objects $pad -to "[expr $origin_x+72.893] [expr $origin_y-9]"
  }
  incr counter
}

#===============================================================================
# TOP
#===============================================================================

set counter 0
foreach_in_collection io $all_top_drivers {
  set name     [get_attribute $io name]
  set origin   [get_attribute $io origin]
  set origin_x [lindex $origin 0]
  set origin_y [lindex $origin 1]
  set pad [create_cell ${name}_PAD */IN14LPP_GPIO33_13M9S30P_48x84_LBStag]
  if { $counter % 2 == 0 } {
    set_attribute $pad orientation MX
    move_objects $pad -to "[expr $origin_x-39] [expr $origin_y-70.293]"
  } else {
    set_attribute $pad orientation R0
    move_objects $pad -to "[expr $origin_x-39] [expr $origin_y-156.839]"
  }
  incr counter
}

#===============================================================================
# RIGHT
#===============================================================================

set counter 0
foreach_in_collection io $all_right_drivers {
  set name     [get_attribute $io name]
  set origin   [get_attribute $io origin]
  set origin_x [lindex $origin 0]
  set origin_y [lindex $origin 1]
  set pad [create_cell ${name}_PAD */IN14LPP_GPIO33_13M9S30P_48x84_LBStag]
  if { $counter % 2 == 0 } {
    set_attribute $pad orientation MXR90
    move_objects $pad -to "[expr $origin_x-156.839] [expr $origin_y-39]"
  } else {
    set_attribute $pad orientation R90
    move_objects $pad -to "[expr $origin_x-70.293] [expr $origin_y-39]"
  }
  incr counter
}

#===============================================================================
# BOTTOM
#===============================================================================

set counter 0
foreach_in_collection io $all_bottom_drivers {
  set name     [get_attribute $io name]
  set origin   [get_attribute $io origin]
  set origin_x [lindex $origin 0]
  set origin_y [lindex $origin 1]
  set pad [create_cell ${name}_PAD */IN14LPP_GPIO33_13M9S30P_48x84_LBStag]
  if { $counter % 2 == 0 } {
    set_attribute $pad orientation MX
    move_objects $pad -to "[expr $origin_x-9] [expr $origin_y+72.893]"
  } else {
    set_attribute $pad orientation R0
    move_objects $pad -to "[expr $origin_x-9] [expr $origin_y-13.707]"
  }
  incr counter
}

