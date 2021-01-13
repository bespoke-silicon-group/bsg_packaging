// **********************************************************************
// Begin HB BGA INVERTED PAD Definitions
//

`define BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(n)  \
   output   p_``n``_clk1_o                        \
  ,output   p_``n``_clk2_o                        \
  ,output   p_``n``_v_o                           \
  ,input    p_``n``_tkn_i                         \
  ,output   p_``n``_0_o                           \
  ,output   p_``n``_1_o                           \
  ,output   p_``n``_2_o                           \
  ,output   p_``n``_3_o                           \
  ,output   p_``n``_4_o                           \
  ,output   p_``n``_5_o                           \
  ,output   p_``n``_6_o                           \
  ,output   p_``n``_7_o                           \
  ,output   p_``n``_8_o                           \
  ,output   p_``n``_9_o                           \
  ,output   p_``n``_10_o                          \
  ,output   p_``n``_11_o                          \
  ,output   p_``n``_12_o                          \
  ,output   p_``n``_13_o                          \
  ,output   p_``n``_14_o                          \
  ,output   p_``n``_15_o                          \
  ,input    p_``n``_clk_i                         \
  ,input    p_``n``_v_i                           \
  ,output   p_``n``_tkn_o                         \
  ,input    p_``n``_0_i                           \
  ,input    p_``n``_1_i                           \
  ,input    p_``n``_2_i                           \
  ,input    p_``n``_3_i                           \
  ,input    p_``n``_4_i                           \
  ,input    p_``n``_5_i                           \
  ,input    p_``n``_6_i                           \
  ,input    p_``n``_7_i                           \
  ,input    p_``n``_8_i                           \
  ,input    p_``n``_9_i                           \
  ,input    p_``n``_10_i                          \
  ,input    p_``n``_11_i                          \
  ,input    p_``n``_12_i                          \
  ,input    p_``n``_13_i                          \
  ,input    p_``n``_14_i                          \
  ,input    p_``n``_15_i                          \
  ,input    p_``n``_extra_i

`define BSG_PINOUT_INVERTED_8B_CHANNEL_PORTS(n)   \
   output  p_``n``_clk_o                          \
  ,output  p_``n``_v_o                            \
  ,input   p_``n``_tkn_i                          \
  ,output  p_``n``_0_o                            \
  ,output  p_``n``_1_o                            \
  ,output  p_``n``_2_o                            \
  ,output  p_``n``_3_o                            \
  ,output  p_``n``_4_o                            \
  ,output  p_``n``_5_o                            \
  ,output  p_``n``_6_o                            \
  ,output  p_``n``_7_o                            \
  ,input   p_``n``_clk_i                          \
  ,input   p_``n``_v_i                            \
  ,output  p_``n``_tkn_o                          \
  ,input   p_``n``_0_i                            \
  ,input   p_``n``_1_i                            \
  ,input   p_``n``_2_i                            \
  ,input   p_``n``_3_i                            \
  ,input   p_``n``_4_i                            \
  ,input   p_``n``_5_i                            \
  ,input   p_``n``_6_i                            \
  ,input   p_``n``_7_i

(
// DRAM L CHANNELS
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(dram_ch_l0)
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(dram_ch_l1),
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(dram_ch_l2),
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(dram_ch_l3),
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(dram_ch_l4),
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(dram_ch_l5),
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(dram_ch_l6),
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(dram_ch_l7),

// DRAM R CHANNELS
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(dram_ch_r0),
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(dram_ch_r1),
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(dram_ch_r2),
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(dram_ch_r3),
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(dram_ch_r4),
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(dram_ch_r5),
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(dram_ch_r6),
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(dram_ch_r7),

// IO T CHANNELS
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(io_ch_t0),
`BSG_PINOUT_INVERTED_16B_CHANNEL_PORTS(io_ch_t1),

// CTRL T/B CHANNELS
`BSG_PINOUT_INVERTED_8B_CHANNEL_PORTS(ctrl_ch_t0),
`BSG_PINOUT_INVERTED_8B_CHANNEL_PORTS(ctrl_ch_b0),

// MISC L0
output p_misc_l0_0_o,
output p_misc_l0_1_o,
output p_misc_l0_2_o,
output p_misc_l0_3_o,
output p_misc_l0_4_o,
output p_misc_l0_5_o,
output p_misc_l0_6_o,

// MISC L1
output p_misc_l1_0_o,
output p_misc_l1_1_o,
output p_misc_l1_2_o,

// MISC R0
output p_misc_r0_0_o,
output p_misc_r0_1_o,
output p_misc_r0_2_o,

// MISC R1
output p_misc_r1_0_o,
output p_misc_r1_1_o,
output p_misc_r1_2_o,
output p_misc_r1_3_o,
output p_misc_r1_4_o,
output p_misc_r1_5_o,
output p_misc_r1_6_o,
output p_misc_r1_7_o
);

//
// END HB BGA INVERTED PAD Definitions
// **********************************************************************
