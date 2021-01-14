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
create_io_guide -name "left_guide" -side left -line {{35 175} 4790}
create_io_guide -name "top_guide" -side top -line {{175 4965} 4790}
create_io_guide -name "right_guide" -side right -line {{4965 4825} 4790}
create_io_guide -name "bottom_guide" -side bottom -line {{4825 35} 4790}

#===============================================================================
# LEFT IO CELLS (IN ORDER!)
#===============================================================================

set left_io_cells {}

append left_io_cells "0  CTRL_BREAKER_L_0 "

append left_io_cells "10 VZZ_L_6 "
append left_io_cells "50 V33_L_6 "
append left_io_cells "50 VSS_L_16 "
append left_io_cells "50 VDD_L_15 "
append left_io_cells "50 VSS_L_15 "
append left_io_cells "50 VDD_L_14 "
append left_io_cells "10 sdi_B_sclk_ex_i "
append left_io_cells "10 VZZ_L_5 "
append left_io_cells "10 PWRDET_L_0 "
append left_io_cells "10 sdi_B_tkn_ex_o "
append left_io_cells "10 V33_L_5 "
append left_io_cells "10 sdi_B_data_7_i "
append left_io_cells "10 VSS_L_14 "
append left_io_cells "10 sdi_B_data_6_i "
append left_io_cells "10 VDD_L_13 "
append left_io_cells "10 sdi_B_data_5_i "
append left_io_cells "10 VSS_L_13 "

append left_io_cells "10 CTRL_BREAKER_L_1 "

append left_io_cells "10 sdi_B_data_4_i "
append left_io_cells "10 VDD_L_12 "
append left_io_cells "10 misc_L_7_i "
append left_io_cells "10 VSS_L_12 "
append left_io_cells "10 sdi_B_sclk_i "
append left_io_cells "10 VDD_L_11 "
append left_io_cells "10 misc_L_6_i "
append left_io_cells "10 VZZ_L_4 "
append left_io_cells "10 PWRDET_L_1 "
append left_io_cells "10 sdi_B_token_o "
append left_io_cells "10 V33_L_4 "
append left_io_cells "10 misc_L_5_i "
append left_io_cells "10 VSS_L_11 "
append left_io_cells "10 sdi_B_ncmd_i "
append left_io_cells "10 VDD_L_10 "
append left_io_cells "10 sdi_B_data_3_i "
append left_io_cells "10 VSS_L_10 "
append left_io_cells "10 sdi_B_data_2_i "

append left_io_cells "10 CTRL_BREAKER_L_2 "

append left_io_cells "10 VDD_L_9 "
append left_io_cells "10 sdi_B_data_1_i "
append left_io_cells "10 VSS_L_9 "
append left_io_cells "10 sdi_B_data_0_i "
append left_io_cells "10 VDD_L_8 "
append left_io_cells "10 misc_L_4_i "
append left_io_cells "10 VSS_L_8 "
append left_io_cells "10 clk_0_n_i "
append left_io_cells "10 PWRDET_L_2 "
append left_io_cells "10 VDD_L_7 "
append left_io_cells "10 clk_0_p_i "
append left_io_cells "10 VZZ_L_3 "
append left_io_cells "10 misc_L_3_o "
append left_io_cells "10 V33_L_3 "
append left_io_cells "10 sdi_A_data_0_i "
append left_io_cells "10 VSS_L_7 "
append left_io_cells "10 sdi_A_data_1_i "
append left_io_cells "10 VDD_L_6 "

append left_io_cells "10 CTRL_BREAKER_L_3 "

append left_io_cells "10 sdi_A_data_2_i "
append left_io_cells "10 VSS_L_6 "
append left_io_cells "10 sdi_A_ncmd_i "
append left_io_cells "10 VDD_L_5 "
append left_io_cells "10 misc_L_2_i "
append left_io_cells "10 VSS_L_5 "
append left_io_cells "10 sdi_A_sclk_i "
append left_io_cells "10 VDD_L_4 "
append left_io_cells "10 PWRDET_L_3 "
append left_io_cells "10 misc_L_1_i "
append left_io_cells "10 VZZ_L_2 "
append left_io_cells "10 sdi_A_token_o "
append left_io_cells "10 V33_L_2 "
append left_io_cells "10 misc_L_0_i "
append left_io_cells "10 VSS_L_4 "
append left_io_cells "10 sdi_A_data_3_i "
append left_io_cells "10 VDD_L_3 "
append left_io_cells "10 sdi_A_data_4_i "

