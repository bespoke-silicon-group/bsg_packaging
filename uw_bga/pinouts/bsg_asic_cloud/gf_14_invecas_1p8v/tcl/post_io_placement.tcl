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

### PLL REGION (do this first so top side fillers do over run this)

set pll_tl_corner [lindex [get_attribute [get_cell brk_t_0] boundary_bbox] 1]
set pll_br_corner [lindex [get_attribute [get_cell brk_t_1] boundary_bbox] 0]
create_io_filler -io_guide top_guide \
                 -reference_cells { IN12LP_GPIO18_13M9S30P_FILL20_V IN12LP_GPIO18_13M9S30P_FILL10_V IN12LP_GPIO18_13M9S30P_FILL5_V  IN12LP_GPIO18_13M9S30P_FILL1_V } \
                 -extension_bbox [list $pll_tl_corner $pll_br_corner] \
                 -prefix "pll_io_filler"

### ALl other sides

set left_io_filler_cells [create_io_filler -io_guide left_guide \
                 -reference_cells { IN12LP_GPIO18_13M9S30P_FILL20_H IN12LP_GPIO18_13M9S30P_FILL10_H IN12LP_GPIO18_13M9S30P_FILL5_H IN12LP_GPIO18_13M9S30P_FILL1_H } \
                 -prefix "left_io_filler"]

set top_io_filler_cells [create_io_filler -io_guide top_guide \
                 -reference_cells { IN12LP_GPIO18_13M9S30P_FILL20_V IN12LP_GPIO18_13M9S30P_FILL10_V IN12LP_GPIO18_13M9S30P_FILL5_V  IN12LP_GPIO18_13M9S30P_FILL1_V } \
                 -prefix "top_io_filler"]

set right_io_filler_cells [create_io_filler -io_guide right_guide \
                 -reference_cells { IN12LP_GPIO18_13M9S30P_FILL20_H IN12LP_GPIO18_13M9S30P_FILL10_H IN12LP_GPIO18_13M9S30P_FILL5_H  IN12LP_GPIO18_13M9S30P_FILL1_H } \
                 -prefix "right_io_filler"]

set bottom_io_filler_cells [create_io_filler -io_guide bottom_guide \
                 -reference_cells { IN12LP_GPIO18_13M9S30P_FILL20_V IN12LP_GPIO18_13M9S30P_FILL10_V IN12LP_GPIO18_13M9S30P_FILL5_V  IN12LP_GPIO18_13M9S30P_FILL1_V } \
                 -prefix "bottom_io_filler"]

#===============================================================================
# Connect up control signals (retc_lo, iopwrok_lo and pwrok_lo)
#===============================================================================

set all_brk_cells [list]
append_to_collection all_brk_cells [get_cells "ctrl_brk_l_0"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_l_1"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_l_2"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_l_3"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_l_4"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_t_0"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_t_1"]
append_to_collection all_brk_cells [get_cells      "brk_t_0"]
append_to_collection all_brk_cells [get_cells      "brk_t_1"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_t_2"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_t_3"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_r_0"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_r_1"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_r_2"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_r_3"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_r_4"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_b_0"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_b_1"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_b_2"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_b_3"]
append_to_collection all_brk_cells [get_cells "ctrl_brk_b_4"]

for {set i 0} {$i < [sizeof $all_brk_cells]} {incr i} {

  puts $i
  set I1 $i
  set I2 [expr ($i+1) % [sizeof $all_brk_cells]]

  set I1_bbox [get_attribute [index_collection $all_brk_cells $I1] boundary_bbox]
  set I1_center_x [expr ([lindex $I1_bbox 0 0]+[lindex $I1_bbox 1 0])/2.0]
  set I1_center_y [expr ([lindex $I1_bbox 0 1]+[lindex $I1_bbox 1 1])/2.0]
  set I1_center_pt [list [expr $I1_center_x-0.001] [expr $I1_center_y-0.001]]

  set I2_bbox [get_attribute [index_collection $all_brk_cells $I2] boundary_bbox]
  set I2_center_x [expr ([lindex $I2_bbox 0 0]+[lindex $I2_bbox 1 0])/2.0]
  set I2_center_y [expr ([lindex $I2_bbox 0 1]+[lindex $I2_bbox 1 1])/2.0]
  set I2_center_pt [list [expr $I2_center_x+0.001] [expr $I2_center_y+0.001]]

  puts "$I1_center_pt -- $I2_center_pt"
  set io_fillers [get_cells -intersect [list $I1_center_pt $I2_center_pt] -filter "name=~*io_filler*"]
  connect_net -net "retc_lo[$i]" [get_pins -of $io_fillers -filter "name==RETC"]
  connect_net -net "pwrok_lo[$i]" [get_pins -of $io_fillers -filter "name==PWROK"]
  connect_net -net "iopwrok_lo[$i]" [get_pins -of $io_fillers -filter "name==IOPWROK"]

}

#===============================================================================
# Update the power rails
#===============================================================================

set pll_io_filler_cells [get_cells pll_io_filler*]
set other_io_filler_cells [remove_from_collection [get_cells *io_filler*] $pll_io_filler_cells]

if { $POWER_INTENT == "mv_standard_pll" } {
  connect_supply_net PLL_VDD   -port [get_pins -of $pll_io_filler_cells -filter "name==VDDC"]
  connect_supply_net VSS       -port [get_pins -of $pll_io_filler_cells -filter "name==VSSC"]
  connect_supply_net PLL_VDDIO -port [get_pins -of $pll_io_filler_cells -filter "name==VDDIO"]
  connect_supply_net PLL_VSSIO -port [get_pins -of $pll_io_filler_cells -filter "name==VSSIO"]
} else {
  connect_supply_net VDD   -port [get_pins -of $pll_io_filler_cells -filter "name==VDDC"]
  connect_supply_net VSS   -port [get_pins -of $pll_io_filler_cells -filter "name==VSSC"]
  connect_supply_net VDDIO -port [get_pins -of $pll_io_filler_cells -filter "name==VDDIO"]
  connect_supply_net VSSIO -port [get_pins -of $pll_io_filler_cells -filter "name==VSSIO"]
}

connect_supply_net VDD   -port [get_pins -of $other_io_filler_cells -filter "name==VDDC"]
connect_supply_net VSS   -port [get_pins -of $other_io_filler_cells -filter "name==VSSC"]
connect_supply_net VDDIO -port [get_pins -of $other_io_filler_cells -filter "name==VDDIO"]
connect_supply_net VSSIO -port [get_pins -of $other_io_filler_cells -filter "name==VSSIO"]

commit_upf
connect_pg_net -automatic -all_blocks

# Do not, under any circumstances, try to route these nets... garunteed DRC errors!
set_attribute [get_nets    retc_lo*] physical_status locked
set_attribute [get_nets   pwrok_lo*] physical_status locked
set_attribute [get_nets iopwrok_lo*] physical_status locked

puts "BSG-info: Completed script [info script]\n"

