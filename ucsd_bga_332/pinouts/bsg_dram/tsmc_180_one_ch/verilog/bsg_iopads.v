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

   // note this is a usually the primary external clock for the system
   `BSG_IO_IN (PLL_CLK,`BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN (reset,  `BSG_PAD_INPUT_PULLDOWN)

   `BSG_IO_IN_AB    (sdi,sclk,    `BSG_PAD_INPUT_PULLDOWN, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_INOUT_CD (sdi,sclk,    `BSG_PAD_INPUT_PULLDOWN, `BSG_PAD_INPUT_PULLDOWN)
// `BSG_IO_IN_ABCD (sdi,sclk_ex, `BSG_PAD_INPUT_PULLDOWN, `BSG_PAD_INPUT_PULLDOWN, `BSG_PAD_INPUT_PULLDOWN, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN_AB    (sdi,ncmd,    `BSG_PAD_INPUT_PULLDOWN, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_OENOUT_CD   (sdi,ncmd,    `BSG_PAD_INPUT_PULLDOWN, `BSG_PAD_INPUT_PULLDOWN)

   `BSG_IO_OUT_ABCD(sdi,token,   `BSG_PAD_OUTPUT_A,    `BSG_PAD_OUTPUT_B,    `BSG_PAD_OUTPUT_C,    `BSG_PAD_OUTPUT_D   )
   `BSG_IO_TIELO_VEC(sdi_token_oen_int,4)

   // sdi_tkn_ex[3] needs a fast pad because it is the clock test output
// `BSG_IO_OUT_ABCD(sdi,tkn_ex,  `BSG_PAD_OUTPUT_SLOW, `BSG_PAD_OUTPUT_SLOW, `BSG_PAD_OUTPUT_SLOW, `BSG_PAD_OUTPUT_FAST)

// user settable
//   `BSG_IO_TIELO_VEC(sdi_tkn_ex_oen_int,4)

   `BSG_IO_IN_V70       (sdi_A_data, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_INOUT_V70    (sdi_B_data, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN_V70       (sdi_C_data, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_INOUT_V70    (sdi_D_data, `BSG_PAD_INPUT_PULLDOWN)


   `BSG_IO_OUT_ABCD(sdo,sclk,     `BSG_PAD_OUTPUT_A, `BSG_PAD_OUTPUT_B, `BSG_PAD_OUTPUT_C, `BSG_PAD_OUTPUT_D)
   `BSG_IO_TIELO_VEC(sdo_sclk_oen_int,4)

   // we make these fast because they are used as data for 10-bit channels
// `BSG_IO_OUT_ABCD(sdo,sclk_ex,  `BSG_PAD_OUTPUT_A, `BSG_PAD_OUTPUT_B, `BSG_PAD_OUTPUT_C, `BSG_PAD_OUTPUT_D)

   // user settable
   //`BSG_IO_TIELO_VEC(sdo_sclk_ex_oen_int,4)

   `BSG_IO_OUT_ABCD(sdo,ncmd,     `BSG_PAD_OUTPUT_A, `BSG_PAD_OUTPUT_B, `BSG_PAD_OUTPUT_C, `BSG_PAD_OUTPUT_D)
   `BSG_IO_TIELO_VEC(sdo_ncmd_oen_int,4)

   `BSG_IO_IN_ABCD (sdo,token,  `BSG_PAD_INPUT_PULLDOWN, `BSG_PAD_INPUT_PULLDOWN, `BSG_PAD_INPUT_PULLDOWN, `BSG_PAD_INPUT_PULLDOWN)
// `BSG_IO_IN_ABCD (sdo,tkn_ex, `BSG_PAD_INPUT_PULLDOWN, `BSG_PAD_INPUT_PULLDOWN, `BSG_PAD_INPUT_PULLDOWN, `BSG_PAD_INPUT_PULLDOWN)

   `BSG_IO_OUT_V70 (sdo_A_data, `BSG_PAD_OUTPUT_A)
   `BSG_IO_OUT_V70 (sdo_B_data, `BSG_PAD_OUTPUT_B)
   `BSG_IO_OUT_V70 (sdo_C_data, `BSG_PAD_OUTPUT_C)
   `BSG_IO_OUT_V70 (sdo_D_data, `BSG_PAD_OUTPUT_D)

   `BSG_IO_TIELO_VEC(sdo_A_data_oen_int,8)
   `BSG_IO_TIELO_VEC(sdo_B_data_oen_int,8)
   `BSG_IO_TIELO_VEC(sdo_C_data_oen_int,8)
   `BSG_IO_TIELO_VEC(sdo_D_data_oen_int,8)

    // node L3 and R3 have been chosen as outputs

   `BSG_IO_IN (misc_L_7, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN (misc_L_6, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN (misc_L_5, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN (misc_L_4, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN (misc_L_2, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_OUT(misc_L_3,`BSG_PAD_OUTPUT_SLOW)

