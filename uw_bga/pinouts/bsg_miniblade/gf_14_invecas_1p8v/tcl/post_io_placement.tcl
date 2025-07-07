#===============================================================================
# post_io_placement.tcl
#
# Sourced at the end of the place_io script. This is responsible for any last
# minute IO stuff that is specific to the foundry. For this specific foundry,
# this includes IO filler cell insertion, bond pad creation, and some net
# connections for new "physical only" cells created.
#===============================================================================

puts "BSG-info: Running script [info script]\n"

###############################################################################
#
#  SET THE BONDPAD LOCATIONS
#
###############################################################################

# Use these when developing the pad locations
#remove_object [get_cells -quiet -filter "ref_name==BONDPAD_BUMP_48X84_LB"]
#remove_object [get_shapes -filter "shape_type==text && layer_name==LBESD"]
#remove_object [get_shapes -filter "shape_type==text && layer_name==LB"]
#remove_object [get_shapes -filter "layer_name==LB"]

# each line of the csv calls this function.
proc bsg_create_bond_pad { name net side ring center_x center_y } {
    # trim the arguments
    set name     [string trim $name]
    set net      [string trim $net]
    set side     [string trim $side]
    set ring     [string trim $ring]
    set center_x [string trim $center_x]
    set center_y [string trim $center_y]

    # create the pad
    set pad_cell [create_cell ${name} */BONDPAD_BUMP_48X84_LB]

    # connect the pad to the net
    connect_net -net $net [get_pin ${name}/PAD]

    # orient the pad
    if { $side == "left" } {
        if { $ring == "inner" } { set orientation "R90"   }
        if { $ring == "outer" } { set orientation "MXR90" }
        set expand_x 15
        set expand_y 3
    }
    if { $side == "right" } {
        if { $ring == "inner" } { set orientation "MXR90" }
        if { $ring == "outer" } { set orientation "R90"   }
        set expand_x 15
        set expand_y 3
    }
    if { $side == "top" } {
        if { $ring == "inner" } { set orientation "R0"    }
        if { $ring == "outer" } { set orientation "MX"    }
        set expand_x 3
        set expand_y 15
    }
    if { $side == "bottom" } {
        if { $ring == "inner" } { set orientation "MX"    }
        if { $ring == "outer" } { set orientation "R0"    }
        set expand_x 3
        set expand_y 15
    }
    set_attribute $pad_cell orientation $orientation

    # move the pad
    move_objects -simple $pad_cell -to "0 0"
    set pad_bbox [get_attribute $pad_cell boundary_bbox]
    set pad_center_x [expr ([lindex $pad_bbox 0 0]+[lindex $pad_bbox 1 0])/2.0]
    set pad_center_y [expr ([lindex $pad_bbox 0 1]+[lindex $pad_bbox 1 1])/2.0]
    move_objects -simple $pad_cell -to "[expr $center_x - $pad_center_x] [expr $center_y - $pad_center_y]"

    # label the pad
    set net_type [get_attr [get_net $net] net_type]
    if { $net_type == "signal" } {
        set esd_label "FULL_ESD"
    } else {
        set esd_label "LC_POWER_ESD"
    }
    set pad_bbox [get_attribute $pad_cell boundary_bbox]
    set pad_center_x [expr ([lindex $pad_bbox 0 0]+[lindex $pad_bbox 1 0])/2.0]
    set pad_center_y [expr ([lindex $pad_bbox 0 1]+[lindex $pad_bbox 1 1])/2.0]
    create_shape -origin "$pad_center_x $pad_center_y" -text $net -layer LB -shape_type text -height 5
    create_shape -origin "$pad_center_x $pad_center_y" -text $esd_label -layer LBESD -shape_type text -height 5

    # create a wider pad shape
    #set shape_bbox [bsg_expand_bbox $pad_bbox $expand_x $expand_y]
    #create_shape -net $net -layer LB -shape_type rect -boundary $shape_bbox
}

