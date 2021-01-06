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

`define BSG_IOPADS_FULL_DUPLEX_LINK_PADS(i)                       \
    `BSG_IO_IN   (bsg_link_in``i``_clk,  `BSG_PAD_INPUT_PULLDOWN) \
    `BSG_IO_IN   (bsg_link_in``i``_v,    `BSG_PAD_INPUT_PULLDOWN) \
    `BSG_IO_OUT  (bsg_link_in``i``_tkn,  `BSG_PAD_OUTPUT_SLOW)    \
    `BSG_IO_TIELO(bsg_link_in``i``_tkn_oen_int)                   \
    `BSG_IO_IN   (bsg_link_in``i``_d0,   `BSG_PAD_INPUT_PULLDOWN) \
    `BSG_IO_IN   (bsg_link_in``i``_d1,   `BSG_PAD_INPUT_PULLDOWN) \
    `BSG_IO_IN   (bsg_link_in``i``_d2,   `BSG_PAD_INPUT_PULLDOWN) \
    `BSG_IO_IN   (bsg_link_in``i``_d3,   `BSG_PAD_INPUT_PULLDOWN) \
    `BSG_IO_IN   (bsg_link_in``i``_d4,   `BSG_PAD_INPUT_PULLDOWN) \
    `BSG_IO_IN   (bsg_link_in``i``_d5,   `BSG_PAD_INPUT_PULLDOWN) \
    `BSG_IO_IN   (bsg_link_in``i``_d6,   `BSG_PAD_INPUT_PULLDOWN) \
    `BSG_IO_IN   (bsg_link_in``i``_d7,   `BSG_PAD_INPUT_PULLDOWN) \
    `BSG_IO_IN   (bsg_link_in``i``_d8,   `BSG_PAD_INPUT_PULLDOWN) \
                                                                  \
    `BSG_IO_OUT  (bsg_link_out``i``_clk, `BSG_PAD_OUTPUT_SLOW)    \
    `BSG_IO_TIELO(bsg_link_out``i``_clk_oen_int)                  \
    `BSG_IO_OUT  (bsg_link_out``i``_v,   `BSG_PAD_OUTPUT_SLOW)    \
    `BSG_IO_TIELO(bsg_link_out``i``_v_oen_int)                    \
    `BSG_IO_IN   (bsg_link_out``i``_tkn, `BSG_PAD_INPUT_PULLDOWN) \
    `BSG_IO_OUT  (bsg_link_out``i``_d0,   `BSG_PAD_OUTPUT_SLOW)   \
    `BSG_IO_TIELO(bsg_link_out``i``_d0_oen_int)                   \
    `BSG_IO_OUT  (bsg_link_out``i``_d1,   `BSG_PAD_OUTPUT_SLOW)   \
    `BSG_IO_TIELO(bsg_link_out``i``_d1_oen_int)                   \
    `BSG_IO_OUT  (bsg_link_out``i``_d2,   `BSG_PAD_OUTPUT_SLOW)   \
    `BSG_IO_TIELO(bsg_link_out``i``_d2_oen_int)                   \
    `BSG_IO_OUT  (bsg_link_out``i``_d3,   `BSG_PAD_OUTPUT_SLOW)   \
    `BSG_IO_TIELO(bsg_link_out``i``_d3_oen_int)                   \
    `BSG_IO_OUT  (bsg_link_out``i``_d4,   `BSG_PAD_OUTPUT_SLOW)   \
    `BSG_IO_TIELO(bsg_link_out``i``_d4_oen_int)                   \
    `BSG_IO_OUT  (bsg_link_out``i``_d5,   `BSG_PAD_OUTPUT_SLOW)   \
    `BSG_IO_TIELO(bsg_link_out``i``_d5_oen_int)                   \
    `BSG_IO_OUT  (bsg_link_out``i``_d6,   `BSG_PAD_OUTPUT_SLOW)   \
    `BSG_IO_TIELO(bsg_link_out``i``_d6_oen_int)                   \
    `BSG_IO_OUT  (bsg_link_out``i``_d7,   `BSG_PAD_OUTPUT_SLOW)   \
    `BSG_IO_TIELO(bsg_link_out``i``_d7_oen_int)                   \
    `BSG_IO_OUT  (bsg_link_out``i``_d8,   `BSG_PAD_OUTPUT_SLOW)   \
    `BSG_IO_TIELO(bsg_link_out``i``_d8_oen_int)

  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS( 0)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS( 1)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS( 2)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS( 3)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS( 4)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS( 5)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS( 6)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS( 7)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS( 8)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS( 9)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS(10)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS(11)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS(12)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS(13)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS(14)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS(15)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS(16)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS(17)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS(18)
  `BSG_IOPADS_FULL_DUPLEX_LINK_PADS(19)

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
