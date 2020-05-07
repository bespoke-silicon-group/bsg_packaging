
puts "BSG-info: Running script [info script]\n"

set all_left_drivers   [sort_collection [get_cells -filter "design_type==pad && orientation==R0   && ref_name=~*_H && ref_name!~*BRK* && ref_name!~*PWRDET*"] {boundary_bounding_box.ll_y}]
set all_top_drivers    [sort_collection [get_cells -filter "design_type==pad && orientation==R180 && ref_name=~*_V && ref_name!~*BRK* && ref_name!~*PWRDET*"] {boundary_bounding_box.ll_x}]
set all_right_drivers  [sort_collection [get_cells -filter "design_type==pad && orientation==R180 && ref_name=~*_H && ref_name!~*BRK* && ref_name!~*PWRDET*"] {boundary_bounding_box.ll_y}]
set all_bottom_drivers [sort_collection [get_cells -filter "design_type==pad && orientation==R0   && ref_name=~*_V && ref_name!~*BRK* && ref_name!~*PWRDET*"] {boundary_bounding_box.ll_x}]

#=======================================
# Left Side
#=======================================

foreach_in_collection io $all_left_drivers {
  set name     [get_attribute $io name]
  set origin   [get_attribute $io origin]
  set origin_x [lindex $origin 0]
  set origin_y [lindex $origin 1]
  set ref_cell [get_attribute $io ref_name]
  set pad_cell [create_cell ${name}_PAD */IN12LP_GPIO18_13M9S30P_48X84_LB_STAG]
  if { [string match IN12LP_GPIO18_13M9S30P_IO_* $ref_cell] } {
    set esd_label_text "FULL_ESD"
    set_attribute $pad_cell orientation R90
    move_objects $pad_cell -to "[expr $origin_x+72.893] [expr $origin_y-9]"
  } else {
    set esd_label_text "LC_POWER_ESD"
    set_attribute $pad_cell orientation MXR90
    move_objects $pad_cell -to "[expr $origin_x-13.707] [expr $origin_y-9]"
  }
  set pad_bbox [get_attribute $pad_cell bbox]
  set pad_center_x [expr ([lindex $pad_bbox 0 0]+[lindex $pad_bbox 1 0])/2.0]
  set pad_center_y [expr ([lindex $pad_bbox 0 1]+[lindex $pad_bbox 1 1])/2.0]
  create_shape -origin "$pad_center_x $pad_center_y" -text $esd_label_text -layer LBESD -shape_type text -height 5
  foreach_in_collection pin [get_pins -of $io] {
    if {[sizeof [get_terminals -quiet -of $pin -filter "layer.name==G2"]]} {
      if {[sizeof [get_net -quiet -of $pin]]} {
        create_shape -origin "$pad_center_x $pad_center_y" -text [get_attribute [get_net -of $pin] name] -layer LB -shape_type text -height 5
        break
      }
    }
  }
}

#=======================================
# Top Side
#=======================================

foreach_in_collection io $all_top_drivers {
  set name     [get_attribute $io name]
  set origin   [get_attribute $io origin]
  set origin_x [lindex $origin 0]
  set origin_y [lindex $origin 1]
  set ref_cell [get_attribute $io ref_name]
  set pad_cell [create_cell ${name}_PAD */IN12LP_GPIO18_13M9S30P_48X84_LB_STAG]
  if { [string match IN12LP_GPIO18_13M9S30P_IO_* $ref_cell] } {
    set esd_label_text "FULL_ESD"
    set_attribute $pad_cell orientation R0
    move_objects $pad_cell -to "[expr $origin_x-39] [expr $origin_y-156.839]"
  } else {
    set esd_label_text "LC_POWER_ESD"
    set_attribute $pad_cell orientation MX
    move_objects $pad_cell -to "[expr $origin_x-39] [expr $origin_y-70.293]"
  }
  set pad_bbox [get_attribute $pad_cell bbox]
  set pad_center_x [expr ([lindex $pad_bbox 0 0]+[lindex $pad_bbox 1 0])/2.0]
  set pad_center_y [expr ([lindex $pad_bbox 0 1]+[lindex $pad_bbox 1 1])/2.0]
  create_shape -origin "$pad_center_x $pad_center_y" -text $esd_label_text -layer LBESD -shape_type text -height 5
  foreach_in_collection pin [get_pins -of $io] {
    if {[sizeof [get_terminals -quiet -of $pin -filter "layer.name==G2"]]} {
      if {[sizeof [get_net -quiet -of $pin]]} {
        create_shape -origin "$pad_center_x $pad_center_y" -text [get_attribute [get_net -of $pin] name] -layer LB -shape_type text -height 5
        break
      }
    }
  }
}

