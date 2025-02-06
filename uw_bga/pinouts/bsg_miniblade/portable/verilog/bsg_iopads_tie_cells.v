`ifdef BSG_USE_TIE_NETS

`define BSG_TIE_CELL_PAIR(n) \
  `BSG_IO_TIEHI(n``_thi); \
  `BSG_IO_TIELO(n``_tlo);

`BSG_TIE_CELL_PAIR( pad_LINK_0_i   )
`BSG_TIE_CELL_PAIR( pad_LINK_1_i   )
`BSG_TIE_CELL_PAIR( pad_LINK_2_i   )
`BSG_TIE_CELL_PAIR( pad_LINK_3_i   )
`BSG_TIE_CELL_PAIR( pad_LINK_v_i   )
`BSG_TIE_CELL_PAIR( pad_LINK_clk_i )
`BSG_TIE_CELL_PAIR( pad_LINK_tkn_o )

`BSG_TIE_CELL_PAIR( pad_LINK_0_o   )
`BSG_TIE_CELL_PAIR( pad_LINK_1_o   )
`BSG_TIE_CELL_PAIR( pad_LINK_2_o   )
`BSG_TIE_CELL_PAIR( pad_LINK_3_o   )
`BSG_TIE_CELL_PAIR( pad_LINK_v_o   )
`BSG_TIE_CELL_PAIR( pad_LINK_clk_o )
`BSG_TIE_CELL_PAIR( pad_LINK_tkn_i )

`BSG_TIE_CELL_PAIR( pad_TAG_clk_i  )
`BSG_TIE_CELL_PAIR( pad_TAG_data_i )

`BSG_TIE_CELL_PAIR( pad_EXT_clk_i  )
`BSG_TIE_CELL_PAIR( pad_MON_clk_o  )
`BSG_TIE_CELL_PAIR( pad_DISABLE_i  )

`endif
