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
remove_io_guide -all
create_io_guide -name "left_guide" -side left -line {{35 175} 2790}
create_io_guide -name "top_guide" -side top -line {{175 2965} 2790}
create_io_guide -name "right_guide" -side right -line {{2965 2825} 2790}
create_io_guide -name "bottom_guide" -side bottom -line {{2825 35} 2790}

#===============================================================================
# LEFT IO CELLS (IN ORDER!)
#===============================================================================

set left_io_cells {}

append left_io_cells  "0 ctrl_brk_l_0 "

append left_io_cells  "0 ddr_dq_8_io "
append left_io_cells  "7 vdd_l_0 "
append left_io_cells  "7 ddr_dq_9_io "
append left_io_cells  "7 vss_l_0 "
append left_io_cells  "7 ddr_dq_10_io "
append left_io_cells  "7 v18_l_0 "
append left_io_cells  "7 ddr_dq_11_io "
append left_io_cells  "7 vzz_l_0 "
append left_io_cells  "7 pwrdet_l_0 "
append left_io_cells  "7 ddr_dq_12_io "
append left_io_cells  "7 vdd_l_1 "
append left_io_cells  "7 ddr_dq_13_io "
append left_io_cells  "7 vss_l_1 "
append left_io_cells  "7 ddr_dq_14_io "
append left_io_cells  "7 v18_l_1 "
append left_io_cells  "7 ddr_dq_15_io "
append left_io_cells  "7 vzz_l_1 "
append left_io_cells  "7 ddr_dqs_p_0_io "

append left_io_cells  "0 ctrl_brk_l_1 "

append left_io_cells  "0 vdd_l_2 "
append left_io_cells  "7 ddr_dqs_n_0_io "
append left_io_cells  "7 vss_l_2 "
append left_io_cells  "7 ddr_dm_0_o "
append left_io_cells  "7 v18_l_2 "
append left_io_cells  "7 ddr_dq_0_io "
append left_io_cells  "7 vzz_l_2 "
append left_io_cells  "7 ddr_dq_1_io "
append left_io_cells  "7 pwrdet_l_1 "
append left_io_cells  "7 vdd_l_3 "
append left_io_cells  "7 ddr_dq_2_io "
append left_io_cells  "7 vss_l_3 "
append left_io_cells  "7 ddr_dq_3_io "
append left_io_cells  "7 v18_l_3 "
append left_io_cells  "7 ddr_dq_4_io "
append left_io_cells  "7 vzz_l_3 "
append left_io_cells  "7 ddr_dq_5_io "

append left_io_cells  "0 ctrl_brk_l_2 "

append left_io_cells  "0 vdd_l_4 "
append left_io_cells  "7 ddr_dq_6_io "
append left_io_cells  "7 vss_l_4 "
append left_io_cells  "7 ddr_dq_7_io "
append left_io_cells  "7 v18_l_4 "
append left_io_cells  "7 bsg_tag_data_o "
append left_io_cells  "7 vzz_l_4 "
append left_io_cells  "7 bsg_tag_clk_o "
append left_io_cells  "7 pwrdet_l_2 "
append left_io_cells  "7 vdd_l_5 "
append left_io_cells  "7 co2_0_o "
append left_io_cells  "7 vss_l_5 "
append left_io_cells  "7 co2_1_o "
append left_io_cells  "7 v18_l_5 "
append left_io_cells  "7 co2_2_o "
append left_io_cells  "7 vzz_l_5 "
append left_io_cells  "7 co2_3_o "

append left_io_cells  "0 ctrl_brk_l_3 "

append left_io_cells  "0 vdd_l_6 "
append left_io_cells  "7 co2_4_o "
append left_io_cells  "7 vss_l_6 "
append left_io_cells  "7 co2_clk_o "
append left_io_cells  "7 v18_l_6 "
append left_io_cells  "7 co2_tkn_i "
append left_io_cells  "7 vzz_l_6 "
append left_io_cells  "7 co2_v_o "
append left_io_cells  "7 pwrdet_l_3 "
append left_io_cells  "7 vdd_l_7 "
append left_io_cells  "7 co2_5_o "
append left_io_cells  "7 vss_l_7 "
append left_io_cells  "7 co2_6_o "
append left_io_cells  "7 v18_l_7 "
append left_io_cells  "7 co2_7_o "
append left_io_cells  "7 vzz_l_7 "
append left_io_cells  "7 co2_8_o "

