genvar i;

  wire [20:0] retc_lo, iopwrok_lo, pwrok_lo;

  // WEST SIDE OF THE CHIP

//`BSG_IO_INOUT(ddr_dq_8,    IN12LP_GPIO18_13M9S30P_IO_H, 0)
//`BSG_IO_INOUT(ddr_dq_9,    IN12LP_GPIO18_13M9S30P_IO_H, 0)
//`BSG_IO_INOUT(ddr_dq_10,   IN12LP_GPIO18_13M9S30P_IO_H, 0)
//`BSG_IO_INOUT(ddr_dq_11,   IN12LP_GPIO18_13M9S30P_IO_H, 0)
//`BSG_IO_INOUT(ddr_dq_12,   IN12LP_GPIO18_13M9S30P_IO_H, 0)
//`BSG_IO_INOUT(ddr_dq_13,   IN12LP_GPIO18_13M9S30P_IO_H, 0)
//`BSG_IO_INOUT(ddr_dq_14,   IN12LP_GPIO18_13M9S30P_IO_H, 0)
//`BSG_IO_INOUT(ddr_dq_15,   IN12LP_GPIO18_13M9S30P_IO_H, 0)
//`BSG_IO_INOUT(ddr_dqs_p_0, IN12LP_GPIO18_13M9S30P_IO_H, 0)
  `BSG_IO_INOUT_UNUSED(ddr_dq_8,    IN12LP_GPIO18_13M9S30P_IO_H, 0)
  `BSG_IO_INOUT_UNUSED(ddr_dq_9,    IN12LP_GPIO18_13M9S30P_IO_H, 0)
  `BSG_IO_INOUT_UNUSED(ddr_dq_10,   IN12LP_GPIO18_13M9S30P_IO_H, 0)
  `BSG_IO_INOUT_UNUSED(ddr_dq_11,   IN12LP_GPIO18_13M9S30P_IO_H, 0)
  `BSG_IO_INOUT_UNUSED(ddr_dq_12,   IN12LP_GPIO18_13M9S30P_IO_H, 0)
  `BSG_IO_INOUT_UNUSED(ddr_dq_13,   IN12LP_GPIO18_13M9S30P_IO_H, 0)
  `BSG_IO_INOUT_UNUSED(ddr_dq_14,   IN12LP_GPIO18_13M9S30P_IO_H, 0)
  `BSG_IO_INOUT_UNUSED(ddr_dq_15,   IN12LP_GPIO18_13M9S30P_IO_H, 0)
  `BSG_IO_INOUT_UNUSED(ddr_dqs_p_0, IN12LP_GPIO18_13M9S30P_IO_H, 0)

//`BSG_IO_INOUT(ddr_dqs_n_0, IN12LP_GPIO18_13M9S30P_IO_H, 1)
//`BSG_IO_OUT  (ddr_dm_0,    IN12LP_GPIO18_13M9S30P_IO_H, 1)
//`BSG_IO_INOUT(ddr_dq_0,    IN12LP_GPIO18_13M9S30P_IO_H, 1)
//`BSG_IO_INOUT(ddr_dq_1,    IN12LP_GPIO18_13M9S30P_IO_H, 1)
//`BSG_IO_INOUT(ddr_dq_2,    IN12LP_GPIO18_13M9S30P_IO_H, 1)
//`BSG_IO_INOUT(ddr_dq_3,    IN12LP_GPIO18_13M9S30P_IO_H, 1)
//`BSG_IO_INOUT(ddr_dq_4,    IN12LP_GPIO18_13M9S30P_IO_H, 1)
//`BSG_IO_INOUT(ddr_dq_5,    IN12LP_GPIO18_13M9S30P_IO_H, 1)
  `BSG_IO_INOUT_UNUSED(ddr_dqs_n_0, IN12LP_GPIO18_13M9S30P_IO_H, 1)
  `BSG_IO_OUT_UNUSED  (ddr_dm_0,    IN12LP_GPIO18_13M9S30P_IO_H, 1)
  `BSG_IO_INOUT_UNUSED(ddr_dq_0,    IN12LP_GPIO18_13M9S30P_IO_H, 1)
  `BSG_IO_INOUT_UNUSED(ddr_dq_1,    IN12LP_GPIO18_13M9S30P_IO_H, 1)
  `BSG_IO_INOUT_UNUSED(ddr_dq_2,    IN12LP_GPIO18_13M9S30P_IO_H, 1)
  `BSG_IO_INOUT_UNUSED(ddr_dq_3,    IN12LP_GPIO18_13M9S30P_IO_H, 1)
  `BSG_IO_INOUT_UNUSED(ddr_dq_4,    IN12LP_GPIO18_13M9S30P_IO_H, 1)
  `BSG_IO_INOUT_UNUSED(ddr_dq_5,    IN12LP_GPIO18_13M9S30P_IO_H, 1)

