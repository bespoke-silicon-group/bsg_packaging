#===============================================================================
# pin_pad_physical_constraints.tcl
#
# This script is responsible for constraining the IO driver cells. After this
# script is sourced, the palce_io command will be called which will then use
# these constraints to physically place all of the IO cells.
#===============================================================================

puts "BSG-info: Running script [info script]\n"

# Offset needs to give us space for the crackstop (14) distance to guard edge
# in the crackstop (7) and then room for the pad overhang (13.707) which totals
# to 34.707 (rounded up to 35 for now). It is possible to remove that 13.707
# overhand by RDL routing to PADs that are further in the die area. This will
# increase bond angles so we should be careful that packaging is still feasible
# if we do this.

# This pad-ring is using 21 rather than 35 negating the 13.707 overhand

remove_io_guide -all
create_io_guide -name "right_guide" -side right -line {{979 1720} 1480}

#===============================================================================
# RIGHT IO CELLS (IN ORDER!)
#===============================================================================

set right_io_cells {}

append right_io_cells " 0 ctrl_brk_0 "
append right_io_cells " 0 pad_DISABLE_i "
append right_io_cells "50 pad_LINK_0_o "
append right_io_cells "50 pad_LINK_1_o "
append right_io_cells "10 v18_0 "
append right_io_cells "10 pad_LINK_clk_o "
append right_io_cells "10 vzz_0 "
append right_io_cells "10 pad_LINK_tkn_i "
append right_io_cells "10 vdd_0 "
append right_io_cells "10 pad_LINK_v_o "
append right_io_cells "10 vss_0 "
append right_io_cells "10 pad_LINK_2_o "
append right_io_cells "10 v18_1 "
append right_io_cells "10 pad_LINK_3_o "
append right_io_cells "10 vzz_1 "
append right_io_cells "10 pad_MON_clk_o "
append right_io_cells "10 vdd_1 "
append right_io_cells "10 pad_EXT_clk_i "
append right_io_cells "10 vss_1 "
append right_io_cells "10 pad_TAG_clk_i "
append right_io_cells "10 vdd_2 "
append right_io_cells "10 pad_TAG_data_i "
append right_io_cells "10 vzz_2 "
append right_io_cells "10 pad_LINK_3_i "
append right_io_cells "10 v18_2 "
append right_io_cells "10 pad_LINK_2_i "
append right_io_cells "10 vss_2 "
append right_io_cells "10 pad_LINK_v_i "
append right_io_cells "10 vdd_3 "
append right_io_cells "10 pad_LINK_clk_i "
append right_io_cells "10 vzz_3 "
append right_io_cells "10 pad_LINK_tkn_o "
append right_io_cells "10 v18_3 "
append right_io_cells "10 pad_LINK_1_i "
append right_io_cells "50 pad_LINK_0_i "
append right_io_cells " 0 ctrl_brk_1 "

set_signal_io_constraint -io_guide right_guide -constraint "$right_io_cells"

puts "BSG-info: Completed script [info script]\n"
