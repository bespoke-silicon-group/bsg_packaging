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

create_cell {corner_io_filler_0 corner_io_filler_1 corner_io_filler_2 corner_io_filler_3} */IN12LP_GPIO18_13M9S30P_CORNER
create_cell {brk_t_0 brk_t_1} */IN12LP_GPIO18_13M9S30P_BRK_V
create_cell {ctrl_brk_l_0 ctrl_brk_l_1 ctrl_brk_l_2 ctrl_brk_l_3 ctrl_brk_l_4 ctrl_brk_r_0 ctrl_brk_r_1 ctrl_brk_r_2 ctrl_brk_r_3 ctrl_brk_r_4} */IN12LP_GPIO18_13M9S30P_CTRL_BRK_H
create_cell {ctrl_brk_b_0 ctrl_brk_b_1 ctrl_brk_b_2 ctrl_brk_b_3 ctrl_brk_b_4 ctrl_brk_t_0 ctrl_brk_t_1 ctrl_brk_t_2 ctrl_brk_t_3} */IN12LP_GPIO18_13M9S30P_CTRL_BRK_V
create_cell {pwrdet_l_0 pwrdet_l_1 pwrdet_l_2 pwrdet_l_3 pwrdet_r_0 pwrdet_r_1 pwrdet_r_2 pwrdet_r_3} */IN12LP_GPIO18_13M9S30P_PWRDET_H
create_cell {pwrdet_b_0 pwrdet_b_1 pwrdet_b_2 pwrdet_b_3 pwrdet_pll_0 pwrdet_t_0 pwrdet_t_1 pwrdet_t_2 pwrdet_t_3} */IN12LP_GPIO18_13M9S30P_PWRDET_V
create_cell {vdd_l_0 vdd_l_1 vdd_l_2 vdd_l_3 vdd_l_4 vdd_l_5 vdd_l_6 vdd_l_7 vdd_r_0 vdd_r_1 vdd_r_2 vdd_r_3 vdd_r_4 vdd_r_5 vdd_r_6 vdd_r_7 vdd_r_8} */IN12LP_GPIO18_13M9S30P_VDDC_H
create_cell {vdd_b_0 vdd_b_1 vdd_b_2 vdd_b_3 vdd_b_4 vdd_b_5 vdd_b_6 vdd_b_7 vdd_pll vdd_t_0 vdd_t_1 vdd_t_2 vdd_t_3 vdd_t_4 vdd_t_5 vdd_t_6 vdd_t_7} */IN12LP_GPIO18_13M9S30P_VDDC_V
create_cell {v18_l_0 v18_l_1 v18_l_2 v18_l_3 v18_l_4 v18_l_5 v18_l_6 v18_l_7 v18_r_0 v18_r_1 v18_r_2 v18_r_3 v18_r_4 v18_r_5 v18_r_6 v18_r_7} */IN12LP_GPIO18_13M9S30P_VDDIO_H
create_cell {v18_b_0 v18_b_1 v18_b_2 v18_b_3 v18_b_4 v18_b_5 v18_b_6 v18_b_7 v18_b_8 v18_t_0 v18_t_1 v18_t_2 v18_t_3 v18_t_4 v18_t_5 v18_t_6 v18_t_7} */IN12LP_GPIO18_13M9S30P_VDDIO_V
create_cell {vss_l_0 vss_l_1 vss_l_2 vss_l_3 vss_l_4 vss_l_5 vss_l_6 vss_l_7 vss_r_0 vss_r_1 vss_r_2 vss_r_3 vss_r_4 vss_r_5 vss_r_6 vss_r_7 vss_r_8} */IN12LP_GPIO18_13M9S30P_VSSC_H
create_cell {vss_b_0 vss_b_1 vss_b_2 vss_b_3 vss_b_4 vss_b_5 vss_b_6 vss_b_7 vss_pll vss_t_0 vss_t_1 vss_t_2 vss_t_3 vss_t_4 vss_t_5 vss_t_6 vss_t_7} */IN12LP_GPIO18_13M9S30P_VSSC_V
create_cell {vzz_l_0 vzz_l_1 vzz_l_2 vzz_l_3 vzz_l_4 vzz_l_5 vzz_l_6 vzz_l_7 vzz_r_0 vzz_r_1 vzz_r_2 vzz_r_3 vzz_r_4 vzz_r_5 vzz_r_6 vzz_r_7} */IN12LP_GPIO18_13M9S30P_VSSIO_H
create_cell {vzz_b_0 vzz_b_1 vzz_b_2 vzz_b_3 vzz_b_4 vzz_b_5 vzz_b_6 vzz_b_7 vzz_b_8 vzz_t_0 vzz_t_1 vzz_t_2 vzz_t_3 vzz_t_4 vzz_t_5 vzz_t_6 vzz_t_7} */IN12LP_GPIO18_13M9S30P_VSSIO_V