//`BSG_IO_INOUT(ddr_dq_6,     IN12LP_GPIO18_13M9S30P_IO_H, 2)
//`BSG_IO_INOUT(ddr_dq_7,     IN12LP_GPIO18_13M9S30P_IO_H, 2)
//`BSG_IO_OUT  (bsg_tag_data, IN12LP_GPIO18_13M9S30P_IO_H, 2)
//`BSG_IO_OUT  (bsg_tag_clk,  IN12LP_GPIO18_13M9S30P_IO_H, 2)
  `BSG_IO_INOUT_UNUSED(ddr_dq_6,     IN12LP_GPIO18_13M9S30P_IO_H, 2)
  `BSG_IO_INOUT_UNUSED(ddr_dq_7,     IN12LP_GPIO18_13M9S30P_IO_H, 2)
  `BSG_IO_OUT_UNUSED  (bsg_tag_data, IN12LP_GPIO18_13M9S30P_IO_H, 2)
  `BSG_IO_OUT_UNUSED  (bsg_tag_clk,  IN12LP_GPIO18_13M9S30P_IO_H, 2)
  `BSG_IO_OUT  (co2_0,        IN12LP_GPIO18_13M9S30P_IO_H, 2)
  `BSG_IO_OUT  (co2_1,        IN12LP_GPIO18_13M9S30P_IO_H, 2)
  `BSG_IO_OUT  (co2_2,        IN12LP_GPIO18_13M9S30P_IO_H, 2)
  `BSG_IO_OUT  (co2_3,        IN12LP_GPIO18_13M9S30P_IO_H, 2)

  `BSG_IO_OUT  (co2_4,   IN12LP_GPIO18_13M9S30P_IO_H, 3)
  `BSG_IO_OUT  (co2_clk, IN12LP_GPIO18_13M9S30P_IO_H, 3)
  `BSG_IO_IN   (co2_tkn, IN12LP_GPIO18_13M9S30P_IO_H, 3)
  `BSG_IO_OUT  (co2_v,   IN12LP_GPIO18_13M9S30P_IO_H, 3)
  `BSG_IO_OUT  (co2_5,   IN12LP_GPIO18_13M9S30P_IO_H, 3)
  `BSG_IO_OUT  (co2_6,   IN12LP_GPIO18_13M9S30P_IO_H, 3)
  `BSG_IO_OUT  (co2_7,   IN12LP_GPIO18_13M9S30P_IO_H, 3)
  `BSG_IO_OUT  (co2_8,   IN12LP_GPIO18_13M9S30P_IO_H, 3)

  // NORTH SIDE OF THE CHIP

  `BSG_IO_IN   (co_0,    IN12LP_GPIO18_13M9S30P_IO_V, 5)
  `BSG_IO_IN   (co_1,    IN12LP_GPIO18_13M9S30P_IO_V, 5)
  `BSG_IO_IN   (co_2,    IN12LP_GPIO18_13M9S30P_IO_V, 5)
  `BSG_IO_IN   (co_3,    IN12LP_GPIO18_13M9S30P_IO_V, 5)
  `BSG_IO_IN   (co_4,    IN12LP_GPIO18_13M9S30P_IO_V, 5)
  `BSG_IO_IN   (co_clk,  IN12LP_GPIO18_13M9S30P_IO_V, 5)
  `BSG_IO_OUT  (co_tkn,  IN12LP_GPIO18_13M9S30P_IO_V, 5)

  `BSG_IO_IN   (co_v,    IN12LP_GPIO18_13M9S30P_IO_V, 6)
  `BSG_IO_IN   (co_5,    IN12LP_GPIO18_13M9S30P_IO_V, 6)
  `BSG_IO_IN   (co_6,    IN12LP_GPIO18_13M9S30P_IO_V, 6)
  `BSG_IO_IN   (co_7,    IN12LP_GPIO18_13M9S30P_IO_V, 6)
  `BSG_IO_IN   (co_8,    IN12LP_GPIO18_13M9S30P_IO_V, 6)
  `BSG_IO_IN   (clk_A,   IN12LP_GPIO18_13M9S30P_IO_V, 6)
  `BSG_IO_IN   (clk_B,   IN12LP_GPIO18_13M9S30P_IO_V, 6)

  `BSG_IO_IN   (clk_C,           IN12LP_GPIO18_13M9S30P_IO_V, 7)
  `BSG_IO_OUT  (clk,             IN12LP_GPIO18_13M9S30P_IO_V, 7)
  `BSG_IO_IN   (clk_async_reset, IN12LP_GPIO18_13M9S30P_IO_V, 7)
  `BSG_IO_OUT  (misc,            IN12LP_GPIO18_13M9S30P_IO_V, 7)

  `BSG_IO_IN   (sel_0,            IN12LP_GPIO18_13M9S30P_IO_V, 8)
  `BSG_IO_IN   (sel_1,            IN12LP_GPIO18_13M9S30P_IO_V, 8)
  `BSG_IO_IN   (sel_2,            IN12LP_GPIO18_13M9S30P_IO_V, 8)
  `BSG_IO_IN   (core_async_reset, IN12LP_GPIO18_13M9S30P_IO_V, 8)
  `BSG_IO_OUT  (ci2_0,            IN12LP_GPIO18_13M9S30P_IO_V, 8)
  `BSG_IO_OUT  (ci2_1,            IN12LP_GPIO18_13M9S30P_IO_V, 8)
  `BSG_IO_OUT  (ci2_2,            IN12LP_GPIO18_13M9S30P_IO_V, 8)
  `BSG_IO_OUT  (ci2_3,            IN12LP_GPIO18_13M9S30P_IO_V, 8)

  `BSG_IO_OUT  (ci2_4,    IN12LP_GPIO18_13M9S30P_IO_V, 9)
  `BSG_IO_OUT  (ci2_clk,  IN12LP_GPIO18_13M9S30P_IO_V, 9)
  `BSG_IO_OUT  (ci2_v,    IN12LP_GPIO18_13M9S30P_IO_V, 9)
  `BSG_IO_IN   (ci2_tkn,  IN12LP_GPIO18_13M9S30P_IO_V, 9)
  `BSG_IO_OUT  (ci2_5,    IN12LP_GPIO18_13M9S30P_IO_V, 9)
  `BSG_IO_OUT  (ci2_6,    IN12LP_GPIO18_13M9S30P_IO_V, 9)
  `BSG_IO_OUT  (ci2_7,    IN12LP_GPIO18_13M9S30P_IO_V, 9)
  `BSG_IO_OUT  (ci2_8,    IN12LP_GPIO18_13M9S30P_IO_V, 9)

  // EAST SIDE OF THE CHIP

  `BSG_IO_IN   (ci_0,    IN12LP_GPIO18_13M9S30P_IO_H, 11)
  `BSG_IO_IN   (ci_1,    IN12LP_GPIO18_13M9S30P_IO_H, 11)
  `BSG_IO_IN   (ci_2,    IN12LP_GPIO18_13M9S30P_IO_H, 11)
  `BSG_IO_IN   (ci_3,    IN12LP_GPIO18_13M9S30P_IO_H, 11)
  `BSG_IO_IN   (ci_4,    IN12LP_GPIO18_13M9S30P_IO_H, 11)
  `BSG_IO_IN   (ci_clk,  IN12LP_GPIO18_13M9S30P_IO_H, 11)
  `BSG_IO_OUT  (ci_tkn,  IN12LP_GPIO18_13M9S30P_IO_H, 11)
  `BSG_IO_IN   (ci_v,    IN12LP_GPIO18_13M9S30P_IO_H, 11)
  `BSG_IO_IN   (ci_5,    IN12LP_GPIO18_13M9S30P_IO_H, 11)

  `BSG_IO_IN   (ci_6,         IN12LP_GPIO18_13M9S30P_IO_H, 12)
  `BSG_IO_IN   (ci_7,         IN12LP_GPIO18_13M9S30P_IO_H, 12)
  `BSG_IO_IN   (ci_8,         IN12LP_GPIO18_13M9S30P_IO_H, 12)
  `BSG_IO_IN   (bsg_tag_en,   IN12LP_GPIO18_13M9S30P_IO_H, 12)
  `BSG_IO_IN   (bsg_tag_data, IN12LP_GPIO18_13M9S30P_IO_H, 12)
  `BSG_IO_IN   (bsg_tag_clk,  IN12LP_GPIO18_13M9S30P_IO_H, 12)
//`BSG_IO_OUT  (ddr_dm_3,     IN12LP_GPIO18_13M9S30P_IO_H, 12)
//`BSG_IO_INOUT(ddr_dqs_p_3,  IN12LP_GPIO18_13M9S30P_IO_H, 12)
  `BSG_IO_OUT_UNUSED  (ddr_dm_3,     IN12LP_GPIO18_13M9S30P_IO_H, 12)
  `BSG_IO_INOUT_UNUSED(ddr_dqs_p_3,  IN12LP_GPIO18_13M9S30P_IO_H, 12)

