#===============================================================================
# post_io_placement.tcl
#
# Sourced at the end of the place_io script. This is responsible for any last
# minute IO stuff that is specific to the foundry. For this specific foundry,
# this includes IO filler cell insertion, bond pad creation, and some net
# connections for new "physical only" cells created.
#===============================================================================

puts "BSG-info: Running script [info script]\n"

### ROUTE RDL ##################################################################

# Get the commit hash of the bsg_packaging repository
set olddir [pwd]
cd $::env(BSG_PACKAGING_DIR)
set bsg_packaging_commit_hash [exec git rev-parse HEAD]
cd $olddir

# Check for a cached version of the RDL routes. The pre-routed RDL def file has
# the commit hash of the bsg_packaging repository in the name to ensure that no
# changes have been made that would invalidate the RDL routes.
if {[file exists $PDK_ROOT_DIR/bsg/rdl/basejump_fcbga_785_rdl.$bsg_packaging_commit_hash.def]} {
  puts "BSG-info: reading RDL def file $PDK_ROOT_DIR/bsg/rdl/basejump_fcbga_785_rdl.$bsg_packaging_commit_hash.def"
  read_def $PDK_ROOT_DIR/bsg/rdl/basejump_fcbga_785_rdl.$bsg_packaging_commit_hash.def

# No RDL route def files were found for this commit hash, so rebuild the RDL
} else {
  puts "BSG-info: building RDL from source (file not found: $PDK_ROOT_DIR/bsg/rdl/basejump_fcbga_785_rdl.$bsg_packaging_commit_hash.def)"

  set io_guide_map [bsg_rdl_create_io_guide_map "$::env(BSG_PACKAGING_PINOUT_SPEC_DIR)/bsg_padring_bump_map.csv"]

  bsg_rdl_create_blockages
  bsg_rdl_route_io_supply

  save_block -label rdl_routes_io_supply

  bsg_rdl_route_guide $io_guide_map DL5
  bsg_rdl_route_guide $io_guide_map DL4
  bsg_rdl_route_guide $io_guide_map DL3
  bsg_rdl_route_guide $io_guide_map DL2
  bsg_rdl_route_guide $io_guide_map DL1

  bsg_rdl_route_guide $io_guide_map DR5
  bsg_rdl_route_guide $io_guide_map DR4
  bsg_rdl_route_guide $io_guide_map DR3
  bsg_rdl_route_guide $io_guide_map DR2
  bsg_rdl_route_guide $io_guide_map DR1

  bsg_rdl_route_guide $io_guide_map ML0
  bsg_rdl_route_guide $io_guide_map DL0
  bsg_rdl_route_guide $io_guide_map IT0
  bsg_rdl_route_guide $io_guide_map CT0
  bsg_rdl_route_guide $io_guide_map IT1
  bsg_rdl_route_guide $io_guide_map DR0
  bsg_rdl_route_guide $io_guide_map MR0

  bsg_rdl_route_guide $io_guide_map ML1
  bsg_rdl_route_guide $io_guide_map DL6
  bsg_rdl_route_guide $io_guide_map DL7
  bsg_rdl_route_guide $io_guide_map CB0
  bsg_rdl_route_guide $io_guide_map DR7
  bsg_rdl_route_guide $io_guide_map DR6
  bsg_rdl_route_guide $io_guide_map MR1

  save_block -label rdl_routes_signals

  optimize_rdl_routes -layer LB
  bsg_rdl_remove_blockages

  save_block -label rdl_routes_optimized

  set rdl_objects [add_to_collection [get_shapes -filter shape_use==rdl] [get_vias -filter shape_use==rdl]]
  write_def -objects $rdl_objects basejump_fcbga_785_rdl.$bsg_packaging_commit_hash.def
}

# Begin the processes of filling in the gaps of the IO pad ring and insertint ctrl brks between IO banks

set io_guide_die_offset  14
set io_corner_width      [get_attribute [get_lib_cells */IN12LP_GPIO18_*_CORNER*] width ]
set io_corner_height     [get_attribute [get_lib_cells */IN12LP_GPIO18_*_CORNER*] height]

