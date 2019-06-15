#===============================================================================
# post_io_placement.tcl
#
# Sourced at the end of the place_io script. This is responsible for any last
# minute IO stuff that is specific to the foundry. For this specific foundry,
# this includes IO filler cell insertion, bond pad creation, and some net
# connections for new "physical only" cells created.
#===============================================================================

puts "BSG-info: Running script [info script]\n"

#===============================================================================
# Create IO fillers
#===============================================================================

if {0} {
create_io_filler -io_guide io_ring.left \
                 -reference_cells { IN12LP_GPIO18_13M9S30P_FILL20_H IN12LP_GPIO18_13M9S30P_FILL10_H IN12LP_GPIO18_13M9S30P_FILL5_H IN12LP_GPIO18_13M9S30P_FILL1_H } \
                 -overlap_cells IN12LP_GPIO18_13M9S30P_FILL1_H \
                 -prefix "io_filler"

create_io_filler -io_guide io_ring.top \
                 -reference_cells { IN12LP_GPIO18_13M9S30P_FILL20_V IN12LP_GPIO18_13M9S30P_FILL10_V IN12LP_GPIO18_13M9S30P_FILL5_V  IN12LP_GPIO18_13M9S30P_FILL1_V } \
                 -overlap_cells IN12LP_GPIO18_13M9S30P_FILL1_V \
                 -prefix "io_filler"

create_io_filler -io_guide io_ring.right \
                 -reference_cells { IN12LP_GPIO18_13M9S30P_FILL20_H IN12LP_GPIO18_13M9S30P_FILL10_H IN12LP_GPIO18_13M9S30P_FILL5_H  IN12LP_GPIO18_13M9S30P_FILL1_H } \
                 -overlap_cells IN12LP_GPIO18_13M9S30P_FILL1_H \
                 -prefix "io_filler"

create_io_filler -io_guide io_ring.bottom \
                 -reference_cells { IN12LP_GPIO18_13M9S30P_FILL20_V IN12LP_GPIO18_13M9S30P_FILL10_V IN12LP_GPIO18_13M9S30P_FILL5_V  IN12LP_GPIO18_13M9S30P_FILL1_V } \
                 -overlap_cells IN12LP_GPIO18_13M9S30P_FILL1_V \
                 -prefix "io_filler"

set io_filler_cells [get_cells -filter "name=~io_filler*"]

connect_supply_net VDD   -port [get_pins -of $io_filler_cells -filter "name==VDDC"]
connect_supply_net VSS   -port [get_pins -of $io_filler_cells -filter "name==VSSC"]
connect_supply_net VDDIO -port [get_pins -of $io_filler_cells -filter "name==VDDIO"]
connect_supply_net VSSIO -port [get_pins -of $io_filler_cells -filter "name==VSSIO"]

connect_net -net retc_lo    [get_pins -of $io_filler_cells -filter "name==RETC"]
connect_net -net pwrok_lo   [get_pins -of $io_filler_cells -filter "name==PWROK"]
connect_net -net iopwrok_lo [get_pins -of $io_filler_cells -filter "name==IOPWROK"]

commit_upf
connect_pg_net -automatic -all_blocks

#===============================================================================
# Create Bond Pads
#===============================================================================

} ;# if {0}

# BSG-STD: Disabling bond pad insertion. Currently, there is a routing block
# issue on the bond pad frame views. Once that is fixed, bond pad insertion
# will be re-enabled.

set all_left_drivers   [sort_collection [get_cells -filter "design_type==pad && orientation==R0   && ref_name=~*_H && ref_name!~*BRK* && ref_name!~*BIAS*"] {boundary_bounding_box.ll_y}]
set all_top_drivers    [sort_collection [get_cells -filter "design_type==pad && orientation==R180 && ref_name=~*_V && ref_name!~*BRK* && ref_name!~*BIAS*"] {boundary_bounding_box.ll_x}]
set all_right_drivers  [sort_collection [get_cells -filter "design_type==pad && orientation==R180 && ref_name=~*_H && ref_name!~*BRK* && ref_name!~*BIAS*"] {boundary_bounding_box.ll_y}]
set all_bottom_drivers [sort_collection [get_cells -filter "design_type==pad && orientation==R0   && ref_name=~*_V && ref_name!~*BRK* && ref_name!~*BIAS*"] {boundary_bounding_box.ll_x}]

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
}


puts "BSG-info: Completed script [info script]\n"

