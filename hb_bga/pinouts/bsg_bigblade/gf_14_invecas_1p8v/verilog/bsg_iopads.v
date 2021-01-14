genvar i;

// WARNING: TEMPORARY IOPADS FOR SIMULATION PURPOSE ONLY

`define BSG_IOPADS_FULL_DUPLEX_LINK_PADS(i)                           \
    `BSG_IO_IN   (bsg_link_in``i``_clk,  IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_IN   (bsg_link_in``i``_v,    IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_OUT  (bsg_link_in``i``_tkn,  IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_IN   (bsg_link_in``i``_d0,   IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_IN   (bsg_link_in``i``_d1,   IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_IN   (bsg_link_in``i``_d2,   IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_IN   (bsg_link_in``i``_d3,   IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_IN   (bsg_link_in``i``_d4,   IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_IN   (bsg_link_in``i``_d5,   IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_IN   (bsg_link_in``i``_d6,   IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_IN   (bsg_link_in``i``_d7,   IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_IN_DISABLE   (bsg_link_in``i``_d8,   IN12LP_GPIO18_13M9S30P_IO_H) \
                                                                      \
    `BSG_IO_OUT  (bsg_link_out``i``_clk, IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_OUT  (bsg_link_out``i``_v,   IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_IN   (bsg_link_out``i``_tkn, IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_OUT  (bsg_link_out``i``_d0,  IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_OUT  (bsg_link_out``i``_d1,  IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_OUT  (bsg_link_out``i``_d2,  IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_OUT  (bsg_link_out``i``_d3,  IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_OUT  (bsg_link_out``i``_d4,  IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_OUT  (bsg_link_out``i``_d5,  IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_OUT  (bsg_link_out``i``_d6,  IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_OUT  (bsg_link_out``i``_d7,  IN12LP_GPIO18_13M9S30P_IO_H) \
    `BSG_IO_OUT_DISABLE  (bsg_link_out``i``_d8,  IN12LP_GPIO18_13M9S30P_IO_H)

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



  `BSG_IO_IN   (bsg_tag_clk,  IN12LP_GPIO18_13M9S30P_IO_H)
  `BSG_IO_IN   (bsg_tag_en,   IN12LP_GPIO18_13M9S30P_IO_H)
  `BSG_IO_IN   (bsg_tag_data, IN12LP_GPIO18_13M9S30P_IO_H)
  `BSG_IO_OUT_DISABLE  (bsg_tag_data, IN12LP_GPIO18_13M9S30P_IO_H)
  `BSG_IO_OUT_DISABLE  (bsg_tag_clk,  IN12LP_GPIO18_13M9S30P_IO_H)

  `BSG_IO_IN   (clk_A,   IN12LP_GPIO18_13M9S30P_IO_H)
  `BSG_IO_IN   (clk_B,   IN12LP_GPIO18_13M9S30P_IO_H)
  `BSG_IO_IN   (clk_C,   IN12LP_GPIO18_13M9S30P_IO_H)
  `BSG_IO_OUT  (clk,     IN12LP_GPIO18_13M9S30P_IO_H)

  `BSG_IO_IN   (sel_0,   IN12LP_GPIO18_13M9S30P_IO_H)
  `BSG_IO_IN   (sel_1,   IN12LP_GPIO18_13M9S30P_IO_H)
  `BSG_IO_IN_DISABLE   (sel_2,   IN12LP_GPIO18_13M9S30P_IO_H)

  `BSG_IO_IN_DISABLE   (clk_async_reset,  IN12LP_GPIO18_13M9S30P_IO_H)
  `BSG_IO_IN_DISABLE   (core_async_reset, IN12LP_GPIO18_13M9S30P_IO_H)

  `BSG_IO_OUT_DISABLE  (misc,             IN12LP_GPIO18_13M9S30P_IO_H)