append left_io_cells "10 CTRL_BREAKER_L_4 "

append left_io_cells "10 VSS_L_3 "
append left_io_cells "10 sdi_A_data_5_i "
append left_io_cells "10 VDD_L_2 "
append left_io_cells "10 sdi_A_data_6_i "
append left_io_cells "10 VSS_L_2 "
append left_io_cells "10 sdi_A_data_7_i "
append left_io_cells "10 VDD_L_1 "
append left_io_cells "10 sdi_A_tkn_ex_o "
append left_io_cells "10 PWRDET_L_4 "
append left_io_cells "10 VZZ_L_1 "
append left_io_cells "10 sdi_A_sclk_ex_i "
append left_io_cells "10 V33_L_1 "
append left_io_cells "50 VSS_L_1 "
append left_io_cells "50 VDD_L_0 "
append left_io_cells "50 VZZ_L_0 "
append left_io_cells "50 V33_L_0 "
append left_io_cells "50 VSS_L_0 "

append left_io_cells "10 CTRL_BREAKER_L_5 "

set_signal_io_constraint -io_guide left_guide -constraint "$left_io_cells"

#===============================================================================
# TOP IO CELLS (IN ORDER!)
#===============================================================================

set top_io_cells {}

append top_io_cells "0 CTRL_BREAKER_T_0 "

append top_io_cells "10 V33_T_0 "
append top_io_cells "50 VZZ_T_0 "
append top_io_cells "50 VDD_T_0 "
append top_io_cells "50 VSS_T_0 "
append top_io_cells "50 V33_T_1 "
append top_io_cells "50 VZZ_T_1 "
append top_io_cells "10 sdo_A_tkn_ex_i "
append top_io_cells "10 VDD_T_1 "
append top_io_cells "10 PWRDET_T_0 "
append top_io_cells "10 sdo_A_sclk_ex_o "
append top_io_cells "10 VSS_T_1 "
append top_io_cells "10 sdo_A_data_8_o "
append top_io_cells "10 V33_T_2 "
append top_io_cells "10 sdo_A_data_7_o "
append top_io_cells "10 VZZ_T_2 "
append top_io_cells "10 sdo_A_data_6_o "
append top_io_cells "10 VDD_T_2 "

append top_io_cells "10 CTRL_BREAKER_T_1 "

append top_io_cells "10 sdo_A_data_5_o "
append top_io_cells "10 VSS_T_2 "
append top_io_cells "10 sdo_A_data_4_o "
append top_io_cells "10 V33_T_3 "
append top_io_cells "10 sdo_A_data_3_o "
append top_io_cells "10 VZZ_T_3 "
append top_io_cells "10 sdo_A_data_2_o "
append top_io_cells "10 VDD_T_3 "
append top_io_cells "10 PWRDET_T_1 "
append top_io_cells "10 sdo_A_data_1_o "
append top_io_cells "10 VSS_T_3 "
append top_io_cells "10 sdo_A_data_0_o "
append top_io_cells "10 V33_T_4 "
append top_io_cells "10 sdo_A_ncmd_o "
append top_io_cells "10 VZZ_T_4 "
append top_io_cells "10 sdo_A_token_i "
append top_io_cells "10 VDD_T_4 "
append top_io_cells "10 misc_T_0_i "

append top_io_cells "10 CTRL_BREAKER_T_2 "

append top_io_cells "10 VSS_T_4 "
append top_io_cells "10 sdo_A_sclk_o "
append top_io_cells "10 VDD_T_5 "
append top_io_cells "10 misc_T_1_i "
append top_io_cells "10 VSS_T_5 "
append top_io_cells "10 SMA_out_p_o "
append top_io_cells "10 V33_T_5 "
append top_io_cells "10 SMA_out_n_o "
append top_io_cells "10 PWRDET_T_2 "
append top_io_cells "10 VZZ_T_5 "
append top_io_cells "10 reset_i "
append top_io_cells "10 VDD_T_6 "
append top_io_cells "10 misc_T_2_i "
append top_io_cells "10 VSS_T_6 "
append top_io_cells "10 SMA_in_p_i "
append top_io_cells "10 VDD_T_7 "
append top_io_cells "10 SMA_in_n_i "
append top_io_cells "10 VSS_T_7 "

append top_io_cells "10 CTRL_BREAKER_T_3 "