#=======================================
# Right Side
#=======================================

foreach_in_collection io $all_right_drivers {
  set name     [get_attribute $io name]
  set origin   [get_attribute $io origin]
  set origin_x [lindex $origin 0]
  set origin_y [lindex $origin 1]
  set ref_cell [get_attribute $io ref_name]
  set pad_cell [create_cell ${name}_PAD */IN12LP_GPIO18_13M9S30P_48X84_LB_STAG]
  if { [string match IN12LP_GPIO18_13M9S30P_IO_* $ref_cell] } {
    set esd_label_text "FULL_ESD"
    set_attribute $pad_cell orientation MXR90
    move_objects $pad_cell -to "[expr $origin_x-156.839] [expr $origin_y-39]"
  } else {
    set esd_label_text "LC_POWER_ESD"
    set_attribute $pad_cell orientation R90
    move_objects $pad_cell -to "[expr $origin_x-70.293] [expr $origin_y-39]"
  }
  set pad_bbox [get_attribute $pad_cell bbox]
  set pad_center_x [expr ([lindex $pad_bbox 0 0]+[lindex $pad_bbox 1 0])/2.0]
  set pad_center_y [expr ([lindex $pad_bbox 0 1]+[lindex $pad_bbox 1 1])/2.0]
  create_shape -origin "$pad_center_x $pad_center_y" -text $esd_label_text -layer LBESD -shape_type text -height 5
  foreach_in_collection pin [get_pins -of $io] {
    if {[sizeof [get_terminals -quiet -of $pin -filter "layer.name==G2"]]} {
      if {[sizeof [get_net -quiet -of $pin]]} {
        create_shape -origin "$pad_center_x $pad_center_y" -text [get_attribute [get_net -of $pin] name] -layer LB -shape_type text -height 5
        break
      }
    }
  }
}

#=======================================
# Bottom Side
#=======================================

foreach_in_collection io $all_bottom_drivers {
  set name [get_attribute $io name]
  set origin   [get_attribute $io origin]
  set origin_x [lindex $origin 0]
  set origin_y [lindex $origin 1]
  set ref_cell [get_attribute $io ref_name]
  set pad_cell [create_cell ${name}_PAD */IN12LP_GPIO18_13M9S30P_48X84_LB_STAG]

  # EXCEPTION FOR THIS PADRING
  # The PLL_* power pads are actually on the inside
  if { [string match IN12LP_GPIO18_13M9S30P_IO_* $ref_cell] || $name == "PLL_VZZ_i" || $name == "PLL_V33_i" || $name == "PLL_VSS_i" || $name == "PLL_VDD_i"} {
    set esd_label_text "FULL_ESD"
    set_attribute $pad_cell orientation MX
    move_objects $pad_cell -to "[expr $origin_x-9] [expr $origin_y+72.893]"
  } else {
    set esd_label_text "LC_POWER_ESD"
    set_attribute $pad_cell orientation R0
    move_objects $pad_cell -to "[expr $origin_x-9] [expr $origin_y-13.707]"
  }
  set pad_bbox [get_attribute $pad_cell bbox]
  set pad_center_x [expr ([lindex $pad_bbox 0 0]+[lindex $pad_bbox 1 0])/2.0]
  set pad_center_y [expr ([lindex $pad_bbox 0 1]+[lindex $pad_bbox 1 1])/2.0]
  create_shape -origin "$pad_center_x $pad_center_y" -text $esd_label_text -layer LBESD -shape_type text -height 5
  foreach_in_collection pin [get_pins -of $io] {
    if {[sizeof [get_terminals -quiet -of $pin -filter "layer.name==G2"]]} {
      if {[sizeof [get_net -quiet -of $pin]]} {
        create_shape -origin "$pad_center_x $pad_center_y" -text [get_attribute [get_net -of $pin] name] -layer LB -shape_type text -height 5
        break
      }
    }
  }
}

puts "BSG-info: Completed script [info script]\n"

