// **********************************************************************
// Begin HB BGA PAD Definitions
//

(

  `define BSG_PINOUT_16B_CHANNEL_PORTS(ch_name) \
      input   p_``ch_name``_clk1_i  \
     ,input   p_``ch_name``_clk2_i  \
     ,input   p_``ch_name``_v_i     \
     ,output  p_``ch_name``_tkn_o   \
     ,input   p_``ch_name``_0_i     \
     ,input   p_``ch_name``_1_i     \
     ,input   p_``ch_name``_2_i     \
     ,input   p_``ch_name``_3_i     \
     ,input   p_``ch_name``_4_i     \
     ,input   p_``ch_name``_5_i     \
     ,input   p_``ch_name``_6_i     \
     ,input   p_``ch_name``_7_i     \
     ,input   p_``ch_name``_8_i     \
     ,input   p_``ch_name``_9_i     \
     ,input   p_``ch_name``_10_i    \
     ,input   p_``ch_name``_11_i    \
     ,input   p_``ch_name``_12_i    \
     ,input   p_``ch_name``_13_i    \
     ,input   p_``ch_name``_14_i    \
     ,input   p_``ch_name``_15_i    \
     ,output  p_``ch_name``_clk_o   \
     ,output  p_``ch_name``_v_o     \
     ,input   p_``ch_name``_tkn_i   \
     ,output  p_``ch_name``_0_o     \
     ,output  p_``ch_name``_1_o     \
     ,output  p_``ch_name``_2_o     \
     ,output  p_``ch_name``_3_o     \
     ,output  p_``ch_name``_4_o     \
     ,output  p_``ch_name``_5_o     \
     ,output  p_``ch_name``_6_o     \
     ,output  p_``ch_name``_7_o     \
     ,output  p_``ch_name``_8_o     \
     ,output  p_``ch_name``_9_o     \
     ,output  p_``ch_name``_10_o    \
     ,output  p_``ch_name``_11_o    \
     ,output  p_``ch_name``_12_o    \
     ,output  p_``ch_name``_13_o    \
     ,output  p_``ch_name``_14_o    \
     ,output  p_``ch_name``_15_o    \
     ,output  p_``ch_name``_extra_o

  `define BSG_PINOUT_8B_CHANNEL_PORTS(ch_name) \
      input   p_``ch_name``_clk_i   \
     ,input   p_``ch_name``_v_i     \
     ,output  p_``ch_name``_tkn_o   \
     ,input   p_``ch_name``_0_i     \
     ,input   p_``ch_name``_1_i     \
     ,input   p_``ch_name``_2_i     \
     ,input   p_``ch_name``_3_i     \
     ,input   p_``ch_name``_4_i     \
     ,input   p_``ch_name``_5_i     \
     ,input   p_``ch_name``_6_i     \
     ,input   p_``ch_name``_7_i     \
     ,output  p_``ch_name``_clk_o   \
     ,output  p_``ch_name``_v_o     \
     ,input   p_``ch_name``_tkn_i   \
     ,output  p_``ch_name``_0_o     \
     ,output  p_``ch_name``_1_o     \
     ,output  p_``ch_name``_2_o     \
     ,output  p_``ch_name``_3_o     \
     ,output  p_``ch_name``_4_o     \
     ,output  p_``ch_name``_5_o     \
     ,output  p_``ch_name``_6_o     \
     ,output  p_``ch_name``_7_o


  // DRAM L CHANNELS
  `BSG_PINOUT_16B_CHANNEL_PORTS(dram_ch_l0)
  `BSG_PINOUT_16B_CHANNEL_PORTS(dram_ch_l1),
  `BSG_PINOUT_16B_CHANNEL_PORTS(dram_ch_l2),
  `BSG_PINOUT_16B_CHANNEL_PORTS(dram_ch_l3),
  `BSG_PINOUT_16B_CHANNEL_PORTS(dram_ch_l4),
  `BSG_PINOUT_16B_CHANNEL_PORTS(dram_ch_l5),
  `BSG_PINOUT_16B_CHANNEL_PORTS(dram_ch_l6),
  `BSG_PINOUT_16B_CHANNEL_PORTS(dram_ch_l7),

  // DRAM R CHANNELS
  `BSG_PINOUT_16B_CHANNEL_PORTS(dram_ch_r0),
  `BSG_PINOUT_16B_CHANNEL_PORTS(dram_ch_r1),
  `BSG_PINOUT_16B_CHANNEL_PORTS(dram_ch_r2),
  `BSG_PINOUT_16B_CHANNEL_PORTS(dram_ch_r3),
  `BSG_PINOUT_16B_CHANNEL_PORTS(dram_ch_r4),
  `BSG_PINOUT_16B_CHANNEL_PORTS(dram_ch_r5),
  `BSG_PINOUT_16B_CHANNEL_PORTS(dram_ch_r6),
  `BSG_PINOUT_16B_CHANNEL_PORTS(dram_ch_r7),

  // IO T CHANNELS
  `BSG_PINOUT_16B_CHANNEL_PORTS(io_ch_t0),
  `BSG_PINOUT_16B_CHANNEL_PORTS(io_ch_t1),

  // CTRL T/B CHANNELS
  `BSG_PINOUT_8B_CHANNEL_PORTS(ctrl_ch_t0),
  `BSG_PINOUT_8B_CHANNEL_PORTS(ctrl_ch_b0),

  // MISC L0
  input p_misc_l0_0_i,
  input p_misc_l0_1_i,
  input p_misc_l0_2_i,
  input p_misc_l0_3_i,
  input p_misc_l0_4_i,
  input p_misc_l0_5_i,
  input p_misc_l0_6_i,

  // MISC L1
  input p_misc_l1_0_i,
  input p_misc_l1_1_i,
  input p_misc_l1_2_i,

  // MISC R0
  input p_misc_r0_0_i,
  input p_misc_r0_1_i,
  input p_misc_r0_2_i,

  // MISC R1
  input p_misc_r1_0_i,
  input p_misc_r1_1_i,
  input p_misc_r1_2_i,
  input p_misc_r1_3_i,
  input p_misc_r1_4_i,
  input p_misc_r1_5_i,
  input p_misc_r1_6_i,
  input p_misc_r1_7_i

);

//
// END HB BGA PAD Definitions
// **********************************************************************
