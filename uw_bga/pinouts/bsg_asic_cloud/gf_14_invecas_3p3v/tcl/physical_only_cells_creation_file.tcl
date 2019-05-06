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

set new_io_cells [list]

append_to_collection new_io_cells [create_cell {corner_ul corner_ur corner_lr corner_ll} */IN14LPP_GPIO33_13M9S30P_CORNER]

append_to_collection new_io_cells [create_cell {vss_l_0 vss_l_1 vss_l_2 vss_l_3 vss_l_4 vss_l_5 vss_l_6 vss_l_7} */IN14LPP_GPIO33_13M9S30P_VSSC_H]
append_to_collection new_io_cells [create_cell {vdd_l_0 vdd_l_1 vdd_l_2 vdd_l_3 vdd_l_4 vdd_l_5 vdd_l_6 vdd_l_7} */IN14LPP_GPIO33_13M9S30P_VDDC_H]
append_to_collection new_io_cells [create_cell {vzz_l_0 vzz_l_1 vzz_l_2 vzz_l_3 vzz_l_4 vzz_l_5 vzz_l_6 vzz_l_7} */IN14LPP_GPIO33_13M9S30P_VSSIO33_H]
append_to_collection new_io_cells [create_cell {v18_l_0 v18_l_1 v18_l_2 v18_l_3 v18_l_4 v18_l_5 v18_l_6 v18_l_7} */IN14LPP_GPIO33_13M9S30P_VDDIO33_H]
append_to_collection new_io_cells [create_cell {bias_l_0 bias_l_1 bias_l_2 bias_l_3} */IN14LPP_GPIO33_13M9S30P_BIAS_GENERATOR_H]

append_to_collection new_io_cells [create_cell {vss_t_0 vss_t_1 vss_t_2 vss_t_3 vss_t_4 vss_t_5 vss_t_6 vss_t_7} */IN14LPP_GPIO33_13M9S30P_VSSC_V]
append_to_collection new_io_cells [create_cell {vdd_t_0 vdd_t_1 vdd_t_2 vdd_t_3 vdd_t_4 vdd_t_5 vdd_t_6 vdd_t_7} */IN14LPP_GPIO33_13M9S30P_VDDC_V]
append_to_collection new_io_cells [create_cell {vzz_t_0 vzz_t_1 vzz_t_2 vzz_t_3 vzz_t_4 vzz_t_5 vzz_t_6 vzz_t_7} */IN14LPP_GPIO33_13M9S30P_VSSIO33_V]
append_to_collection new_io_cells [create_cell {v18_t_0 v18_t_1 v18_t_2 v18_t_3 v18_t_4 v18_t_5 v18_t_6 v18_t_7} */IN14LPP_GPIO33_13M9S30P_VDDIO33_V]
append_to_collection new_io_cells [create_cell {bias_t_0 bias_t_1 bias_t_2 bias_t_3 bias_t_4} */IN14LPP_GPIO33_13M9S30P_BIAS_GENERATOR_V]
append_to_collection new_io_cells [create_cell vss_pll */IN14LPP_GPIO33_13M9S30P_VSSC_V]
append_to_collection new_io_cells [create_cell vdd_pll */IN14LPP_GPIO33_13M9S30P_VDDC_V]
append_to_collection new_io_cells [create_cell {breaker_t_0 breaker_t_1} */IN14LPP_GPIO33_13M9S30P_BRK_V]

append_to_collection new_io_cells [create_cell {vss_r_0 vss_r_1 vss_r_2 vss_r_3 vss_r_4 vss_r_5 vss_r_6 vss_r_7 vss_r_8} */IN14LPP_GPIO33_13M9S30P_VSSC_H]
append_to_collection new_io_cells [create_cell {vdd_r_0 vdd_r_1 vdd_r_2 vdd_r_3 vdd_r_4 vdd_r_5 vdd_r_6 vdd_r_7 vdd_r_8} */IN14LPP_GPIO33_13M9S30P_VDDC_H]
append_to_collection new_io_cells [create_cell {vzz_r_0 vzz_r_1 vzz_r_2 vzz_r_3 vzz_r_4 vzz_r_5 vzz_r_6 vzz_r_7} */IN14LPP_GPIO33_13M9S30P_VSSIO33_H]
append_to_collection new_io_cells [create_cell {v18_r_0 v18_r_1 v18_r_2 v18_r_3 v18_r_4 v18_r_5 v18_r_6 v18_r_7} */IN14LPP_GPIO33_13M9S30P_VDDIO33_H]
append_to_collection new_io_cells [create_cell {bias_r_0 bias_r_1 bias_r_2 bias_r_3} */IN14LPP_GPIO33_13M9S30P_BIAS_GENERATOR_H]

append_to_collection new_io_cells [create_cell {vss_b_0 vss_b_1 vss_b_2 vss_b_3 vss_b_4 vss_b_5 vss_b_6 vss_b_7} */IN14LPP_GPIO33_13M9S30P_VSSC_V]
append_to_collection new_io_cells [create_cell {vdd_b_0 vdd_b_1 vdd_b_2 vdd_b_3 vdd_b_4 vdd_b_5 vdd_b_6 vdd_b_7} */IN14LPP_GPIO33_13M9S30P_VDDC_V]
append_to_collection new_io_cells [create_cell {vzz_b_0 vzz_b_1 vzz_b_2 vzz_b_3 vzz_b_4 vzz_b_5 vzz_b_6 vzz_b_7 vzz_b_8} */IN14LPP_GPIO33_13M9S30P_VSSIO33_V]
append_to_collection new_io_cells [create_cell {v18_b_0 v18_b_1 v18_b_2 v18_b_3 v18_b_4 v18_b_5 v18_b_6 v18_b_7 v18_b_8} */IN14LPP_GPIO33_13M9S30P_VDDIO33_V]
append_to_collection new_io_cells [create_cell {bias_b_0 bias_b_1 bias_b_2 bias_b_3 bias_b_4} */IN14LPP_GPIO33_13M9S30P_BIAS_GENERATOR_V]

connect_supply_net VDD   -ports [get_pins -of $new_io_cells -filter "name=~VDDC*"]
connect_supply_net VSS   -ports [get_pins -of $new_io_cells -filter "name=~VSSC*"]
connect_supply_net VDDIO -ports [get_pins -of $new_io_cells -filter "name=~VDDIO*"]
connect_supply_net VSSIO -ports [get_pins -of $new_io_cells -filter "name=~VSSIO*"]

connect_net -net VDD      [get_pins -of $new_io_cells -filter "name==MODE18"]
connect_net -net VREFN_LO [get_pins -of $new_io_cells -filter "name=~VREFN*"]
connect_net -net VREFP_LO [get_pins -of $new_io_cells -filter "name=~VREFP*"]

commit_upf
connect_pg_net -auto

puts "BSG-info: Completed script [info script]\n"