append left_io_cells  "0 ctrl_brk_l_4 "

set_signal_io_constraint -io_guide left_guide -constraint "$left_io_cells"

#===============================================================================
# TOP IO CELLS (IN ORDER!)
#===============================================================================

set top_io_cells {}

append top_io_cells "0 ctrl_brk_t_0 "

append top_io_cells "0 vdd_t_0 "
append top_io_cells "5 co_0_i "
append top_io_cells "5 vss_t_0 "
append top_io_cells "5 co_1_i "
append top_io_cells "5 v18_t_0 "
append top_io_cells "5 co_2_i "
append top_io_cells "5 vzz_t_0 "
append top_io_cells "5 pwrdet_t_0 "
append top_io_cells "5 co_3_i "
append top_io_cells "5 vdd_t_1 "
append top_io_cells "5 co_4_i "
append top_io_cells "5 vss_t_1 "
append top_io_cells "5 co_clk_i "
append top_io_cells "5 v18_t_1 "
append top_io_cells "5 co_tkn_o "

append top_io_cells "0 ctrl_brk_t_1 "

append top_io_cells "0 vzz_t_1 "
append top_io_cells "5 co_v_i "
append top_io_cells "5 vdd_t_2 "
append top_io_cells "5 co_5_i "
append top_io_cells "5 vss_t_2 "
append top_io_cells "5 co_6_i "
append top_io_cells "5 v18_t_2 "
append top_io_cells "5 pwrdet_t_1 "
append top_io_cells "5 co_7_i "
append top_io_cells "5 vzz_t_2 "
append top_io_cells "5 co_8_i "
append top_io_cells "5 vdd_t_3 "
append top_io_cells "5 clk_A_i "
append top_io_cells "5 vss_t_3 "
append top_io_cells "5 clk_B_i "

append top_io_cells "0 brk_t_0 "

append top_io_cells "0 v18_t_3 "
append top_io_cells "5 clk_C_i "
append top_io_cells "5 vzz_t_3 "
append top_io_cells "5 clk_o "
append top_io_cells "5 pwrdet_pll_0 "
append top_io_cells "5 vdd_pll "
append top_io_cells "5 clk_async_reset_i "
append top_io_cells "5 vss_pll "
append top_io_cells "5 misc_o "

append top_io_cells "0 brk_t_1 "

append top_io_cells "0 vdd_t_4 "
append top_io_cells "5 sel_0_i "
append top_io_cells "5 vss_t_4 "
append top_io_cells "5 sel_1_i "
append top_io_cells "5 v18_t_4 "
append top_io_cells "5 sel_2_i "
append top_io_cells "5 vzz_t_4 "
append top_io_cells "5 core_async_reset_i "
append top_io_cells "5 pwrdet_t_2 "
append top_io_cells "5 vdd_t_5 "
append top_io_cells "5 ci2_0_o "
append top_io_cells "5 vss_t_5 "
append top_io_cells "5 ci2_1_o "
append top_io_cells "5 v18_t_5 "
append top_io_cells "5 ci2_2_o "
append top_io_cells "5 vzz_t_5 "
append top_io_cells "5 ci2_3_o "

append top_io_cells "0 ctrl_brk_t_2 "

append top_io_cells "0 vdd_t_6 "
append top_io_cells "5 ci2_4_o "
append top_io_cells "5 vss_t_6 "
append top_io_cells "5 ci2_clk_o "
append top_io_cells "5 v18_t_6 "
append top_io_cells "5 ci2_tkn_i "
append top_io_cells "5 vzz_t_6 "
append top_io_cells "5 ci2_v_o "
append top_io_cells "5 pwrdet_t_3 "
append top_io_cells "5 vdd_t_7 "
append top_io_cells "5 ci2_5_o "
append top_io_cells "5 vss_t_7 "
append top_io_cells "5 ci2_6_o "
append top_io_cells "5 v18_t_7 "
append top_io_cells "5 ci2_7_o "
append top_io_cells "5 vzz_t_7 "
append top_io_cells "5 ci2_8_o "

append top_io_cells "0 ctrl_brk_t_3 "

set_signal_io_constraint -io_guide top_guide -constraint "$top_io_cells"

#===============================================================================
# RIGHT IO CELLS (IN ORDER!)
#===============================================================================

set right_io_cells {}

append right_io_cells "1 ctrl_brk_r_0 "

