// **********************************************************************
// Begin HB BGA PAD Definitions
//

`define BSG_PINOUT_16B_CHANNEL_PORTS(n) \
   input   p_``n``_clk_i                \
  ,input   p_``n``_v_i                  \
  ,output  p_``n``_tkn_o                \
  ,input   p_``n``_0_i                  \
  ,input   p_``n``_1_i                  \
  ,input   p_``n``_2_i                  \
  ,input   p_``n``_3_i                  \
  ,input   p_``n``_4_i                  \
  ,input   p_``n``_5_i                  \
  ,input   p_``n``_6_i                  \
  ,input   p_``n``_7_i                  \
  ,input   p_``n``_8_i                  \
  ,input   p_``n``_9_i                  \
  ,input   p_``n``_10_i                 \
  ,input   p_``n``_11_i                 \
  ,input   p_``n``_12_i                 \
  ,input   p_``n``_13_i                 \
  ,input   p_``n``_14_i                 \
  ,input   p_``n``_15_i                 \
  ,output  p_``n``_clk_o                \
  ,output  p_``n``_v_o                  \
  ,input   p_``n``_tkn_i                \
  ,output  p_``n``_0_o                  \
  ,output  p_``n``_1_o                  \
  ,output  p_``n``_2_o                  \
  ,output  p_``n``_3_o                  \
  ,output  p_``n``_4_o                  \
  ,output  p_``n``_5_o                  \
  ,output  p_``n``_6_o                  \
  ,output  p_``n``_7_o                  \
  ,output  p_``n``_8_o                  \
  ,output  p_``n``_9_o                  \
  ,output  p_``n``_10_o                 \
  ,output  p_``n``_11_o                 \
  ,output  p_``n``_12_o                 \
  ,output  p_``n``_13_o                 \
  ,output  p_``n``_14_o                 \
  ,output  p_``n``_15_o                 \
  ,input   p_``n``_extra_i              \
  ,output  p_``n``_extra_o

`define BSG_PINOUT_8B_CHANNEL_PORTS(n)  \
   input   p_``n``_clk_i                \
  ,input   p_``n``_v_i                  \
  ,output  p_``n``_tkn_o                \
  ,input   p_``n``_0_i                  \
  ,input   p_``n``_1_i                  \
  ,input   p_``n``_2_i                  \
  ,input   p_``n``_3_i                  \
  ,input   p_``n``_4_i                  \
  ,input   p_``n``_5_i                  \
  ,input   p_``n``_6_i                  \
  ,input   p_``n``_7_i                  \
  ,output  p_``n``_clk_o                \
  ,output  p_``n``_v_o                  \
  ,input   p_``n``_tkn_i                \
  ,output  p_``n``_0_o                  \
  ,output  p_``n``_1_o                  \
  ,output  p_``n``_2_o                  \
  ,output  p_``n``_3_o                  \
  ,output  p_``n``_4_o                  \
  ,output  p_``n``_5_o                  \
  ,output  p_``n``_6_o                  \
  ,output  p_``n``_7_o

(
// DRAM L CHANNELS
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_DL0),
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_DL1),
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_DL2),
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_DL3),
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_DL4),
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_DL5),
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_DL6),
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_DL7),

// DRAM R CHANNELS
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_DR0),
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_DR1),
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_DR2),
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_DR3),
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_DR4),
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_DR5),
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_DR6),
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_DR7),

// IO T CHANNELS
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_IT0),
`BSG_PINOUT_16B_CHANNEL_PORTS(pad_IT1),

// CTRL T/B CHANNELS
`BSG_PINOUT_8B_CHANNEL_PORTS(pad_CT0),
`BSG_PINOUT_8B_CHANNEL_PORTS(pad_CB0),

// MISC L0
input p_pad_ML0_0_i,
input p_pad_ML0_1_i,
input p_pad_ML0_2_i,
input p_pad_ML0_3_i,
input p_pad_ML0_4_i,
input p_pad_ML0_5_i,
input p_pad_ML0_6_i,

// MISC L1
input p_pad_ML1_0_i,
input p_pad_ML1_1_i,
input p_pad_ML1_2_i,

// MISC R0
input p_pad_MR0_0_i,
input p_pad_MR0_1_i,
input p_pad_MR0_2_i,

// MISC R1
input p_pad_MR1_0_i,
input p_pad_MR1_1_i,
input p_pad_MR1_2_i,
input p_pad_MR1_3_i,
input p_pad_MR1_4_i,
input p_pad_MR1_5_i,
input p_pad_MR1_6_i,
input p_pad_MR1_7_i
);

//
// END HB BGA PAD Definitions
// **********************************************************************
