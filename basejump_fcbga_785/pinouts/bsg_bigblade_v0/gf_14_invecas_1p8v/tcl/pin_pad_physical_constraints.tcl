#===============================================================================
# pin_pad_physical_constraints.tcl
#
# This script is responsible for constraining the IO driver cells. After this
# script is sourced, the palce_io command will be called which will then use
# these constraints to physically place all of the IO cells.
#===============================================================================

puts "BSG-info: Running script [info script]\n"

remove_io_guide -all
remove_matching_types -all

set die_edge_offset  14
set gpio_cell_width  30

set io_guide_map [bsg_rdl_create_io_guide_map "$::env(BSG_PACKAGING_PINOUT_SPEC_DIR)/bsg_padring_bump_map.csv"]

set pad_pin_map {
  "IN12LP_GPIO18_13M9S30P_VDDC_H"     "VDDC"    "IN12LP_GPIO18_13M9S30P_VDDC_V"     "VDDC"
  "IN12LP_GPIO18_13M9S30P_VSSC_H"     "VSSC"    "IN12LP_GPIO18_13M9S30P_VSSC_V"     "VSSC"
  "IN12LP_GPIO18_13M9S30P_VDDIO_H"    "VDDIO"   "IN12LP_GPIO18_13M9S30P_VDDIO_V"    "VDDIO"
  "IN12LP_GPIO18_13M9S30P_VSSIO_H"    "VSSIO"   "IN12LP_GPIO18_13M9S30P_VSSIO_V"    "VSSIO"
  "IN12LP_GPIO18_13M9S30P_SPVDDIO_H"  "VDDIO"   "IN12LP_GPIO18_13M9S30P_SPVDDIO_V"  "VDDIO"
  "IN12LP_GPIO18_13M9S30P_IO_H"       "PAD"     "IN12LP_GPIO18_13M9S30P_IO_V"       "PAD"
}

### CREATE MATCHING TYPE BETWEEN BUMPS AND PADS ################################

dict for {k v} [dict get $io_guide_map guides] {
  set side [dict get $v side]
  foreach pad [dict get $v pads] {
    set pad_name [lindex $pad 0]
    set bump_name [lindex $pad 3]
    set pad_pin [string map $pad_pin_map [get_attribute [get_cell $pad_name] ref_name]]
    puts "BSG-info: matching bump ${bump_name} with pad ${pad_name}"
    create_matching_type -name $bump_name -uniquify 0 "${bump_name}/PAD ${pad_name}/${pad_pin}"
  }
}

### CREATE IO GUIDES AND ASSIGN PAD ORDER TO GUIDES ############################

dict for {k v} [dict get $io_guide_map guides] {
  set side  [dict get $v side]
  set pads  [dict get $v pads]

  set guide_bumps [list]
  set sorted_pads [list]
  foreach pad [lsort -integer -index 1 $pads] {
    lappend sorted_pads [lindex $pad 0]
    lappend guide_bumps [lindex $pad 3]
  }

  if { $side == "left" || $side == "right" } {
    set sorted_bumps [sort_collection [get_cells $guide_bumps] boundary_bounding_box.ll_y]
    set min_bump_loc [lindex [get_attribute [index_collection $sorted_bumps   0] origin] 1]
    set max_bump_loc [lindex [get_attribute [index_collection $sorted_bumps end] origin] 1]
  } elseif { $side == "top" || $side == "bottom" } {
    set sorted_bumps [sort_collection [get_cells $guide_bumps] boundary_bounding_box.ll_x]
    set min_bump_loc [lindex [get_attribute [index_collection $sorted_bumps   0] origin] 0]
    set max_bump_loc [lindex [get_attribute [index_collection $sorted_bumps end] origin] 0]
  }

  set center_bump_loc [expr ($min_bump_loc + $max_bump_loc) / 2.0]

  if {![string match "M*" $k]} {
    set guide_length [expr [llength $pads] * $gpio_cell_width + 5.0]
    set sorted_pads [linsert $sorted_pads [expr int([llength $sorted_pads]/2.0)] "${k}_ctrl_brk"]
  } else {
    set guide_length [expr [llength $pads] * $gpio_cell_width + 30.0]
    if { ($min_bump_loc > 5500 && $side == "bottom") || ($min_bump_loc < 5500 && $side == "top") } {
      set sorted_pads [linsert $sorted_pads 0   "${k}_pwrdet_tie"] ;# prepend
    } else {
      set sorted_pads [linsert $sorted_pads end "${k}_pwrdet_tie"] ;# append
    }
  }

  if { $side == "left" } {
    set guide_start_x [expr $die_edge_offset]
    set guide_start_y [expr $center_bump_loc - $guide_length / 2.0]
  } elseif { $side == "top" } {
    set guide_start_x [expr $center_bump_loc - $guide_length / 2.0]
    set guide_start_y [expr [die_height] - $die_edge_offset]
  } elseif { $side == "right" } {
    set guide_start_x [expr [die_width] - $die_edge_offset]
    set guide_start_y [expr $center_bump_loc + $guide_length / 2.0]
  } elseif { $side == "bottom" } {
    set guide_start_x [expr $center_bump_loc + $guide_length / 2.0]
    set guide_start_y [expr $die_edge_offset]
  }

  set guide_start_x [round_down_to_nearest $guide_start_x 1.0]
  set guide_start_y [round_down_to_nearest $guide_start_y 1.0]

  puts "BSG-info: creating io guide $k on side $side start: ($guide_start_x,$guide_start_y) len: $guide_length"
  create_io_guide -name $k -side $side -line "{$guide_start_x $guide_start_y} $guide_length"
  add_to_io_guide $k [get_cells $sorted_pads]
  set_signal_io_constraints -io_guide_object $k -constraint "{order_only} $sorted_pads"
}

puts "BSG-info: Completed script [info script]\n"