set csv_file "$::env(BSG_PACKAGING_PINOUT_TCL_DIR)/../csv/bond_pad_locations.csv"
set fid [open $csv_file r]
# csv-header
gets $fid line
# csv-body
while {![eof $fid]} {
    gets $fid line
    if {[string trim $line] == ""} { continue }
    bsg_create_bond_pad {*}[split $line ,]
}
close $fid

# Draw the RDL
if { [file exists $::env(BSG_DESIGNS_TARGET_TCL_HARD_DIR)/rdl.tcl] } {
    source -echo -verbose "$::env(BSG_DESIGNS_TARGET_TCL_HARD_DIR)/rdl.tcl"
}

###############################################################################
#
#  INSERT IO FILLERS
#
###############################################################################

set right_io_filler_cells [create_io_filler -io_guide right_guide \
                 -reference_cells { IN12LP_GPIO18_13M9S30P_FILL20_H IN12LP_GPIO18_13M9S30P_FILL10_H IN12LP_GPIO18_13M9S30P_FILL5_H  IN12LP_GPIO18_13M9S30P_FILL1_H } \
                 -prefix "right_io_filler"]

###############################################################################
#
#  DEAL WITH THE IO CTRL SIGNALS
#
###############################################################################

set all_io_cells [get_flat_cells -filter "is_io"]

set all_brk_cells [list]
append_to_collection all_brk_cells [get_cells "ctrl_brk_0"] ;# 0
append_to_collection all_brk_cells [get_cells "ctrl_brk_1"] ;# 1

disconnect_net [get_pins -of $all_io_cells -filter "name==RETC"]
disconnect_net [get_pins -of $all_io_cells -filter "name==RETCOUT"]
disconnect_net [get_pins -of $all_io_cells -filter "name==RETCIN"]
disconnect_net [get_pins -of $all_io_cells -filter "name==PWROK"]
disconnect_net [get_pins -of $all_io_cells -filter "name==PWROKOUT"]
disconnect_net [get_pins -of $all_io_cells -filter "name==IOPWROK"]
disconnect_net [get_pins -of $all_io_cells -filter "name==IOPWROKOUT"]

#connect_net -net VSS [get_pins -of $all_io_cells -filter "name==RETCIN"]
connect_net -net pad_LINK_3_o_tlo [get_pins -of v18_1 -filter "name==RETCIN"]

set i 0

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

create_net    retc_lo_$i
create_net   pwrok_lo_$i
create_net iopwrok_lo_$i

connect_net -net    retc_lo_$i [get_pins -of [index_collection $all_brk_cells $I1] -filter "name==RETCA"]
connect_net -net   pwrok_lo_$i [get_pins -of [index_collection $all_brk_cells $I1] -filter "name==PWROKA"]
connect_net -net iopwrok_lo_$i [get_pins -of [index_collection $all_brk_cells $I1] -filter "name==IOPWROKA"]

connect_net -net    retc_lo_$i [get_pins -of [index_collection $all_brk_cells $I2] -filter "name==RETCB"]
connect_net -net   pwrok_lo_$i [get_pins -of [index_collection $all_brk_cells $I2] -filter "name==PWROKB"]
connect_net -net iopwrok_lo_$i [get_pins -of [index_collection $all_brk_cells $I2] -filter "name==IOPWROKB"]

connect_net -net    retc_lo_$i [get_pins -of $io_cells -filter "name==RETC    || name==RETCOUT"]
connect_net -net   pwrok_lo_$i [get_pins -of $io_cells -filter "name==PWROK   || name==PWROKOUT"]
connect_net -net iopwrok_lo_$i [get_pins -of $io_cells -filter "name==IOPWROK || name==IOPWROKOUT"]

# Do not, under any circumstances, try to route these nets... garunteed DRC errors!
set_attribute [get_nets    retc_lo_*] physical_status locked
set_attribute [get_nets   pwrok_lo_*] physical_status locked
set_attribute [get_nets iopwrok_lo_*] physical_status locked

puts "BSG-info: Completed script [info script]\n"