//`BSG_IO_INOUT(ddr_dqs_n_3, IN12LP_GPIO18_13M9S30P_IO_H, 13)
//`BSG_IO_INOUT(ddr_dq_24,   IN12LP_GPIO18_13M9S30P_IO_H, 13)
//`BSG_IO_INOUT(ddr_dq_25,   IN12LP_GPIO18_13M9S30P_IO_H, 13)
//`BSG_IO_INOUT(ddr_dq_26,   IN12LP_GPIO18_13M9S30P_IO_H, 13)
//`BSG_IO_INOUT(ddr_dq_27,   IN12LP_GPIO18_13M9S30P_IO_H, 13)
//`BSG_IO_INOUT(ddr_dq_28,   IN12LP_GPIO18_13M9S30P_IO_H, 13)
//`BSG_IO_INOUT(ddr_dq_29,   IN12LP_GPIO18_13M9S30P_IO_H, 13)
//`BSG_IO_INOUT(ddr_dq_30,   IN12LP_GPIO18_13M9S30P_IO_H, 13)
//`BSG_IO_INOUT(ddr_dq_31,   IN12LP_GPIO18_13M9S30P_IO_H, 13)
  `BSG_IO_INOUT_UNUSED(ddr_dqs_n_3, IN12LP_GPIO18_13M9S30P_IO_H, 13)
  `BSG_IO_INOUT_UNUSED(ddr_dq_24,   IN12LP_GPIO18_13M9S30P_IO_H, 13)
  `BSG_IO_INOUT_UNUSED(ddr_dq_25,   IN12LP_GPIO18_13M9S30P_IO_H, 13)
  `BSG_IO_INOUT_UNUSED(ddr_dq_26,   IN12LP_GPIO18_13M9S30P_IO_H, 13)
  `BSG_IO_INOUT_UNUSED(ddr_dq_27,   IN12LP_GPIO18_13M9S30P_IO_H, 13)
  `BSG_IO_INOUT_UNUSED(ddr_dq_28,   IN12LP_GPIO18_13M9S30P_IO_H, 13)
  `BSG_IO_INOUT_UNUSED(ddr_dq_29,   IN12LP_GPIO18_13M9S30P_IO_H, 13)
  `BSG_IO_INOUT_UNUSED(ddr_dq_30,   IN12LP_GPIO18_13M9S30P_IO_H, 13)
  `BSG_IO_INOUT_UNUSED(ddr_dq_31,   IN12LP_GPIO18_13M9S30P_IO_H, 13)

//`BSG_IO_INOUT(ddr_dq_16, IN12LP_GPIO18_13M9S30P_IO_H, 14)
//`BSG_IO_INOUT(ddr_dq_17, IN12LP_GPIO18_13M9S30P_IO_H, 14)
//`BSG_IO_INOUT(ddr_dq_18, IN12LP_GPIO18_13M9S30P_IO_H, 14)
//`BSG_IO_INOUT(ddr_dq_19, IN12LP_GPIO18_13M9S30P_IO_H, 14)
//`BSG_IO_INOUT(ddr_dq_20, IN12LP_GPIO18_13M9S30P_IO_H, 14)
//`BSG_IO_INOUT(ddr_dq_21, IN12LP_GPIO18_13M9S30P_IO_H, 14)
//`BSG_IO_INOUT(ddr_dq_22, IN12LP_GPIO18_13M9S30P_IO_H, 14)
//`BSG_IO_INOUT(ddr_dq_23, IN12LP_GPIO18_13M9S30P_IO_H, 14)
  `BSG_IO_INOUT_UNUSED(ddr_dq_16, IN12LP_GPIO18_13M9S30P_IO_H, 14)
  `BSG_IO_INOUT_UNUSED(ddr_dq_17, IN12LP_GPIO18_13M9S30P_IO_H, 14)
  `BSG_IO_INOUT_UNUSED(ddr_dq_18, IN12LP_GPIO18_13M9S30P_IO_H, 14)
  `BSG_IO_INOUT_UNUSED(ddr_dq_19, IN12LP_GPIO18_13M9S30P_IO_H, 14)
  `BSG_IO_INOUT_UNUSED(ddr_dq_20, IN12LP_GPIO18_13M9S30P_IO_H, 14)
  `BSG_IO_INOUT_UNUSED(ddr_dq_21, IN12LP_GPIO18_13M9S30P_IO_H, 14)
  `BSG_IO_INOUT_UNUSED(ddr_dq_22, IN12LP_GPIO18_13M9S30P_IO_H, 14)
  `BSG_IO_INOUT_UNUSED(ddr_dq_23, IN12LP_GPIO18_13M9S30P_IO_H, 14)

  // SOUTH SIDE OF THE CHIP