//`BSG_IO_TIELO(misc_L_3_oen_int)

   `BSG_IO_IN (misc_L_1, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN (misc_L_0, `BSG_PAD_INPUT_PULLDOWN)

   `BSG_IO_IN (misc_R_7, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN (misc_R_6, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN (misc_R_5, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN (misc_R_4, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_OUT(misc_R_3,`BSG_PAD_OUTPUT_SLOW)
//   `BSG_IO_TIELO(misc_R_3_oen_int)

   `BSG_IO_IN (misc_R_2, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN (misc_R_1, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN (misc_R_0, `BSG_PAD_INPUT_PULLDOWN)

   // note these are not part of the vector as bit number is in name.
   `BSG_IO_IN (misc_T_0,`BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN (misc_T_1,`BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN (misc_T_2,`BSG_PAD_INPUT_PULLDOWN)

    // these can be used as fast i/os
   `BSG_IO_OUT(sdo_A_data_8,`BSG_PAD_OUTPUT_A)
   `BSG_IO_OUT(sdo_C_data_8,`BSG_PAD_OUTPUT_C)

//   `BSG_IO_TIELO(sdo_A_data_8_oen_int)
//   `BSG_IO_TIELO(sdo_C_data_8_oen_int)

   // differential pairs
   `BSG_IO_IN_DIFF_DISABLE (clk_0, `BSG_PAD_DISABLE)
// `BSG_IO_IN_DIFF_DISABLE (clk_1, `BSG_PAD_DISABLE)
   `BSG_IO_OUT(clk_1_p,`BSG_PAD_OUTPUT_FAST)
   `BSG_IO_OUT(clk_1_n,`BSG_PAD_OUTPUT_FAST)
   `BSG_IO_IN_DIFF_DISABLE (SMA_in,`BSG_PAD_DISABLE)


    // these are routed as 100 ohms to SMA connector
    // they do not have a differential termination resistor
    // on-board, so they can be driven with normal outputs
    // and used for debug.

   `BSG_IO_OUT(SMA_out_p,`BSG_PAD_OUTPUT_SLOW)
   `BSG_IO_OUT(SMA_out_n,`BSG_PAD_OUTPUT_SLOW)
   `BSG_IO_TIELO(SMA_out_p_oen_int)
   `BSG_IO_TIELO(SMA_out_n_oen_int)

   // Lutag inputs
   `BSG_IO_IN(JTAG_TMS, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN(JTAG_TDI, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN(JTAG_TCK, `BSG_PAD_INPUT_PULLDOWN)
   `BSG_IO_IN(JTAG_TRST,`BSG_PAD_INPUT_PULLDOWN)

   // debug output
   `BSG_IO_OUT(JTAG_TDO,`BSG_PAD_OUTPUT_SLOW)
//   `BSG_IO_TIELO(JTAG_TDO_oen_int)

   // these are dedicated power pins and should not be
   // instantiated as pins in the verilog
   //
   //`BSG_IO_IN(PLL_VDD)
   //`BSG_IO_IN(PLL_VSS)

   //`BSG_IO_IN(PLL_V33)
   //`BSG_IO_IN(PLL_VZZ)