set io_filler_cells_v [get_attribute [sort_collection -desc [get_lib_cells */IN12LP_GPIO18_*_FILL*_V] width] name]
set io_filler_cells_h [get_attribute [sort_collection -desc [get_lib_cells */IN12LP_GPIO18_*_FILL*_H] height] name]

puts "BSG-info: Vertical io filler cells in order: $io_filler_cells_v"
puts "BSG-info: Horizontal io filler cells in order: $io_filler_cells_h"

# fill the existing IO guides (there is usually no fillers to be inserted at this time)
foreach_in_collection g [get_io_guides -filter "side==left || side==right"] { create_io_filler -io_guide $g -reference_cells $io_filler_cells_h -prefix iofiller }
foreach_in_collection g [get_io_guides -filter "side==top || side==bottom"] { create_io_filler -io_guide $g -reference_cells $io_filler_cells_v -prefix iofiller }

# For each side, we are going to create IO guides that fill in the gaps between
# the IO banks. We are also going to add a ctrl brk cell as there is no sharing
# of pwrdet cells between IO banks. These ctrl brk cells end up in their own IO
# guide object (this was the only way I could consistently get the cells where
# I wanted them).

### LEFT SIDE ###

set x             [expr [die_llx] + $io_guide_die_offset]
set y_lo          [expr [die_lly] + $io_guide_die_offset + $io_corner_height]
set y_hi          [expr [die_ury] - $io_guide_die_offset]
set y_pts_pre_brk "$y_lo $y_hi"

foreach_in_collection g [sort_collection -desc [get_io_guides -filter "side==left"] bounding_box.ll_y] {
  set origin_y      [lindex [get_attribute $g origin] 1]
  set length        [get_attribute $g length]
  set y_pts_pre_brk [linsert $y_pts_pre_brk 1 [expr $origin_y+$length]]
  set y_pts_pre_brk [linsert $y_pts_pre_brk 1 [expr $origin_y]]
}

set y_pts [list]
for {set i 0} {$i < [llength $y_pts_pre_brk]} {incr i 2} {
  set y_start [lindex $y_pts_pre_brk $i]
  set y_end   [lindex $y_pts_pre_brk [expr $i+1]]
  if {$i == 0} {
    set y_end [expr $y_end - 5]
    lappend y_pts $y_start $y_end
    create_io_guide -name "iobrk_left_$i" -side left -line "{$x $y_end} 5"
    add_to_io_guide "iobrk_left_$i" [create_cell "iobrk_left_ctrl_$i" */IN12LP_GPIO18_13M9S30P_CTRL_BRK_H]
    place_io -io_guide "iobrk_left_$i"
  } elseif {$i+2 == [llength $y_pts_pre_brk]} {
    set y_start [expr $y_start + 5]
    lappend y_pts $y_start $y_end
    create_io_guide -name "iobrk_left_$i" -side left -line "{$x [expr $y_start - 5]} 5"
    add_to_io_guide "iobrk_left_$i" [create_cell "iobrk_left_ctrl_$i" */IN12LP_GPIO18_13M9S30P_CTRL_BRK_H]
    place_io -io_guide "iobrk_left_$i"
  } else {
    set y_mid [expr int(($y_end-$y_start-5)/2.0)]
    lappend y_pts $y_start [expr $y_start + $y_mid]
    lappend y_pts [expr $y_start + $y_mid + 5] $y_end
    create_io_guide -name "iobrk_left_$i" -side left -line "{$x [expr $y_start + $y_mid]} 5"
    add_to_io_guide "iobrk_left_$i" [create_cell "iobrk_left_ctrl_$i" */IN12LP_GPIO18_13M9S30P_CTRL_BRK_H]
    place_io -io_guide "iobrk_left_$i"
  }
}

