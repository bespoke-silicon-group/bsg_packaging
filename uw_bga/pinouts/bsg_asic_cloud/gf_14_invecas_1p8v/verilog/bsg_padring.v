
// IMPORTANT NOTE: It is strongly recommended to set a "dont touch" attribute
// on every instance of a bsg_padring module. There can be control signals and
// dedicated tie-off cells that you don't want modified during synthesis.

module bsg_padring
  import bsg_iopad_macros_pkg::*;

#(parameter disable_ci_clk_i = 0
, parameter disable_ci_v_i = 0
, parameter disable_ci_tkn_o = 0
, parameter disable_ci_0_i = 0
, parameter disable_ci_1_i = 0
, parameter disable_ci_2_i = 0
, parameter disable_ci_3_i = 0
, parameter disable_ci_4_i = 0
, parameter disable_ci_5_i = 0
, parameter disable_ci_6_i = 0
, parameter disable_ci_7_i = 0
, parameter disable_ci_8_i = 0
, parameter disable_co_clk_i = 0
, parameter disable_co_v_i = 0
, parameter disable_co_tkn_o = 0
, parameter disable_co_0_i = 0
, parameter disable_co_1_i = 0
, parameter disable_co_2_i = 0
, parameter disable_co_3_i = 0
, parameter disable_co_4_i = 0
, parameter disable_co_5_i = 0
, parameter disable_co_6_i = 0
, parameter disable_co_7_i = 0
, parameter disable_co_8_i = 0
, parameter disable_ci2_clk_o = 0
, parameter disable_ci2_v_o = 0
, parameter disable_ci2_tkn_i = 0
, parameter disable_ci2_0_o = 0
, parameter disable_ci2_1_o = 0
, parameter disable_ci2_2_o = 0
, parameter disable_ci2_3_o = 0
, parameter disable_ci2_4_o = 0
, parameter disable_ci2_5_o = 0
, parameter disable_ci2_6_o = 0
, parameter disable_ci2_7_o = 0
, parameter disable_ci2_8_o = 0
, parameter disable_co2_clk_o = 0
, parameter disable_co2_v_o = 0
, parameter disable_co2_tkn_i = 0
, parameter disable_co2_0_o = 0
, parameter disable_co2_1_o = 0
, parameter disable_co2_2_o = 0
, parameter disable_co2_3_o = 0
, parameter disable_co2_4_o = 0
, parameter disable_co2_5_o = 0
, parameter disable_co2_6_o = 0
, parameter disable_co2_7_o = 0
, parameter disable_co2_8_o = 0
, parameter disable_ddr_ck_p_o = 0
, parameter disable_ddr_ck_n_o = 0
, parameter disable_ddr_cke_o = 0
, parameter disable_ddr_cs_n_o = 0
, parameter disable_ddr_ras_n_o = 0
, parameter disable_ddr_cas_n_o = 0
, parameter disable_ddr_we_n_o = 0
, parameter disable_ddr_reset_n_o = 0
, parameter disable_ddr_odt_o = 0
, parameter disable_ddr_ba_0_o = 0
, parameter disable_ddr_ba_1_o = 0
, parameter disable_ddr_ba_2_o = 0
, parameter disable_ddr_addr_0_o = 0
, parameter disable_ddr_addr_1_o = 0
, parameter disable_ddr_addr_2_o = 0
, parameter disable_ddr_addr_3_o = 0
, parameter disable_ddr_addr_4_o = 0
, parameter disable_ddr_addr_5_o = 0
, parameter disable_ddr_addr_6_o = 0
, parameter disable_ddr_addr_7_o = 0
, parameter disable_ddr_addr_8_o = 0
, parameter disable_ddr_addr_9_o = 0
, parameter disable_ddr_addr_10_o = 0
, parameter disable_ddr_addr_11_o = 0
, parameter disable_ddr_addr_12_o = 0
, parameter disable_ddr_addr_13_o = 0
, parameter disable_ddr_addr_14_o = 0
, parameter disable_ddr_addr_15_o = 0
, parameter disable_ddr_dm_0_o = 0
, parameter disable_ddr_dm_1_o = 0
, parameter disable_ddr_dm_2_o = 0
, parameter disable_ddr_dm_3_o = 0
, parameter disable_ddr_dqs_p_0_io = 0
, parameter disable_ddr_dqs_n_0_io = 0
, parameter disable_ddr_dqs_p_1_io = 0
, parameter disable_ddr_dqs_n_1_io = 0
, parameter disable_ddr_dqs_p_2_io = 0
, parameter disable_ddr_dqs_n_2_io = 0
, parameter disable_ddr_dqs_p_3_io = 0
, parameter disable_ddr_dqs_n_3_io = 0
, parameter disable_ddr_dq_0_io = 0
, parameter disable_ddr_dq_1_io = 0
, parameter disable_ddr_dq_2_io = 0
, parameter disable_ddr_dq_3_io = 0
, parameter disable_ddr_dq_4_io = 0
, parameter disable_ddr_dq_5_io = 0
, parameter disable_ddr_dq_6_io = 0
, parameter disable_ddr_dq_7_io = 0
, parameter disable_ddr_dq_8_io = 0
, parameter disable_ddr_dq_9_io = 0
, parameter disable_ddr_dq_10_io = 0
, parameter disable_ddr_dq_11_io = 0
, parameter disable_ddr_dq_12_io = 0
, parameter disable_ddr_dq_13_io = 0
, parameter disable_ddr_dq_14_io = 0
, parameter disable_ddr_dq_15_io = 0
, parameter disable_ddr_dq_16_io = 0
, parameter disable_ddr_dq_17_io = 0
, parameter disable_ddr_dq_18_io = 0
, parameter disable_ddr_dq_19_io = 0
, parameter disable_ddr_dq_20_io = 0
, parameter disable_ddr_dq_21_io = 0
, parameter disable_ddr_dq_22_io = 0
, parameter disable_ddr_dq_23_io = 0
, parameter disable_ddr_dq_24_io = 0
, parameter disable_ddr_dq_25_io = 0
, parameter disable_ddr_dq_26_io = 0
, parameter disable_ddr_dq_27_io = 0
, parameter disable_ddr_dq_28_io = 0
, parameter disable_ddr_dq_29_io = 0
, parameter disable_ddr_dq_30_io = 0
, parameter disable_ddr_dq_31_io = 0
, parameter disable_bsg_tag_clk_i = 0
, parameter disable_bsg_tag_en_i = 0
, parameter disable_bsg_tag_data_i = 0
, parameter disable_bsg_tag_clk_o = 0
, parameter disable_bsg_tag_data_o = 0
, parameter disable_clk_A_i = 0
, parameter disable_clk_B_i = 0
, parameter disable_clk_C_i = 0
, parameter disable_clk_o = 0
, parameter disable_sel_0_i = 0
, parameter disable_sel_1_i = 0
, parameter disable_sel_2_i = 0
, parameter disable_clk_async_reset_i = 0
, parameter disable_core_async_reset_i = 0
, parameter disable_misc_o = 0
)

