genvar i;

`define BSG_IOPADS_16B_CHANNEL_PADS_V(n)  \
  `BSG_IO_IN(n``_clk, `BSG_IN_PAD_V)      \
  `BSG_IO_IN(n``_v, `BSG_IN_PAD_V)        \
  `BSG_IO_OUT(n``_tkn, `BSG_OUT_PAD_V)    \
  `BSG_IO_IN(n``_0, `BSG_IN_PAD_V)        \
  `BSG_IO_IN(n``_1, `BSG_IN_PAD_V)        \
  `BSG_IO_IN(n``_2, `BSG_IN_PAD_V)        \
  `BSG_IO_IN(n``_3, `BSG_IN_PAD_V)        \
  `BSG_IO_IN(n``_4, `BSG_IN_PAD_V)        \
  `BSG_IO_IN(n``_5, `BSG_IN_PAD_V)        \
  `BSG_IO_IN(n``_6, `BSG_IN_PAD_V)        \
  `BSG_IO_IN(n``_7, `BSG_IN_PAD_V)        \
  `BSG_IO_IN(n``_8, `BSG_IN_PAD_V)        \
  `BSG_IO_IN(n``_9, `BSG_IN_PAD_V)        \
  `BSG_IO_IN(n``_10, `BSG_IN_PAD_V)       \
  `BSG_IO_IN(n``_11, `BSG_IN_PAD_V)       \
  `BSG_IO_IN(n``_12, `BSG_IN_PAD_V)       \
  `BSG_IO_IN(n``_13, `BSG_IN_PAD_V)       \
  `BSG_IO_IN(n``_14, `BSG_IN_PAD_V)       \
  `BSG_IO_IN(n``_15, `BSG_IN_PAD_V)       \
  `BSG_IO_OUT(n``_clk, `BSG_OUT_PAD_V)    \
  `BSG_IO_OUT(n``_v, `BSG_OUT_PAD_V)      \
  `BSG_IO_IN(n``_tkn, `BSG_IN_PAD_V)      \
  `BSG_IO_OUT(n``_0, `BSG_OUT_PAD_V)      \
  `BSG_IO_OUT(n``_1, `BSG_OUT_PAD_V)      \
  `BSG_IO_OUT(n``_2, `BSG_OUT_PAD_V)      \
  `BSG_IO_OUT(n``_3, `BSG_OUT_PAD_V)      \
  `BSG_IO_OUT(n``_4, `BSG_OUT_PAD_V)      \
  `BSG_IO_OUT(n``_5, `BSG_OUT_PAD_V)      \
  `BSG_IO_OUT(n``_6, `BSG_OUT_PAD_V)      \
  `BSG_IO_OUT(n``_7, `BSG_OUT_PAD_V)      \
  `BSG_IO_OUT(n``_8, `BSG_OUT_PAD_V)      \
  `BSG_IO_OUT(n``_9, `BSG_OUT_PAD_V)      \
  `BSG_IO_OUT(n``_10, `BSG_OUT_PAD_V)     \
  `BSG_IO_OUT(n``_11, `BSG_OUT_PAD_V)     \
  `BSG_IO_OUT(n``_12, `BSG_OUT_PAD_V)     \
  `BSG_IO_OUT(n``_13, `BSG_OUT_PAD_V)     \
  `BSG_IO_OUT(n``_14, `BSG_OUT_PAD_V)     \
  `BSG_IO_OUT(n``_15, `BSG_OUT_PAD_V)     \
  `BSG_IO_IN(n``_extra, `BSG_IN_PAD_V)    \
  `BSG_IO_OUT(n``_extra, `BSG_OUT_PAD_V)

`define BSG_IOPADS_8B_CHANNEL_PADS_V(n)   \
  `BSG_IO_IN(n``_clk, `BSG_IN_PAD_V)      \
  `BSG_IO_IN(n``_v, `BSG_IN_PAD_V)        \
  `BSG_IO_OUT(n``_tkn, `BSG_OUT_PAD_V)    \
  `BSG_IO_IN(n``_0, `BSG_IN_PAD_V)        \
  `BSG_IO_IN(n``_1, `BSG_IN_PAD_V)        \
  `BSG_IO_IN(n``_2, `BSG_IN_PAD_V)        \
  `BSG_IO_IN(n``_3, `BSG_IN_PAD_V)        \
  `BSG_IO_IN(n``_4, `BSG_IN_PAD_V)        \
  `BSG_IO_IN(n``_5, `BSG_IN_PAD_V)        \
  `BSG_IO_IN(n``_6, `BSG_IN_PAD_V)        \
  `BSG_IO_IN(n``_7, `BSG_IN_PAD_V)        \
  `BSG_IO_OUT(n``_clk, `BSG_OUT_PAD_V)    \
  `BSG_IO_OUT(n``_v, `BSG_OUT_PAD_V)      \
  `BSG_IO_IN(n``_tkn, `BSG_IN_PAD_V)      \
  `BSG_IO_OUT(n``_0, `BSG_OUT_PAD_V)      \
  `BSG_IO_OUT(n``_1, `BSG_OUT_PAD_V)      \
  `BSG_IO_OUT(n``_2, `BSG_OUT_PAD_V)      \
  `BSG_IO_OUT(n``_3, `BSG_OUT_PAD_V)      \
  `BSG_IO_OUT(n``_4, `BSG_OUT_PAD_V)      \
  `BSG_IO_OUT(n``_5, `BSG_OUT_PAD_V)      \
  `BSG_IO_OUT(n``_6, `BSG_OUT_PAD_V)      \
  `BSG_IO_OUT(n``_7, `BSG_OUT_PAD_V)

`define BSG_IOPADS_16B_CHANNEL_PADS_H(n)  \
  `BSG_IO_IN(n``_clk, `BSG_IN_PAD_H)      \
  `BSG_IO_IN(n``_v, `BSG_IN_PAD_H)        \
  `BSG_IO_OUT(n``_tkn, `BSG_OUT_PAD_H)    \
  `BSG_IO_IN(n``_0, `BSG_IN_PAD_H)        \
  `BSG_IO_IN(n``_1, `BSG_IN_PAD_H)        \
  `BSG_IO_IN(n``_2, `BSG_IN_PAD_H)        \
  `BSG_IO_IN(n``_3, `BSG_IN_PAD_H)        \
  `BSG_IO_IN(n``_4, `BSG_IN_PAD_H)        \
  `BSG_IO_IN(n``_5, `BSG_IN_PAD_H)        \
  `BSG_IO_IN(n``_6, `BSG_IN_PAD_H)        \
  `BSG_IO_IN(n``_7, `BSG_IN_PAD_H)        \
  `BSG_IO_IN(n``_8, `BSG_IN_PAD_H)        \
  `BSG_IO_IN(n``_9, `BSG_IN_PAD_H)        \
  `BSG_IO_IN(n``_10, `BSG_IN_PAD_H)       \
  `BSG_IO_IN(n``_11, `BSG_IN_PAD_H)       \
  `BSG_IO_IN(n``_12, `BSG_IN_PAD_H)       \
  `BSG_IO_IN(n``_13, `BSG_IN_PAD_H)       \
  `BSG_IO_IN(n``_14, `BSG_IN_PAD_H)       \
  `BSG_IO_IN(n``_15, `BSG_IN_PAD_H)       \
  `BSG_IO_OUT(n``_clk, `BSG_OUT_PAD_H)    \
  `BSG_IO_OUT(n``_v, `BSG_OUT_PAD_H)      \
  `BSG_IO_IN(n``_tkn, `BSG_IN_PAD_H)      \
  `BSG_IO_OUT(n``_0, `BSG_OUT_PAD_H)      \
  `BSG_IO_OUT(n``_1, `BSG_OUT_PAD_H)      \
  `BSG_IO_OUT(n``_2, `BSG_OUT_PAD_H)      \
  `BSG_IO_OUT(n``_3, `BSG_OUT_PAD_H)      \
  `BSG_IO_OUT(n``_4, `BSG_OUT_PAD_H)      \
  `BSG_IO_OUT(n``_5, `BSG_OUT_PAD_H)      \
  `BSG_IO_OUT(n``_6, `BSG_OUT_PAD_H)      \
  `BSG_IO_OUT(n``_7, `BSG_OUT_PAD_H)      \
  `BSG_IO_OUT(n``_8, `BSG_OUT_PAD_H)      \
  `BSG_IO_OUT(n``_9, `BSG_OUT_PAD_H)      \
  `BSG_IO_OUT(n``_10, `BSG_OUT_PAD_H)     \
  `BSG_IO_OUT(n``_11, `BSG_OUT_PAD_H)     \
  `BSG_IO_OUT(n``_12, `BSG_OUT_PAD_H)     \
  `BSG_IO_OUT(n``_13, `BSG_OUT_PAD_H)     \
  `BSG_IO_OUT(n``_14, `BSG_OUT_PAD_H)     \
  `BSG_IO_OUT(n``_15, `BSG_OUT_PAD_H)     \
  `BSG_IO_IN(n``_extra, `BSG_IN_PAD_H)    \
  `BSG_IO_OUT(n``_extra, `BSG_OUT_PAD_H)

`define BSG_IOPADS_8B_CHANNEL_PADS_H(n)   \
  `BSG_IO_IN(n``_clk, `BSG_IN_PAD_H)      \
  `BSG_IO_IN(n``_v, `BSG_IN_PAD_H)        \
  `BSG_IO_OUT(n``_tkn, `BSG_OUT_PAD_H)    \
  `BSG_IO_IN(n``_0, `BSG_IN_PAD_H)        \
  `BSG_IO_IN(n``_1, `BSG_IN_PAD_H)        \
  `BSG_IO_IN(n``_2, `BSG_IN_PAD_H)        \
  `BSG_IO_IN(n``_3, `BSG_IN_PAD_H)        \
  `BSG_IO_IN(n``_4, `BSG_IN_PAD_H)        \
  `BSG_IO_IN(n``_5, `BSG_IN_PAD_H)        \
  `BSG_IO_IN(n``_6, `BSG_IN_PAD_H)        \
  `BSG_IO_IN(n``_7, `BSG_IN_PAD_H)        \
  `BSG_IO_OUT(n``_clk, `BSG_OUT_PAD_H)    \
  `BSG_IO_OUT(n``_v, `BSG_OUT_PAD_H)      \
  `BSG_IO_IN(n``_tkn, `BSG_IN_PAD_H)      \
  `BSG_IO_OUT(n``_0, `BSG_OUT_PAD_H)      \
  `BSG_IO_OUT(n``_1, `BSG_OUT_PAD_H)      \
  `BSG_IO_OUT(n``_2, `BSG_OUT_PAD_H)      \
  `BSG_IO_OUT(n``_3, `BSG_OUT_PAD_H)      \
  `BSG_IO_OUT(n``_4, `BSG_OUT_PAD_H)      \
  `BSG_IO_OUT(n``_5, `BSG_OUT_PAD_H)      \
  `BSG_IO_OUT(n``_6, `BSG_OUT_PAD_H)      \
  `BSG_IO_OUT(n``_7, `BSG_OUT_PAD_H)

// DRAM L CHANNELS
`BSG_IOPADS_16B_CHANNEL_PADS_V(pad_DL0)
`BSG_IOPADS_16B_CHANNEL_PADS_H(pad_DL1)
`BSG_IOPADS_16B_CHANNEL_PADS_H(pad_DL2)
`BSG_IOPADS_16B_CHANNEL_PADS_H(pad_DL3)
`BSG_IOPADS_16B_CHANNEL_PADS_H(pad_DL4)
`BSG_IOPADS_16B_CHANNEL_PADS_H(pad_DL5)
`BSG_IOPADS_16B_CHANNEL_PADS_V(pad_DL6)
`BSG_IOPADS_16B_CHANNEL_PADS_V(pad_DL7)

// DRAM R CHANNELS
`BSG_IOPADS_16B_CHANNEL_PADS_V(pad_DR0)
`BSG_IOPADS_16B_CHANNEL_PADS_H(pad_DR1)
`BSG_IOPADS_16B_CHANNEL_PADS_H(pad_DR2)
`BSG_IOPADS_16B_CHANNEL_PADS_H(pad_DR3)
`BSG_IOPADS_16B_CHANNEL_PADS_H(pad_DR4)
`BSG_IOPADS_16B_CHANNEL_PADS_H(pad_DR5)
`BSG_IOPADS_16B_CHANNEL_PADS_V(pad_DR6)
`BSG_IOPADS_16B_CHANNEL_PADS_V(pad_DR7)

// IO T CHANNELS
`BSG_IOPADS_16B_CHANNEL_PADS_V(pad_IT0)
`BSG_IOPADS_16B_CHANNEL_PADS_V(pad_IT1)

// CTRL T/B CHANNELS
`BSG_IOPADS_8B_CHANNEL_PADS_V(pad_CT0)
`BSG_IOPADS_8B_CHANNEL_PADS_V(pad_CB0)

// MISC L0
`BSG_IO_IN(pad_ML0_0, `BSG_IN_PAD_V)
`BSG_IO_IN(pad_ML0_1, `BSG_IN_PAD_V)
`BSG_IO_IN(pad_ML0_2, `BSG_IN_PAD_V)
`BSG_IO_IN(pad_ML0_3, `BSG_IN_PAD_V)
`BSG_IO_IN(pad_ML0_4, `BSG_IN_PAD_V)
`BSG_IO_IN(pad_ML0_5, `BSG_IN_PAD_V)
`BSG_IO_IN(pad_ML0_6, `BSG_IN_PAD_V)

// MISC L1
`BSG_IO_IN(pad_ML1_0, `BSG_IN_PAD_V)
`BSG_IO_IN(pad_ML1_1, `BSG_IN_PAD_V)
`BSG_IO_IN(pad_ML1_2, `BSG_IN_PAD_V)

// MISC R0
`BSG_IO_IN(pad_MR0_0, `BSG_IN_PAD_V)
`BSG_IO_IN(pad_MR0_1, `BSG_IN_PAD_V)
`BSG_IO_IN(pad_MR0_2, `BSG_IN_PAD_V)

// MISC R1
`BSG_IO_IN(pad_MR1_0, `BSG_IN_PAD_V)
`BSG_IO_IN(pad_MR1_1, `BSG_IN_PAD_V)
`BSG_IO_IN(pad_MR1_2, `BSG_IN_PAD_V)
`BSG_IO_IN(pad_MR1_3, `BSG_IN_PAD_V)
`BSG_IO_IN(pad_MR1_4, `BSG_IN_PAD_V)
`BSG_IO_IN(pad_MR1_5, `BSG_IN_PAD_V)
`BSG_IO_IN(pad_MR1_6, `BSG_IN_PAD_V)
`BSG_IO_IN(pad_MR1_7, `BSG_IN_PAD_V)