for {set i 0} {$i < [llength $y_pts]} {incr i 2} {
  set y_start     [lindex $y_pts $i]
  set y_end       [lindex $y_pts [expr $i+1]]
  set guide_len   [expr $y_end - $y_start]
  if {$y_start != $y_end} {
    create_io_guide -name "iofiller_left_$i" -side left -line "{$x $y_start} $guide_len"
    if {$i+2 == [llength $y_pts]} {
      add_to_io_guide "iofiller_left_$i" [create_cell iofiller_corner_ul */IN12LP_GPIO18_*_CORNER]
      place_io -io_guide "iofiller_left_$i"
    }
    create_io_filler -io_guide "iofiller_left_$i" -reference_cells $io_filler_cells_h -prefix iofiller
  }
}

### TOP SIDE ###

set y             [expr [die_ury] - $io_guide_die_offset]
set x_lo          [expr [die_llx] + $io_guide_die_offset + $io_corner_height]
set x_hi          [expr [die_urx] - $io_guide_die_offset]
set x_pts_pre_brk "$x_lo $x_hi"

foreach_in_collection g [sort_collection -desc [get_io_guides -filter "side==top"] bounding_box.ll_x] {
  set origin_x      [lindex [get_attribute $g origin] 0]
  set length        [get_attribute $g length]
  set x_pts_pre_brk [linsert $x_pts_pre_brk 1 [expr $origin_x+$length]]
  set x_pts_pre_brk [linsert $x_pts_pre_brk 1 [expr $origin_x]]
}

set x_pts [list]
for {set i 0} {$i < [llength $x_pts_pre_brk]} {incr i 2} {
  set x_start [lindex $x_pts_pre_brk $i]
  set x_end   [lindex $x_pts_pre_brk [expr $i+1]]
  if {$i == 0} {
    set x_end [expr $x_end - 5]
    lappend x_pts $x_start $x_end
    create_io_guide -name "iobrk_top_$i" -side top -line "{$x_end $y} 5"
    add_to_io_guide "iobrk_top_$i" [create_cell "iobrk_top_ctrl_$i" */IN12LP_GPIO18_13M9S30P_CTRL_BRK_V]
    place_io -io_guide "iobrk_top_$i"
  } elseif {$i+2 == [llength $x_pts_pre_brk]} {
    set x_start [expr $x_start + 5]
    lappend x_pts $x_start $x_end
    create_io_guide -name "iobrk_top_$i" -side top -line "{[expr $x_start - 5] $y} 5"
    add_to_io_guide "iobrk_top_$i" [create_cell "iobrk_top_ctrl_$i" */IN12LP_GPIO18_13M9S30P_CTRL_BRK_V]
    place_io -io_guide "iobrk_top_$i"
  } else {
    set x_mid [expr int(($x_end-$x_start-5)/2.0)]
    lappend x_pts $x_start [expr $x_start + $x_mid]
    lappend x_pts [expr $x_start + $x_mid + 5] $x_end
    create_io_guide -name "iobrk_top_$i" -side top -line "{[expr $x_start + $x_mid] $y} 5"
    add_to_io_guide "iobrk_top_$i" [create_cell "iobrk_top_ctrl_$i" */IN12LP_GPIO18_13M9S30P_CTRL_BRK_V]
    place_io -io_guide "iobrk_top_$i"
  }
}

for {set i 0} {$i < [llength $x_pts]} {incr i 2} {
  set x_start     [lindex $x_pts $i]
  set x_end       [lindex $x_pts [expr $i+1]]
  set guide_len   [expr $x_end - $x_start]
  if {$x_start != $x_end} {
    create_io_guide -name "iofiller_top_$i" -side top -line "{$x_start $y} $guide_len"
    if {$i+2 == [llength $x_pts]} {
      add_to_io_guide "iofiller_top_$i" [create_cell iofiller_corner_ur */IN12LP_GPIO18_*_CORNER]
      place_io -io_guide "iofiller_top_$i"
    }
    create_io_filler -io_guide "iofiller_top_$i" -reference_cells $io_filler_cells_v -prefix iofiller
  }
}

### RIGHT SIDE ###

set x     [expr [die_urx] - $io_guide_die_offset]
set y_hi  [expr [die_ury] - $io_guide_die_offset - $io_corner_height]
set y_lo  [expr [die_lly] + $io_guide_die_offset]
set y_pts_pre_brk "$y_hi $y_lo"