// TOP-LVL PORTS               CORE SIDE PINS
(input  p_ci_clk_i            ,output c_ci_clk_o
,input  p_ci_v_i              ,output c_ci_v_o
,output p_ci_tkn_o            ,input  c_ci_tkn_i
,input  p_ci_0_i              ,output c_ci_0_o
,input  p_ci_1_i              ,output c_ci_1_o
,input  p_ci_2_i              ,output c_ci_2_o
,input  p_ci_3_i              ,output c_ci_3_o
,input  p_ci_4_i              ,output c_ci_4_o
,input  p_ci_5_i              ,output c_ci_5_o
,input  p_ci_6_i              ,output c_ci_6_o
,input  p_ci_7_i              ,output c_ci_7_o
,input  p_ci_8_i              ,output c_ci_8_o

,input  p_co_clk_i            ,input  c_co_clk_i // swizzled to p_ci2_clk_o
,input  p_co_v_i              ,input  c_co_v_i   // swizzled to p_ci2_5_o
,output p_co_tkn_o            ,output c_co_tkn_o // swizzled to p_ci2_tkn_i
,input  p_co_0_i              ,input  c_co_0_i   // swizzled to p_ci2_8_o
,input  p_co_1_i              ,input  c_co_1_i   // swizzled to p_ci2_7_o
,input  p_co_2_i              ,input  c_co_2_i   // swizzled to p_ci2_6_o
,input  p_co_3_i              ,input  c_co_3_i   // swizzled to p_ci2_4_o
,input  p_co_4_i              ,input  c_co_4_i   // swizzled to p_ci2_v_o
,input  p_co_5_i              ,input  c_co_5_i   // swizzled to p_ci2_1_o
,input  p_co_6_i              ,input  c_co_6_i   // swizzled to p_ci2_0_o
,input  p_co_7_i              ,input  c_co_7_i   // swizzled to p_ci2_2_o
,input  p_co_8_i              ,input  c_co_8_i   // swizzled to p_ci2_3_o

,output p_ci2_clk_o           ,output c_ci2_clk_o // swizzled to p_co_clk_i
,output p_ci2_v_o             ,output c_ci2_v_o   // swizzled to p_co_v_i
,input  p_ci2_tkn_i           ,input  c_ci2_tkn_i // swizzled to p_co_tkn_o
,output p_ci2_0_o             ,output c_ci2_0_o   // swizzled to p_co_0_i
,output p_ci2_1_o             ,output c_ci2_1_o   // swizzled to p_co_1_i
,output p_ci2_2_o             ,output c_ci2_2_o   // swizzled to p_co_2_i
,output p_ci2_3_o             ,output c_ci2_3_o   // swizzled to p_co_3_i
,output p_ci2_4_o             ,output c_ci2_4_o   // swizzled to p_co_4_i
,output p_ci2_5_o             ,output c_ci2_5_o   // swizzled to p_co_5_i
,output p_ci2_6_o             ,output c_ci2_6_o   // swizzled to p_co_6_i
,output p_ci2_7_o             ,output c_ci2_7_o   // swizzled to p_co_7_i
,output p_ci2_8_o             ,output c_ci2_8_o   // swizzled to p_co_8_i

,output p_co2_clk_o           ,input  c_co2_clk_i
,output p_co2_v_o             ,input  c_co2_v_i   // swizzled to p_co2_2_o
,input  p_co2_tkn_i           ,output c_co2_tkn_o
,output p_co2_0_o             ,input  c_co2_0_i   // swizzled to p_co2_8_o
,output p_co2_1_o             ,input  c_co2_1_i   // swizzled to p_co2_7_o
,output p_co2_2_o             ,input  c_co2_2_i   // swizzled to p_co2_6_o
,output p_co2_3_o             ,input  c_co2_3_i   // swizzled to p_co2_5_o
,output p_co2_4_o             ,input  c_co2_4_i   // swizzled to p_co2_v_o
,output p_co2_5_o             ,input  c_co2_5_i   // swizzled to p_co2_4_o
,output p_co2_6_o             ,input  c_co2_6_i   // swizzled to p_co2_3_o
,output p_co2_7_o             ,input  c_co2_7_i   // swizzled to p_co2_1_o
,output p_co2_8_o             ,input  c_co2_8_i   // swizzled to p_co2_0_o

,output p_ddr_ck_p_o          ,input  c_ddr_ck_p_i
,output p_ddr_ck_n_o          ,input  c_ddr_ck_n_i

,output p_ddr_cke_o           ,input  c_ddr_cke_i

,output p_ddr_cs_n_o          ,input  c_ddr_cs_n_i
,output p_ddr_ras_n_o         ,input  c_ddr_ras_n_i
,output p_ddr_cas_n_o         ,input  c_ddr_cas_n_i
,output p_ddr_we_n_o          ,input  c_ddr_we_n_i

,output p_ddr_reset_n_o       ,input  c_ddr_reset_n_i
,output p_ddr_odt_o           ,input  c_ddr_odt_i

,output p_ddr_ba_0_o          ,input  c_ddr_ba_0_i
,output p_ddr_ba_1_o          ,input  c_ddr_ba_1_i
,output p_ddr_ba_2_o          ,input  c_ddr_ba_2_i

,output p_ddr_addr_0_o        ,input  c_ddr_addr_0_i
,output p_ddr_addr_1_o        ,input  c_ddr_addr_1_i
,output p_ddr_addr_2_o        ,input  c_ddr_addr_2_i
,output p_ddr_addr_3_o        ,input  c_ddr_addr_3_i
,output p_ddr_addr_4_o        ,input  c_ddr_addr_4_i
,output p_ddr_addr_5_o        ,input  c_ddr_addr_5_i
,output p_ddr_addr_6_o        ,input  c_ddr_addr_6_i
,output p_ddr_addr_7_o        ,input  c_ddr_addr_7_i
,output p_ddr_addr_8_o        ,input  c_ddr_addr_8_i
,output p_ddr_addr_9_o        ,input  c_ddr_addr_9_i
,output p_ddr_addr_10_o       ,input  c_ddr_addr_10_i
,output p_ddr_addr_11_o       ,input  c_ddr_addr_11_i
,output p_ddr_addr_12_o       ,input  c_ddr_addr_12_i
,output p_ddr_addr_13_o       ,input  c_ddr_addr_13_i
,output p_ddr_addr_14_o       ,input  c_ddr_addr_14_i
,output p_ddr_addr_15_o       ,input  c_ddr_addr_15_i

,output p_ddr_dm_0_o          ,input  c_ddr_dm_0_i
,output p_ddr_dm_1_o          ,input  c_ddr_dm_1_i
,output p_ddr_dm_2_o          ,input  c_ddr_dm_2_i
,output p_ddr_dm_3_o          ,input  c_ddr_dm_3_i

,inout  p_ddr_dqs_p_0_io      ,output c_ddr_dqs_p_0_o   ,input  c_ddr_dqs_p_0_i   ,input  c_ddr_dqs_p_0_oen_i
,inout  p_ddr_dqs_n_0_io      ,output c_ddr_dqs_n_0_o   ,input  c_ddr_dqs_n_0_i   ,input  c_ddr_dqs_n_0_oen_i
,inout  p_ddr_dqs_p_1_io      ,output c_ddr_dqs_p_1_o   ,input  c_ddr_dqs_p_1_i   ,input  c_ddr_dqs_p_1_oen_i
,inout  p_ddr_dqs_n_1_io      ,output c_ddr_dqs_n_1_o   ,input  c_ddr_dqs_n_1_i   ,input  c_ddr_dqs_n_1_oen_i
,inout  p_ddr_dqs_p_2_io      ,output c_ddr_dqs_p_2_o   ,input  c_ddr_dqs_p_2_i   ,input  c_ddr_dqs_p_2_oen_i
,inout  p_ddr_dqs_n_2_io      ,output c_ddr_dqs_n_2_o   ,input  c_ddr_dqs_n_2_i   ,input  c_ddr_dqs_n_2_oen_i
,inout  p_ddr_dqs_p_3_io      ,output c_ddr_dqs_p_3_o   ,input  c_ddr_dqs_p_3_i   ,input  c_ddr_dqs_p_3_oen_i
,inout  p_ddr_dqs_n_3_io      ,output c_ddr_dqs_n_3_o   ,input  c_ddr_dqs_n_3_i   ,input  c_ddr_dqs_n_3_oen_i

,inout  p_ddr_dq_0_io         ,output c_ddr_dq_0_o      ,input  c_ddr_dq_0_i      ,input  c_ddr_dq_0_oen_i
,inout  p_ddr_dq_1_io         ,output c_ddr_dq_1_o      ,input  c_ddr_dq_1_i      ,input  c_ddr_dq_1_oen_i
,inout  p_ddr_dq_2_io         ,output c_ddr_dq_2_o      ,input  c_ddr_dq_2_i      ,input  c_ddr_dq_2_oen_i
,inout  p_ddr_dq_3_io         ,output c_ddr_dq_3_o      ,input  c_ddr_dq_3_i      ,input  c_ddr_dq_3_oen_i
,inout  p_ddr_dq_4_io         ,output c_ddr_dq_4_o      ,input  c_ddr_dq_4_i      ,input  c_ddr_dq_4_oen_i
,inout  p_ddr_dq_5_io         ,output c_ddr_dq_5_o      ,input  c_ddr_dq_5_i      ,input  c_ddr_dq_5_oen_i
,inout  p_ddr_dq_6_io         ,output c_ddr_dq_6_o      ,input  c_ddr_dq_6_i      ,input  c_ddr_dq_6_oen_i
,inout  p_ddr_dq_7_io         ,output c_ddr_dq_7_o      ,input  c_ddr_dq_7_i      ,input  c_ddr_dq_7_oen_i
,inout  p_ddr_dq_8_io         ,output c_ddr_dq_8_o      ,input  c_ddr_dq_8_i      ,input  c_ddr_dq_8_oen_i
,inout  p_ddr_dq_9_io         ,output c_ddr_dq_9_o      ,input  c_ddr_dq_9_i      ,input  c_ddr_dq_9_oen_i
,inout  p_ddr_dq_10_io        ,output c_ddr_dq_10_o     ,input  c_ddr_dq_10_i     ,input  c_ddr_dq_10_oen_i
,inout  p_ddr_dq_11_io        ,output c_ddr_dq_11_o     ,input  c_ddr_dq_11_i     ,input  c_ddr_dq_11_oen_i
,inout  p_ddr_dq_12_io        ,output c_ddr_dq_12_o     ,input  c_ddr_dq_12_i     ,input  c_ddr_dq_12_oen_i
,inout  p_ddr_dq_13_io        ,output c_ddr_dq_13_o     ,input  c_ddr_dq_13_i     ,input  c_ddr_dq_13_oen_i
,inout  p_ddr_dq_14_io        ,output c_ddr_dq_14_o     ,input  c_ddr_dq_14_i     ,input  c_ddr_dq_14_oen_i
,inout  p_ddr_dq_15_io        ,output c_ddr_dq_15_o     ,input  c_ddr_dq_15_i     ,input  c_ddr_dq_15_oen_i
,inout  p_ddr_dq_16_io        ,output c_ddr_dq_16_o     ,input  c_ddr_dq_16_i     ,input  c_ddr_dq_16_oen_i
,inout  p_ddr_dq_17_io        ,output c_ddr_dq_17_o     ,input  c_ddr_dq_17_i     ,input  c_ddr_dq_17_oen_i
,inout  p_ddr_dq_18_io        ,output c_ddr_dq_18_o     ,input  c_ddr_dq_18_i     ,input  c_ddr_dq_18_oen_i
,inout  p_ddr_dq_19_io        ,output c_ddr_dq_19_o     ,input  c_ddr_dq_19_i     ,input  c_ddr_dq_19_oen_i
,inout  p_ddr_dq_20_io        ,output c_ddr_dq_20_o     ,input  c_ddr_dq_20_i     ,input  c_ddr_dq_20_oen_i
,inout  p_ddr_dq_21_io        ,output c_ddr_dq_21_o     ,input  c_ddr_dq_21_i     ,input  c_ddr_dq_21_oen_i
,inout  p_ddr_dq_22_io        ,output c_ddr_dq_22_o     ,input  c_ddr_dq_22_i     ,input  c_ddr_dq_22_oen_i
,inout  p_ddr_dq_23_io        ,output c_ddr_dq_23_o     ,input  c_ddr_dq_23_i     ,input  c_ddr_dq_23_oen_i
,inout  p_ddr_dq_24_io        ,output c_ddr_dq_24_o     ,input  c_ddr_dq_24_i     ,input  c_ddr_dq_24_oen_i
,inout  p_ddr_dq_25_io        ,output c_ddr_dq_25_o     ,input  c_ddr_dq_25_i     ,input  c_ddr_dq_25_oen_i
,inout  p_ddr_dq_26_io        ,output c_ddr_dq_26_o     ,input  c_ddr_dq_26_i     ,input  c_ddr_dq_26_oen_i
,inout  p_ddr_dq_27_io        ,output c_ddr_dq_27_o     ,input  c_ddr_dq_27_i     ,input  c_ddr_dq_27_oen_i
,inout  p_ddr_dq_28_io        ,output c_ddr_dq_28_o     ,input  c_ddr_dq_28_i     ,input  c_ddr_dq_28_oen_i
,inout  p_ddr_dq_29_io        ,output c_ddr_dq_29_o     ,input  c_ddr_dq_29_i     ,input  c_ddr_dq_29_oen_i
,inout  p_ddr_dq_30_io        ,output c_ddr_dq_30_o     ,input  c_ddr_dq_30_i     ,input  c_ddr_dq_30_oen_i
,inout  p_ddr_dq_31_io        ,output c_ddr_dq_31_o     ,input  c_ddr_dq_31_i     ,input  c_ddr_dq_31_oen_i

,input  p_bsg_tag_clk_i       ,output c_bsg_tag_clk_o
,input  p_bsg_tag_en_i        ,output c_bsg_tag_en_o
,input  p_bsg_tag_data_i      ,output c_bsg_tag_data_o
,output p_bsg_tag_clk_o       ,input  c_bsg_tag_clk_i
,output p_bsg_tag_data_o      ,input  c_bsg_tag_data_i

,input  p_clk_A_i             ,output c_clk_A_o
,input  p_clk_B_i             ,output c_clk_B_o
,input  p_clk_C_i             ,output c_clk_C_o

,output p_clk_o               ,input  c_clk_i

,input  p_sel_0_i             ,output c_sel_0_o
,input  p_sel_1_i             ,output c_sel_1_o
,input  p_sel_2_i             ,output c_sel_2_o

,input  p_clk_async_reset_i   ,output c_clk_async_reset_o
,input  p_core_async_reset_i  ,output c_core_async_reset_o

,output p_misc_o              ,input  c_misc_i
);

