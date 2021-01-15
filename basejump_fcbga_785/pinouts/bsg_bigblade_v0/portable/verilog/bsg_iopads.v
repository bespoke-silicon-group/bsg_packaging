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

`define BSG_IOPADS_16B_CHANNEL_PADS(n)           \
  `BSG_IO_IN(n``_clk, `BSG_PAD_INPUT_PULLDOWN)   \
  `BSG_IO_IN(n``_v, `BSG_PAD_INPUT_PULLDOWN)     \
  `BSG_IO_OUT(n``_tkn, `BSG_PAD_OUTPUT_SLOW)     \
  `BSG_IO_TIELO(n``_tkn_oen_int)                 \
  `BSG_IO_IN(n``_0, `BSG_PAD_INPUT_PULLDOWN)     \
  `BSG_IO_IN(n``_1, `BSG_PAD_INPUT_PULLDOWN)     \
  `BSG_IO_IN(n``_2, `BSG_PAD_INPUT_PULLDOWN)     \
  `BSG_IO_IN(n``_3, `BSG_PAD_INPUT_PULLDOWN)     \
  `BSG_IO_IN(n``_4, `BSG_PAD_INPUT_PULLDOWN)     \
  `BSG_IO_IN(n``_5, `BSG_PAD_INPUT_PULLDOWN)     \
  `BSG_IO_IN(n``_6, `BSG_PAD_INPUT_PULLDOWN)     \
  `BSG_IO_IN(n``_7, `BSG_PAD_INPUT_PULLDOWN)     \
  `BSG_IO_IN(n``_8, `BSG_PAD_INPUT_PULLDOWN)     \
  `BSG_IO_IN(n``_9, `BSG_PAD_INPUT_PULLDOWN)     \
  `BSG_IO_IN(n``_10, `BSG_PAD_INPUT_PULLDOWN)    \
  `BSG_IO_IN(n``_11, `BSG_PAD_INPUT_PULLDOWN)    \
  `BSG_IO_IN(n``_12, `BSG_PAD_INPUT_PULLDOWN)    \
  `BSG_IO_IN(n``_13, `BSG_PAD_INPUT_PULLDOWN)    \
  `BSG_IO_IN(n``_14, `BSG_PAD_INPUT_PULLDOWN)    \
  `BSG_IO_IN(n``_15, `BSG_PAD_INPUT_PULLDOWN)    \
  `BSG_IO_OUT(n``_clk, `BSG_PAD_OUTPUT_SLOW)     \
  `BSG_IO_TIELO(n``_clk_oen_int)                 \
  `BSG_IO_OUT(n``_v, `BSG_PAD_OUTPUT_SLOW)       \
  `BSG_IO_TIELO(n``_v_oen_int)                   \
  `BSG_IO_IN(n``_tkn, `BSG_PAD_INPUT_PULLDOWN)   \
  `BSG_IO_OUT(n``_0, `BSG_PAD_OUTPUT_SLOW)       \
  `BSG_IO_TIELO(n``_0_oen_int)                   \
  `BSG_IO_OUT(n``_1, `BSG_PAD_OUTPUT_SLOW)       \
  `BSG_IO_TIELO(n``_1_oen_int)                   \
  `BSG_IO_OUT(n``_2, `BSG_PAD_OUTPUT_SLOW)       \
  `BSG_IO_TIELO(n``_2_oen_int)                   \
  `BSG_IO_OUT(n``_3, `BSG_PAD_OUTPUT_SLOW)       \
  `BSG_IO_TIELO(n``_3_oen_int)                   \
  `BSG_IO_OUT(n``_4, `BSG_PAD_OUTPUT_SLOW)       \
  `BSG_IO_TIELO(n``_4_oen_int)                   \
  `BSG_IO_OUT(n``_5, `BSG_PAD_OUTPUT_SLOW)       \
  `BSG_IO_TIELO(n``_5_oen_int)                   \
  `BSG_IO_OUT(n``_6, `BSG_PAD_OUTPUT_SLOW)       \
  `BSG_IO_TIELO(n``_6_oen_int)                   \
  `BSG_IO_OUT(n``_7, `BSG_PAD_OUTPUT_SLOW)       \
  `BSG_IO_TIELO(n``_7_oen_int)                   \
  `BSG_IO_OUT(n``_8, `BSG_PAD_OUTPUT_SLOW)       \
  `BSG_IO_TIELO(n``_8_oen_int)                   \
  `BSG_IO_OUT(n``_9, `BSG_PAD_OUTPUT_SLOW)       \
  `BSG_IO_TIELO(n``_9_oen_int)                   \
  `BSG_IO_OUT(n``_10, `BSG_PAD_OUTPUT_SLOW)      \
  `BSG_IO_TIELO(n``_10_oen_int)                  \
  `BSG_IO_OUT(n``_11, `BSG_PAD_OUTPUT_SLOW)      \
  `BSG_IO_TIELO(n``_11_oen_int)                  \
  `BSG_IO_OUT(n``_12, `BSG_PAD_OUTPUT_SLOW)      \
  `BSG_IO_TIELO(n``_12_oen_int)                  \
  `BSG_IO_OUT(n``_13, `BSG_PAD_OUTPUT_SLOW)      \
  `BSG_IO_TIELO(n``_13_oen_int)                  \
  `BSG_IO_OUT(n``_14, `BSG_PAD_OUTPUT_SLOW)      \
  `BSG_IO_TIELO(n``_14_oen_int)                  \
  `BSG_IO_OUT(n``_15, `BSG_PAD_OUTPUT_SLOW)      \
  `BSG_IO_TIELO(n``_15_oen_int)                  \
  `BSG_IO_IN(n``_extra, `BSG_PAD_INPUT_PULLDOWN) \
  `BSG_IO_OUT(n``_extra, `BSG_PAD_OUTPUT_SLOW)   \
  `BSG_IO_TIELO(n``_extra_oen_int)

`define BSG_IOPADS_8B_CHANNEL_PADS(n)           \
  `BSG_IO_IN(n``_clk, `BSG_PAD_INPUT_PULLDOWN)  \
  `BSG_IO_IN(n``_v, `BSG_PAD_INPUT_PULLDOWN)    \
  `BSG_IO_OUT(n``_tkn, `BSG_PAD_OUTPUT_SLOW)    \
  `BSG_IO_TIELO(n``_tkn_oen_int)                \
  `BSG_IO_IN(n``_0, `BSG_PAD_INPUT_PULLDOWN)    \
  `BSG_IO_IN(n``_1, `BSG_PAD_INPUT_PULLDOWN)    \
  `BSG_IO_IN(n``_2, `BSG_PAD_INPUT_PULLDOWN)    \
  `BSG_IO_IN(n``_3, `BSG_PAD_INPUT_PULLDOWN)    \
  `BSG_IO_IN(n``_4, `BSG_PAD_INPUT_PULLDOWN)    \
  `BSG_IO_IN(n``_5, `BSG_PAD_INPUT_PULLDOWN)    \
  `BSG_IO_IN(n``_6, `BSG_PAD_INPUT_PULLDOWN)    \
  `BSG_IO_IN(n``_7, `BSG_PAD_INPUT_PULLDOWN)    \
  `BSG_IO_OUT(n``_clk, `BSG_PAD_OUTPUT_SLOW)    \
  `BSG_IO_TIELO(n``_clk_oen_int)                \
  `BSG_IO_OUT(n``_v, `BSG_PAD_OUTPUT_SLOW)      \
  `BSG_IO_TIELO(n``_v_oen_int)                  \
  `BSG_IO_IN(n``_tkn, `BSG_PAD_INPUT_PULLDOWN)  \
  `BSG_IO_OUT(n``_0, `BSG_PAD_OUTPUT_SLOW)      \
  `BSG_IO_TIELO(n``_0_oen_int)                  \
  `BSG_IO_OUT(n``_1, `BSG_PAD_OUTPUT_SLOW)      \
  `BSG_IO_TIELO(n``_1_oen_int)                  \
  `BSG_IO_OUT(n``_2, `BSG_PAD_OUTPUT_SLOW)      \
  `BSG_IO_TIELO(n``_2_oen_int)                  \
  `BSG_IO_OUT(n``_3, `BSG_PAD_OUTPUT_SLOW)      \
  `BSG_IO_TIELO(n``_3_oen_int)                  \
  `BSG_IO_OUT(n``_4, `BSG_PAD_OUTPUT_SLOW)      \
  `BSG_IO_TIELO(n``_4_oen_int)                  \
  `BSG_IO_OUT(n``_5, `BSG_PAD_OUTPUT_SLOW)      \
  `BSG_IO_TIELO(n``_5_oen_int)                  \
  `BSG_IO_OUT(n``_6, `BSG_PAD_OUTPUT_SLOW)      \
  `BSG_IO_TIELO(n``_6_oen_int)                  \
  `BSG_IO_OUT(n``_7, `BSG_PAD_OUTPUT_SLOW)      \
  `BSG_IO_TIELO(n``_7_oen_int)

// DRAM L CHANNELS
`BSG_IOPADS_16B_CHANNEL_PADS(pad_DL0)
`BSG_IOPADS_16B_CHANNEL_PADS(pad_DL1)
`BSG_IOPADS_16B_CHANNEL_PADS(pad_DL2)
`BSG_IOPADS_16B_CHANNEL_PADS(pad_DL3)
`BSG_IOPADS_16B_CHANNEL_PADS(pad_DL4)
`BSG_IOPADS_16B_CHANNEL_PADS(pad_DL5)
`BSG_IOPADS_16B_CHANNEL_PADS(pad_DL6)
`BSG_IOPADS_16B_CHANNEL_PADS(pad_DL7)

// DRAM R CHANNELS
`BSG_IOPADS_16B_CHANNEL_PADS(pad_DR0)
`BSG_IOPADS_16B_CHANNEL_PADS(pad_DR1)
`BSG_IOPADS_16B_CHANNEL_PADS(pad_DR2)
`BSG_IOPADS_16B_CHANNEL_PADS(pad_DR3)
`BSG_IOPADS_16B_CHANNEL_PADS(pad_DR4)
`BSG_IOPADS_16B_CHANNEL_PADS(pad_DR5)
`BSG_IOPADS_16B_CHANNEL_PADS(pad_DR6)
`BSG_IOPADS_16B_CHANNEL_PADS(pad_DR7)

// IO T CHANNELS
`BSG_IOPADS_16B_CHANNEL_PADS(pad_IT0)
`BSG_IOPADS_16B_CHANNEL_PADS(pad_IT1)

// CTRL T/B CHANNELS
`BSG_IOPADS_8B_CHANNEL_PADS(pad_CT0)
`BSG_IOPADS_8B_CHANNEL_PADS(pad_CB0)

// MISC L0
`BSG_IO_IN(pad_ML0_0, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(pad_ML0_1, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(pad_ML0_2, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(pad_ML0_3, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(pad_ML0_4, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(pad_ML0_5, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(pad_ML0_6, `BSG_PAD_INPUT_PULLDOWN)

// MISC L1
`BSG_IO_IN(pad_ML1_0, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(pad_ML1_1, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(pad_ML1_2, `BSG_PAD_INPUT_PULLDOWN)

// MISC R0
`BSG_IO_IN(pad_MR0_0, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(pad_MR0_1, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(pad_MR0_2, `BSG_PAD_INPUT_PULLDOWN)

// MISC R1
`BSG_IO_IN(pad_MR1_0, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(pad_MR1_1, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(pad_MR1_2, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(pad_MR1_3, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(pad_MR1_4, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(pad_MR1_5, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(pad_MR1_6, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(pad_MR1_7, `BSG_PAD_INPUT_PULLDOWN)