//`BSG_IO_OUT  (ddr_dm_2,    IN12LP_GPIO18_13M9S30P_IO_V, 16)
//`BSG_IO_INOUT(ddr_dqs_p_2, IN12LP_GPIO18_13M9S30P_IO_V, 16)
//`BSG_IO_INOUT(ddr_dqs_n_2, IN12LP_GPIO18_13M9S30P_IO_V, 16)
//`BSG_IO_OUT  (ddr_ck_p,    IN12LP_GPIO18_13M9S30P_IO_V, 16)
//`BSG_IO_OUT  (ddr_ck_n,    IN12LP_GPIO18_13M9S30P_IO_V, 16)
//`BSG_IO_OUT  (ddr_cke,     IN12LP_GPIO18_13M9S30P_IO_V, 16)
//`BSG_IO_OUT  (ddr_cs_n,    IN12LP_GPIO18_13M9S30P_IO_V, 16)
//`BSG_IO_OUT  (ddr_ras_n,   IN12LP_GPIO18_13M9S30P_IO_V, 16)
//`BSG_IO_OUT  (ddr_cas_n,   IN12LP_GPIO18_13M9S30P_IO_V, 16)
  `BSG_IO_OUT_UNUSED  (ddr_dm_2,    IN12LP_GPIO18_13M9S30P_IO_V, 16)
  `BSG_IO_INOUT_UNUSED(ddr_dqs_p_2, IN12LP_GPIO18_13M9S30P_IO_V, 16)
  `BSG_IO_INOUT_UNUSED(ddr_dqs_n_2, IN12LP_GPIO18_13M9S30P_IO_V, 16)
  `BSG_IO_OUT_UNUSED  (ddr_ck_p,    IN12LP_GPIO18_13M9S30P_IO_V, 16)
  `BSG_IO_OUT_UNUSED  (ddr_ck_n,    IN12LP_GPIO18_13M9S30P_IO_V, 16)
  `BSG_IO_OUT_UNUSED  (ddr_cke,     IN12LP_GPIO18_13M9S30P_IO_V, 16)
  `BSG_IO_OUT_UNUSED  (ddr_cs_n,    IN12LP_GPIO18_13M9S30P_IO_V, 16)
  `BSG_IO_OUT_UNUSED  (ddr_ras_n,   IN12LP_GPIO18_13M9S30P_IO_V, 16)
  `BSG_IO_OUT_UNUSED  (ddr_cas_n,   IN12LP_GPIO18_13M9S30P_IO_V, 16)

//`BSG_IO_OUT  (ddr_we_n,     IN12LP_GPIO18_13M9S30P_IO_V, 17)
//`BSG_IO_OUT  (ddr_reset_n,  IN12LP_GPIO18_13M9S30P_IO_V, 17)
//`BSG_IO_OUT  (ddr_odt,      IN12LP_GPIO18_13M9S30P_IO_V, 17)
//`BSG_IO_OUT  (ddr_addr_0,   IN12LP_GPIO18_13M9S30P_IO_V, 17)
//`BSG_IO_OUT  (ddr_addr_1,   IN12LP_GPIO18_13M9S30P_IO_V, 17)
//`BSG_IO_OUT  (ddr_addr_2,   IN12LP_GPIO18_13M9S30P_IO_V, 17)
//`BSG_IO_OUT  (ddr_addr_3,   IN12LP_GPIO18_13M9S30P_IO_V, 17)
//`BSG_IO_OUT  (ddr_addr_4,   IN12LP_GPIO18_13M9S30P_IO_V, 17)
  `BSG_IO_OUT_UNUSED(ddr_we_n,     IN12LP_GPIO18_13M9S30P_IO_V, 17)
  `BSG_IO_OUT_UNUSED(ddr_reset_n,  IN12LP_GPIO18_13M9S30P_IO_V, 17)
  `BSG_IO_OUT_UNUSED(ddr_odt,      IN12LP_GPIO18_13M9S30P_IO_V, 17)
  `BSG_IO_OUT_UNUSED(ddr_addr_0,   IN12LP_GPIO18_13M9S30P_IO_V, 17)
  `BSG_IO_OUT_UNUSED(ddr_addr_1,   IN12LP_GPIO18_13M9S30P_IO_V, 17)
  `BSG_IO_OUT_UNUSED(ddr_addr_2,   IN12LP_GPIO18_13M9S30P_IO_V, 17)
  `BSG_IO_OUT_UNUSED(ddr_addr_3,   IN12LP_GPIO18_13M9S30P_IO_V, 17)
  `BSG_IO_OUT_UNUSED(ddr_addr_4,   IN12LP_GPIO18_13M9S30P_IO_V, 17)

