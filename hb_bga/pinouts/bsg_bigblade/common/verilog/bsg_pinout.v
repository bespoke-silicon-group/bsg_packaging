
  (

`define BSG_PINOUT_FULL_DUPLEX_LINK_PORTS(i) \
     input  p_bsg_link_in``i``_clk_i         \
    ,input  p_bsg_link_in``i``_v_i           \
    ,output p_bsg_link_in``i``_tkn_o         \
    ,input  p_bsg_link_in``i``_d0_i          \
    ,input  p_bsg_link_in``i``_d1_i          \
    ,input  p_bsg_link_in``i``_d2_i          \
    ,input  p_bsg_link_in``i``_d3_i          \
    ,input  p_bsg_link_in``i``_d4_i          \
    ,input  p_bsg_link_in``i``_d5_i          \
    ,input  p_bsg_link_in``i``_d6_i          \
    ,input  p_bsg_link_in``i``_d7_i          \
    ,input  p_bsg_link_in``i``_d8_i          \
                                             \
    ,output p_bsg_link_out``i``_clk_o        \
    ,output p_bsg_link_out``i``_v_o          \
    ,input  p_bsg_link_out``i``_tkn_i        \
    ,output p_bsg_link_out``i``_d0_o         \
    ,output p_bsg_link_out``i``_d1_o         \
    ,output p_bsg_link_out``i``_d2_o         \
    ,output p_bsg_link_out``i``_d3_o         \
    ,output p_bsg_link_out``i``_d4_o         \
    ,output p_bsg_link_out``i``_d5_o         \
    ,output p_bsg_link_out``i``_d6_o         \
    ,output p_bsg_link_out``i``_d7_o         \
    ,output p_bsg_link_out``i``_d8_o

  // 20 full-duplex bsg_link interfaces, 480 pins
   `BSG_PINOUT_FULL_DUPLEX_LINK_PORTS( 0)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS( 1)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS( 2)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS( 3)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS( 4)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS( 5)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS( 6)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS( 7)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS( 8)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS( 9)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS(10)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS(11)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS(12)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS(13)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS(14)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS(15)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS(16)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS(17)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS(18)
  ,`BSG_PINOUT_FULL_DUPLEX_LINK_PORTS(19)
  

  // bsg tag interface, 5 pins
  ,input  p_bsg_tag_clk_i
  ,input  p_bsg_tag_en_i
  ,input  p_bsg_tag_data_i
  ,output p_bsg_tag_clk_o
  ,output p_bsg_tag_data_o
  // clock and reset interface, 9 pins
  // clock input signals
  ,input  p_clk_A_i
  ,input  p_clk_B_i
  ,input  p_clk_C_i
  // clock output signal
  ,output p_clk_o
  // 3-bit clock selection signals
  ,input  p_sel_0_i
  ,input  p_sel_1_i
  ,input  p_sel_2_i
  // asynchronous reset signals
  ,input  p_clk_async_reset_i
  ,input  p_core_async_reset_i
  // miscellaneous signal, 1 pin
  ,output p_misc_o);
// End HB BGA PAD Definitions
// **********************************************************************
