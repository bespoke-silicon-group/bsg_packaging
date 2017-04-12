genvar i;

`ifndef BSG_PAD_BIDIR_H
BSG_PAD_BIDIR_H should be defined!
`endif

`ifndef BSG_PAD_BIDIR_V
BSG_PAD_BIDIR_V should be defined!
`endif

   // note this is a usually the primary external clock for the system

   `BSG_IO_IN (reset,  `BSG_PAD_BIDIR_V)

   `BSG_IO_IN_ABCD (sdi,sclk,    `BSG_PAD_BIDIR_H)
   `BSG_IO_IN_ABCD (sdi,sclk_ex, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN_ABCD (sdi,ncmd,    `BSG_PAD_BIDIR_H)

   `BSG_IO_OUT_ABCD(sdi,token,   `BSG_PAD_BIDIR_H,    `BSG_PAD_BIDIR_H,    `BSG_PAD_BIDIR_H,    `BSG_PAD_BIDIR_H   )
   `BSG_IO_TIELO_VEC(sdi_token_oen_int,4)

   // sdi_tkn_ex[3] needs a fast pad because it is the clock test output
   `BSG_IO_OUT_ABCD(sdi,tkn_ex,  `BSG_PAD_BIDIR_H, `BSG_PAD_BIDIR_H, `BSG_PAD_BIDIR_H, `BSG_PAD_BIDIR_H)

// user settable
//   `BSG_IO_TIELO_VEC(sdi_tkn_ex_oen_int,4)

   `BSG_IO_IN_V70 (sdi_A_data, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN_V70 (sdi_B_data, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN_V70 (sdi_C_data, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN_V70 (sdi_D_data, `BSG_PAD_BIDIR_H)


   `BSG_IO_OUT_ABCD(sdo,sclk,     `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V)
   `BSG_IO_TIELO_VEC(sdo_sclk_oen_int,4)

   // we make these fast because they are used as data for 10-bit channels
   `BSG_IO_OUT_ABCD(sdo,sclk_ex,  `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V)

   // user settable
   //`BSG_IO_TIELO_VEC(sdo_sclk_ex_oen_int,4)

   `BSG_IO_OUT_ABCD(sdo,ncmd,     `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V)
   `BSG_IO_TIELO_VEC(sdo_ncmd_oen_int,4)

   `BSG_IO_IN_ABCD (sdo,token,  `BSG_PAD_BIDIR_V)
   `BSG_IO_IN_ABCD (sdo,tkn_ex, `BSG_PAD_BIDIR_V)

   `BSG_IO_OUT_V70 (sdo_A_data, `BSG_PAD_BIDIR_V)
   `BSG_IO_OUT_V70 (sdo_B_data, `BSG_PAD_BIDIR_V)
   `BSG_IO_OUT_V70 (sdo_C_data, `BSG_PAD_BIDIR_V)
   `BSG_IO_OUT_V70 (sdo_D_data, `BSG_PAD_BIDIR_V)

   `BSG_IO_TIELO_VEC(sdo_A_data_oen_int,8)
   `BSG_IO_TIELO_VEC(sdo_B_data_oen_int,8)
   `BSG_IO_TIELO_VEC(sdo_C_data_oen_int,8)
   `BSG_IO_TIELO_VEC(sdo_D_data_oen_int,8)

    // node L3 and R3 have been chosen as outputs


   `BSG_IO_IN (misc_L_6, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN (misc_L_2, `BSG_PAD_BIDIR_H)
   `BSG_IO_OUT(misc_L_3, `BSG_PAD_BIDIR_H)

//`BSG_IO_TIELO(misc_L_3_oen_int)

   `BSG_IO_IN (misc_L_1, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN (misc_R_6, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN (misc_R_5, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN (misc_R_4, `BSG_PAD_BIDIR_H)
   `BSG_IO_OUT(misc_R_3, `BSG_PAD_BIDIR_H)
//   `BSG_IO_TIELO(misc_R_3_oen_int)

   `BSG_IO_IN (misc_R_2, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN (misc_R_1, `BSG_PAD_BIDIR_H)

    // these can be used as fast i/os
   `BSG_IO_OUT(sdo_A_data_8,`BSG_PAD_BIDIR_V)
   `BSG_IO_OUT(sdo_C_data_8,`BSG_PAD_BIDIR_V)

//   `BSG_IO_TIELO(sdo_A_data_8_oen_int)
//   `BSG_IO_TIELO(sdo_C_data_8_oen_int)

   // differential pairs
   //`BSG_IO_IN_DIFF_DISABLE (clk_0, `BSG_PAD_DISABLE)
   //`BSG_IO_IN_DIFF_DISABLE (clk_1, `BSG_PAD_DISABLE)
   //`BSG_IO_IN_DIFF_DISABLE (SMA_in,`BSG_PAD_DISABLE)

   `BSG_IO_IN (clk_0_p, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN (clk_0_n, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN (clk_1_p, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN (clk_1_n, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN (SMA_in_p,`BSG_PAD_BIDIR_V)
   `BSG_IO_IN (SMA_in_n,`BSG_PAD_BIDIR_V)

    // these are routed as 100 ohms to SMA connector
    // they do not have a differential termination resistor
    // on-board, so they can be driven with normal outputs
    // and used for debug.

   `BSG_IO_OUT(SMA_out_p,`BSG_PAD_BIDIR_V)
   `BSG_IO_OUT(SMA_out_n,`BSG_PAD_BIDIR_V)

   // Unused in Certus
   //`BSG_IO_TIELO(SMA_out_p_oen_int)
   //`BSG_IO_TIELO(SMA_out_n_oen_int)

   // Lutag inputs
   `BSG_IO_IN(JTAG_TDI, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN(JTAG_TCK, `BSG_PAD_BIDIR_H)

   // debug output
   `BSG_IO_OUT(JTAG_TDO,`BSG_PAD_BIDIR_H)