append right_io_cells "0 ci_0_i "
append right_io_cells "5 vdd_r_0 "
append right_io_cells "5 ci_1_i "
append right_io_cells "5 vss_r_0 "
append right_io_cells "5 ci_2_i "
append right_io_cells "5 v18_r_0 "
append right_io_cells "5 ci_3_i "
append right_io_cells "5 vzz_r_0 "
append right_io_cells "5 pwrdet_r_0 "
append right_io_cells "5 ci_4_i "
append right_io_cells "5 vdd_r_1 "
append right_io_cells "5 ci_clk_i "
append right_io_cells "5 vss_r_1 "
append right_io_cells "5 ci_tkn_o "
append right_io_cells "5 v18_r_1 "
append right_io_cells "5 ci_v_i "
append right_io_cells "5 vzz_r_1 "
append right_io_cells "5 ci_5_i "

append right_io_cells "0 ctrl_brk_r_1 "

append right_io_cells "0 vdd_r_2 "
append right_io_cells "5 ci_6_i "
append right_io_cells "5 vss_r_2 "
append right_io_cells "5 ci_7_i "
append right_io_cells "5 v18_r_2 "
append right_io_cells "5 ci_8_i "
append right_io_cells "5 vzz_r_2 "
append right_io_cells "5 bsg_tag_en_i "
append right_io_cells "5 pwrdet_r_1 "
append right_io_cells "5 vdd_r_3 "
append right_io_cells "5 bsg_tag_data_i "
append right_io_cells "5 vss_r_3 "
append right_io_cells "5 bsg_tag_clk_i "
append right_io_cells "5 v18_r_3 "
append right_io_cells "5 ddr_dm_3_o "
append right_io_cells "5 vzz_r_3 "
append right_io_cells "5 ddr_dqs_p_3_io "
append right_io_cells "5 vdd_r_4 "

append right_io_cells "0 ctrl_brk_r_2 "

append right_io_cells "0 ddr_dqs_n_3_io "
append right_io_cells "5 vss_r_4 "
append right_io_cells "5 ddr_dq_24_io "
append right_io_cells "5 v18_r_4 "
append right_io_cells "5 ddr_dq_25_io "
append right_io_cells "5 vzz_r_4 "
append right_io_cells "5 ddr_dq_26_io "
append right_io_cells "5 vdd_r_5 "
append right_io_cells "5 pwrdet_r_2 "
append right_io_cells "5 ddr_dq_27_io "
append right_io_cells "5 vss_r_5 "
append right_io_cells "5 ddr_dq_28_io "
append right_io_cells "5 v18_r_5 "
append right_io_cells "5 ddr_dq_29_io "
append right_io_cells "5 vzz_r_5 "
append right_io_cells "5 ddr_dq_30_io "
append right_io_cells "5 vdd_r_6 "
append right_io_cells "5 ddr_dq_31_io "

append right_io_cells "0 ctrl_brk_r_3 "

append right_io_cells "0 vss_r_6 "
append right_io_cells "5 ddr_dq_16_io "
append right_io_cells "5 v18_r_6 "
append right_io_cells "5 ddr_dq_17_io "
append right_io_cells "5 vzz_r_6 "
append right_io_cells "5 ddr_dq_18_io "
append right_io_cells "5 vdd_r_7 "
append right_io_cells "5 ddr_dq_19_io "
append right_io_cells "5 pwrdet_r_3 "
append right_io_cells "5 vss_r_7 "
append right_io_cells "5 ddr_dq_20_io "
append right_io_cells "5 v18_r_7 "
append right_io_cells "5 ddr_dq_21_io "
append right_io_cells "5 vzz_r_7 "
append right_io_cells "5 ddr_dq_22_io "
append right_io_cells "5 vdd_r_8 "
append right_io_cells "5 ddr_dq_23_io "
append right_io_cells "5 vss_r_8 "

append right_io_cells "0 ctrl_brk_r_4 "

set_signal_io_constraint -io_guide right_guide -constraint "$right_io_cells"

#===============================================================================
# BOTTOM IO CELLS (IN ORDER!)
#===============================================================================

set bottom_io_cells {}

append bottom_io_cells "1 ctrl_brk_b_0 "

