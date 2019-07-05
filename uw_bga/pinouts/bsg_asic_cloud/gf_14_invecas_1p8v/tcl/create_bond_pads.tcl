
puts "BSG-info: Running script [info script]\n"

set all_left_drivers   [sort_collection [get_cells -filter "design_type==pad && orientation==R0   && ref_name=~*_H && ref_name!~*BRK* && ref_name!~*PWRDET*"] {boundary_bounding_box.ll_y}]
set all_top_drivers    [sort_collection [get_cells -filter "design_type==pad && orientation==R180 && ref_name=~*_V && ref_name!~*BRK* && ref_name!~*PWRDET*"] {boundary_bounding_box.ll_x}]
set all_right_drivers  [sort_collection [get_cells -filter "design_type==pad && orientation==R180 && ref_name=~*_H && ref_name!~*BRK* && ref_name!~*PWRDET*"] {boundary_bounding_box.ll_y}]
set all_bottom_drivers [sort_collection [get_cells -filter "design_type==pad && orientation==R0   && ref_name=~*_V && ref_name!~*BRK* && ref_name!~*PWRDET*"] {boundary_bounding_box.ll_x}]

#=======================================
# Left Side
#=======================================

set counter 0
foreach_in_collection io $all_left_drivers {
  set name     [get_attribute $io name]
  set origin   [get_attribute $io origin]
  set origin_x [lindex $origin 0]
  set origin_y [lindex $origin 1]
  set pad [create_cell ${name}_PAD */IN12LP_GPIO18_13M9S30P_48X84_LB_STAG]
  if { $counter % 2 == 0 } {
    set_attribute $pad orientation MXR90
    move_objects $pad -to "[expr $origin_x-13.707] [expr $origin_y-9]"
  } else {
    set_attribute $pad orientation R90
    move_objects $pad -to "[expr $origin_x+72.893] [expr $origin_y-9]"
  }
  incr counter

  set ref_cell [get_attribute $io ref_name]
  if { [string match IN12LP_GPIO18_13M9S30P_IO_* $ref_cell] } {
    set esd_label_text "FULL_ESD"
  } else {
    set esd_label_text "LC_POWER_ESD"
  }
  set pad_bbox [get_attribute $pad bbox]
  set pad_center_x [expr ([lindex $pad_bbox 0 0]+[lindex $pad_bbox 1 0])/2.0]
  set pad_center_y [expr ([lindex $pad_bbox 0 1]+[lindex $pad_bbox 1 1])/2.0]
  create_shape -origin "$pad_center_x $pad_center_y" -text $esd_label_text -layer LBESD -shape_type text -height 5
}

#=======================================
# Top Side
#=======================================

set counter 0
foreach_in_collection io $all_top_drivers {
  set name     [get_attribute $io name]
  set origin   [get_attribute $io origin]
  set origin_x [lindex $origin 0]
  set origin_y [lindex $origin 1]
  set pad [create_cell ${name}_PAD */IN12LP_GPIO18_13M9S30P_48X84_LB_STAG]
  if { $counter % 2 == 0 } {
    set_attribute $pad orientation MX
    move_objects $pad -to "[expr $origin_x-39] [expr $origin_y-70.293]"
  } else {
    set_attribute $pad orientation R0
    move_objects $pad -to "[expr $origin_x-39] [expr $origin_y-156.839]"
  }
  incr counter

  set ref_cell [get_attribute $io ref_name]
  if { [string match IN12LP_GPIO18_13M9S30P_IO_* $ref_cell] } {
    set esd_label_text "FULL_ESD"
  } else {
    set esd_label_text "LC_POWER_ESD"
  }
  set pad_bbox [get_attribute $pad bbox]
  set pad_center_x [expr ([lindex $pad_bbox 0 0]+[lindex $pad_bbox 1 0])/2.0]
  set pad_center_y [expr ([lindex $pad_bbox 0 1]+[lindex $pad_bbox 1 1])/2.0]
  create_shape -origin "$pad_center_x $pad_center_y" -text $esd_label_text -layer LBESD -shape_type text -height 5
}

#=======================================
# Right Side
#=======================================

set counter 0
foreach_in_collection io $all_right_drivers {
  set name     [get_attribute $io name]
  set origin   [get_attribute $io origin]
  set origin_x [lindex $origin 0]
  set origin_y [lindex $origin 1]
  set pad [create_cell ${name}_PAD */IN12LP_GPIO18_13M9S30P_48X84_LB_STAG]
  if { $counter % 2 == 0 } {
    set_attribute $pad orientation MXR90
    move_objects $pad -to "[expr $origin_x-156.839] [expr $origin_y-39]"
  } else {
    set_attribute $pad orientation R90
    move_objects $pad -to "[expr $origin_x-70.293] [expr $origin_y-39]"
  }
  incr counter

  set ref_cell [get_attribute $io ref_name]
  if { [string match IN12LP_GPIO18_13M9S30P_IO_* $ref_cell] } {
    set esd_label_text "FULL_ESD"
  } else {
    set esd_label_text "LC_POWER_ESD"
  }
  set pad_bbox [get_attribute $pad bbox]
  set pad_center_x [expr ([lindex $pad_bbox 0 0]+[lindex $pad_bbox 1 0])/2.0]
  set pad_center_y [expr ([lindex $pad_bbox 0 1]+[lindex $pad_bbox 1 1])/2.0]
  create_shape -origin "$pad_center_x $pad_center_y" -text $esd_label_text -layer LBESD -shape_type text -height 5
}

#=======================================
# Bottom Side
#=======================================

set counter 0
foreach_in_collection io $all_bottom_drivers {
  set name     [get_attribute $io name]
  set origin   [get_attribute $io origin]
  set origin_x [lindex $origin 0]
  set origin_y [lindex $origin 1]
  set pad [create_cell ${name}_PAD */IN12LP_GPIO18_13M9S30P_48X84_LB_STAG]
  if { $counter % 2 == 0 } {
    set_attribute $pad orientation MX
    move_objects $pad -to "[expr $origin_x-9] [expr $origin_y+72.893]"
  } else {
    set_attribute $pad orientation R0
    move_objects $pad -to "[expr $origin_x-9] [expr $origin_y-13.707]"
  }
  incr counter

  set ref_cell [get_attribute $io ref_name]
  if { [string match IN12LP_GPIO18_13M9S30P_IO_* $ref_cell] } {
    set esd_label_text "FULL_ESD"
  } else {
    set esd_label_text "LC_POWER_ESD"
  }
  set pad_bbox [get_attribute $pad bbox]
  set pad_center_x [expr ([lindex $pad_bbox 0 0]+[lindex $pad_bbox 1 0])/2.0]
  set pad_center_y [expr ([lindex $pad_bbox 0 1]+[lindex $pad_bbox 1 1])/2.0]
  create_shape -origin "$pad_center_x $pad_center_y" -text $esd_label_text -layer LBESD -shape_type text -height 5
}

puts "BSG-info: Completed script [info script]\n"
