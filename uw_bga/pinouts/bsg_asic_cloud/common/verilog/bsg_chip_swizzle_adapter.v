
// Paul Gao
// This module should be instantiated in toplevel bsg_chip
// All comm-link channels should go through this adapter

module bsg_chip_swizzle_adapter

  (// bsg_chip_guts side
  // coming in from next chip
   output guts_ci_clk_o
  ,output guts_ci_v_o
  ,output [8:0] guts_ci_data_o
  ,input guts_ci_tkn_i
  // coming in from previous chip
  ,output guts_ci2_clk_o
  ,output guts_ci2_v_o
  ,output [8:0] guts_ci2_data_o
  ,input guts_ci2_tkn_i
  // going out to next chip
  ,input guts_co_clk_i
  ,input guts_co_v_i
  ,input [8:0] guts_co_data_i
  ,output guts_co_tkn_o
  // going out to previous chip
  ,input guts_co2_clk_i
  ,input guts_co2_v_i
  ,input [8:0] guts_co2_data_i
  ,output guts_co2_tkn_o

  // bsg_chip port side

  ,input port_ci_clk_i
  ,input port_ci_v_i
  ,input [8:0] port_ci_data_i
  ,output port_ci_tkn_o

  ,input port_co_clk_i
  ,input port_co_v_i
  ,input [8:0] port_co_data_i
  ,output port_co_tkn_o

  ,output port_ci2_clk_o
  ,output port_ci2_v_o
  ,output [8:0] port_ci2_data_o
  ,input port_ci2_tkn_i

  ,output port_co2_clk_o
  ,output port_co2_v_o
  ,output [8:0] port_co2_data_o
  ,input port_co2_tkn_i
  );

  
  // Channel guts_ci remain the same
  assign guts_ci_clk_o = port_ci_clk_i;
  assign guts_ci_v_o = port_ci_v_i;
  assign guts_ci_data_o = port_ci_data_i;
  assign port_ci_tkn_o = guts_ci_tkn_i;


  // channel guts_ci2 are mapped to port_co
  assign guts_ci2_clk_o = port_co_clk_i;
  assign guts_ci2_v_o = port_co_v_i;
  assign guts_ci2_data_o = port_co_data_i;
  assign port_co_tkn_o = guts_ci2_tkn_i;


  // channel port_ci2 are mapped to guts_co
  // pin sequence changed
  assign port_ci2_clk_o = guts_co_clk_i;
  assign port_ci2_v_o = guts_co_data_i[4];
  assign port_ci2_data_o[0] = guts_co_data_i[6];
  assign port_ci2_data_o[1] = guts_co_data_i[5];
  assign port_ci2_data_o[2] = guts_co_data_i[7];
  assign port_ci2_data_o[3] = guts_co_data_i[8];
  assign port_ci2_data_o[4] = guts_co_data_i[3];
  assign port_ci2_data_o[5] = guts_co_v_i;
  assign port_ci2_data_o[6] = guts_co_data_i[2];
  assign port_ci2_data_o[7] = guts_co_data_i[1];
  assign port_ci2_data_o[8] = guts_co_data_i[0];
  assign guts_co_tkn_o = port_ci2_tkn_i;


  // channel port_co2 are mapped to guts_co2
  // pin sequence changed
  assign port_co2_clk_o = guts_co2_clk_i;
  assign port_co2_v_o = guts_co2_data_i[4];
  assign port_co2_data_o[0] = guts_co2_data_i[8];
  assign port_co2_data_o[1] = guts_co2_data_i[7];
  assign port_co2_data_o[2] = guts_co2_v_i;
  assign port_co2_data_o[3] = guts_co2_data_i[6];
  assign port_co2_data_o[4] = guts_co2_data_i[5];
  assign port_co2_data_o[5] = guts_co2_data_i[3];
  assign port_co2_data_o[6] = guts_co2_data_i[2];
  assign port_co2_data_o[7] = guts_co2_data_i[1];
  assign port_co2_data_o[8] = guts_co2_data_i[0];
  assign guts_co2_tkn_o = port_co2_tkn_i;


endmodule




