// IMPORTANT: These nets can get clobbered in synthesis therefore it is
// useful to set a "dont_touch" attribute on them to be safe. The are routed
// through the padring therefore you don't them to be buffered or tied off.
wire [20:0] retc_lo, pwrok_lo, iopwrok_lo;

////////////////////////////////////////////////////////////////////////////////
// BEGIN WEST SIDE
//

`BSG_BREAKER_PAD(ctrl_brk_l_0,IN12LP_GPIO18_13M9S30P_CTRL_BRK_H,20,0)

`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_8,IN12LP_GPIO18_13M9S30P_IO_H,0)
`BSG_PHYSICAL_ONLY_PAD(vdd_l_0,IN12LP_GPIO18_13M9S30P_VDDC_H,0)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_9,IN12LP_GPIO18_13M9S30P_IO_H,0)
`BSG_PHYSICAL_ONLY_PAD(vss_l_0,IN12LP_GPIO18_13M9S30P_VSSC_H,0)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_10,IN12LP_GPIO18_13M9S30P_IO_H,0)
`BSG_PHYSICAL_ONLY_PAD(v18_l_0,IN12LP_GPIO18_13M9S30P_VDDIO_H,0)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_11,IN12LP_GPIO18_13M9S30P_IO_H,0)
`BSG_PHYSICAL_ONLY_PAD(vzz_l_0,IN12LP_GPIO18_13M9S30P_VSSIO_H,0)
`BSG_POWER_CONTROL_PAD(pwrdet_l_0,IN12LP_GPIO18_13M9S30P_PWRDET_H,0)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_12,IN12LP_GPIO18_13M9S30P_IO_H,0)
`BSG_PHYSICAL_ONLY_PAD(vdd_l_1,IN12LP_GPIO18_13M9S30P_VDDC_H,0)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_13,IN12LP_GPIO18_13M9S30P_IO_H,0)
`BSG_PHYSICAL_ONLY_PAD(vss_l_1,IN12LP_GPIO18_13M9S30P_VSSC_H,0)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_14,IN12LP_GPIO18_13M9S30P_IO_H,0)
`BSG_PHYSICAL_ONLY_PAD(v18_l_1,IN12LP_GPIO18_13M9S30P_VDDIO_H,0)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_15,IN12LP_GPIO18_13M9S30P_IO_H,0)
`BSG_PHYSICAL_ONLY_PAD(vzz_l_1,IN12LP_GPIO18_13M9S30P_VSSIO_H,0)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dqs_p_0,IN12LP_GPIO18_13M9S30P_IO_H,0)

`BSG_BREAKER_PAD(ctrl_brk_l_1,IN12LP_GPIO18_13M9S30P_CTRL_BRK_H,0,1)

`BSG_PHYSICAL_ONLY_PAD(vdd_l_2,IN12LP_GPIO18_13M9S30P_VDDC_H,1)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dqs_n_0,IN12LP_GPIO18_13M9S30P_IO_H,1)
`BSG_PHYSICAL_ONLY_PAD(vss_l_2,IN12LP_GPIO18_13M9S30P_VSSC_H,1)
`BSG_IO_OUT_DISABLE_PARAM(ddr_dm_0,IN12LP_GPIO18_13M9S30P_IO_H,1)
`BSG_PHYSICAL_ONLY_PAD(v18_l_2,IN12LP_GPIO18_13M9S30P_VDDIO_H,1)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_0,IN12LP_GPIO18_13M9S30P_IO_H,1)
`BSG_PHYSICAL_ONLY_PAD(vzz_l_2,IN12LP_GPIO18_13M9S30P_VSSIO_H,1)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_1,IN12LP_GPIO18_13M9S30P_IO_H,1)
`BSG_POWER_CONTROL_PAD(pwrdet_l_1,IN12LP_GPIO18_13M9S30P_PWRDET_H,1)
`BSG_PHYSICAL_ONLY_PAD(vdd_l_3,IN12LP_GPIO18_13M9S30P_VDDC_H,1)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_2,IN12LP_GPIO18_13M9S30P_IO_H,1)
`BSG_PHYSICAL_ONLY_PAD(vss_l_3,IN12LP_GPIO18_13M9S30P_VSSC_H,1)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_3,IN12LP_GPIO18_13M9S30P_IO_H,1)
`BSG_PHYSICAL_ONLY_PAD(v18_l_3,IN12LP_GPIO18_13M9S30P_VDDIO_H,1)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_4,IN12LP_GPIO18_13M9S30P_IO_H,1)
`BSG_PHYSICAL_ONLY_PAD(vzz_l_3,IN12LP_GPIO18_13M9S30P_VSSIO_H,1)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_5,IN12LP_GPIO18_13M9S30P_IO_H,1)

`BSG_BREAKER_PAD(ctrl_brk_l_2,IN12LP_GPIO18_13M9S30P_CTRL_BRK_H,1,2)

`BSG_PHYSICAL_ONLY_PAD(vdd_l_4,IN12LP_GPIO18_13M9S30P_VDDC_H,2)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_6,IN12LP_GPIO18_13M9S30P_IO_H,2)
`BSG_PHYSICAL_ONLY_PAD(vss_l_4,IN12LP_GPIO18_13M9S30P_VSSC_H,2)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_7,IN12LP_GPIO18_13M9S30P_IO_H,2)
`BSG_PHYSICAL_ONLY_PAD(v18_l_4,IN12LP_GPIO18_13M9S30P_VDDIO_H,2)
`BSG_IO_OUT_DISABLE_PARAM(bsg_tag_data,IN12LP_GPIO18_13M9S30P_IO_H,2)
`BSG_PHYSICAL_ONLY_PAD(vzz_l_4,IN12LP_GPIO18_13M9S30P_VSSIO_H,2)
`BSG_IO_OUT_DISABLE_PARAM(bsg_tag_clk,IN12LP_GPIO18_13M9S30P_IO_H,2)
`BSG_POWER_CONTROL_PAD(pwrdet_l_2,IN12LP_GPIO18_13M9S30P_PWRDET_H,2)
`BSG_PHYSICAL_ONLY_PAD(vdd_l_5,IN12LP_GPIO18_13M9S30P_VDDC_H,2)
`BSG_IO_OUT_DISABLE_PARAM(co2_0,IN12LP_GPIO18_13M9S30P_IO_H,2)
`BSG_PHYSICAL_ONLY_PAD(vss_l_5,IN12LP_GPIO18_13M9S30P_VSSC_H,2)
`BSG_IO_OUT_DISABLE_PARAM(co2_1,IN12LP_GPIO18_13M9S30P_IO_H,2)
`BSG_PHYSICAL_ONLY_PAD(v18_l_5,IN12LP_GPIO18_13M9S30P_VDDIO_H,2)
`BSG_IO_OUT_DISABLE_PARAM(co2_2,IN12LP_GPIO18_13M9S30P_IO_H,2)
`BSG_PHYSICAL_ONLY_PAD(vzz_l_5,IN12LP_GPIO18_13M9S30P_VSSIO_H,2)
`BSG_IO_OUT_DISABLE_PARAM(co2_3,IN12LP_GPIO18_13M9S30P_IO_H,2)

`BSG_BREAKER_PAD(ctrl_brk_l_3,IN12LP_GPIO18_13M9S30P_CTRL_BRK_H,2,3)

`BSG_PHYSICAL_ONLY_PAD(vdd_l_6,IN12LP_GPIO18_13M9S30P_VDDC_H,3)
`BSG_IO_OUT_DISABLE_PARAM(co2_4,IN12LP_GPIO18_13M9S30P_IO_H,3)
`BSG_PHYSICAL_ONLY_PAD(vss_l_6,IN12LP_GPIO18_13M9S30P_VSSC_H,3)
`BSG_IO_OUT_DISABLE_PARAM(co2_clk,IN12LP_GPIO18_13M9S30P_IO_H,3)
`BSG_PHYSICAL_ONLY_PAD(v18_l_6,IN12LP_GPIO18_13M9S30P_VDDIO_H,3)
`BSG_IO_IN_DISABLE_PARAM(co2_tkn,IN12LP_GPIO18_13M9S30P_IO_H,3)
`BSG_PHYSICAL_ONLY_PAD(vzz_l_6,IN12LP_GPIO18_13M9S30P_VSSIO_H,3)
`BSG_IO_OUT_DISABLE_PARAM(co2_v,IN12LP_GPIO18_13M9S30P_IO_H,3)
`BSG_POWER_CONTROL_PAD(pwrdet_l_3,IN12LP_GPIO18_13M9S30P_PWRDET_H,3)
`BSG_PHYSICAL_ONLY_PAD(vdd_l_7,IN12LP_GPIO18_13M9S30P_VDDC_H,3)
`BSG_IO_OUT_DISABLE_PARAM(co2_5,IN12LP_GPIO18_13M9S30P_IO_H,3)
`BSG_PHYSICAL_ONLY_PAD(vss_l_7,IN12LP_GPIO18_13M9S30P_VSSC_H,3)
`BSG_IO_OUT_DISABLE_PARAM(co2_6,IN12LP_GPIO18_13M9S30P_IO_H,3)
`BSG_PHYSICAL_ONLY_PAD(v18_l_7,IN12LP_GPIO18_13M9S30P_VDDIO_H,3)
`BSG_IO_OUT_DISABLE_PARAM(co2_7,IN12LP_GPIO18_13M9S30P_IO_H,3)
`BSG_PHYSICAL_ONLY_PAD(vzz_l_7,IN12LP_GPIO18_13M9S30P_VSSIO_H,3)
`BSG_IO_OUT_DISABLE_PARAM(co2_8,IN12LP_GPIO18_13M9S30P_IO_H,3)