foreach_in_collection g [sort_collection [get_io_guides -filter "side==right"] bounding_box.ll_y] {
  set origin_y [lindex [get_attribute $g origin] 1]
  set length   [get_attribute $g length]
  set y_pts_pre_brk [linsert $y_pts_pre_brk 1 [expr $origin_y-$length]]
  set y_pts_pre_brk [linsert $y_pts_pre_brk 1 [expr $origin_y]]
}

set y_pts [list]
for {set i 0} {$i < [llength $y_pts_pre_brk]} {incr i 2} {
  set y_start [lindex $y_pts_pre_brk $i]
  set y_end   [lindex $y_pts_pre_brk [expr $i+1]]
  if {$i == 0} {
    set y_end [expr $y_end + 5]
    lappend y_pts $y_start $y_end
    create_io_guide -name "iobrk_right_$i" -side right -line "{$x $y_end} 5"
    add_to_io_guide "iobrk_right_$i" [create_cell "iobrk_right_ctrl_$i" */IN12LP_GPIO18_13M9S30P_CTRL_BRK_H]
    place_io -io_guide "iobrk_right_$i"
  } elseif {$i+2 == [llength $y_pts_pre_brk]} {
    set y_start [expr $y_start - 5]
    lappend y_pts $y_start $y_end
    create_io_guide -name "iobrk_right_$i" -side right -line "{$x [expr $y_start + 5]} 5"
    add_to_io_guide "iobrk_right_$i" [create_cell "iobrk_right_ctrl_$i" */IN12LP_GPIO18_13M9S30P_CTRL_BRK_H]
    place_io -io_guide "iobrk_right_$i"
  } else {
    set y_mid [expr int(($y_start-$y_end-5)/2.0)]
    lappend y_pts $y_start [expr $y_start - $y_mid]
    lappend y_pts [expr $y_start - $y_mid - 5] $y_end
    create_io_guide -name "iobrk_right_$i" -side right -line "{$x [expr $y_start - $y_mid]} 5"
    add_to_io_guide "iobrk_right_$i" [create_cell "iobrk_right_ctrl_$i" */IN12LP_GPIO18_13M9S30P_CTRL_BRK_H]
    place_io -io_guide "iobrk_right_$i"
  }
}

for {set i 0} {$i < [llength $y_pts]} {incr i 2} {
  set y_start     [lindex $y_pts $i]
  set y_end       [lindex $y_pts [expr $i+1]]
  set guide_len   [expr $y_start - $y_end]
  if {$y_start != $y_end} {
    create_io_guide -name "iofiller_right_$i" -side right -line "{$x $y_start} $guide_len"
    if {$i+2 == [llength $y_pts]} {
      add_to_io_guide "iofiller_right_$i" [create_cell iofiller_corner_lr */IN12LP_GPIO18_*_CORNER]
      place_io -io_guide "iofiller_right_$i"
    }
    create_io_filler -io_guide "iofiller_right_$i" -reference_cells $io_filler_cells_h -prefix iofiller
  }
}

### BOTTOM SIDE ###

set y             [expr [die_lly] + $io_guide_die_offset]
set x_hi          [expr [die_urx] - $io_guide_die_offset - $io_corner_height]
set x_lo          [expr [die_llx] + $io_guide_die_offset]
set x_pts_pre_brk "$x_hi $x_lo"

foreach_in_collection g [sort_collection [get_io_guides -filter "side==bottom"] bounding_box.ll_x] {
  set origin_x      [lindex [get_attribute $g origin] 0]
  set length        [get_attribute $g length]
  set x_pts_pre_brk [linsert $x_pts_pre_brk 1 [expr $origin_x-$length]]
  set x_pts_pre_brk [linsert $x_pts_pre_brk 1 [expr $origin_x]]
}