//`BSG_IO_OUT  (ddr_addr_5,   IN12LP_GPIO18_13M9S30P_IO_V, 18)
//`BSG_IO_OUT  (ddr_addr_6,   IN12LP_GPIO18_13M9S30P_IO_V, 18)
//`BSG_IO_OUT  (ddr_addr_7,   IN12LP_GPIO18_13M9S30P_IO_V, 18)
//`BSG_IO_OUT  (ddr_addr_8,   IN12LP_GPIO18_13M9S30P_IO_V, 18)
//`BSG_IO_OUT  (ddr_addr_9,   IN12LP_GPIO18_13M9S30P_IO_V, 18)
//`BSG_IO_OUT  (ddr_addr_10,  IN12LP_GPIO18_13M9S30P_IO_V, 18)
//`BSG_IO_OUT  (ddr_addr_11,  IN12LP_GPIO18_13M9S30P_IO_V, 18)
//`BSG_IO_OUT  (ddr_addr_12,  IN12LP_GPIO18_13M9S30P_IO_V, 18)
//`BSG_IO_OUT  (ddr_addr_13,  IN12LP_GPIO18_13M9S30P_IO_V, 18)
  `BSG_IO_OUT_UNUSED(ddr_addr_5,   IN12LP_GPIO18_13M9S30P_IO_V, 18)
  `BSG_IO_OUT_UNUSED(ddr_addr_6,   IN12LP_GPIO18_13M9S30P_IO_V, 18)
  `BSG_IO_OUT_UNUSED(ddr_addr_7,   IN12LP_GPIO18_13M9S30P_IO_V, 18)
  `BSG_IO_OUT_UNUSED(ddr_addr_8,   IN12LP_GPIO18_13M9S30P_IO_V, 18)
  `BSG_IO_OUT_UNUSED(ddr_addr_9,   IN12LP_GPIO18_13M9S30P_IO_V, 18)
  `BSG_IO_OUT_UNUSED(ddr_addr_10,  IN12LP_GPIO18_13M9S30P_IO_V, 18)
  `BSG_IO_OUT_UNUSED(ddr_addr_11,  IN12LP_GPIO18_13M9S30P_IO_V, 18)
  `BSG_IO_OUT_UNUSED(ddr_addr_12,  IN12LP_GPIO18_13M9S30P_IO_V, 18)
  `BSG_IO_OUT_UNUSED(ddr_addr_13,  IN12LP_GPIO18_13M9S30P_IO_V, 18)

//`BSG_IO_OUT  (ddr_addr_14,   IN12LP_GPIO18_13M9S30P_IO_V, 19)
//`BSG_IO_OUT  (ddr_addr_15,   IN12LP_GPIO18_13M9S30P_IO_V, 19)
//`BSG_IO_OUT  (ddr_ba_0,      IN12LP_GPIO18_13M9S30P_IO_V, 19)
//`BSG_IO_OUT  (ddr_ba_1,      IN12LP_GPIO18_13M9S30P_IO_V, 19)
//`BSG_IO_OUT  (ddr_ba_2,      IN12LP_GPIO18_13M9S30P_IO_V, 19)
//`BSG_IO_INOUT(ddr_dqs_p_1,   IN12LP_GPIO18_13M9S30P_IO_V, 19)
//`BSG_IO_INOUT(ddr_dqs_n_1,   IN12LP_GPIO18_13M9S30P_IO_V, 19)
//`BSG_IO_OUT  (ddr_dm_1,      IN12LP_GPIO18_13M9S30P_IO_V, 19)
  `BSG_IO_OUT_UNUSED  (ddr_addr_14,   IN12LP_GPIO18_13M9S30P_IO_V, 19)
  `BSG_IO_OUT_UNUSED  (ddr_addr_15,   IN12LP_GPIO18_13M9S30P_IO_V, 19)
  `BSG_IO_OUT_UNUSED  (ddr_ba_0,      IN12LP_GPIO18_13M9S30P_IO_V, 19)
  `BSG_IO_OUT_UNUSED  (ddr_ba_1,      IN12LP_GPIO18_13M9S30P_IO_V, 19)
  `BSG_IO_OUT_UNUSED  (ddr_ba_2,      IN12LP_GPIO18_13M9S30P_IO_V, 19)
  `BSG_IO_INOUT_UNUSED(ddr_dqs_p_1,   IN12LP_GPIO18_13M9S30P_IO_V, 19)
  `BSG_IO_INOUT_UNUSED(ddr_dqs_n_1,   IN12LP_GPIO18_13M9S30P_IO_V, 19)
  `BSG_IO_OUT_UNUSED  (ddr_dm_1,      IN12LP_GPIO18_13M9S30P_IO_V, 19)
  
  `include "bsg_iopads_physical_only.v"