`BSG_BREAKER_PAD(ctrl_brk_l_4,IN12LP_GPIO18_13M9S30P_CTRL_BRK_H,3,4)

//
// END WEST SIDE
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// BEGIN NORTH SIDE
//

`BSG_BREAKER_PAD(ctrl_brk_t_0,IN12LP_GPIO18_13M9S30P_CTRL_BRK_V,4,5)

`BSG_PHYSICAL_ONLY_PAD(vdd_t_0,IN12LP_GPIO18_13M9S30P_VDDC_V,5)
`BSG_IO_IN_DISABLE_PARAM(co_0,IN12LP_GPIO18_13M9S30P_IO_V,5)
`BSG_PHYSICAL_ONLY_PAD(vss_t_0,IN12LP_GPIO18_13M9S30P_VSSC_V,5)
`BSG_IO_IN_DISABLE_PARAM(co_1,IN12LP_GPIO18_13M9S30P_IO_V,5)
`BSG_PHYSICAL_ONLY_PAD(v18_t_0,IN12LP_GPIO18_13M9S30P_VDDIO_V,5)
`BSG_IO_IN_DISABLE_PARAM(co_2,IN12LP_GPIO18_13M9S30P_IO_V,5)
`BSG_PHYSICAL_ONLY_PAD(vzz_t_0,IN12LP_GPIO18_13M9S30P_VSSIO_V,5)
`BSG_POWER_CONTROL_PAD(pwrdet_t_0,IN12LP_GPIO18_13M9S30P_PWRDET_V,5)
`BSG_IO_IN_DISABLE_PARAM(co_3,IN12LP_GPIO18_13M9S30P_IO_V,5)
`BSG_PHYSICAL_ONLY_PAD(vdd_t_1,IN12LP_GPIO18_13M9S30P_VDDC_V,5)
`BSG_IO_IN_DISABLE_PARAM(co_4,IN12LP_GPIO18_13M9S30P_IO_V,5)
`BSG_PHYSICAL_ONLY_PAD(vss_t_1,IN12LP_GPIO18_13M9S30P_VSSC_V,5)
`BSG_IO_IN_DISABLE_PARAM(co_clk,IN12LP_GPIO18_13M9S30P_IO_V,5)
`BSG_PHYSICAL_ONLY_PAD(v18_t_1,IN12LP_GPIO18_13M9S30P_VDDIO_V,5)
`BSG_IO_OUT_DISABLE_PARAM(co_tkn,IN12LP_GPIO18_13M9S30P_IO_V,5)

`BSG_BREAKER_PAD(ctrl_brk_t_1,IN12LP_GPIO18_13M9S30P_CTRL_BRK_V,5,6)

`BSG_PHYSICAL_ONLY_PAD(vzz_t_1,IN12LP_GPIO18_13M9S30P_VSSIO_V,6)
`BSG_IO_IN_DISABLE_PARAM(co_v,IN12LP_GPIO18_13M9S30P_IO_V,6)
`BSG_PHYSICAL_ONLY_PAD(vdd_t_2,IN12LP_GPIO18_13M9S30P_VDDC_V,6)
`BSG_IO_IN_DISABLE_PARAM(co_5,IN12LP_GPIO18_13M9S30P_IO_V,6)
`BSG_PHYSICAL_ONLY_PAD(vss_t_2,IN12LP_GPIO18_13M9S30P_VSSC_V,6)
`BSG_IO_IN_DISABLE_PARAM(co_6,IN12LP_GPIO18_13M9S30P_IO_V,6)
`BSG_PHYSICAL_ONLY_PAD(v18_t_2,IN12LP_GPIO18_13M9S30P_VDDIO_V,6)
`BSG_POWER_CONTROL_PAD(pwrdet_t_1,IN12LP_GPIO18_13M9S30P_PWRDET_V,6)
`BSG_IO_IN_DISABLE_PARAM(co_7,IN12LP_GPIO18_13M9S30P_IO_V,6)
`BSG_PHYSICAL_ONLY_PAD(vzz_t_2,IN12LP_GPIO18_13M9S30P_VSSIO_V,6)
`BSG_IO_IN_DISABLE_PARAM(co_8,IN12LP_GPIO18_13M9S30P_IO_V,6)
`BSG_PHYSICAL_ONLY_PAD(vdd_t_3,IN12LP_GPIO18_13M9S30P_VDDC_V,6)
`BSG_IO_IN_DISABLE_PARAM(clk_A,IN12LP_GPIO18_13M9S30P_IO_V,6)
`BSG_PHYSICAL_ONLY_PAD(vss_t_3,IN12LP_GPIO18_13M9S30P_VSSC_V,6)
`BSG_IO_IN_DISABLE_PARAM(clk_B,IN12LP_GPIO18_13M9S30P_IO_V,6)

`BSG_BREAKER_PAD(brk_t_0,IN12LP_GPIO18_13M9S30P_BRK_V,6,7)

`BSG_PHYSICAL_ONLY_PAD(v18_t_3,IN12LP_GPIO18_13M9S30P_VDDIO_V,7)
`BSG_IO_IN_DISABLE_PARAM(clk_C,IN12LP_GPIO18_13M9S30P_IO_V,7)
`BSG_PHYSICAL_ONLY_PAD(vzz_t_3,IN12LP_GPIO18_13M9S30P_VSSIO_V,7)
`BSG_IO_OUT_DISABLE_PARAM(clk,IN12LP_GPIO18_13M9S30P_IO_V,7)
`BSG_POWER_CONTROL_PAD(pwrdet_pll_0,IN12LP_GPIO18_13M9S30P_PWRDET_V,7)
`BSG_PHYSICAL_ONLY_PAD(vss_pll,IN12LP_GPIO18_13M9S30P_VSSC_V,7)
`BSG_IO_IN_DISABLE_PARAM(clk_async_reset,IN12LP_GPIO18_13M9S30P_IO_V,7)
`BSG_PHYSICAL_ONLY_PAD(vdd_pll,IN12LP_GPIO18_13M9S30P_VDDC_V,7)
`BSG_IO_OUT_DISABLE_PARAM(misc,IN12LP_GPIO18_13M9S30P_IO_V,7)

`BSG_BREAKER_PAD(brk_t_1,IN12LP_GPIO18_13M9S30P_BRK_V,7,8)

`BSG_PHYSICAL_ONLY_PAD(vdd_t_4,IN12LP_GPIO18_13M9S30P_VDDC_V,8)
`BSG_IO_IN_DISABLE_PARAM(sel_0,IN12LP_GPIO18_13M9S30P_IO_V,8)
`BSG_PHYSICAL_ONLY_PAD(vss_t_4,IN12LP_GPIO18_13M9S30P_VSSC_V,8)
`BSG_IO_IN_DISABLE_PARAM(sel_1,IN12LP_GPIO18_13M9S30P_IO_V,8)
`BSG_PHYSICAL_ONLY_PAD(v18_t_4,IN12LP_GPIO18_13M9S30P_VDDIO_V,8)
`BSG_IO_IN_DISABLE_PARAM(sel_2,IN12LP_GPIO18_13M9S30P_IO_V,8)
`BSG_PHYSICAL_ONLY_PAD(vzz_t_4,IN12LP_GPIO18_13M9S30P_VSSIO_V,8)
`BSG_IO_IN_DISABLE_PARAM(core_async_reset,IN12LP_GPIO18_13M9S30P_IO_V,8)
`BSG_POWER_CONTROL_PAD(pwrdet_t_2,IN12LP_GPIO18_13M9S30P_PWRDET_V,8)
`BSG_PHYSICAL_ONLY_PAD(vdd_t_5,IN12LP_GPIO18_13M9S30P_VDDC_V,8)
`BSG_IO_OUT_DISABLE_PARAM(ci2_0,IN12LP_GPIO18_13M9S30P_IO_V,8)
`BSG_PHYSICAL_ONLY_PAD(vss_t_5,IN12LP_GPIO18_13M9S30P_VSSC_V,8)
`BSG_IO_OUT_DISABLE_PARAM(ci2_1,IN12LP_GPIO18_13M9S30P_IO_V,8)
`BSG_PHYSICAL_ONLY_PAD(v18_t_5,IN12LP_GPIO18_13M9S30P_VDDIO_V,8)
`BSG_IO_OUT_DISABLE_PARAM(ci2_2,IN12LP_GPIO18_13M9S30P_IO_V,8)
`BSG_PHYSICAL_ONLY_PAD(vzz_t_5,IN12LP_GPIO18_13M9S30P_VSSIO_V,8)
`BSG_IO_OUT_DISABLE_PARAM(ci2_3,IN12LP_GPIO18_13M9S30P_IO_V,8)

`BSG_BREAKER_PAD(ctrl_brk_t_2,IN12LP_GPIO18_13M9S30P_CTRL_BRK_V,8,9)