set x_pts [list]
for {set i 0} {$i < [llength $x_pts_pre_brk]} {incr i 2} {
  set x_start [lindex $x_pts_pre_brk $i]
  set x_end   [lindex $x_pts_pre_brk [expr $i+1]]
  if { $i == 0 } {
    set x_end [expr $x_end + 5]
    lappend x_pts $x_start $x_end
    create_io_guide -name "iobrk_bottom_$i" -side bottom -line "{$x_end $y} 5"
    add_to_io_guide "iobrk_bottom_$i" [create_cell "iobrk_bottom_ctrl_$i" */IN12LP_GPIO18_13M9S30P_CTRL_BRK_V]
    place_io -io_guide "iobrk_bottom_$i"
  } elseif {$i+2 == [llength $x_pts_pre_brk]} {
    set x_start [expr $x_start - 5]
    lappend x_pts $x_start $x_end
    create_io_guide -name "iobrk_bottom_$i" -side bottom -line "{[expr $x_start + 5] $y} 5"
    add_to_io_guide "iobrk_bottom_$i" [create_cell "iobrk_bottom_ctrl_$i" */IN12LP_GPIO18_13M9S30P_CTRL_BRK_V]
    place_io -io_guide "iobrk_bottom_$i"
  } else {
    set x_mid [expr int(($x_start-$x_end-5)/2.0)]
    lappend x_pts $x_start [expr $x_start - $x_mid]
    lappend x_pts [expr $x_start - $x_mid - 5] $x_end
    create_io_guide -name "iobrk_bottom_$i" -side bottom -line "{[expr $x_start - $x_mid] $y} 5"
    add_to_io_guide "iobrk_bottom_$i" [create_cell "iobrk_bottom_ctrl_$i" */IN12LP_GPIO18_13M9S30P_CTRL_BRK_V]
    place_io -io_guide "iobrk_bottom_$i"
  }
}

for {set i 0} {$i < [llength $x_pts]} {incr i 2} {
  set x_start     [lindex $x_pts $i]
  set x_end       [lindex $x_pts [expr $i+1]]
  set guide_len   [expr $x_start - $x_end]
  if {$x_start != $x_end} {
    create_io_guide -name "iofiller_bottom_$i" -side bottom -line "{$x_start $y} $guide_len"
    if {$i+2 == [llength $x_pts]} {
      add_to_io_guide "iofiller_bottom_$i" [create_cell iofiller_corner_ll */IN12LP_GPIO18_*_CORNER]
      place_io -io_guide "iofiller_bottom_$i"
    }
    create_io_filler -io_guide "iofiller_bottom_$i" -reference_cells $io_filler_cells_v -prefix iofiller
  }
}

# Go around the pad ring in a clockwise manner and select all the cells between
# 2 ctrl breaker cells and connect their pwrok, iopwrok and retc pins to the
# same net. Then mark those nets are locked to make sure they don't get routed.