//   `BSG_IO_TIELO(JTAG_TDO_oen_int)

   //LDO DIGITAL SECTION
    `BSG_IO_OUT(LDO_CLKOV64, `BSG_PAD_BIDIR_H)
    `BSG_IO_OUT(LDO_ENH, `BSG_PAD_BIDIR_H)
    `BSG_IO_OUT(LDO_ENHH, `BSG_PAD_BIDIR_H)
    `BSG_IO_OUT(LDO_ENL, `BSG_PAD_BIDIR_H)
    `BSG_IO_OUT(LDO_ENLL, `BSG_PAD_BIDIR_H)
    `BSG_IO_IN(LDO_EXT_SAM, `BSG_PAD_BIDIR_H)
    `BSG_IO_IN(LDO_CLK_LOAD, `BSG_PAD_BIDIR_H)
    `BSG_IO_IN(LDO_CLK_REF, `BSG_PAD_BIDIR_H)
    `BSG_IO_IN(LDO_PLL, `BSG_PAD_BIDIR_H)
    `BSG_IO_IN(LDO_RSTIN, `BSG_PAD_BIDIR_H)
    `BSG_IO_IN(LDO_SPI_CLK, `BSG_PAD_BIDIR_H)
    `BSG_IO_IN(LDO_SPI_IN, `BSG_PAD_BIDIR_H)
    `BSG_IO_IN(LDO_SPI_RST, `BSG_PAD_BIDIR_H)

    //LDO ANALOG SECTION
   `BSG_ANALOG_PAD (LDO_A1, PANALOG_18_18_NT_DR_V)
   `BSG_ANALOG_PAD (LDO_A2, PANALOG_18_18_NT_DR_V)
   `BSG_ANALOG_PAD (LDO_A6, PANALOG_18_18_NT_DR_V)
   `BSG_ANALOG_PAD (LDO_A7, PANALOG_18_18_NT_DR_V)
   `BSG_ANALOG_PAD (LDO_A9, PANALOG_18_18_NT_DR_V)
   `BSG_ANALOG_PAD (LDO_A11, PANALOG_18_18_NT_DR_V)


/*   `BSG_IO_IN (LDO_A1, `BSG_PAD_BIDIR_V)
   `BSG_IO_IN (LDO_A2, `BSG_PAD_BIDIR_V)
   `BSG_IO_IN (LDO_A6, `BSG_PAD_BIDIR_V)
   `BSG_IO_IN (LDO_A7, `BSG_PAD_BIDIR_V)
   `BSG_IO_IN (LDO_A9, `BSG_PAD_BIDIR_V)
   `BSG_IO_IN (LDO_A11, `BSG_PAD_BIDIR_V)
*/

    //PLL Section
   `BSG_IO_IN (PLL_1_REF, `BSG_PAD_BIDIR_V)
   `BSG_IO_OUT(PLL_1_TST, `BSG_PAD_BIDIR_V)
   `BSG_IO_IN (PLL_1_RST, `BSG_PAD_BIDIR_V)
   `BSG_IO_IN (PLL_2_REF, `BSG_PAD_BIDIR_V)
   `BSG_IO_OUT(PLL_2_TST, `BSG_PAD_BIDIR_V)
   `BSG_IO_IN (PLL_2_RST, `BSG_PAD_BIDIR_V)
   `BSG_IO_IN (PLL_3_REF, `BSG_PAD_BIDIR_V)
   `BSG_IO_OUT(PLL_3_TST, `BSG_PAD_BIDIR_V)
   `BSG_IO_IN (PLL_3_RST, `BSG_PAD_BIDIR_V)