`BSG_PHYSICAL_ONLY_PAD(vdd_t_6,IN12LP_GPIO18_13M9S30P_VDDC_V,9)
`BSG_IO_OUT_DISABLE_PARAM(ci2_4,IN12LP_GPIO18_13M9S30P_IO_V,9)
`BSG_PHYSICAL_ONLY_PAD(vss_t_6,IN12LP_GPIO18_13M9S30P_VSSC_V,9)
`BSG_IO_OUT_DISABLE_PARAM(ci2_clk,IN12LP_GPIO18_13M9S30P_IO_V,9)
`BSG_PHYSICAL_ONLY_PAD(v18_t_6,IN12LP_GPIO18_13M9S30P_VDDIO_V,9)
`BSG_IO_IN_DISABLE_PARAM(ci2_tkn,IN12LP_GPIO18_13M9S30P_IO_V,9)
`BSG_PHYSICAL_ONLY_PAD(vzz_t_6,IN12LP_GPIO18_13M9S30P_VSSIO_V,9)
`BSG_IO_OUT_DISABLE_PARAM(ci2_v,IN12LP_GPIO18_13M9S30P_IO_V,9)
`BSG_POWER_CONTROL_PAD(pwrdet_t_3,IN12LP_GPIO18_13M9S30P_PWRDET_V,9)
`BSG_PHYSICAL_ONLY_PAD(vdd_t_7,IN12LP_GPIO18_13M9S30P_VDDC_V,9)
`BSG_IO_OUT_DISABLE_PARAM(ci2_5,IN12LP_GPIO18_13M9S30P_IO_V,9)
`BSG_PHYSICAL_ONLY_PAD(vss_t_7,IN12LP_GPIO18_13M9S30P_VSSC_V,9)
`BSG_IO_OUT_DISABLE_PARAM(ci2_6,IN12LP_GPIO18_13M9S30P_IO_V,9)
`BSG_PHYSICAL_ONLY_PAD(v18_t_7,IN12LP_GPIO18_13M9S30P_VDDIO_V,9)
`BSG_IO_OUT_DISABLE_PARAM(ci2_7,IN12LP_GPIO18_13M9S30P_IO_V,9)
`BSG_PHYSICAL_ONLY_PAD(vzz_t_7,IN12LP_GPIO18_13M9S30P_VSSIO_V,9)
`BSG_IO_OUT_DISABLE_PARAM(ci2_8,IN12LP_GPIO18_13M9S30P_IO_V,9)

`BSG_BREAKER_PAD(ctrl_brk_t_3,IN12LP_GPIO18_13M9S30P_CTRL_BRK_V,9,10)

//
// END NORTH SIDE
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// BEGIN EAST SIDE
//

`BSG_BREAKER_PAD(ctrl_brk_r_0,IN12LP_GPIO18_13M9S30P_CTRL_BRK_H,10,11)

`BSG_IO_IN_DISABLE_PARAM(ci_0,IN12LP_GPIO18_13M9S30P_IO_H,11)
`BSG_PHYSICAL_ONLY_PAD(vdd_r_0,IN12LP_GPIO18_13M9S30P_VDDC_H,11)
`BSG_IO_IN_DISABLE_PARAM(ci_1,IN12LP_GPIO18_13M9S30P_IO_H,11)
`BSG_PHYSICAL_ONLY_PAD(vss_r_0,IN12LP_GPIO18_13M9S30P_VSSC_H,11)
`BSG_IO_IN_DISABLE_PARAM(ci_2,IN12LP_GPIO18_13M9S30P_IO_H,11)
`BSG_PHYSICAL_ONLY_PAD(v18_r_0,IN12LP_GPIO18_13M9S30P_VDDIO_H,11)
`BSG_IO_IN_DISABLE_PARAM(ci_3,IN12LP_GPIO18_13M9S30P_IO_H,11)
`BSG_PHYSICAL_ONLY_PAD(vzz_r_0,IN12LP_GPIO18_13M9S30P_VSSIO_H,11)
`BSG_POWER_CONTROL_PAD(pwrdet_r_0,IN12LP_GPIO18_13M9S30P_PWRDET_H,11)
`BSG_IO_IN_DISABLE_PARAM(ci_4,IN12LP_GPIO18_13M9S30P_IO_H,11)
`BSG_PHYSICAL_ONLY_PAD(vdd_r_1,IN12LP_GPIO18_13M9S30P_VDDC_H,11)
`BSG_IO_IN_DISABLE_PARAM(ci_clk,IN12LP_GPIO18_13M9S30P_IO_H,11)
`BSG_PHYSICAL_ONLY_PAD(vss_r_1,IN12LP_GPIO18_13M9S30P_VSSC_H,11)
`BSG_IO_OUT_DISABLE_PARAM(ci_tkn,IN12LP_GPIO18_13M9S30P_IO_H,11)
`BSG_PHYSICAL_ONLY_PAD(v18_r_1,IN12LP_GPIO18_13M9S30P_VDDIO_H,11)
`BSG_IO_IN_DISABLE_PARAM(ci_v,IN12LP_GPIO18_13M9S30P_IO_H,11)
`BSG_PHYSICAL_ONLY_PAD(vzz_r_1,IN12LP_GPIO18_13M9S30P_VSSIO_H,11)
`BSG_IO_IN_DISABLE_PARAM(ci_5,IN12LP_GPIO18_13M9S30P_IO_H,11)

`BSG_BREAKER_PAD(ctrl_brk_r_1,IN12LP_GPIO18_13M9S30P_CTRL_BRK_H,11,12)

`BSG_PHYSICAL_ONLY_PAD(vdd_r_2,IN12LP_GPIO18_13M9S30P_VDDC_H,12)
`BSG_IO_IN_DISABLE_PARAM(ci_6,IN12LP_GPIO18_13M9S30P_IO_H,12)
`BSG_PHYSICAL_ONLY_PAD(vss_r_2,IN12LP_GPIO18_13M9S30P_VSSC_H,12)
`BSG_IO_IN_DISABLE_PARAM(ci_7,IN12LP_GPIO18_13M9S30P_IO_H,12)
`BSG_PHYSICAL_ONLY_PAD(v18_r_2,IN12LP_GPIO18_13M9S30P_VDDIO_H,12)
`BSG_IO_IN_DISABLE_PARAM(ci_8,IN12LP_GPIO18_13M9S30P_IO_H,12)
`BSG_PHYSICAL_ONLY_PAD(vzz_r_2,IN12LP_GPIO18_13M9S30P_VSSIO_H,12)
`BSG_IO_IN_DISABLE_PARAM(bsg_tag_en,IN12LP_GPIO18_13M9S30P_IO_H,12)
`BSG_POWER_CONTROL_PAD(pwrdet_r_1,IN12LP_GPIO18_13M9S30P_PWRDET_H,12)
`BSG_PHYSICAL_ONLY_PAD(vdd_r_3,IN12LP_GPIO18_13M9S30P_VDDC_H,12)
`BSG_IO_IN_DISABLE_PARAM(bsg_tag_data,IN12LP_GPIO18_13M9S30P_IO_H,12)
`BSG_PHYSICAL_ONLY_PAD(vss_r_3,IN12LP_GPIO18_13M9S30P_VSSC_H,12)
`BSG_IO_IN_DISABLE_PARAM(bsg_tag_clk,IN12LP_GPIO18_13M9S30P_IO_H,12)
`BSG_PHYSICAL_ONLY_PAD(v18_r_3,IN12LP_GPIO18_13M9S30P_VDDIO_H,12)
`BSG_IO_OUT_DISABLE_PARAM(ddr_dm_3,IN12LP_GPIO18_13M9S30P_IO_H,12)
`BSG_PHYSICAL_ONLY_PAD(vzz_r_3,IN12LP_GPIO18_13M9S30P_VSSIO_H,12)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dqs_p_3,IN12LP_GPIO18_13M9S30P_IO_H,12)
`BSG_PHYSICAL_ONLY_PAD(vdd_r_4,IN12LP_GPIO18_13M9S30P_VDDC_H,12)

`BSG_BREAKER_PAD(ctrl_brk_r_2,IN12LP_GPIO18_13M9S30P_CTRL_BRK_H,12,13)

`BSG_IO_INOUT_DISABLE_PARAM(ddr_dqs_n_3,IN12LP_GPIO18_13M9S30P_IO_H,13)
`BSG_PHYSICAL_ONLY_PAD(vss_r_4,IN12LP_GPIO18_13M9S30P_VSSC_H,13)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_24,IN12LP_GPIO18_13M9S30P_IO_H,13)
`BSG_PHYSICAL_ONLY_PAD(v18_r_4,IN12LP_GPIO18_13M9S30P_VDDIO_H,13)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_25,IN12LP_GPIO18_13M9S30P_IO_H,13)
`BSG_PHYSICAL_ONLY_PAD(vzz_r_4,IN12LP_GPIO18_13M9S30P_VSSIO_H,13)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_26,IN12LP_GPIO18_13M9S30P_IO_H,13)
`BSG_PHYSICAL_ONLY_PAD(vdd_r_5,IN12LP_GPIO18_13M9S30P_VDDC_H,13)
`BSG_POWER_CONTROL_PAD(pwrdet_r_2,IN12LP_GPIO18_13M9S30P_PWRDET_H,13)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_27,IN12LP_GPIO18_13M9S30P_IO_H,13)
`BSG_PHYSICAL_ONLY_PAD(vss_r_5,IN12LP_GPIO18_13M9S30P_VSSC_H,13)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_28,IN12LP_GPIO18_13M9S30P_IO_H,13)
`BSG_PHYSICAL_ONLY_PAD(v18_r_5,IN12LP_GPIO18_13M9S30P_VDDIO_H,13)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_29,IN12LP_GPIO18_13M9S30P_IO_H,13)
`BSG_PHYSICAL_ONLY_PAD(vzz_r_5,IN12LP_GPIO18_13M9S30P_VSSIO_H,13)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_30,IN12LP_GPIO18_13M9S30P_IO_H,13)
`BSG_PHYSICAL_ONLY_PAD(vdd_r_6,IN12LP_GPIO18_13M9S30P_VDDC_H,13)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_31,IN12LP_GPIO18_13M9S30P_IO_H,13)