set                  all_brk_cells [sort_collection       [get_cells -filter "ref_name=~*_CTRL_BRK_H && orientation==R0"]   bounding_box.ll_y]
append_to_collection all_brk_cells [sort_collection       [get_cells -filter "ref_name=~*_CTRL_BRK_V && orientation==R180"] bounding_box.ll_x]
append_to_collection all_brk_cells [sort_collection -desc [get_cells -filter "ref_name=~*_CTRL_BRK_H && orientation==R180"] bounding_box.ll_y]
append_to_collection all_brk_cells [sort_collection -desc [get_cells -filter "ref_name=~*_CTRL_BRK_V && orientation==R0"]   bounding_box.ll_x]
for {set i 0} {$i < [sizeof $all_brk_cells]} {incr i} {

  set I1 $i
  set I1_bbox [get_attribute [index_collection $all_brk_cells $I1] boundary_bbox]
  set I1_center_x [expr ([lindex $I1_bbox 0 0]+[lindex $I1_bbox 1 0])/2.0]
  set I1_center_y [expr ([lindex $I1_bbox 0 1]+[lindex $I1_bbox 1 1])/2.0]
  set I1_center_pt [list [expr $I1_center_x-0.001] [expr $I1_center_y-0.001]]

  set I2 [expr ($i+1) % [sizeof $all_brk_cells]]
  set I2_bbox [get_attribute [index_collection $all_brk_cells $I2] boundary_bbox]
  set I2_center_x [expr ([lindex $I2_bbox 0 0]+[lindex $I2_bbox 1 0])/2.0]
  set I2_center_y [expr ([lindex $I2_bbox 0 1]+[lindex $I2_bbox 1 1])/2.0]
  set I2_center_pt [list [expr $I2_center_x+0.001] [expr $I2_center_y+0.001]]

  set io_cells [get_cells -intersect [list $I1_center_pt $I2_center_pt]]

  if {[sizeof [get_net -quiet retc_lo_$i]]    == 0} { create_net    retc_lo_$i }
  if {[sizeof [get_net -quiet pwrok_lo_$i]]   == 0} { create_net   pwrok_lo_$i }
  if {[sizeof [get_net -quiet iopwrok_lo_$i]] == 0} { create_net iopwrok_lo_$i }

  disconnect_net [get_pins -of $io_cells -filter "name==RETC    || name==RETCOUT"]
  disconnect_net [get_pins -of $io_cells -filter "name==PWROK   || name==PWROKOUT"]
  disconnect_net [get_pins -of $io_cells -filter "name==IOPWROK || name==IOPWROKOUT"]

  disconnect_net [get_pins -of [index_collection $all_brk_cells $I1] -filter "name==RETCA"]
  disconnect_net [get_pins -of [index_collection $all_brk_cells $I1] -filter "name==PWROKA"]
  disconnect_net [get_pins -of [index_collection $all_brk_cells $I1] -filter "name==IOPWROKA"]

  disconnect_net [get_pins -of [index_collection $all_brk_cells $I2] -filter "name==RETCB"]
  disconnect_net [get_pins -of [index_collection $all_brk_cells $I2] -filter "name==PWROKB"]
  disconnect_net [get_pins -of [index_collection $all_brk_cells $I2] -filter "name==IOPWROKB"]

  connect_net -net    retc_lo_$i [get_pins -of [index_collection $all_brk_cells $I1] -filter "name==RETCA"]
  connect_net -net   pwrok_lo_$i [get_pins -of [index_collection $all_brk_cells $I1] -filter "name==PWROKA"]
  connect_net -net iopwrok_lo_$i [get_pins -of [index_collection $all_brk_cells $I1] -filter "name==IOPWROKA"]

  connect_net -net    retc_lo_$i [get_pins -of [index_collection $all_brk_cells $I2] -filter "name==RETCB"]
  connect_net -net   pwrok_lo_$i [get_pins -of [index_collection $all_brk_cells $I2] -filter "name==PWROKB"]
  connect_net -net iopwrok_lo_$i [get_pins -of [index_collection $all_brk_cells $I2] -filter "name==IOPWROKB"]

  connect_net -net    retc_lo_$i [get_pins -of $io_cells -filter "name==RETC    || name==RETCOUT"]
  connect_net -net   pwrok_lo_$i [get_pins -of $io_cells -filter "name==PWROK   || name==PWROKOUT"]
  connect_net -net iopwrok_lo_$i [get_pins -of $io_cells -filter "name==IOPWROK || name==IOPWROKOUT"]
}

# Do not, under any circumstances, try to route these nets... garunteed DRC errors!
set_attribute [get_nets    retc_lo_*] physical_status locked
set_attribute [get_nets   pwrok_lo_*] physical_status locked
set_attribute [get_nets iopwrok_lo_*] physical_status locked

