genvar i;

`ifndef BSG_PAD_INPUT_PULLDOWN
BSG_PAD_INPUT_PULLDOWN should be defined!
`endif

`ifndef BSG_PAD_OUTPUT_A
BSG_PAD_OUTPUT_A should be defined!
`endif

`ifndef BSG_PAD_OUTPUT_B
BSG_PAD_OUTPUT_B should be defined!
`endif

`ifndef BSG_PAD_OUTPUT_C
BSG_PAD_OUTPUT_C should be defined!
`endif

`ifndef BSG_PAD_OUTPUT_D
BSG_PAD_OUTPUT_D should be defined!
`endif

`ifndef BSG_PAD_OUTPUT_SLOW
BSG_PAD_OUTPUT_SLOW should be defined!
`endif

`ifndef BSG_PAD_DISABLE
BSG_PAD_DISABLE should be defined!
`endif

`ifndef BSG_PAD_INOUT
BSG_PAD_INOUT should be defined!
`endif

  `BSG_IO_IN   (ci_clk,  `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci_v,    `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_OUT  (ci_tkn,  `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ci_tkn_oen_int)
  `BSG_IO_IN   (ci_0,    `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci_1,    `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci_2,    `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci_3,    `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci_4,    `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci_5,    `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci_6,    `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci_7,    `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci_8,    `BSG_PAD_INPUT_PULLDOWN)

  `BSG_IO_OUT  (co_clk,  `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co_clk_oen_int)
  `BSG_IO_OUT  (co_v,    `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co_v_oen_int)
  `BSG_IO_IN   (co_tkn,  `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_OUT  (co_0,    `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co_0_oen_int)
  `BSG_IO_OUT  (co_1,    `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co_1_oen_int)
  `BSG_IO_OUT  (co_2,    `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co_2_oen_int)
  `BSG_IO_OUT  (co_3,    `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co_3_oen_int)
  `BSG_IO_OUT  (co_4,    `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co_4_oen_int)
  `BSG_IO_OUT  (co_5,    `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co_5_oen_int)
  `BSG_IO_OUT  (co_6,    `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co_6_oen_int)
  `BSG_IO_OUT  (co_7,    `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co_7_oen_int)
  `BSG_IO_OUT  (co_8,    `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co_8_oen_int)

  `BSG_IO_IN   (ci2_clk, `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci2_v,   `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_OUT  (ci2_tkn, `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ci2_tkn_oen_int)
  `BSG_IO_IN   (ci2_0,   `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci2_1,   `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci2_2,   `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci2_3,   `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci2_4,   `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci2_5,   `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci2_6,   `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci2_7,   `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (ci2_8,   `BSG_PAD_INPUT_PULLDOWN)

  `BSG_IO_OUT  (co2_clk, `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co2_clk_oen_int)
  `BSG_IO_OUT  (co2_v,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co2_v_oen_int)
  `BSG_IO_IN   (co2_tkn, `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_OUT  (co2_0,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co2_0_oen_int)
  `BSG_IO_OUT  (co2_1,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co2_1_oen_int)
  `BSG_IO_OUT  (co2_2,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co2_2_oen_int)
  `BSG_IO_OUT  (co2_3,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co2_3_oen_int)
  `BSG_IO_OUT  (co2_4,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co2_4_oen_int)
  `BSG_IO_OUT  (co2_5,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co2_5_oen_int)
  `BSG_IO_OUT  (co2_6,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co2_6_oen_int)
  `BSG_IO_OUT  (co2_7,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co2_7_oen_int)
  `BSG_IO_OUT  (co2_8,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(co2_8_oen_int)

  `BSG_IO_OUT  (ddr_ck_p, `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_ck_p_oen_int)
  `BSG_IO_OUT  (ddr_ck_n, `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_ck_n_oen_int)

  `BSG_IO_OUT  (ddr_cke, `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_cke_oen_int)

  `BSG_IO_OUT  (ddr_cs_n, `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_cs_n_oen_int)
  `BSG_IO_OUT  (ddr_ras_n, `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_ras_n_oen_int)
  `BSG_IO_OUT  (ddr_cas_n, `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_cas_n_oen_int)
  `BSG_IO_OUT  (ddr_we_n, `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_we_n_oen_int)

  `BSG_IO_OUT  (ddr_reset_n, `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_reset_n_oen_int)
  `BSG_IO_OUT  (ddr_odt, `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_odt_oen_int)

  `BSG_IO_OUT  (ddr_ba_0,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_ba_0_oen_int)
  `BSG_IO_OUT  (ddr_ba_1,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_ba_1_oen_int)
  `BSG_IO_OUT  (ddr_ba_2,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_ba_2_oen_int)

  `BSG_IO_OUT  (ddr_addr_0,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_addr_0_oen_int)
  `BSG_IO_OUT  (ddr_addr_1,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_addr_1_oen_int)
  `BSG_IO_OUT  (ddr_addr_2,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_addr_2_oen_int)
  `BSG_IO_OUT  (ddr_addr_3,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_addr_3_oen_int)
  `BSG_IO_OUT  (ddr_addr_4,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_addr_4_oen_int)
  `BSG_IO_OUT  (ddr_addr_5,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_addr_5_oen_int)
  `BSG_IO_OUT  (ddr_addr_6,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_addr_6_oen_int)
  `BSG_IO_OUT  (ddr_addr_7,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_addr_7_oen_int)
  `BSG_IO_OUT  (ddr_addr_8,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_addr_8_oen_int)
  `BSG_IO_OUT  (ddr_addr_9,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_addr_9_oen_int)
  `BSG_IO_OUT  (ddr_addr_10,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_addr_10_oen_int)
  `BSG_IO_OUT  (ddr_addr_11,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_addr_11_oen_int)
  `BSG_IO_OUT  (ddr_addr_12,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_addr_12_oen_int)
  `BSG_IO_OUT  (ddr_addr_13,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_addr_13_oen_int)
  `BSG_IO_OUT  (ddr_addr_14,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_addr_14_oen_int)
  `BSG_IO_OUT  (ddr_addr_15,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_addr_15_oen_int)

  `BSG_IO_OUT  (ddr_dm_0,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_dm_0_oen_int)
  `BSG_IO_OUT  (ddr_dm_1,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_dm_1_oen_int)
  `BSG_IO_OUT  (ddr_dm_2,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_dm_2_oen_int)
  `BSG_IO_OUT  (ddr_dm_3,   `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(ddr_dm_3_oen_int)

  `BSG_IO_INOUT(ddr_dqs_p_0,   `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dqs_n_0,   `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dqs_p_1,   `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dqs_n_1,   `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dqs_p_2,   `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dqs_n_2,   `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dqs_p_3,   `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dqs_n_3,   `BSG_PAD_INOUT)

  `BSG_IO_INOUT(ddr_dq_0,  `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_1,  `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_2,  `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_3,  `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_4,  `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_5,  `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_6,  `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_7,  `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_8,  `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_9,  `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_10, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_11, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_12, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_13, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_14, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_15, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_16, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_17, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_18, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_19, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_20, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_21, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_22, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_23, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_24, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_25, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_26, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_27, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_28, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_29, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_30, `BSG_PAD_INOUT)
  `BSG_IO_INOUT(ddr_dq_31, `BSG_PAD_INOUT)

  `BSG_IO_IN   (bsg_tag_clk,  `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (bsg_tag_en,   `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (bsg_tag_data, `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_OUT  (bsg_tag_clk,  `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(bsg_tag_clk_oen_int)
  `BSG_IO_OUT  (bsg_tag_data, `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(bsg_tag_data_oen_int)

  `BSG_IO_IN   (clk_A, `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (clk_B, `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (clk_C, `BSG_PAD_INPUT_PULLDOWN)

  `BSG_IO_OUT  (clk, `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(clk_oen_int)

  `BSG_IO_IN   (sel_0, `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (sel_1, `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (sel_2, `BSG_PAD_INPUT_PULLDOWN)

  `BSG_IO_IN   (clk_async_reset, `BSG_PAD_INPUT_PULLDOWN)
  `BSG_IO_IN   (core_async_reset, `BSG_PAD_INPUT_PULLDOWN)

  `BSG_IO_OUT  (misc, `BSG_PAD_OUTPUT_SLOW)
  `BSG_IO_TIELO(misc_oen_int)
