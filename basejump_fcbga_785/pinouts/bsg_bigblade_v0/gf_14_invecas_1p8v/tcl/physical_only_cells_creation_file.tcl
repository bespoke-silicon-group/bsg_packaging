#===============================================================================
# physical_only_cell_creation_file.tcl
#
# Note: the name of this file is misleading. These cells are not just "physical
# only" cells!
#
# This script is responsible for creating any additional IO cells that we need
# that are not present in the netlist. This includes corner cells, supply
# cells, and any other cells that might be required for the IO pad ring.
#===============================================================================

puts "BSG-info: Running script [info script]\n"

set io_guide_map [bsg_rdl_create_io_guide_map "$::env(BSG_PACKAGING_PINOUT_SPEC_DIR)/bsg_padring_bump_map.csv"]

set side_cell_suffix_map {
  "left"    "H"
  "top"     "V"
  "right"   "H"
  "bottom"  "V"
}

### CREATE AND PLACE THE BUMP CELLS ############################################

foreach v [dict get $io_guide_map bumps] {
  set bump_name [lindex $v 0]
  set bump_cx   [lindex $v 1]
  set bump_cy   [lindex $v 2]
  set bump_net  [lindex $v 3]
  if { $bump_name != "-" } {
    puts "BSG-info: creating bump cell (bump:$bump_name, x:$bump_cx, y:$bump_cy, net:$bump_net"
    set bump_cell [create_cell $bump_name */Bump_SNAG_180_RS]
    move_objects $bump_cell -delta "$bump_cx $bump_cy" -simple -force
    set_fixed_objects $bump_cell
  }
}

### CREATE SUPPLY PADS ########################################################

dict for {k v} [dict get $io_guide_map guides] {
  set side [dict get $v side]
  foreach pad [dict get $v pads] {
    set pad_name [lindex $pad 0]
    set net_name [lindex $pad 4]
    if {[string match "VDD_stable" $net_name]} {
      set ref_name "IN12LP_GPIO18_13M9S30P_VDDC_[string map $side_cell_suffix_map $side]"
    } elseif {[string match "VSS_stable" $net_name]} {
      set ref_name "IN12LP_GPIO18_13M9S30P_VSSC_[string map $side_cell_suffix_map $side]"
    } elseif {[string match "VDDIO" $net_name]} {
      set ref_name "IN12LP_GPIO18_13M9S30P_VDDIO_[string map $side_cell_suffix_map $side]"
    } elseif {[string match "VSSIO" $net_name]} {
      set ref_name "IN12LP_GPIO18_13M9S30P_VSSIO_[string map $side_cell_suffix_map $side]"
    } else {
      continue
    }
    puts "BSG-info: creating gpio cell (pad:$pad_name, side:$side, ref_name:$ref_name)"
    create_cell $pad_name */$ref_name
  }
}

puts "BSG-info: Completed script [info script]\n"