# Check to make sure that each of these banks has no more than 20 IO cells
# (constraint of the GPIO manual). Also, can set the if statement to not eval
# to 0 to visually inspect the banks in a gui.
for {set i 0} {$i < [sizeof $all_brk_cells]} {incr i} {

  set I1 $i
  set I1_bbox [get_attribute [index_collection $all_brk_cells $I1] boundary_bbox]
  set I1_center_x [expr ([lindex $I1_bbox 0 0]+[lindex $I1_bbox 1 0])/2.0]
  set I1_center_y [expr ([lindex $I1_bbox 0 1]+[lindex $I1_bbox 1 1])/2.0]
  set I1_center_pt [list [expr $I1_center_x-0.001] [expr $I1_center_y-0.001]]

  set I2 [expr ($i+1) % [sizeof $all_brk_cells]]
  set I2_bbox [get_attribute [index_collection $all_brk_cells $I2] boundary_bbox]
  set I2_center_x [expr ([lindex $I2_bbox 0 0]+[lindex $I2_bbox 1 0])/2.0]
  set I2_center_y [expr ([lindex $I2_bbox 0 1]+[lindex $I2_bbox 1 1])/2.0]
  set I2_center_pt [list [expr $I2_center_x+0.001] [expr $I2_center_y+0.001]]

  set io_cells [get_cells -intersect [list $I1_center_pt $I2_center_pt]]

  set total_cell_count [sizeof $io_cells]
  set io_cell_count    [sizeof [filter_collection $io_cells ref_name=~*_IO_*]]

  if {$io_cell_count > 20} {
    puts "BSG-error: overloaded pwrdet bank (#$i has $io_cell_count IO cells)"
  }

  # can be useful in interactive GUI mode to highlight the pwrdet banks with
  # colors that can be visually inspected.
  if { 0 } {
    puts "BSG-debug: pwrdet bank $i contains [sizeof [filter_collection $io_cells ref_name=~*_IO_*]] io cells ([sizeof $io_cells] total cells) {IO CELLS => [get_object_name $io_cells]}"
    gui_set_highlight_options -auto_cycle_color 1
    gui_change_highlight -collection $io_cells
  }

}

# For the misc banks, tie the retension mode pins low using the tlo net of the
# neighboring cell.
connect_net -net pad_ML0_0_i_tlo [get_pins ML0_pwrdet_tie/RETCIN]
connect_net -net pad_MR0_0_i_tlo [get_pins MR0_pwrdet_tie/RETCIN]
connect_net -net pad_ML1_0_i_tlo [get_pins ML1_pwrdet_tie/RETCIN]
connect_net -net pad_MR1_5_i_tlo [get_pins MR1_pwrdet_tie/RETCIN]

# For all other banks, select the VDDIO pads to swap to SPVDDIO and the tie the
# retension mode pins low using the tlo net of a neighboring cell.
foreach bank {DL0 DL1 DL2 DL3 DL4 DL5 DL6 DL7 DR0 DR1 DR2 DR3 DR4 DR5 DR6 DR7 IT0 IT1 CT0 CB0} {

  set side [get_attribute [get_io_guide $bank] side]
  if { $side == "top" || $side == "bottom" } {
    set suffix V
  } elseif { $side == "left" || $side == "right" } {
    set suffix H
  }

  if {[string match "C??" $bank]} {
    set swap_cell "pad_${bank}_V18_0"
    set tied_cell "pad_${bank}_1_o"
  } else {
    set swap_cell "pad_${bank}_V18_1"
    set tied_cell "pad_${bank}_4_o"
  }
  puts "BSG-info: swap $swap_cell to SPVDDIO, tieoff RECTIN to ${tied_cell}_tlo"
  set_reference -pin_rebind force -pin_map {PWROK PWROKOUT IOPWROK IOPWROKOUT RETC RETCOUT} -to_block */IN12LP_GPIO18_13M9S30P_SPVDDIO_${suffix} $swap_cell
  connect_net -net ${tied_cell}_tlo [get_pins $swap_cell/RETCIN]

  if {[string match "C??" $bank]} {
    set swap_cell "pad_${bank}_V18_2"
    set tied_cell "pad_${bank}_6_o"
  } else {
    set swap_cell "pad_${bank}_V18_4"
    set tied_cell "pad_${bank}_v_o"
  }
  puts "BSG-info: swap $swap_cell to SPVDDIO, tieoff RECTIN to ${tied_cell}_tlo"
  set_reference -pin_rebind force -pin_map {PWROK PWROKOUT IOPWROK IOPWROKOUT RETC RETCOUT} -to_block */IN12LP_GPIO18_13M9S30P_SPVDDIO_${suffix} $swap_cell
  connect_net -net ${tied_cell}_tlo [get_pins $swap_cell/RETCIN]

}

