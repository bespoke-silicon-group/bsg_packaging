// CZ 1-1-2019
//
// **********************************************************************
// UW BSG ASIC Cloud Pinout Inverted (Based on UW BGA)
//
// - use this for bsg_gateway_chip.
// - must use bsg_chip_swizzle_adapter to work.

  (input  p_ci_clk_i
  ,input  p_ci_v_i
  ,output p_ci_tkn_o
  ,input  p_ci_0_i
  ,input  p_ci_1_i
  ,input  p_ci_2_i
  ,input  p_ci_3_i
  ,input  p_ci_4_i
  ,input  p_ci_5_i
  ,input  p_ci_6_i
  ,input  p_ci_7_i
  ,input  p_ci_8_i
  // output channel of comm link 1
  // direction switched from OUTPUT to INPUT
  ,input  p_co_clk_i
  ,input  p_co_v_i
  ,output p_co_tkn_o
  ,input  p_co_0_i
  ,input  p_co_1_i
  ,input  p_co_2_i
  ,input  p_co_3_i
  ,input  p_co_4_i
  ,input  p_co_5_i
  ,input  p_co_6_i
  ,input  p_co_7_i
  ,input  p_co_8_i
  // input channel of comm link 2
  // direction switched from INPUT to OUTPUT
  ,output p_ci2_clk_o
  ,output p_ci2_v_o
  ,input  p_ci2_tkn_i
  ,output p_ci2_0_o
  ,output p_ci2_1_o
  ,output p_ci2_2_o
  ,output p_ci2_3_o
  ,output p_ci2_4_o
  ,output p_ci2_5_o
  ,output p_ci2_6_o
  ,output p_ci2_7_o
  ,output p_ci2_8_o
  // output channel of comm link 2
  ,output p_co2_clk_o
  ,output p_co2_v_o
  ,input  p_co2_tkn_i
  ,output p_co2_0_o
  ,output p_co2_1_o
  ,output p_co2_2_o
  ,output p_co2_3_o
  ,output p_co2_4_o
  ,output p_co2_5_o
  ,output p_co2_6_o
  ,output p_co2_7_o
  ,output p_co2_8_o
  // bsg tag interface, 5 pins
  ,output p_bsg_tag_clk_o
  ,output p_bsg_tag_en_o
  ,output p_bsg_tag_data_o
  ,input p_bsg_tag_clk_i
  ,input p_bsg_tag_data_i
  // clock and reset interface, 9 pins
  // clock input signals
  ,output p_clk_A_o
  ,output p_clk_B_o
  ,output p_clk_C_o
  // clock output signal
  ,input p_clk_i
  // 3-bit clock selection signals
  ,output p_sel_0_o
  ,output p_sel_1_o
  ,output p_sel_2_o
  // asynchronous reset signals
  ,output p_clk_async_reset_o
  ,output p_core_async_reset_o
  // miscellaneous signal, 1 pin
  ,input p_misc_i
  );
// End UW BGA PAD Definitions
// **********************************************************************
