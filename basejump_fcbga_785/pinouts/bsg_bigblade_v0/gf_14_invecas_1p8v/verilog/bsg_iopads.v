genvar i;

`define BSG_IOPADS_16B_CHANNEL_PADS_V(n)  \
  `BSG_IO_IN(n``_clk1, `BSG_IN_PAD_V)     \
  `BSG_IO_IN(n``_clk2, `BSG_IN_PAD_V)     \
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
  `BSG_IO_IN(n``_clk1, `BSG_IN_PAD_H)     \
  `BSG_IO_IN(n``_clk2, `BSG_IN_PAD_H)     \
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
`BSG_IOPADS_16B_CHANNEL_PADS_V(dram_ch_l0)
`BSG_IOPADS_16B_CHANNEL_PADS_H(dram_ch_l1)
`BSG_IOPADS_16B_CHANNEL_PADS_H(dram_ch_l2)
`BSG_IOPADS_16B_CHANNEL_PADS_H(dram_ch_l3)
`BSG_IOPADS_16B_CHANNEL_PADS_H(dram_ch_l4)
`BSG_IOPADS_16B_CHANNEL_PADS_H(dram_ch_l5)
`BSG_IOPADS_16B_CHANNEL_PADS_V(dram_ch_l6)
`BSG_IOPADS_16B_CHANNEL_PADS_V(dram_ch_l7)

// DRAM R CHANNELS
`BSG_IOPADS_16B_CHANNEL_PADS_V(dram_ch_r0)
`BSG_IOPADS_16B_CHANNEL_PADS_H(dram_ch_r1)
`BSG_IOPADS_16B_CHANNEL_PADS_H(dram_ch_r2)
`BSG_IOPADS_16B_CHANNEL_PADS_H(dram_ch_r3)
`BSG_IOPADS_16B_CHANNEL_PADS_H(dram_ch_r4)
`BSG_IOPADS_16B_CHANNEL_PADS_H(dram_ch_r5)
`BSG_IOPADS_16B_CHANNEL_PADS_V(dram_ch_r6)
`BSG_IOPADS_16B_CHANNEL_PADS_V(dram_ch_r7)

// IO T CHANNELS
`BSG_IOPADS_16B_CHANNEL_PADS_V(io_ch_t0)
`BSG_IOPADS_16B_CHANNEL_PADS_V(io_ch_t1)

// CTRL T/B CHANNELS
`BSG_IOPADS_8B_CHANNEL_PADS_V(ctrl_ch_t0)
`BSG_IOPADS_8B_CHANNEL_PADS_V(ctrl_ch_b0)

// MISC L0
`BSG_IO_IN(misc_l0_0, `BSG_IN_PAD_V)
`BSG_IO_IN(misc_l0_1, `BSG_IN_PAD_V)
`BSG_IO_IN(misc_l0_2, `BSG_IN_PAD_V)
`BSG_IO_IN(misc_l0_3, `BSG_IN_PAD_V)
`BSG_IO_IN(misc_l0_4, `BSG_IN_PAD_V)
`BSG_IO_IN(misc_l0_5, `BSG_IN_PAD_V)
`BSG_IO_IN(misc_l0_6, `BSG_IN_PAD_V)

// MISC L1
`BSG_IO_IN(misc_l1_0, `BSG_IN_PAD_V)
`BSG_IO_IN(misc_l1_1, `BSG_IN_PAD_V)
`BSG_IO_IN(misc_l1_2, `BSG_IN_PAD_V)

// MISC R0
`BSG_IO_IN(misc_r0_0, `BSG_IN_PAD_V)
`BSG_IO_IN(misc_r0_1, `BSG_IN_PAD_V)
`BSG_IO_IN(misc_r0_2, `BSG_IN_PAD_V)

// MISC R1
`BSG_IO_IN(misc_r1_0, `BSG_IN_PAD_V)
`BSG_IO_IN(misc_r1_1, `BSG_IN_PAD_V)
`BSG_IO_IN(misc_r1_2, `BSG_IN_PAD_V)
`BSG_IO_IN(misc_r1_3, `BSG_IN_PAD_V)
`BSG_IO_IN(misc_r1_4, `BSG_IN_PAD_V)
`BSG_IO_IN(misc_r1_5, `BSG_IN_PAD_V)
`BSG_IO_IN(misc_r1_6, `BSG_IN_PAD_V)
`BSG_IO_IN(misc_r1_7, `BSG_IN_PAD_V)