append top_io_cells "10 sdo_B_sclk_o "
append top_io_cells "10 V33_T_6 "
append top_io_cells "10 JTAG_TDO_o "
append top_io_cells "10 VZZ_T_6 "
append top_io_cells "10 sdo_B_token_i "
append top_io_cells "10 VDD_T_8 "
append top_io_cells "10 sdo_B_ncmd_o "
append top_io_cells "10 VSS_T_8 "
append top_io_cells "10 PWRDET_T_3 "
append top_io_cells "10 sdo_B_data_0_o "
append top_io_cells "10 V33_T_7 "
append top_io_cells "10 sdo_B_data_1_o "
append top_io_cells "10 VZZ_T_7 "
append top_io_cells "10 sdo_B_data_2_o "
append top_io_cells "10 VDD_T_9 "
append top_io_cells "10 sdo_B_data_3_o "
append top_io_cells "10 VSS_T_9 "
append top_io_cells "10 sdo_B_data_4_o "

append top_io_cells "10 CTRL_BREAKER_T_4 "

append top_io_cells "10 V33_T_8 "
append top_io_cells "10 sdo_B_data_5_o "
append top_io_cells "10 VZZ_T_8 "
append top_io_cells "10 sdo_B_data_6_o "
append top_io_cells "10 VDD_T_10 "
append top_io_cells "10 sdo_B_data_7_o "
append top_io_cells "10 VSS_T_10 "
append top_io_cells "10 sdo_B_sclk_ex_o "
append top_io_cells "10 PWRDET_T_4 "
append top_io_cells "10 V33_T_9 "
append top_io_cells "10 sdo_B_tkn_ex_i "
append top_io_cells "10 VZZ_T_9 "
append top_io_cells "50 VDD_T_11 "
append top_io_cells "50 VSS_T_11 "
append top_io_cells "50 V33_T_10 "
append top_io_cells "50 VZZ_T_10 "
append top_io_cells "50 VDD_T_12 "

append top_io_cells "10 CTRL_BREAKER_T_5 "

set_signal_io_constraint -io_guide top_guide -constraint "$top_io_cells"

#===============================================================================
# RIGHT IO CELLS (IN ORDER!)
#===============================================================================

set right_io_cells {}

append right_io_cells "0 CTRL_BREAKER_R_0 "

append right_io_cells "10 VSS_R_0 "
append right_io_cells "50 V33_R_0 "
append right_io_cells "50 VZZ_R_0 "
append right_io_cells "50 VDD_R_0 "
append right_io_cells "50 VSS_R_1 "
append right_io_cells "50 V33_R_1 "
append right_io_cells "10 sdi_C_sclk_ex_i "
append right_io_cells "10 VZZ_R_1 "
append right_io_cells "10 PWRDET_R_0 "
append right_io_cells "10 sdi_C_tkn_ex_o "
append right_io_cells "10 VDD_R_1 "
append right_io_cells "10 sdi_C_data_7_i "
append right_io_cells "10 VSS_R_2 "
append right_io_cells "10 sdi_C_data_6_i "
append right_io_cells "10 VDD_R_2 "
append right_io_cells "10 sdi_C_data_5_i "
append right_io_cells "10 VSS_R_3 "

append right_io_cells "10 CTRL_BREAKER_R_1 "

append right_io_cells "10 sdi_C_data_4_i "
append right_io_cells "10 VDD_R_3 "
append right_io_cells "10 sdi_C_data_3_i "
append right_io_cells "10 VSS_R_4 "
append right_io_cells "10 misc_R_0_i "
append right_io_cells "10 V33_R_2 "
append right_io_cells "10 sdi_C_token_o "
append right_io_cells "10 VZZ_R_2 "
append right_io_cells "10 PWRDET_R_1 "
append right_io_cells "10 misc_R_1_i "
append right_io_cells "10 VDD_R_4 "
append right_io_cells "10 sdi_C_sclk_i "
append right_io_cells "10 VSS_R_5 "
append right_io_cells "10 misc_R_2_i "
append right_io_cells "10 VDD_R_5 "
append right_io_cells "10 sdi_C_ncmd_i "
append right_io_cells "10 VSS_R_6 "
append right_io_cells "10 sdi_C_data_2_i "

append right_io_cells "10 CTRL_BREAKER_R_2 "