`BSG_BREAKER_PAD(ctrl_brk_r_3,IN12LP_GPIO18_13M9S30P_CTRL_BRK_H,13,14)

`BSG_PHYSICAL_ONLY_PAD(vss_r_6,IN12LP_GPIO18_13M9S30P_VSSC_H,14)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_16,IN12LP_GPIO18_13M9S30P_IO_H,14)
`BSG_PHYSICAL_ONLY_PAD(v18_r_6,IN12LP_GPIO18_13M9S30P_VDDIO_H,14)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_17,IN12LP_GPIO18_13M9S30P_IO_H,14)
`BSG_PHYSICAL_ONLY_PAD(vzz_r_6,IN12LP_GPIO18_13M9S30P_VSSIO_H,14)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_18,IN12LP_GPIO18_13M9S30P_IO_H,14)
`BSG_PHYSICAL_ONLY_PAD(vdd_r_7,IN12LP_GPIO18_13M9S30P_VDDC_H,14)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_19,IN12LP_GPIO18_13M9S30P_IO_H,14)
`BSG_POWER_CONTROL_PAD(pwrdet_r_3,IN12LP_GPIO18_13M9S30P_PWRDET_H,14)
`BSG_PHYSICAL_ONLY_PAD(vss_r_7,IN12LP_GPIO18_13M9S30P_VSSC_H,14)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_20,IN12LP_GPIO18_13M9S30P_IO_H,14)
`BSG_PHYSICAL_ONLY_PAD(v18_r_7,IN12LP_GPIO18_13M9S30P_VDDIO_H,14)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_21,IN12LP_GPIO18_13M9S30P_IO_H,14)
`BSG_PHYSICAL_ONLY_PAD(vzz_r_7,IN12LP_GPIO18_13M9S30P_VSSIO_H,14)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_22,IN12LP_GPIO18_13M9S30P_IO_H,14)
`BSG_PHYSICAL_ONLY_PAD(vdd_r_8,IN12LP_GPIO18_13M9S30P_VDDC_H,14)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dq_23,IN12LP_GPIO18_13M9S30P_IO_H,14)
`BSG_PHYSICAL_ONLY_PAD(vss_r_8,IN12LP_GPIO18_13M9S30P_VSSC_H,14)

`BSG_BREAKER_PAD(ctrl_brk_r_4,IN12LP_GPIO18_13M9S30P_CTRL_BRK_H,14,15)

//
// END EAST SIDE
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// BEGIN SOUTH SIDE
//

`BSG_BREAKER_PAD(ctrl_brk_b_0,IN12LP_GPIO18_13M9S30P_CTRL_BRK_V,15,16)

`BSG_IO_OUT_DISABLE_PARAM(ddr_dm_2,IN12LP_GPIO18_13M9S30P_IO_V,16)
`BSG_PHYSICAL_ONLY_PAD(v18_b_0,IN12LP_GPIO18_13M9S30P_VDDIO_V,16)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dqs_p_2,IN12LP_GPIO18_13M9S30P_IO_V,16)
`BSG_PHYSICAL_ONLY_PAD(vzz_b_0,IN12LP_GPIO18_13M9S30P_VSSIO_V,16)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dqs_n_2,IN12LP_GPIO18_13M9S30P_IO_V,16)
`BSG_PHYSICAL_ONLY_PAD(vdd_b_0,IN12LP_GPIO18_13M9S30P_VDDC_V,16)
`BSG_IO_OUT_DISABLE_PARAM(ddr_ck_p,IN12LP_GPIO18_13M9S30P_IO_V,16)
`BSG_PHYSICAL_ONLY_PAD(vss_b_0,IN12LP_GPIO18_13M9S30P_VSSC_V,16)
`BSG_POWER_CONTROL_PAD(pwrdet_b_0,IN12LP_GPIO18_13M9S30P_PWRDET_V,16)
`BSG_IO_OUT_DISABLE_PARAM(ddr_ck_n,IN12LP_GPIO18_13M9S30P_IO_V,16)
`BSG_PHYSICAL_ONLY_PAD(v18_b_1,IN12LP_GPIO18_13M9S30P_VDDIO_V,16)
`BSG_IO_OUT_DISABLE_PARAM(ddr_cke,IN12LP_GPIO18_13M9S30P_IO_V,16)
`BSG_PHYSICAL_ONLY_PAD(vzz_b_1,IN12LP_GPIO18_13M9S30P_VSSIO_V,16)
`BSG_IO_OUT_DISABLE_PARAM(ddr_cs_n,IN12LP_GPIO18_13M9S30P_IO_V,16)
`BSG_PHYSICAL_ONLY_PAD(vdd_b_1,IN12LP_GPIO18_13M9S30P_VDDC_V,16)
`BSG_IO_OUT_DISABLE_PARAM(ddr_ras_n,IN12LP_GPIO18_13M9S30P_IO_V,16)
`BSG_PHYSICAL_ONLY_PAD(vss_b_1,IN12LP_GPIO18_13M9S30P_VSSC_V,16)
`BSG_IO_OUT_DISABLE_PARAM(ddr_cas_n,IN12LP_GPIO18_13M9S30P_IO_V,16)

`BSG_BREAKER_PAD(ctrl_brk_b_1,IN12LP_GPIO18_13M9S30P_CTRL_BRK_V,16,17)

`BSG_PHYSICAL_ONLY_PAD(v18_b_2,IN12LP_GPIO18_13M9S30P_VDDIO_V,17)
`BSG_IO_OUT_DISABLE_PARAM(ddr_we_n,IN12LP_GPIO18_13M9S30P_IO_V,17)
`BSG_PHYSICAL_ONLY_PAD(vzz_b_2,IN12LP_GPIO18_13M9S30P_VSSIO_V,17)
`BSG_IO_OUT_DISABLE_PARAM(ddr_reset_n,IN12LP_GPIO18_13M9S30P_IO_V,17)
`BSG_PHYSICAL_ONLY_PAD(vdd_b_2,IN12LP_GPIO18_13M9S30P_VDDC_V,17)
`BSG_IO_OUT_DISABLE_PARAM(ddr_odt,IN12LP_GPIO18_13M9S30P_IO_V,17)
`BSG_PHYSICAL_ONLY_PAD(vss_b_2,IN12LP_GPIO18_13M9S30P_VSSC_V,17)
`BSG_IO_OUT_DISABLE_PARAM(ddr_addr_0,IN12LP_GPIO18_13M9S30P_IO_V,17)
`BSG_POWER_CONTROL_PAD(pwrdet_b_1,IN12LP_GPIO18_13M9S30P_PWRDET_V,17)
`BSG_PHYSICAL_ONLY_PAD(v18_b_3,IN12LP_GPIO18_13M9S30P_VDDIO_V,17)
`BSG_IO_OUT_DISABLE_PARAM(ddr_addr_1,IN12LP_GPIO18_13M9S30P_IO_V,17)
`BSG_PHYSICAL_ONLY_PAD(vzz_b_3,IN12LP_GPIO18_13M9S30P_VSSIO_V,17)
`BSG_IO_OUT_DISABLE_PARAM(ddr_addr_2,IN12LP_GPIO18_13M9S30P_IO_V,17)
`BSG_PHYSICAL_ONLY_PAD(vdd_b_3,IN12LP_GPIO18_13M9S30P_VDDC_V,17)
`BSG_IO_OUT_DISABLE_PARAM(ddr_addr_3,IN12LP_GPIO18_13M9S30P_IO_V,17)
`BSG_PHYSICAL_ONLY_PAD(vss_b_3,IN12LP_GPIO18_13M9S30P_VSSC_V,17)
`BSG_IO_OUT_DISABLE_PARAM(ddr_addr_4,IN12LP_GPIO18_13M9S30P_IO_V,17)
`BSG_PHYSICAL_ONLY_PAD(v18_b_4,IN12LP_GPIO18_13M9S30P_VDDIO_V,17)

`BSG_BREAKER_PAD(ctrl_brk_b_2,IN12LP_GPIO18_13M9S30P_CTRL_BRK_V,17,18)

`BSG_IO_OUT_DISABLE_PARAM(ddr_addr_5,IN12LP_GPIO18_13M9S30P_IO_V,18)
`BSG_PHYSICAL_ONLY_PAD(vzz_b_4,IN12LP_GPIO18_13M9S30P_VSSIO_V,18)
`BSG_IO_OUT_DISABLE_PARAM(ddr_addr_6,IN12LP_GPIO18_13M9S30P_IO_V,18)
`BSG_PHYSICAL_ONLY_PAD(vdd_b_4,IN12LP_GPIO18_13M9S30P_VDDC_V,18)
`BSG_IO_OUT_DISABLE_PARAM(ddr_addr_7,IN12LP_GPIO18_13M9S30P_IO_V,18)
`BSG_PHYSICAL_ONLY_PAD(vss_b_4,IN12LP_GPIO18_13M9S30P_VSSC_V,18)
`BSG_IO_OUT_DISABLE_PARAM(ddr_addr_8,IN12LP_GPIO18_13M9S30P_IO_V,18)
`BSG_PHYSICAL_ONLY_PAD(v18_b_5,IN12LP_GPIO18_13M9S30P_VDDIO_V,18)
`BSG_POWER_CONTROL_PAD(pwrdet_b_2,IN12LP_GPIO18_13M9S30P_PWRDET_V,18)
`BSG_IO_OUT_DISABLE_PARAM(ddr_addr_9,IN12LP_GPIO18_13M9S30P_IO_V,18)
`BSG_PHYSICAL_ONLY_PAD(vzz_b_5,IN12LP_GPIO18_13M9S30P_VSSIO_V,18)
`BSG_IO_OUT_DISABLE_PARAM(ddr_addr_10,IN12LP_GPIO18_13M9S30P_IO_V,18)
`BSG_PHYSICAL_ONLY_PAD(vdd_b_5,IN12LP_GPIO18_13M9S30P_VDDC_V,18)
`BSG_IO_OUT_DISABLE_PARAM(ddr_addr_11,IN12LP_GPIO18_13M9S30P_IO_V,18)
`BSG_PHYSICAL_ONLY_PAD(vss_b_5,IN12LP_GPIO18_13M9S30P_VSSC_V,18)
`BSG_IO_OUT_DISABLE_PARAM(ddr_addr_12,IN12LP_GPIO18_13M9S30P_IO_V,18)
`BSG_PHYSICAL_ONLY_PAD(v18_b_6,IN12LP_GPIO18_13M9S30P_VDDIO_V,18)
`BSG_IO_OUT_DISABLE_PARAM(ddr_addr_13,IN12LP_GPIO18_13M9S30P_IO_V,18)

`BSG_BREAKER_PAD(ctrl_brk_b_3,IN12LP_GPIO18_13M9S30P_CTRL_BRK_V,18,19)