append bottom_io_cells "0 ddr_dm_2_o "
append bottom_io_cells "5 v18_b_0 "
append bottom_io_cells "5 ddr_dqs_p_2_io "
append bottom_io_cells "5 vzz_b_0 "
append bottom_io_cells "5 ddr_dqs_n_2_io "
append bottom_io_cells "5 vdd_b_0 "
append bottom_io_cells "5 ddr_ck_p_o "
append bottom_io_cells "5 vss_b_0 "
append bottom_io_cells "5 pwrdet_b_0 "
append bottom_io_cells "5 ddr_ck_n_o "
append bottom_io_cells "5 v18_b_1 "
append bottom_io_cells "5 ddr_cke_o "
append bottom_io_cells "5 vzz_b_1 "
append bottom_io_cells "5 ddr_cs_n_o "
append bottom_io_cells "5 vdd_b_1 "
append bottom_io_cells "5 ddr_ras_n_o "
append bottom_io_cells "5 vss_b_1 "
append bottom_io_cells "5 ddr_cas_n_o "

append bottom_io_cells "0 ctrl_brk_b_1 "

append bottom_io_cells "0 v18_b_2 "
append bottom_io_cells "5 ddr_we_n_o "
append bottom_io_cells "5 vzz_b_2 "
append bottom_io_cells "5 ddr_reset_n_o "
append bottom_io_cells "5 vdd_b_2 "
append bottom_io_cells "5 ddr_odt_o "
append bottom_io_cells "5 vss_b_2 "
append bottom_io_cells "5 ddr_addr_0_o "
append bottom_io_cells "5 pwrdet_b_1 "
append bottom_io_cells "5 v18_b_3 "
append bottom_io_cells "5 ddr_addr_1_o "
append bottom_io_cells "5 vzz_b_3 "
append bottom_io_cells "5 ddr_addr_2_o "
append bottom_io_cells "5 vdd_b_3 "
append bottom_io_cells "5 ddr_addr_3_o "
append bottom_io_cells "5 vss_b_3 "
append bottom_io_cells "5 ddr_addr_4_o "
append bottom_io_cells "5 v18_b_4 "

append bottom_io_cells "0 ctrl_brk_b_2 "

append bottom_io_cells "0 ddr_addr_5_o "
append bottom_io_cells "5 vzz_b_4 "
append bottom_io_cells "5 ddr_addr_6_o "
append bottom_io_cells "5 vdd_b_4 "
append bottom_io_cells "5 ddr_addr_7_o "
append bottom_io_cells "5 vss_b_4 "
append bottom_io_cells "5 ddr_addr_8_o "
append bottom_io_cells "5 v18_b_5 "
append bottom_io_cells "5 pwrdet_b_2 "
append bottom_io_cells "5 ddr_addr_9_o "
append bottom_io_cells "5 vzz_b_5 "
append bottom_io_cells "5 ddr_addr_10_o "
append bottom_io_cells "5 vdd_b_5 "
append bottom_io_cells "5 ddr_addr_11_o "
append bottom_io_cells "5 vss_b_5 "
append bottom_io_cells "5 ddr_addr_12_o "
append bottom_io_cells "5 v18_b_6 "
append bottom_io_cells "5 ddr_addr_13_o "

append bottom_io_cells "0 ctrl_brk_b_3 "

append bottom_io_cells "0 vzz_b_6 "
append bottom_io_cells "5 ddr_addr_14_o "
append bottom_io_cells "5 vdd_b_6 "
append bottom_io_cells "5 ddr_addr_15_o "
append bottom_io_cells "5 vss_b_6 "
append bottom_io_cells "5 ddr_ba_0_o "
append bottom_io_cells "5 v18_b_7 "
append bottom_io_cells "5 ddr_ba_1_o "
append bottom_io_cells "5 pwrdet_b_3 "
append bottom_io_cells "5 vzz_b_7 "
append bottom_io_cells "5 ddr_ba_2_o "
append bottom_io_cells "5 vdd_b_7 "
append bottom_io_cells "5 ddr_dqs_p_1_io "
append bottom_io_cells "5 vss_b_7 "
append bottom_io_cells "5 ddr_dqs_n_1_io "
append bottom_io_cells "5 v18_b_8 "
append bottom_io_cells "5 ddr_dm_1_o "
append bottom_io_cells "5 vzz_b_8 "

append bottom_io_cells "0 ctrl_brk_b_4 "

set_signal_io_constraint -io_guide bottom_guide -constraint "$bottom_io_cells"

puts "BSG-info: Completed script [info script]\n"