append right_io_cells "10 VDD_R_6 "
append right_io_cells "10 sdi_C_data_1_i "
append right_io_cells "10 VSS_R_7 "
append right_io_cells "10 sdi_C_data_0_i "
append right_io_cells "10 V33_R_3 "
append right_io_cells "10 misc_R_3_o "
append right_io_cells "10 VZZ_R_3 "
append right_io_cells "10 clk_1_p_i "
append right_io_cells "10 PWRDET_R_2 "
append right_io_cells "10 VDD_R_7 "
append right_io_cells "10 clk_1_n_i "
append right_io_cells "10 VSS_R_8 "
append right_io_cells "10 misc_R_4_i "
append right_io_cells "10 VDD_R_8 "
append right_io_cells "10 sdi_D_data_0_i "
append right_io_cells "10 VSS_R_9 "
append right_io_cells "10 sdi_D_data_1_i "
append right_io_cells "10 VDD_R_9 "

append right_io_cells "10 CTRL_BREAKER_R_3 "

append right_io_cells "10 sdi_D_data_2_i "
append right_io_cells "10 VSS_R_10 "
append right_io_cells "10 sdi_D_data_3_i "
append right_io_cells "10 VDD_R_10 "
append right_io_cells "10 sdi_D_ncmd_i "
append right_io_cells "10 VSS_R_11 "
append right_io_cells "10 misc_R_5_i "
append right_io_cells "10 V33_R_4 "
append right_io_cells "10 PWRDET_R_3 "
append right_io_cells "10 sdi_D_token_o "
append right_io_cells "10 VZZ_R_4 "
append right_io_cells "10 misc_R_6_i "
append right_io_cells "10 VDD_R_11 "
append right_io_cells "10 sdi_D_sclk_i "
append right_io_cells "10 VSS_R_12 "
append right_io_cells "10 misc_R_7_i "
append right_io_cells "10 VDD_R_12 "
append right_io_cells "10 sdi_D_data_4_i "

append right_io_cells "10 CTRL_BREAKER_R_4 "

append right_io_cells "10 VSS_R_13 "
append right_io_cells "10 sdi_D_data_5_i "
append right_io_cells "10 VDD_R_13 "
append right_io_cells "10 sdi_D_data_6_i "
append right_io_cells "10 VSS_R_14 "
append right_io_cells "10 sdi_D_data_7_i "
append right_io_cells "10 V33_R_5 "
append right_io_cells "10 sdi_D_tkn_ex_o "
append right_io_cells "10 PWRDET_R_4 "
append right_io_cells "10 VZZ_R_5 "
append right_io_cells "10 sdi_D_sclk_ex_i "
append right_io_cells "10 VDD_R_14 "
append right_io_cells "50 VSS_R_15 "
append right_io_cells "50 VDD_R_15 "
append right_io_cells "50 VSS_R_16 "
append right_io_cells "50 V33_R_6 "
append right_io_cells "50 VZZ_R_6 "

append right_io_cells "10 CTRL_BREAKER_R_5 "

set_signal_io_constraint -io_guide right_guide -constraint "$right_io_cells"

#===============================================================================
# BOTTOM IO CELLS (IN ORDER!)
#===============================================================================

set bottom_io_cells {}

append bottom_io_cells "0 CTRL_BREAKER_B_0 "

append bottom_io_cells "10 VDD_B_12 "
append bottom_io_cells "50 VZZ_B_10 "
append bottom_io_cells "50 V33_B_10 "
append bottom_io_cells "50 VSS_B_11 "
append bottom_io_cells "50 VDD_B_11 "
append bottom_io_cells "50 VZZ_B_9 "
append bottom_io_cells "10 sdo_D_tkn_ex_i "
append bottom_io_cells "10 V33_B_9 "
append bottom_io_cells "10 sdo_D_sclk_ex_o "
append bottom_io_cells "10 PWRDET_B_0 "
append bottom_io_cells "10 VSS_B_10 "
append bottom_io_cells "10 sdo_D_data_7_o "
append bottom_io_cells "10 VDD_B_10 "
append bottom_io_cells "10 sdo_D_data_6_o "
append bottom_io_cells "10 VZZ_B_8 "
append bottom_io_cells "10 sdo_D_data_5_o "
append bottom_io_cells "10 V33_B_8 "
append bottom_io_cells "10 sdo_D_data_4_o "
append bottom_io_cells "10 VSS_B_9 "

append bottom_io_cells "10 CTRL_BREAKER_B_1 "

