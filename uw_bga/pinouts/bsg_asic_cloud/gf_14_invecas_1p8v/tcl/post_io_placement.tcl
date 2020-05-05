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

set all_io_cells [get_flat_cells -filter "is_io"]

set all_brk_cells [list]
append_to_collection all_brk_cells [get_cells "ctrl_brk_l_0"] ;# 0
append_to_collection all_brk_cells [get_cells "ctrl_brk_l_1"] ;# 1
append_to_collection all_brk_cells [get_cells "ctrl_brk_l_2"] ;# 2
append_to_collection all_brk_cells [get_cells "ctrl_brk_l_3"] ;# 3
append_to_collection all_brk_cells [get_cells "ctrl_brk_l_4"] ;# 4
append_to_collection all_brk_cells [get_cells "ctrl_brk_t_0"] ;# 5
append_to_collection all_brk_cells [get_cells "ctrl_brk_t_1"] ;# 6
append_to_collection all_brk_cells [get_cells      "brk_t_0"] ;# 7
append_to_collection all_brk_cells [get_cells      "brk_t_1"] ;# 8
append_to_collection all_brk_cells [get_cells "ctrl_brk_t_2"] ;# 9
append_to_collection all_brk_cells [get_cells "ctrl_brk_t_3"] ;# 10
append_to_collection all_brk_cells [get_cells "ctrl_brk_r_0"] ;# 11
append_to_collection all_brk_cells [get_cells "ctrl_brk_r_1"] ;# 12
append_to_collection all_brk_cells [get_cells "ctrl_brk_r_2"] ;# 13
append_to_collection all_brk_cells [get_cells "ctrl_brk_r_3"] ;# 14
append_to_collection all_brk_cells [get_cells "ctrl_brk_r_4"] ;# 15
append_to_collection all_brk_cells [get_cells "ctrl_brk_b_0"] ;# 16
append_to_collection all_brk_cells [get_cells "ctrl_brk_b_1"] ;# 17
append_to_collection all_brk_cells [get_cells "ctrl_brk_b_2"] ;# 18
append_to_collection all_brk_cells [get_cells "ctrl_brk_b_3"] ;# 19
append_to_collection all_brk_cells [get_cells "ctrl_brk_b_4"] ;# 20

disconnect_net [get_pins -of $all_io_cells -filter "name==RETC"]
disconnect_net [get_pins -of $all_io_cells -filter "name==RETCOUT"]
disconnect_net [get_pins -of $all_io_cells -filter "name==RETCIN"]
disconnect_net [get_pins -of $all_io_cells -filter "name==PWROK"]
disconnect_net [get_pins -of $all_io_cells -filter "name==PWROKOUT"]
disconnect_net [get_pins -of $all_io_cells -filter "name==IOPWROK"]
disconnect_net [get_pins -of $all_io_cells -filter "name==IOPWROKOUT"]

connect_net -net VSS [get_pins -of $all_io_cells -filter "name==RETCIN"]

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
}

# Do not, under any circumstances, try to route these nets... garunteed DRC errors!
set_attribute [get_nets    retc_lo_*] physical_status locked
set_attribute [get_nets   pwrok_lo_*] physical_status locked
set_attribute [get_nets iopwrok_lo_*] physical_status locked

puts "BSG-info: Completed script [info script]\n"

