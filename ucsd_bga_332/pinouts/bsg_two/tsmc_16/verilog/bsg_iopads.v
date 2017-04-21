genvar i;

`ifndef BSG_PAD_BIDIR_H
BSG_PAD_BIDIR_H should be defined!
`endif

`ifndef BSG_PAD_BIDIR_V
BSG_PAD_BIDIR_V should be defined!
`endif

  `BSG_IO_IN (reset, `BSG_PAD_BIDIR_V)
  `BSG_IO_IN_ABCD (sdi,sclk, `BSG_PAD_BIDIR_H)
  `BSG_IO_IN_ABCD (sdi,ncmd, `BSG_PAD_BIDIR_H)

  `BSG_IO_OUT_ABCD(sdi,token,   `BSG_PAD_BIDIR_H, `BSG_PAD_BIDIR_H, `BSG_PAD_BIDIR_H, `BSG_PAD_BIDIR_H   )
  // `BSG_IO_TIELO_VEC(sdi_token_oen_int,4)

  `BSG_IO_IN_V70 (sdi_A_data, `BSG_PAD_BIDIR_H)
  `BSG_IO_IN_V70 (sdi_B_data, `BSG_PAD_BIDIR_H)
  `BSG_IO_IN_V70 (sdi_C_data, `BSG_PAD_BIDIR_H)
  `BSG_IO_IN_V70 (sdi_D_data, `BSG_PAD_BIDIR_H)


  `BSG_IO_OUT_ABCD(sdo,sclk, `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V)
  // `BSG_IO_TIELO_VEC(sdo_sclk_oen_int,4)

  // `BSG_IO_OUT_ABCD(sdo,sclk_ex, `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V)
  //`BSG_IO_TIELO_VEC(sdo_sclk_ex_oen_int,4)

  `BSG_IO_OUT_ABCD(sdo,ncmd, `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V, `BSG_PAD_BIDIR_V)
  // `BSG_IO_TIELO_VEC(sdo_ncmd_oen_int,4)

  `BSG_IO_IN_ABCD (sdo,token,  `BSG_PAD_BIDIR_V)

  `BSG_IO_OUT_V70 (sdo_A_data, `BSG_PAD_BIDIR_V)
  `BSG_IO_OUT_V70 (sdo_B_data, `BSG_PAD_BIDIR_V)
  `BSG_IO_OUT_V70 (sdo_C_data, `BSG_PAD_BIDIR_V)
  `BSG_IO_OUT_V70 (sdo_D_data, `BSG_PAD_BIDIR_V)
  // `BSG_IO_TIELO_VEC(sdo_A_data_oen_int,8)
  // `BSG_IO_TIELO_VEC(sdo_B_data_oen_int,8)
  // `BSG_IO_TIELO_VEC(sdo_C_data_oen_int,8)
  // `BSG_IO_TIELO_VEC(sdo_D_data_oen_int,8)

  // `BSG_IO_IN (misc_R_7, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN (misc_R_6, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN (misc_R_5, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN (misc_R_4, `BSG_PAD_BIDIR_H)
  // `BSG_IO_OUT(misc_R_3, `BSG_PAD_BIDIR_H)
  // `BSG_IO_TIELO(misc_R_3_oen_int)
  // `BSG_IO_IN (misc_R_2, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN (misc_R_1, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN (misc_R_0, `BSG_PAD_BIDIR_H)
  //
  // `BSG_IO_IN (misc_L_7, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN (misc_L_6, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN (misc_L_5, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN (misc_L_4, `BSG_PAD_BIDIR_H)
  // `BSG_IO_OUT(misc_L_3, `BSG_PAD_BIDIR_H)
  // `BSG_IO_TIELO(misc_L_3_oen_int)
  // `BSG_IO_IN (misc_L_2, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN (misc_L_1, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN (misc_L_0, `BSG_PAD_BIDIR_H)

  // `BSG_IO_IN (misc_T_2, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN (misc_T_1, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN (misc_T_0, `BSG_PAD_BIDIR_H)

  // `BSG_IO_OUT(sdo_A_data_8,`BSG_PAD_BIDIR_V)
  // `BSG_IO_OUT(sdo_C_data_8,`BSG_PAD_BIDIR_V)

  // `BSG_IO_IN (clk_0_p, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN (clk_0_n, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN (clk_1_p, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN (clk_1_n, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN (SMA_in_p,`BSG_PAD_BIDIR_V)
  // `BSG_IO_IN (SMA_in_n,`BSG_PAD_BIDIR_V)

  //LDO DIGITAL SECTION
   `BSG_IO_OUT(LDO_CLKOV64, `BSG_PAD_BIDIR_H)
   `BSG_IO_OUT(LDO_ENH, `BSG_PAD_BIDIR_H)
   `BSG_IO_OUT(LDO_ENHH, `BSG_PAD_BIDIR_H)
   `BSG_IO_OUT(LDO_ENL, `BSG_PAD_BIDIR_H)
   `BSG_IO_OUT(LDO_ENLL, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN(LDO_EXT_SAM, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN(LDO_CLK_LOAD, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN(LDO_CLK_REF, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN(LDO_RSTIN, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN(LDO_SPI_CLK, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN(LDO_SPI_IN, `BSG_PAD_BIDIR_H)
   `BSG_IO_IN(LDO_SPI_RST, `BSG_PAD_BIDIR_H)
   // `BSG_IO_IN(LDO_PLL, `BSG_PAD_BIDIR_H)

   //LDO ANALOG SECTION
  `BSG_ANALOG_PAD (LDO_SECTION_VREFH, PANALOG_08_08_NT_DR_V)
  `BSG_ANALOG_PAD (LDO_SECTION_VREFL, PANALOG_08_08_NT_DR_V)
  `BSG_ANALOG_PAD (LDO_SECTION_VB_RING, PANALOG_08_08_NT_DR_V)
  `BSG_ANALOG_PAD (LDO_SECTION_VCAL_HH, PANALOG_08_08_NT_DR_V)
  `BSG_ANALOG_PAD (LDO_SECTION_VCAL_LL, PANALOG_08_08_NT_DR_V)
  `BSG_ANALOG_PAD (LDO_SECTION_VL, PANALOG_08_08_NT_DR_V)
  `BSG_ANALOG_PAD (LDO_SECTION_VDD_LOAD, PANALOG_08_08_NT_DR_V)
  `BSG_ANALOG_PAD (LDO_SECTION_VDDIO, PANALOG_08_08_NT_DR_V)
  `BSG_ANALOG_PAD (LDO_SECTION_VDDC, PANALOG_08_08_NT_DR_V)
  // Spare Analog Pins
  //`BSG_ANALOG_PAD (LDO_A4, PANALOG_08_08_NT_DR_V)
  //`BSG_ANALOG_PAD (LDO_A3, PANALOG_08_08_NT_DR_V)


   //PLL Section
  `BSG_IO_IN (PLL_SECTION_1_REF, `BSG_PAD_BIDIR_V)
  `BSG_IO_OUT(PLL_SECTION_1_TST, `BSG_PAD_BIDIR_V)
  `BSG_IO_IN (PLL_SECTION_1_RST, `BSG_PAD_BIDIR_V)
  `BSG_IO_IN (PLL_SECTION_2_REF, `BSG_PAD_BIDIR_V)
  `BSG_IO_OUT(PLL_SECTION_2_TST, `BSG_PAD_BIDIR_V)
  `BSG_IO_IN (PLL_SECTION_2_RST, `BSG_PAD_BIDIR_V)
  `BSG_IO_IN (PLL_SECTION_3_REF, `BSG_PAD_BIDIR_V)
  `BSG_IO_OUT(PLL_SECTION_3_TST, `BSG_PAD_BIDIR_V)
  `BSG_IO_IN (PLL_SECTION_3_RST, `BSG_PAD_BIDIR_V)

   //PLL Regular Section
  `BSG_IO_IN (PLL_SCLK, `BSG_PAD_BIDIR_V)
  `BSG_IO_IN (PLL_1_CS, `BSG_PAD_BIDIR_V)
  `BSG_IO_IN (PLL_1_SDI, `BSG_PAD_BIDIR_V)
  `BSG_IO_OUT(PLL_1_SDO, `BSG_PAD_BIDIR_V)
  `BSG_IO_IN (PLL_2_CS, `BSG_PAD_BIDIR_V)
  `BSG_IO_IN (PLL_2_SDI, `BSG_PAD_BIDIR_V)
  `BSG_IO_OUT(PLL_2_SDO, `BSG_PAD_BIDIR_V)
  `BSG_IO_IN (PLL_3_CS, `BSG_PAD_BIDIR_V)
  `BSG_IO_IN (PLL_3_SDI, `BSG_PAD_BIDIR_V)
  `BSG_IO_OUT(PLL_3_SDO, `BSG_PAD_BIDIR_V)

  // differential pairs
  //`BSG_IO_IN_DIFF_DISABLE (clk_0, `BSG_PAD_DISABLE)
  //`BSG_IO_IN_DIFF_DISABLE (clk_1, `BSG_PAD_DISABLE)
  //`BSG_IO_IN_DIFF_DISABLE (SMA_in,`BSG_PAD_DISABLE)

  // Unused in Certus
  // `BSG_IO_IN(JTAG_TCK, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN(JTAG_TDI, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN_ABCD (sdi,sclk_ex, `BSG_PAD_BIDIR_H)
  // `BSG_IO_IN_ABCD (sdo,tkn_ex, `BSG_PAD_BIDIR_V)
  // `BSG_IO_OUT_ABCD(sdi,tkn_ex,  `BSG_PAD_BIDIR_H, `BSG_PAD_BIDIR_H, `BSG_PAD_BIDIR_H, `BSG_PAD_BIDIR_H)
  //
  // `BSG_IO_OUT(JTAG_TDO,`BSG_PAD_BIDIR_H)
  // `BSG_IO_TIELO(JTAG_TDO_oen_int)
  // `BSG_IO_OUT(SMA_out_n,`BSG_PAD_BIDIR_V)
  // `BSG_IO_TIELO(SMA_out_n_oen_int)
  // `BSG_IO_OUT(SMA_out_p,`BSG_PAD_BIDIR_V)
  // `BSG_IO_TIELO(SMA_out_p_oen_int)
