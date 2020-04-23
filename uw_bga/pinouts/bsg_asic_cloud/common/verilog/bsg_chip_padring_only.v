module bsg_chip_padring_only
`include "bsg_pinout.v"

  // Link CH1 Inputs (from next chip)
  logic       ci_clk_i_int;
  logic       ci_v_i_int;
  logic [8:0] ci_data_i_int;
  logic       ci_tkn_o_int;

  // Link CH1 Outputs (to next chip)
  logic       co_clk_o_int;
  logic       co_v_o_int;
  logic [8:0] co_data_o_int;
  logic       co_tkn_i_int;

  // Link CH2 Inputs (from prev chip)
  logic       ci2_clk_i_int;
  logic       ci2_v_i_int;
  logic [8:0] ci2_data_i_int;
  logic       ci2_tkn_o_int;

  // Link CH2 Outputs (to prev chip)
  logic       co2_clk_o_int;
  logic       co2_v_o_int;
  logic [8:0] co2_data_o_int;
  logic       co2_tkn_i_int;

  // LPDDR DRAM Interface
  logic        ddr_ck_p_o_int;
  logic        ddr_ck_n_o_int;
  logic        ddr_cke_o_int;
  logic        ddr_cs_n_o_int;
  logic        ddr_ras_n_o_int;
  logic        ddr_cas_n_o_int;
  logic        ddr_we_n_o_int;
  logic        ddr_reset_n_o_int;
  logic        ddr_odt_o_int;
  logic [2:0]  ddr_ba_o_int;
  logic [15:0] ddr_addr_o_int;
  logic [3:0]  ddr_dm_o_int;
  logic [3:0]  ddr_dqs_p_i_int, ddr_dqs_p_o_int, ddr_dqs_p_oen_int;
  logic [3:0]  ddr_dqs_n_i_int, ddr_dqs_n_o_int, ddr_dqs_n_oen_int;
  logic [31:0] ddr_dq_i_int,    ddr_dq_o_int,    ddr_dq_oen_int;

  // BSG Tag Interface
  logic bsg_tag_clk_i_int;
  logic bsg_tag_en_i_int;
  logic bsg_tag_data_i_int;
  logic bsg_tag_clk_o_int;
  logic bsg_tag_data_o_int;

  // Clock Signals
  logic clk_A_i_int;
  logic clk_B_i_int;
  logic clk_C_i_int;
  logic clk_o_int;

  // Async Reset Signals
  logic clk_async_reset_i_int;
  logic core_async_reset_i_int;

  // Misc. Signals
  logic [2:0] sel_i_int;
  logic       misc_o_int;

  bsg_padring padring
    (.p_ci_clk_i            ,.c_ci_clk_o(ci_clk_i_int    )
    ,.p_ci_v_i              ,.c_ci_v_o  (ci_v_i_int      )
    ,.p_ci_tkn_o            ,.c_ci_tkn_i(ci_tkn_o_int    )
    ,.p_ci_0_i              ,.c_ci_0_o  (ci_data_i_int[0])
    ,.p_ci_1_i              ,.c_ci_1_o  (ci_data_i_int[1])
    ,.p_ci_2_i              ,.c_ci_2_o  (ci_data_i_int[2])
    ,.p_ci_3_i              ,.c_ci_3_o  (ci_data_i_int[3])
    ,.p_ci_4_i              ,.c_ci_4_o  (ci_data_i_int[4])
    ,.p_ci_5_i              ,.c_ci_5_o  (ci_data_i_int[5])
    ,.p_ci_6_i              ,.c_ci_6_o  (ci_data_i_int[6])
    ,.p_ci_7_i              ,.c_ci_7_o  (ci_data_i_int[7])
    ,.p_ci_8_i              ,.c_ci_8_o  (ci_data_i_int[8])

    ,.p_co_clk_i            ,.c_co_clk_i(co_clk_o_int    )
    ,.p_co_v_i              ,.c_co_v_i  (co_v_o_int      )
    ,.p_co_tkn_o            ,.c_co_tkn_o(co_tkn_i_int    )
    ,.p_co_0_i              ,.c_co_0_i  (co_data_o_int[0])
    ,.p_co_1_i              ,.c_co_1_i  (co_data_o_int[1])
    ,.p_co_2_i              ,.c_co_2_i  (co_data_o_int[2])
    ,.p_co_3_i              ,.c_co_3_i  (co_data_o_int[3])
    ,.p_co_4_i              ,.c_co_4_i  (co_data_o_int[4])
    ,.p_co_5_i              ,.c_co_5_i  (co_data_o_int[5])
    ,.p_co_6_i              ,.c_co_6_i  (co_data_o_int[6])
    ,.p_co_7_i              ,.c_co_7_i  (co_data_o_int[7])
    ,.p_co_8_i              ,.c_co_8_i  (co_data_o_int[8])

    ,.p_ci2_clk_o           ,.c_ci2_clk_o(ci2_clk_i_int    )
    ,.p_ci2_v_o             ,.c_ci2_v_o  (ci2_v_i_int      )
    ,.p_ci2_tkn_i           ,.c_ci2_tkn_i(ci2_tkn_o_int    )
    ,.p_ci2_0_o             ,.c_ci2_0_o  (ci2_data_i_int[0])
    ,.p_ci2_1_o             ,.c_ci2_1_o  (ci2_data_i_int[1])
    ,.p_ci2_2_o             ,.c_ci2_2_o  (ci2_data_i_int[2])
    ,.p_ci2_3_o             ,.c_ci2_3_o  (ci2_data_i_int[3])
    ,.p_ci2_4_o             ,.c_ci2_4_o  (ci2_data_i_int[4])
    ,.p_ci2_5_o             ,.c_ci2_5_o  (ci2_data_i_int[5])
    ,.p_ci2_6_o             ,.c_ci2_6_o  (ci2_data_i_int[6])
    ,.p_ci2_7_o             ,.c_ci2_7_o  (ci2_data_i_int[7])
    ,.p_ci2_8_o             ,.c_ci2_8_o  (ci2_data_i_int[8])

    ,.p_co2_clk_o           ,.c_co2_clk_i(co2_clk_o_int    )
    ,.p_co2_v_o             ,.c_co2_v_i  (co2_v_o_int      )
    ,.p_co2_tkn_i           ,.c_co2_tkn_o(co2_tkn_i_int    )
    ,.p_co2_0_o             ,.c_co2_0_i  (co2_data_o_int[0])
    ,.p_co2_1_o             ,.c_co2_1_i  (co2_data_o_int[1])
    ,.p_co2_2_o             ,.c_co2_2_i  (co2_data_o_int[2])
    ,.p_co2_3_o             ,.c_co2_3_i  (co2_data_o_int[3])
    ,.p_co2_4_o             ,.c_co2_4_i  (co2_data_o_int[4])
    ,.p_co2_5_o             ,.c_co2_5_i  (co2_data_o_int[5])
    ,.p_co2_6_o             ,.c_co2_6_i  (co2_data_o_int[6])
    ,.p_co2_7_o             ,.c_co2_7_i  (co2_data_o_int[7])
    ,.p_co2_8_o             ,.c_co2_8_i  (co2_data_o_int[8])

    ,.p_ddr_ck_p_o          ,.c_ddr_ck_p_i(ddr_ck_p_o_int)
    ,.p_ddr_ck_n_o          ,.c_ddr_ck_n_i(ddr_ck_n_o_int)

    ,.p_ddr_cke_o           ,.c_ddr_cke_i(ddr_cke_o_int)

    ,.p_ddr_cs_n_o          ,.c_ddr_cs_n_i (ddr_cs_n_o_int )
    ,.p_ddr_ras_n_o         ,.c_ddr_ras_n_i(ddr_ras_n_o_int)
    ,.p_ddr_cas_n_o         ,.c_ddr_cas_n_i(ddr_cas_n_o_int)
    ,.p_ddr_we_n_o          ,.c_ddr_we_n_i (ddr_we_n_o_int )

    ,.p_ddr_reset_n_o       ,.c_ddr_reset_n_i(ddr_reset_n_o_int)
    ,.p_ddr_odt_o           ,.c_ddr_odt_i    (ddr_odt_o_int    )

    ,.p_ddr_ba_0_o          ,.c_ddr_ba_0_i(ddr_ba_o_int[0])
    ,.p_ddr_ba_1_o          ,.c_ddr_ba_1_i(ddr_ba_o_int[1])
    ,.p_ddr_ba_2_o          ,.c_ddr_ba_2_i(ddr_ba_o_int[2])

    ,.p_ddr_addr_0_o        ,.c_ddr_addr_0_i (ddr_addr_o_int[0] )
    ,.p_ddr_addr_1_o        ,.c_ddr_addr_1_i (ddr_addr_o_int[1] )
    ,.p_ddr_addr_2_o        ,.c_ddr_addr_2_i (ddr_addr_o_int[2] )
    ,.p_ddr_addr_3_o        ,.c_ddr_addr_3_i (ddr_addr_o_int[3] )
    ,.p_ddr_addr_4_o        ,.c_ddr_addr_4_i (ddr_addr_o_int[4] )
    ,.p_ddr_addr_5_o        ,.c_ddr_addr_5_i (ddr_addr_o_int[5] )
    ,.p_ddr_addr_6_o        ,.c_ddr_addr_6_i (ddr_addr_o_int[6] )
    ,.p_ddr_addr_7_o        ,.c_ddr_addr_7_i (ddr_addr_o_int[7] )
    ,.p_ddr_addr_8_o        ,.c_ddr_addr_8_i (ddr_addr_o_int[8] )
    ,.p_ddr_addr_9_o        ,.c_ddr_addr_9_i (ddr_addr_o_int[9] )
    ,.p_ddr_addr_10_o       ,.c_ddr_addr_10_i(ddr_addr_o_int[10])
    ,.p_ddr_addr_11_o       ,.c_ddr_addr_11_i(ddr_addr_o_int[11])
    ,.p_ddr_addr_12_o       ,.c_ddr_addr_12_i(ddr_addr_o_int[12])
    ,.p_ddr_addr_13_o       ,.c_ddr_addr_13_i(ddr_addr_o_int[13])
    ,.p_ddr_addr_14_o       ,.c_ddr_addr_14_i(ddr_addr_o_int[14])
    ,.p_ddr_addr_15_o       ,.c_ddr_addr_15_i(ddr_addr_o_int[15])

    ,.p_ddr_dm_0_o          ,.c_ddr_dm_0_i(ddr_dm_o_int[0])
    ,.p_ddr_dm_1_o          ,.c_ddr_dm_1_i(ddr_dm_o_int[1])
    ,.p_ddr_dm_2_o          ,.c_ddr_dm_2_i(ddr_dm_o_int[2])
    ,.p_ddr_dm_3_o          ,.c_ddr_dm_3_i(ddr_dm_o_int[3])

    ,.p_ddr_dqs_p_0_io      ,.c_ddr_dqs_p_0_o(ddr_dqs_p_i_int[0]) ,.c_ddr_dqs_p_0_i(ddr_dqs_p_o_int[0]) ,.c_ddr_dqs_p_0_oen_i(ddr_dqs_p_oen_int[0])
    ,.p_ddr_dqs_n_0_io      ,.c_ddr_dqs_n_0_o(ddr_dqs_n_i_int[0]) ,.c_ddr_dqs_n_0_i(ddr_dqs_n_o_int[0]) ,.c_ddr_dqs_n_0_oen_i(ddr_dqs_n_oen_int[0])
    ,.p_ddr_dqs_p_1_io      ,.c_ddr_dqs_p_1_o(ddr_dqs_p_i_int[1]) ,.c_ddr_dqs_p_1_i(ddr_dqs_p_o_int[1]) ,.c_ddr_dqs_p_1_oen_i(ddr_dqs_p_oen_int[1])
    ,.p_ddr_dqs_n_1_io      ,.c_ddr_dqs_n_1_o(ddr_dqs_n_i_int[1]) ,.c_ddr_dqs_n_1_i(ddr_dqs_n_o_int[1]) ,.c_ddr_dqs_n_1_oen_i(ddr_dqs_n_oen_int[1])
    ,.p_ddr_dqs_p_2_io      ,.c_ddr_dqs_p_2_o(ddr_dqs_p_i_int[2]) ,.c_ddr_dqs_p_2_i(ddr_dqs_p_o_int[2]) ,.c_ddr_dqs_p_2_oen_i(ddr_dqs_p_oen_int[2])
    ,.p_ddr_dqs_n_2_io      ,.c_ddr_dqs_n_2_o(ddr_dqs_n_i_int[2]) ,.c_ddr_dqs_n_2_i(ddr_dqs_n_o_int[2]) ,.c_ddr_dqs_n_2_oen_i(ddr_dqs_n_oen_int[2])
    ,.p_ddr_dqs_p_3_io      ,.c_ddr_dqs_p_3_o(ddr_dqs_p_i_int[3]) ,.c_ddr_dqs_p_3_i(ddr_dqs_p_o_int[3]) ,.c_ddr_dqs_p_3_oen_i(ddr_dqs_p_oen_int[3])
    ,.p_ddr_dqs_n_3_io      ,.c_ddr_dqs_n_3_o(ddr_dqs_n_i_int[3]) ,.c_ddr_dqs_n_3_i(ddr_dqs_n_o_int[3]) ,.c_ddr_dqs_n_3_oen_i(ddr_dqs_n_oen_int[3])

    ,.p_ddr_dq_0_io         ,.c_ddr_dq_0_o (ddr_dq_i_int[0] ) ,.c_ddr_dq_0_i (ddr_dq_o_int[0] ) ,.c_ddr_dq_0_oen_i (ddr_dq_oen_int[0] )
    ,.p_ddr_dq_1_io         ,.c_ddr_dq_1_o (ddr_dq_i_int[1] ) ,.c_ddr_dq_1_i (ddr_dq_o_int[1] ) ,.c_ddr_dq_1_oen_i (ddr_dq_oen_int[1] )
    ,.p_ddr_dq_2_io         ,.c_ddr_dq_2_o (ddr_dq_i_int[2] ) ,.c_ddr_dq_2_i (ddr_dq_o_int[2] ) ,.c_ddr_dq_2_oen_i (ddr_dq_oen_int[2] )
    ,.p_ddr_dq_3_io         ,.c_ddr_dq_3_o (ddr_dq_i_int[3] ) ,.c_ddr_dq_3_i (ddr_dq_o_int[3] ) ,.c_ddr_dq_3_oen_i (ddr_dq_oen_int[3] )
    ,.p_ddr_dq_4_io         ,.c_ddr_dq_4_o (ddr_dq_i_int[4] ) ,.c_ddr_dq_4_i (ddr_dq_o_int[4] ) ,.c_ddr_dq_4_oen_i (ddr_dq_oen_int[4] )
    ,.p_ddr_dq_5_io         ,.c_ddr_dq_5_o (ddr_dq_i_int[5] ) ,.c_ddr_dq_5_i (ddr_dq_o_int[5] ) ,.c_ddr_dq_5_oen_i (ddr_dq_oen_int[5] )
    ,.p_ddr_dq_6_io         ,.c_ddr_dq_6_o (ddr_dq_i_int[6] ) ,.c_ddr_dq_6_i (ddr_dq_o_int[6] ) ,.c_ddr_dq_6_oen_i (ddr_dq_oen_int[6] )
    ,.p_ddr_dq_7_io         ,.c_ddr_dq_7_o (ddr_dq_i_int[7] ) ,.c_ddr_dq_7_i (ddr_dq_o_int[7] ) ,.c_ddr_dq_7_oen_i (ddr_dq_oen_int[7] )
    ,.p_ddr_dq_8_io         ,.c_ddr_dq_8_o (ddr_dq_i_int[8] ) ,.c_ddr_dq_8_i (ddr_dq_o_int[8] ) ,.c_ddr_dq_8_oen_i (ddr_dq_oen_int[8] )
    ,.p_ddr_dq_9_io         ,.c_ddr_dq_9_o (ddr_dq_i_int[9] ) ,.c_ddr_dq_9_i (ddr_dq_o_int[9] ) ,.c_ddr_dq_9_oen_i (ddr_dq_oen_int[9] )
    ,.p_ddr_dq_10_io        ,.c_ddr_dq_10_o(ddr_dq_i_int[10]) ,.c_ddr_dq_10_i(ddr_dq_o_int[10]) ,.c_ddr_dq_10_oen_i(ddr_dq_oen_int[10])
    ,.p_ddr_dq_11_io        ,.c_ddr_dq_11_o(ddr_dq_i_int[11]) ,.c_ddr_dq_11_i(ddr_dq_o_int[11]) ,.c_ddr_dq_11_oen_i(ddr_dq_oen_int[11])
    ,.p_ddr_dq_12_io        ,.c_ddr_dq_12_o(ddr_dq_i_int[12]) ,.c_ddr_dq_12_i(ddr_dq_o_int[12]) ,.c_ddr_dq_12_oen_i(ddr_dq_oen_int[12])
    ,.p_ddr_dq_13_io        ,.c_ddr_dq_13_o(ddr_dq_i_int[13]) ,.c_ddr_dq_13_i(ddr_dq_o_int[13]) ,.c_ddr_dq_13_oen_i(ddr_dq_oen_int[13])
    ,.p_ddr_dq_14_io        ,.c_ddr_dq_14_o(ddr_dq_i_int[14]) ,.c_ddr_dq_14_i(ddr_dq_o_int[14]) ,.c_ddr_dq_14_oen_i(ddr_dq_oen_int[14])
    ,.p_ddr_dq_15_io        ,.c_ddr_dq_15_o(ddr_dq_i_int[15]) ,.c_ddr_dq_15_i(ddr_dq_o_int[15]) ,.c_ddr_dq_15_oen_i(ddr_dq_oen_int[15])
    ,.p_ddr_dq_16_io        ,.c_ddr_dq_16_o(ddr_dq_i_int[16]) ,.c_ddr_dq_16_i(ddr_dq_o_int[16]) ,.c_ddr_dq_16_oen_i(ddr_dq_oen_int[16])
    ,.p_ddr_dq_17_io        ,.c_ddr_dq_17_o(ddr_dq_i_int[17]) ,.c_ddr_dq_17_i(ddr_dq_o_int[17]) ,.c_ddr_dq_17_oen_i(ddr_dq_oen_int[17])
    ,.p_ddr_dq_18_io        ,.c_ddr_dq_18_o(ddr_dq_i_int[18]) ,.c_ddr_dq_18_i(ddr_dq_o_int[18]) ,.c_ddr_dq_18_oen_i(ddr_dq_oen_int[18])
    ,.p_ddr_dq_19_io        ,.c_ddr_dq_19_o(ddr_dq_i_int[19]) ,.c_ddr_dq_19_i(ddr_dq_o_int[19]) ,.c_ddr_dq_19_oen_i(ddr_dq_oen_int[19])
    ,.p_ddr_dq_20_io        ,.c_ddr_dq_20_o(ddr_dq_i_int[20]) ,.c_ddr_dq_20_i(ddr_dq_o_int[20]) ,.c_ddr_dq_20_oen_i(ddr_dq_oen_int[20])
    ,.p_ddr_dq_21_io        ,.c_ddr_dq_21_o(ddr_dq_i_int[21]) ,.c_ddr_dq_21_i(ddr_dq_o_int[21]) ,.c_ddr_dq_21_oen_i(ddr_dq_oen_int[21])
    ,.p_ddr_dq_22_io        ,.c_ddr_dq_22_o(ddr_dq_i_int[22]) ,.c_ddr_dq_22_i(ddr_dq_o_int[22]) ,.c_ddr_dq_22_oen_i(ddr_dq_oen_int[22])
    ,.p_ddr_dq_23_io        ,.c_ddr_dq_23_o(ddr_dq_i_int[23]) ,.c_ddr_dq_23_i(ddr_dq_o_int[23]) ,.c_ddr_dq_23_oen_i(ddr_dq_oen_int[23])
    ,.p_ddr_dq_24_io        ,.c_ddr_dq_24_o(ddr_dq_i_int[24]) ,.c_ddr_dq_24_i(ddr_dq_o_int[24]) ,.c_ddr_dq_24_oen_i(ddr_dq_oen_int[24])
    ,.p_ddr_dq_25_io        ,.c_ddr_dq_25_o(ddr_dq_i_int[25]) ,.c_ddr_dq_25_i(ddr_dq_o_int[25]) ,.c_ddr_dq_25_oen_i(ddr_dq_oen_int[25])
    ,.p_ddr_dq_26_io        ,.c_ddr_dq_26_o(ddr_dq_i_int[26]) ,.c_ddr_dq_26_i(ddr_dq_o_int[26]) ,.c_ddr_dq_26_oen_i(ddr_dq_oen_int[26])
    ,.p_ddr_dq_27_io        ,.c_ddr_dq_27_o(ddr_dq_i_int[27]) ,.c_ddr_dq_27_i(ddr_dq_o_int[27]) ,.c_ddr_dq_27_oen_i(ddr_dq_oen_int[27])
    ,.p_ddr_dq_28_io        ,.c_ddr_dq_28_o(ddr_dq_i_int[28]) ,.c_ddr_dq_28_i(ddr_dq_o_int[28]) ,.c_ddr_dq_28_oen_i(ddr_dq_oen_int[28])
    ,.p_ddr_dq_29_io        ,.c_ddr_dq_29_o(ddr_dq_i_int[29]) ,.c_ddr_dq_29_i(ddr_dq_o_int[29]) ,.c_ddr_dq_29_oen_i(ddr_dq_oen_int[29])
    ,.p_ddr_dq_30_io        ,.c_ddr_dq_30_o(ddr_dq_i_int[30]) ,.c_ddr_dq_30_i(ddr_dq_o_int[30]) ,.c_ddr_dq_30_oen_i(ddr_dq_oen_int[30])
    ,.p_ddr_dq_31_io        ,.c_ddr_dq_31_o(ddr_dq_i_int[31]) ,.c_ddr_dq_31_i(ddr_dq_o_int[31]) ,.c_ddr_dq_31_oen_i(ddr_dq_oen_int[31])

    ,.p_bsg_tag_clk_i       ,.c_bsg_tag_clk_o (bsg_tag_clk_i_int )
    ,.p_bsg_tag_en_i        ,.c_bsg_tag_en_o  (bsg_tag_en_i_int  )
    ,.p_bsg_tag_data_i      ,.c_bsg_tag_data_o(bsg_tag_data_i_int)
    ,.p_bsg_tag_clk_o       ,.c_bsg_tag_clk_i (bsg_tag_clk_o_int )
    ,.p_bsg_tag_data_o      ,.c_bsg_tag_data_i(bsg_tag_data_o_int)

    ,.p_clk_A_i             ,.c_clk_A_o(clk_A_i_int)
    ,.p_clk_B_i             ,.c_clk_B_o(clk_B_i_int)
    ,.p_clk_C_i             ,.c_clk_C_o(clk_C_i_int)

    ,.p_clk_o               ,.c_clk_i(clk_o_int)

    ,.p_sel_0_i             ,.c_sel_0_o(sel_i_int[0])
    ,.p_sel_1_i             ,.c_sel_1_o(sel_i_int[1])
    ,.p_sel_2_i             ,.c_sel_2_o(sel_i_int[2])

    ,.p_clk_async_reset_i   ,.c_clk_async_reset_o (clk_async_reset_i_int )
    ,.p_core_async_reset_i  ,.c_core_async_reset_o(core_async_reset_i_int)

    ,.p_misc_o              ,.c_misc_i(misc_o_int)
    );

endmodule // bsg_chip_padring_only

