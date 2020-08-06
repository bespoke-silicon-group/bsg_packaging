// CZ 1-1-2019
//
// **********************************************************************
// UW BSG ASIC Cloud Pinout (Based on UW BGA)
//
// 135 signal pins in total
//
// This file defines all of the pads that are used for a given pinout of
// a package. It would change if we reversed the direction of a pad. It
// is recommended not to change the name of the pin (except the _i or _o)
// at this level so that we can maintain canonical naming for the package;
// instead just do an assign of a wire to rename.
//
// convention:
//
// - the input ports have a prefix of "p_"
// - the corresponding signals have no prefix
//   and have a suffix of _int.
// - the IO pad names are consistent with the
//   BGA pinout names (e.g, sdi_B_data_7_i, sdi_B_ncmd_i)
//
// it is customary to include a macro file ahead of this one;
// for example bsg_one_iopad_macros_verilog.v

// module bsg_asic_cloud
  // 2-channel comm link interface, 48 pins
  // NEED A SWIZZLING ADAPTER TO WORK CORRECTLY
  // input channel of comm link 1
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
  // 32-bit ddr dram interface, 72 pins
  // ddr interface differential output clock pair
  ,output p_ddr_ck_p_o, output p_ddr_ck_n_o
  // ddr interface output clock enable signal
  ,output p_ddr_cke_o
  // ddr interface output command signals
  ,output p_ddr_cs_n_o
  ,output p_ddr_ras_n_o
  ,output p_ddr_cas_n_o
  ,output p_ddr_we_n_o
  // ddr interface output control signals
  ,output p_ddr_reset_n_o
  ,output p_ddr_odt_o
  // ddr interface bank address
  ,output p_ddr_ba_0_o
  ,output p_ddr_ba_1_o
  ,output p_ddr_ba_2_o
  // ddr interface address bus
  ,output p_ddr_addr_0_o
  ,output p_ddr_addr_1_o
  ,output p_ddr_addr_2_o
  ,output p_ddr_addr_3_o
  ,output p_ddr_addr_4_o
  ,output p_ddr_addr_5_o
  ,output p_ddr_addr_6_o
  ,output p_ddr_addr_7_o
  ,output p_ddr_addr_8_o
  ,output p_ddr_addr_9_o
  ,output p_ddr_addr_10_o
  ,output p_ddr_addr_11_o
  ,output p_ddr_addr_12_o
  ,output p_ddr_addr_13_o
  ,output p_ddr_addr_14_o
  ,output p_ddr_addr_15_o
  // 32-bit ddr interface data mask
  ,output p_ddr_dm_0_o
  ,output p_ddr_dm_1_o
  ,output p_ddr_dm_2_o
  ,output p_ddr_dm_3_o
  // 32-bit ddr interface dq strobe signals
  ,inout  p_ddr_dqs_p_0_io, inout  p_ddr_dqs_n_0_io
  ,inout  p_ddr_dqs_p_1_io, inout  p_ddr_dqs_n_1_io
  ,inout  p_ddr_dqs_p_2_io, inout  p_ddr_dqs_n_2_io
  ,inout  p_ddr_dqs_p_3_io, inout  p_ddr_dqs_n_3_io
  // ddr interface data bus
  ,inout  p_ddr_dq_0_io
  ,inout  p_ddr_dq_1_io
  ,inout  p_ddr_dq_2_io
  ,inout  p_ddr_dq_3_io
  ,inout  p_ddr_dq_4_io
  ,inout  p_ddr_dq_5_io
  ,inout  p_ddr_dq_6_io
  ,inout  p_ddr_dq_7_io
  ,inout  p_ddr_dq_8_io
  ,inout  p_ddr_dq_9_io
  ,inout  p_ddr_dq_10_io
  ,inout  p_ddr_dq_11_io
  ,inout  p_ddr_dq_12_io
  ,inout  p_ddr_dq_13_io
  ,inout  p_ddr_dq_14_io
  ,inout  p_ddr_dq_15_io
  ,inout  p_ddr_dq_16_io
  ,inout  p_ddr_dq_17_io
  ,inout  p_ddr_dq_18_io
  ,inout  p_ddr_dq_19_io
  ,inout  p_ddr_dq_20_io
  ,inout  p_ddr_dq_21_io
  ,inout  p_ddr_dq_22_io
  ,inout  p_ddr_dq_23_io
  ,inout  p_ddr_dq_24_io
  ,inout  p_ddr_dq_25_io
  ,inout  p_ddr_dq_26_io
  ,inout  p_ddr_dq_27_io
  ,inout  p_ddr_dq_28_io
  ,inout  p_ddr_dq_29_io
  ,inout  p_ddr_dq_30_io
  ,inout  p_ddr_dq_31_io
  // bsg tag interface, 5 pins
  ,input  p_bsg_tag_clk_i
  ,input  p_bsg_tag_en_i
  ,input  p_bsg_tag_data_i
  ,output p_bsg_tag_clk_o
  ,output p_bsg_tag_data_o
  // clock and reset interface, 9 pins
  // clock input signals
  ,input  p_clk_A_i
  ,input  p_clk_B_i
  ,input  p_clk_C_i
  // clock output signal
  ,output p_clk_o
  // 3-bit clock selection signals
  ,input  p_sel_0_i
  ,input  p_sel_1_i
  ,input  p_sel_2_i
  // asynchronous reset signals
  ,input  p_clk_async_reset_i
  ,input  p_core_async_reset_i
  // miscellaneous signal, 1 pin
  ,output p_misc_o);
// End UW BGA PAD Definitions
// **********************************************************************
