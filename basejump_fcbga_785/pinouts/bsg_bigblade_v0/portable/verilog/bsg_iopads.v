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

`define BSG_IOPADS_16B_CHANNEL_PADS(n)          \
  `BSG_IO_IN(n``_clk1, `BSG_PAD_INPUT_PULLDOWN) \
  `BSG_IO_IN(n``_clk2, `BSG_PAD_INPUT_PULLDOWN) \
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
  `BSG_IO_IN(n``_8, `BSG_PAD_INPUT_PULLDOWN)    \
  `BSG_IO_IN(n``_9, `BSG_PAD_INPUT_PULLDOWN)    \
  `BSG_IO_IN(n``_10, `BSG_PAD_INPUT_PULLDOWN)   \
  `BSG_IO_IN(n``_11, `BSG_PAD_INPUT_PULLDOWN)   \
  `BSG_IO_IN(n``_12, `BSG_PAD_INPUT_PULLDOWN)   \
  `BSG_IO_IN(n``_13, `BSG_PAD_INPUT_PULLDOWN)   \
  `BSG_IO_IN(n``_14, `BSG_PAD_INPUT_PULLDOWN)   \
  `BSG_IO_IN(n``_15, `BSG_PAD_INPUT_PULLDOWN)   \
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
  `BSG_IO_TIELO(n``_7_oen_int)                  \
  `BSG_IO_OUT(n``_8, `BSG_PAD_OUTPUT_SLOW)      \
  `BSG_IO_TIELO(n``_8_oen_int)                  \
  `BSG_IO_OUT(n``_9, `BSG_PAD_OUTPUT_SLOW)      \
  `BSG_IO_TIELO(n``_9_oen_int)                  \
  `BSG_IO_OUT(n``_10, `BSG_PAD_OUTPUT_SLOW)     \
  `BSG_IO_TIELO(n``_10_oen_int)                 \
  `BSG_IO_OUT(n``_11, `BSG_PAD_OUTPUT_SLOW)     \
  `BSG_IO_TIELO(n``_11_oen_int)                 \
  `BSG_IO_OUT(n``_12, `BSG_PAD_OUTPUT_SLOW)     \
  `BSG_IO_TIELO(n``_12_oen_int)                 \
  `BSG_IO_OUT(n``_13, `BSG_PAD_OUTPUT_SLOW)     \
  `BSG_IO_TIELO(n``_13_oen_int)                 \
  `BSG_IO_OUT(n``_14, `BSG_PAD_OUTPUT_SLOW)     \
  `BSG_IO_TIELO(n``_14_oen_int)                 \
  `BSG_IO_OUT(n``_15, `BSG_PAD_OUTPUT_SLOW)     \
  `BSG_IO_TIELO(n``_15_oen_int)                 \
  `BSG_IO_OUT(n``_extra, `BSG_PAD_OUTPUT_SLOW)  \
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
`BSG_IOPADS_16B_CHANNEL_PADS(dram_ch_l0)
`BSG_IOPADS_16B_CHANNEL_PADS(dram_ch_l1)
`BSG_IOPADS_16B_CHANNEL_PADS(dram_ch_l2)
`BSG_IOPADS_16B_CHANNEL_PADS(dram_ch_l3)
`BSG_IOPADS_16B_CHANNEL_PADS(dram_ch_l4)
`BSG_IOPADS_16B_CHANNEL_PADS(dram_ch_l5)
`BSG_IOPADS_16B_CHANNEL_PADS(dram_ch_l6)
`BSG_IOPADS_16B_CHANNEL_PADS(dram_ch_l7)

// DRAM R CHANNELS
`BSG_IOPADS_16B_CHANNEL_PADS(dram_ch_r0)
`BSG_IOPADS_16B_CHANNEL_PADS(dram_ch_r1)
`BSG_IOPADS_16B_CHANNEL_PADS(dram_ch_r2)
`BSG_IOPADS_16B_CHANNEL_PADS(dram_ch_r3)
`BSG_IOPADS_16B_CHANNEL_PADS(dram_ch_r4)
`BSG_IOPADS_16B_CHANNEL_PADS(dram_ch_r5)
`BSG_IOPADS_16B_CHANNEL_PADS(dram_ch_r6)
`BSG_IOPADS_16B_CHANNEL_PADS(dram_ch_r7)

// IO T CHANNELS
`BSG_IOPADS_16B_CHANNEL_PADS(io_ch_t0)
`BSG_IOPADS_16B_CHANNEL_PADS(io_ch_t1)

// CTRL T/B CHANNELS
`BSG_IOPADS_8B_CHANNEL_PADS(ctrl_ch_t0)
`BSG_IOPADS_8B_CHANNEL_PADS(ctrl_ch_b0)

// MISC L0
`BSG_IO_IN(misc_l0_0, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(misc_l0_1, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(misc_l0_2, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(misc_l0_3, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(misc_l0_4, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(misc_l0_5, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(misc_l0_6, `BSG_PAD_INPUT_PULLDOWN)

// MISC L1
`BSG_IO_IN(misc_l1_0, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(misc_l1_1, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(misc_l1_2, `BSG_PAD_INPUT_PULLDOWN)

// MISC R0
`BSG_IO_IN(misc_r0_0, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(misc_r0_1, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(misc_r0_2, `BSG_PAD_INPUT_PULLDOWN)

// MISC R1
`BSG_IO_IN(misc_r1_0, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(misc_r1_1, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(misc_r1_2, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(misc_r1_3, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(misc_r1_4, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(misc_r1_5, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(misc_r1_6, `BSG_PAD_INPUT_PULLDOWN)
`BSG_IO_IN(misc_r1_7, `BSG_PAD_INPUT_PULLDOWN)