`BSG_PHYSICAL_ONLY_PAD(vzz_b_6,IN12LP_GPIO18_13M9S30P_VSSIO_V,19)
`BSG_IO_OUT_DISABLE_PARAM(ddr_addr_14,IN12LP_GPIO18_13M9S30P_IO_V,19)
`BSG_PHYSICAL_ONLY_PAD(vdd_b_6,IN12LP_GPIO18_13M9S30P_VDDC_V,19)
`BSG_IO_OUT_DISABLE_PARAM(ddr_addr_15,IN12LP_GPIO18_13M9S30P_IO_V,19)
`BSG_PHYSICAL_ONLY_PAD(vss_b_6,IN12LP_GPIO18_13M9S30P_VSSC_V,19)
`BSG_IO_OUT_DISABLE_PARAM(ddr_ba_0,IN12LP_GPIO18_13M9S30P_IO_V,19)
`BSG_PHYSICAL_ONLY_PAD(v18_b_7,IN12LP_GPIO18_13M9S30P_VDDIO_V,19)
`BSG_IO_OUT_DISABLE_PARAM(ddr_ba_1,IN12LP_GPIO18_13M9S30P_IO_V,19)
`BSG_POWER_CONTROL_PAD(pwrdet_b_3,IN12LP_GPIO18_13M9S30P_PWRDET_V,19)
`BSG_PHYSICAL_ONLY_PAD(vzz_b_7,IN12LP_GPIO18_13M9S30P_VSSIO_V,19)
`BSG_IO_OUT_DISABLE_PARAM(ddr_ba_2,IN12LP_GPIO18_13M9S30P_IO_V,19)
`BSG_PHYSICAL_ONLY_PAD(vdd_b_7,IN12LP_GPIO18_13M9S30P_VDDC_V,19)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dqs_p_1,IN12LP_GPIO18_13M9S30P_IO_V,19)
`BSG_PHYSICAL_ONLY_PAD(vss_b_7,IN12LP_GPIO18_13M9S30P_VSSC_V,19)
`BSG_IO_INOUT_DISABLE_PARAM(ddr_dqs_n_1,IN12LP_GPIO18_13M9S30P_IO_V,19)
`BSG_PHYSICAL_ONLY_PAD(v18_b_8,IN12LP_GPIO18_13M9S30P_VDDIO_V,19)
`BSG_IO_OUT_DISABLE_PARAM(ddr_dm_1,IN12LP_GPIO18_13M9S30P_IO_V,19)
`BSG_PHYSICAL_ONLY_PAD(vzz_b_8,IN12LP_GPIO18_13M9S30P_VSSIO_V,19)

`BSG_BREAKER_PAD(ctrl_brk_b_4,IN12LP_GPIO18_13M9S30P_CTRL_BRK_V,19,20)

//
// END SOUTH SIDE
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// BEGIN CORE SIDE PORT ASSIGNMENT
//

bsg_chip_swizzle_adapter
  swizzle
    ( // To IO Driver Cells
     .port_ci_clk_i   (ci_clk_i_int)
    ,.port_ci_v_i     (ci_v_i_int)
    ,.port_ci_data_i  ({ci_8_i_int, ci_7_i_int, ci_6_i_int, ci_5_i_int, ci_4_i_int, ci_3_i_int, ci_2_i_int, ci_1_i_int, ci_0_i_int})
    ,.port_ci_tkn_o   (ci_tkn_o_int)

    ,.port_ci2_clk_o  (ci2_clk_o_int)
    ,.port_ci2_v_o    (ci2_v_o_int)
    ,.port_ci2_data_o ({ci2_8_o_int, ci2_7_o_int, ci2_6_o_int, ci2_5_o_int, ci2_4_o_int, ci2_3_o_int, ci2_2_o_int, ci2_1_o_int, ci2_0_o_int})
    ,.port_ci2_tkn_i  (ci2_tkn_i_int)

    ,.port_co_clk_i   (co_clk_i_int)
    ,.port_co_v_i     (co_v_i_int)
    ,.port_co_data_i  ({co_8_i_int, co_7_i_int, co_6_i_int, co_5_i_int, co_4_i_int, co_3_i_int, co_2_i_int, co_1_i_int, co_0_i_int})
    ,.port_co_tkn_o   (co_tkn_o_int)

    ,.port_co2_clk_o  (co2_clk_o_int)
    ,.port_co2_v_o    (co2_v_o_int)
    ,.port_co2_data_o ({co2_8_o_int, co2_7_o_int, co2_6_o_int, co2_5_o_int, co2_4_o_int, co2_3_o_int, co2_2_o_int, co2_1_o_int, co2_0_o_int})
    ,.port_co2_tkn_i  (co2_tkn_i_int)

    // To Core Side Ports
    ,.guts_ci_clk_o   (c_ci_clk_o)
    ,.guts_ci_v_o     (c_ci_v_o)
    ,.guts_ci_data_o  ({c_ci_8_o, c_ci_7_o, c_ci_6_o, c_ci_5_o, c_ci_4_o, c_ci_3_o, c_ci_2_o, c_ci_1_o, c_ci_0_o})
    ,.guts_ci_tkn_i   (c_ci_tkn_i)

    ,.guts_co_clk_i   (c_co_clk_i)
    ,.guts_co_v_i     (c_co_v_i)
    ,.guts_co_data_i  ({c_co_8_i, c_co_7_i, c_co_6_i, c_co_5_i, c_co_4_i, c_co_3_i, c_co_2_i, c_co_1_i, c_co_0_i})
    ,.guts_co_tkn_o   (c_co_tkn_o)

    ,.guts_ci2_clk_o  (c_ci2_clk_o)
    ,.guts_ci2_v_o    (c_ci2_v_o)
    ,.guts_ci2_data_o ({c_ci2_8_o, c_ci2_7_o, c_ci2_6_o, c_ci2_5_o, c_ci2_4_o, c_ci2_3_o, c_ci2_2_o, c_ci2_1_o, c_ci2_0_o})
    ,.guts_ci2_tkn_i  (c_ci2_tkn_i)

    ,.guts_co2_clk_i  (c_co2_clk_i)
    ,.guts_co2_v_i    (c_co2_v_i)
    ,.guts_co2_data_i ({c_co2_8_i, c_co2_7_i, c_co2_6_i, c_co2_5_i, c_co2_4_i, c_co2_3_i, c_co2_2_i, c_co2_1_i, c_co2_0_i})
    ,.guts_co2_tkn_o  (c_co2_tkn_o)
    );

assign ddr_ck_p_o_int = c_ddr_ck_p_i;
assign ddr_ck_n_o_int = c_ddr_ck_n_i;

assign ddr_cke_o_int = c_ddr_cke_i;

assign ddr_cs_n_o_int  = c_ddr_cs_n_i;
assign ddr_ras_n_o_int = c_ddr_ras_n_i;
assign ddr_cas_n_o_int = c_ddr_cas_n_i;
assign ddr_we_n_o_int  = c_ddr_we_n_i;

assign ddr_reset_n_o_int = c_ddr_reset_n_i;
assign ddr_odt_o_int     = c_ddr_odt_i;

assign ddr_ba_0_o_int = c_ddr_ba_0_i;
assign ddr_ba_1_o_int = c_ddr_ba_1_i;
assign ddr_ba_2_o_int = c_ddr_ba_2_i;

assign ddr_addr_0_o_int  = c_ddr_addr_0_i;
assign ddr_addr_1_o_int  = c_ddr_addr_1_i;
assign ddr_addr_2_o_int  = c_ddr_addr_2_i;
assign ddr_addr_3_o_int  = c_ddr_addr_3_i;
assign ddr_addr_4_o_int  = c_ddr_addr_4_i;
assign ddr_addr_5_o_int  = c_ddr_addr_5_i;
assign ddr_addr_6_o_int  = c_ddr_addr_6_i;
assign ddr_addr_7_o_int  = c_ddr_addr_7_i;
assign ddr_addr_8_o_int  = c_ddr_addr_8_i;
assign ddr_addr_9_o_int  = c_ddr_addr_9_i;
assign ddr_addr_10_o_int = c_ddr_addr_10_i;
assign ddr_addr_11_o_int = c_ddr_addr_11_i;
assign ddr_addr_12_o_int = c_ddr_addr_12_i;
assign ddr_addr_13_o_int = c_ddr_addr_13_i;
assign ddr_addr_14_o_int = c_ddr_addr_14_i;
assign ddr_addr_15_o_int = c_ddr_addr_15_i;

assign ddr_dm_0_o_int = c_ddr_dm_0_i;
assign ddr_dm_1_o_int = c_ddr_dm_1_i;
assign ddr_dm_2_o_int = c_ddr_dm_2_i;
assign ddr_dm_3_o_int = c_ddr_dm_3_i;