append bottom_io_cells "10 sdo_D_data_3_o "
append bottom_io_cells "10 VDD_B_9 "
append bottom_io_cells "10 sdo_D_data_2_o "
append bottom_io_cells "10 VZZ_B_7 "
append bottom_io_cells "10 sdo_D_data_1_o "
append bottom_io_cells "10 V33_B_7 "
append bottom_io_cells "10 sdo_D_data_0_o "
append bottom_io_cells "10 VSS_B_8 "
append bottom_io_cells "10 sdo_D_ncmd_o "
append bottom_io_cells "10 PWRDET_B_1 "
append bottom_io_cells "10 VDD_B_8 "
append bottom_io_cells "10 sdo_D_token_i "
append bottom_io_cells "10 VZZ_B_6 "
append bottom_io_cells "10 JTAG_TRST_i "
append bottom_io_cells "10 V33_B_6 "
append bottom_io_cells "10 sdo_D_sclk_o "
append bottom_io_cells "10 VSS_B_7 "
append bottom_io_cells "10 JTAG_TCK_i "
append bottom_io_cells "10 VDD_B_7 "

append bottom_io_cells "10 BREAKER_B_0 "

append bottom_io_cells "10 PLL_VZZ_i "
#append bottom_io_cells "10 VSS_B_6 "
append bottom_io_cells "50 PLL_V33_i "
#append bottom_io_cells "10 VDD_B_6 "
append bottom_io_cells "50 PLL_PWRDET_B_0 "
append bottom_io_cells "10 PLL_CLK_i "
#append bottom_io_cells "10 VZZ_B_5 "
append bottom_io_cells "50 PLL_VSS_i "
#append bottom_io_cells "10 V33_B_5 "
append bottom_io_cells "50 PLL_VDD_i "

append bottom_io_cells "10 BREAKER_B_1 "

append bottom_io_cells "10 VSS_B_5 "
append bottom_io_cells "10 JTAG_TDI_i "
append bottom_io_cells "10 VDD_B_5 "
append bottom_io_cells "10 sdo_C_sclk_o "
append bottom_io_cells "10 VSS_B_4 "
append bottom_io_cells "10 JTAG_TMS_i "
append bottom_io_cells "10 VDD_B_4 "
append bottom_io_cells "10 sdo_C_token_i "
append bottom_io_cells "10 VZZ_B_4 "
append bottom_io_cells "10 PWRDET_B_2 "
append bottom_io_cells "10 sdo_C_ncmd_o "
append bottom_io_cells "10 V33_B_4 "
append bottom_io_cells "10 sdo_C_data_0_o "
append bottom_io_cells "10 VSS_B_3 "
append bottom_io_cells "10 sdo_C_data_1_o "
append bottom_io_cells "10 VDD_B_3 "
append bottom_io_cells "10 sdo_C_data_2_o "
append bottom_io_cells "10 VZZ_B_3 "
append bottom_io_cells "10 sdo_C_data_3_o "
append bottom_io_cells "10 V33_B_3 "

append bottom_io_cells "10 CTRL_BREAKER_B_2 "

append bottom_io_cells "10 sdo_C_data_4_o "
append bottom_io_cells "10 VSS_B_2 "
append bottom_io_cells "10 sdo_C_data_5_o "
append bottom_io_cells "10 VDD_B_2 "
append bottom_io_cells "10 sdo_C_data_6_o "
append bottom_io_cells "10 VZZ_B_2 "
append bottom_io_cells "10 sdo_C_data_7_o "
append bottom_io_cells "10 V33_B_2 "
append bottom_io_cells "10 sdo_C_data_8_o "
append bottom_io_cells "10 PWRDET_B_3 "
append bottom_io_cells "10 VSS_B_1 "
append bottom_io_cells "10 sdo_C_sclk_ex_o "
append bottom_io_cells "10 VDD_B_1 "
append bottom_io_cells "10 sdo_C_tkn_ex_i "
append bottom_io_cells "10 VZZ_B_1 "
append bottom_io_cells "50 V33_B_1 "
append bottom_io_cells "50 VSS_B_0 "
append bottom_io_cells "50 VDD_B_0 "
append bottom_io_cells "50 VZZ_B_0 "
append bottom_io_cells "50 V33_B_0 "

append bottom_io_cells "10 CTRL_BREAKER_B_3 "

set_signal_io_constraint -io_guide bottom_guide -constraint "$bottom_io_cells"

puts "BSG-info: Completed script [info script]\n"
