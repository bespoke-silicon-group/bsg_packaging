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

#create_cell {ctrl_brk_l_0 ctrl_brk_l_1 ctrl_brk_l_2 ctrl_brk_l_3 ctrl_brk_l_4 ctrl_brk_r_0 ctrl_brk_r_1 ctrl_brk_r_2 ctrl_brk_r_3 ctrl_brk_r_4} */IN12LP_GPIO18_13M9S30P_CTRL_BRK_H
#create_cell {pwrdet_l_0 pwrdet_l_1 pwrdet_l_2 pwrdet_l_3 pwrdet_r_0 pwrdet_r_1 pwrdet_r_2 pwrdet_r_3} */IN12LP_GPIO18_13M9S30P_PWRDET_H
create_cell {vdd_0 vdd_1 vdd_2 vdd_3 vdd_4} */IN12LP_GPIO18_13M9S30P_VDDC_H
create_cell {v18_0 v18_1 v18_2 v18_3 v18_4} */IN12LP_GPIO18_13M9S30P_VDDIO_H
create_cell {vss_0 vss_1 vss_2 vss_3 vss_4} */IN12LP_GPIO18_13M9S30P_VSSC_H
create_cell {vzz_0 vzz_1 vzz_2 vzz_3 vzz_4} */IN12LP_GPIO18_13M9S30P_VSSIO_H