assign c_ddr_dqs_p_0_o = ddr_dqs_p_0_i_io_int; assign ddr_dqs_p_0_o_io_int = c_ddr_dqs_p_0_i; assign ddr_dqs_p_0_oen_int = c_ddr_dqs_p_0_oen_i;
assign c_ddr_dqs_n_0_o = ddr_dqs_n_0_i_io_int; assign ddr_dqs_n_0_o_io_int = c_ddr_dqs_n_0_i; assign ddr_dqs_n_0_oen_int = c_ddr_dqs_n_0_oen_i;
assign c_ddr_dqs_p_1_o = ddr_dqs_p_1_i_io_int; assign ddr_dqs_p_1_o_io_int = c_ddr_dqs_p_1_i; assign ddr_dqs_p_1_oen_int = c_ddr_dqs_p_1_oen_i;
assign c_ddr_dqs_n_1_o = ddr_dqs_n_1_i_io_int; assign ddr_dqs_n_1_o_io_int = c_ddr_dqs_n_1_i; assign ddr_dqs_n_1_oen_int = c_ddr_dqs_n_1_oen_i;
assign c_ddr_dqs_p_2_o = ddr_dqs_p_2_i_io_int; assign ddr_dqs_p_2_o_io_int = c_ddr_dqs_p_2_i; assign ddr_dqs_p_2_oen_int = c_ddr_dqs_p_2_oen_i;
assign c_ddr_dqs_n_2_o = ddr_dqs_n_2_i_io_int; assign ddr_dqs_n_2_o_io_int = c_ddr_dqs_n_2_i; assign ddr_dqs_n_2_oen_int = c_ddr_dqs_n_2_oen_i;
assign c_ddr_dqs_p_3_o = ddr_dqs_p_3_i_io_int; assign ddr_dqs_p_3_o_io_int = c_ddr_dqs_p_3_i; assign ddr_dqs_p_3_oen_int = c_ddr_dqs_p_3_oen_i;
assign c_ddr_dqs_n_3_o = ddr_dqs_n_3_i_io_int; assign ddr_dqs_n_3_o_io_int = c_ddr_dqs_n_3_i; assign ddr_dqs_n_3_oen_int = c_ddr_dqs_n_3_oen_i;

assign c_ddr_dq_0_o  = ddr_dq_0_i_io_int;  assign ddr_dq_0_o_io_int  = c_ddr_dq_0_i;  assign ddr_dq_0_oen_int  = c_ddr_dq_0_oen_i;
assign c_ddr_dq_1_o  = ddr_dq_1_i_io_int;  assign ddr_dq_1_o_io_int  = c_ddr_dq_1_i;  assign ddr_dq_1_oen_int  = c_ddr_dq_1_oen_i;
assign c_ddr_dq_2_o  = ddr_dq_2_i_io_int;  assign ddr_dq_2_o_io_int  = c_ddr_dq_2_i;  assign ddr_dq_2_oen_int  = c_ddr_dq_2_oen_i;
assign c_ddr_dq_3_o  = ddr_dq_3_i_io_int;  assign ddr_dq_3_o_io_int  = c_ddr_dq_3_i;  assign ddr_dq_3_oen_int  = c_ddr_dq_3_oen_i;
assign c_ddr_dq_4_o  = ddr_dq_4_i_io_int;  assign ddr_dq_4_o_io_int  = c_ddr_dq_4_i;  assign ddr_dq_4_oen_int  = c_ddr_dq_4_oen_i;
assign c_ddr_dq_5_o  = ddr_dq_5_i_io_int;  assign ddr_dq_5_o_io_int  = c_ddr_dq_5_i;  assign ddr_dq_5_oen_int  = c_ddr_dq_5_oen_i;
assign c_ddr_dq_6_o  = ddr_dq_6_i_io_int;  assign ddr_dq_6_o_io_int  = c_ddr_dq_6_i;  assign ddr_dq_6_oen_int  = c_ddr_dq_6_oen_i;
assign c_ddr_dq_7_o  = ddr_dq_7_i_io_int;  assign ddr_dq_7_o_io_int  = c_ddr_dq_7_i;  assign ddr_dq_7_oen_int  = c_ddr_dq_7_oen_i;
assign c_ddr_dq_8_o  = ddr_dq_8_i_io_int;  assign ddr_dq_8_o_io_int  = c_ddr_dq_8_i;  assign ddr_dq_8_oen_int  = c_ddr_dq_8_oen_i;
assign c_ddr_dq_9_o  = ddr_dq_9_i_io_int;  assign ddr_dq_9_o_io_int  = c_ddr_dq_9_i;  assign ddr_dq_9_oen_int  = c_ddr_dq_9_oen_i;
assign c_ddr_dq_10_o = ddr_dq_10_i_io_int; assign ddr_dq_10_o_io_int = c_ddr_dq_10_i; assign ddr_dq_10_oen_int = c_ddr_dq_10_oen_i;
assign c_ddr_dq_11_o = ddr_dq_11_i_io_int; assign ddr_dq_11_o_io_int = c_ddr_dq_11_i; assign ddr_dq_11_oen_int = c_ddr_dq_11_oen_i;
assign c_ddr_dq_12_o = ddr_dq_12_i_io_int; assign ddr_dq_12_o_io_int = c_ddr_dq_12_i; assign ddr_dq_12_oen_int = c_ddr_dq_12_oen_i;
assign c_ddr_dq_13_o = ddr_dq_13_i_io_int; assign ddr_dq_13_o_io_int = c_ddr_dq_13_i; assign ddr_dq_13_oen_int = c_ddr_dq_13_oen_i;
assign c_ddr_dq_14_o = ddr_dq_14_i_io_int; assign ddr_dq_14_o_io_int = c_ddr_dq_14_i; assign ddr_dq_14_oen_int = c_ddr_dq_14_oen_i;
assign c_ddr_dq_15_o = ddr_dq_15_i_io_int; assign ddr_dq_15_o_io_int = c_ddr_dq_15_i; assign ddr_dq_15_oen_int = c_ddr_dq_15_oen_i;
assign c_ddr_dq_16_o = ddr_dq_16_i_io_int; assign ddr_dq_16_o_io_int = c_ddr_dq_16_i; assign ddr_dq_16_oen_int = c_ddr_dq_16_oen_i;
assign c_ddr_dq_17_o = ddr_dq_17_i_io_int; assign ddr_dq_17_o_io_int = c_ddr_dq_17_i; assign ddr_dq_17_oen_int = c_ddr_dq_17_oen_i;
assign c_ddr_dq_18_o = ddr_dq_18_i_io_int; assign ddr_dq_18_o_io_int = c_ddr_dq_18_i; assign ddr_dq_18_oen_int = c_ddr_dq_18_oen_i;
assign c_ddr_dq_19_o = ddr_dq_19_i_io_int; assign ddr_dq_19_o_io_int = c_ddr_dq_19_i; assign ddr_dq_19_oen_int = c_ddr_dq_19_oen_i;
assign c_ddr_dq_20_o = ddr_dq_20_i_io_int; assign ddr_dq_20_o_io_int = c_ddr_dq_20_i; assign ddr_dq_20_oen_int = c_ddr_dq_20_oen_i;
assign c_ddr_dq_21_o = ddr_dq_21_i_io_int; assign ddr_dq_21_o_io_int = c_ddr_dq_21_i; assign ddr_dq_21_oen_int = c_ddr_dq_21_oen_i;
assign c_ddr_dq_22_o = ddr_dq_22_i_io_int; assign ddr_dq_22_o_io_int = c_ddr_dq_22_i; assign ddr_dq_22_oen_int = c_ddr_dq_22_oen_i;
assign c_ddr_dq_23_o = ddr_dq_23_i_io_int; assign ddr_dq_23_o_io_int = c_ddr_dq_23_i; assign ddr_dq_23_oen_int = c_ddr_dq_23_oen_i;
assign c_ddr_dq_24_o = ddr_dq_24_i_io_int; assign ddr_dq_24_o_io_int = c_ddr_dq_24_i; assign ddr_dq_24_oen_int = c_ddr_dq_24_oen_i;
assign c_ddr_dq_25_o = ddr_dq_25_i_io_int; assign ddr_dq_25_o_io_int = c_ddr_dq_25_i; assign ddr_dq_25_oen_int = c_ddr_dq_25_oen_i;
assign c_ddr_dq_26_o = ddr_dq_26_i_io_int; assign ddr_dq_26_o_io_int = c_ddr_dq_26_i; assign ddr_dq_26_oen_int = c_ddr_dq_26_oen_i;
assign c_ddr_dq_27_o = ddr_dq_27_i_io_int; assign ddr_dq_27_o_io_int = c_ddr_dq_27_i; assign ddr_dq_27_oen_int = c_ddr_dq_27_oen_i;
assign c_ddr_dq_28_o = ddr_dq_28_i_io_int; assign ddr_dq_28_o_io_int = c_ddr_dq_28_i; assign ddr_dq_28_oen_int = c_ddr_dq_28_oen_i;
assign c_ddr_dq_29_o = ddr_dq_29_i_io_int; assign ddr_dq_29_o_io_int = c_ddr_dq_29_i; assign ddr_dq_29_oen_int = c_ddr_dq_29_oen_i;
assign c_ddr_dq_30_o = ddr_dq_30_i_io_int; assign ddr_dq_30_o_io_int = c_ddr_dq_30_i; assign ddr_dq_30_oen_int = c_ddr_dq_30_oen_i;
assign c_ddr_dq_31_o = ddr_dq_31_i_io_int; assign ddr_dq_31_o_io_int = c_ddr_dq_31_i; assign ddr_dq_31_oen_int = c_ddr_dq_31_oen_i;

assign c_bsg_tag_clk_o    = bsg_tag_clk_i_int;
assign c_bsg_tag_en_o     = bsg_tag_en_i_int;
assign c_bsg_tag_data_o   = bsg_tag_data_i_int;
assign bsg_tag_clk_o_int  = c_bsg_tag_clk_i;
assign bsg_tag_data_o_int = c_bsg_tag_data_i;

assign c_clk_A_o = clk_A_i_int;
assign c_clk_B_o = clk_B_i_int;
assign c_clk_C_o = clk_C_i_int;

assign clk_o_int = c_clk_i;

assign c_sel_0_o = sel_0_i_int;
assign c_sel_1_o = sel_1_i_int;
assign c_sel_2_o = sel_2_i_int;

assign c_clk_async_reset_o  = clk_async_reset_i_int;
assign c_core_async_reset_o = core_async_reset_i_int;

assign misc_o_int = c_misc_i;

//
// END CORE SIDE PORT ASSIGNMENT
////////////////////////////////////////////////////////////////////////////////

endmodule

