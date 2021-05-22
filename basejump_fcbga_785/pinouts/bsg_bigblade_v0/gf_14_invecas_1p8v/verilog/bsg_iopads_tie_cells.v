`ifdef BSG_USE_TIE_NETS

`define BSG_TIE_CELL_PAIR(n) \
  `BSG_IO_TIEHI(n``_thi); \
  `BSG_IO_TIELO(n``_tlo);

`define BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(n)  \
  `BSG_TIE_CELL_PAIR(n``_clk_i)       \
  `BSG_TIE_CELL_PAIR(n``_v_i)         \
  `BSG_TIE_CELL_PAIR(n``_tkn_o)       \
  `BSG_TIE_CELL_PAIR(n``_0_i)         \
  `BSG_TIE_CELL_PAIR(n``_1_i)         \
  `BSG_TIE_CELL_PAIR(n``_2_i)         \
  `BSG_TIE_CELL_PAIR(n``_3_i)         \
  `BSG_TIE_CELL_PAIR(n``_4_i)         \
  `BSG_TIE_CELL_PAIR(n``_5_i)         \
  `BSG_TIE_CELL_PAIR(n``_6_i)         \
  `BSG_TIE_CELL_PAIR(n``_7_i)         \
  `BSG_TIE_CELL_PAIR(n``_8_i)         \
  `BSG_TIE_CELL_PAIR(n``_9_i)         \
  `BSG_TIE_CELL_PAIR(n``_10_i)        \
  `BSG_TIE_CELL_PAIR(n``_11_i)        \
  `BSG_TIE_CELL_PAIR(n``_12_i)        \
  `BSG_TIE_CELL_PAIR(n``_13_i)        \
  `BSG_TIE_CELL_PAIR(n``_14_i)        \
  `BSG_TIE_CELL_PAIR(n``_15_i)        \
  `BSG_TIE_CELL_PAIR(n``_clk_o)       \
  `BSG_TIE_CELL_PAIR(n``_v_o)         \
  `BSG_TIE_CELL_PAIR(n``_tkn_i)       \
  `BSG_TIE_CELL_PAIR(n``_0_o)         \
  `BSG_TIE_CELL_PAIR(n``_1_o)         \
  `BSG_TIE_CELL_PAIR(n``_2_o)         \
  `BSG_TIE_CELL_PAIR(n``_3_o)         \
  `BSG_TIE_CELL_PAIR(n``_4_o)         \
  `BSG_TIE_CELL_PAIR(n``_5_o)         \
  `BSG_TIE_CELL_PAIR(n``_6_o)         \
  `BSG_TIE_CELL_PAIR(n``_7_o)         \
  `BSG_TIE_CELL_PAIR(n``_8_o)         \
  `BSG_TIE_CELL_PAIR(n``_9_o)         \
  `BSG_TIE_CELL_PAIR(n``_10_o)        \
  `BSG_TIE_CELL_PAIR(n``_11_o)        \
  `BSG_TIE_CELL_PAIR(n``_12_o)        \
  `BSG_TIE_CELL_PAIR(n``_13_o)        \
  `BSG_TIE_CELL_PAIR(n``_14_o)        \
  `BSG_TIE_CELL_PAIR(n``_15_o)        \
  `BSG_TIE_CELL_PAIR(n``_extra_i)     \
  `BSG_TIE_CELL_PAIR(n``_extra_o)

`define BSG_IOPADS_8B_CHANNEL_PADS_TIE_CELLS(n) \
  `BSG_TIE_CELL_PAIR(n``_clk_i)       \
  `BSG_TIE_CELL_PAIR(n``_v_i)         \
  `BSG_TIE_CELL_PAIR(n``_tkn_o)       \
  `BSG_TIE_CELL_PAIR(n``_0_i)         \
  `BSG_TIE_CELL_PAIR(n``_1_i)         \
  `BSG_TIE_CELL_PAIR(n``_2_i)         \
  `BSG_TIE_CELL_PAIR(n``_3_i)         \
  `BSG_TIE_CELL_PAIR(n``_4_i)         \
  `BSG_TIE_CELL_PAIR(n``_5_i)         \
  `BSG_TIE_CELL_PAIR(n``_6_i)         \
  `BSG_TIE_CELL_PAIR(n``_7_i)         \
  `BSG_TIE_CELL_PAIR(n``_clk_o)       \
  `BSG_TIE_CELL_PAIR(n``_v_o)         \
  `BSG_TIE_CELL_PAIR(n``_tkn_i)       \
  `BSG_TIE_CELL_PAIR(n``_0_o)         \
  `BSG_TIE_CELL_PAIR(n``_1_o)         \
  `BSG_TIE_CELL_PAIR(n``_2_o)         \
  `BSG_TIE_CELL_PAIR(n``_3_o)         \
  `BSG_TIE_CELL_PAIR(n``_4_o)         \
  `BSG_TIE_CELL_PAIR(n``_5_o)         \
  `BSG_TIE_CELL_PAIR(n``_6_o)         \
  `BSG_TIE_CELL_PAIR(n``_7_o)

// DRAM L CHANNELS
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_DL0)
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_DL1)
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_DL2)
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_DL3)
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_DL4)
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_DL5)
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_DL6)
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_DL7)

// DRAM R CHANNELS
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_DR0)
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_DR1)
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_DR2)
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_DR3)
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_DR4)
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_DR5)
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_DR6)
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_DR7)

// IO T CHANNELS
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_IT0)
`BSG_IOPADS_16B_CHANNEL_PADS_TIE_CELLS(pad_IT1)

// CTRL T/B CHANNELS
`BSG_IOPADS_8B_CHANNEL_PADS_TIE_CELLS(pad_CT0)
`BSG_IOPADS_8B_CHANNEL_PADS_TIE_CELLS(pad_CB0)

// MISC L0
`BSG_TIE_CELL_PAIR(pad_ML0_0_i)
`BSG_TIE_CELL_PAIR(pad_ML0_1_i)
`BSG_TIE_CELL_PAIR(pad_ML0_2_i)
`BSG_TIE_CELL_PAIR(pad_ML0_3_i)
`BSG_TIE_CELL_PAIR(pad_ML0_4_i)
`BSG_TIE_CELL_PAIR(pad_ML0_5_i)
`BSG_TIE_CELL_PAIR(pad_ML0_6_i)

// MISC L1
`BSG_TIE_CELL_PAIR(pad_ML1_0_i)
`BSG_TIE_CELL_PAIR(pad_ML1_1_i)
`BSG_TIE_CELL_PAIR(pad_ML1_2_i)

// MISC R0
`BSG_TIE_CELL_PAIR(pad_MR0_0_i)
`BSG_TIE_CELL_PAIR(pad_MR0_1_i)
`BSG_TIE_CELL_PAIR(pad_MR0_2_i)

// MISC R1
`BSG_TIE_CELL_PAIR(pad_MR1_0_i)
`BSG_TIE_CELL_PAIR(pad_MR1_1_i)
`BSG_TIE_CELL_PAIR(pad_MR1_2_i)
`BSG_TIE_CELL_PAIR(pad_MR1_3_i)
`BSG_TIE_CELL_PAIR(pad_MR1_4_i)
`BSG_TIE_CELL_PAIR(pad_MR1_5_i)
`BSG_TIE_CELL_PAIR(pad_MR1_6_i)
`BSG_TIE_CELL_PAIR(pad_MR1_7_i)

`endif
