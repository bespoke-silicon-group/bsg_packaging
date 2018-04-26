(
 // *************************************************************************
 // DDR DRAM interface signals
 //
 // Data mask signals
   output p_ddr_dm_0_o
 , output p_ddr_dm_1_o

 // DQ strobe signals, single-ended for DDR and differential for DDR2/3
 , inout  p_ddr_dqs_0_p_io
 , inout  p_ddr_dqs_1_p_io

 // DQ signals
 , inout  p_ddr_dq_0_io
 , inout  p_ddr_dq_1_io
 , inout  p_ddr_dq_2_io
 , inout  p_ddr_dq_3_io
 , inout  p_ddr_dq_4_io
 , inout  p_ddr_dq_5_io
 , inout  p_ddr_dq_6_io
 , inout  p_ddr_dq_7_io
 , inout  p_ddr_dq_8_io
 , inout  p_ddr_dq_9_io
 , inout  p_ddr_dq_10_io
 , inout  p_ddr_dq_11_io
 , inout  p_ddr_dq_12_io
 , inout  p_ddr_dq_13_io
 , inout  p_ddr_dq_14_io
 , inout  p_ddr_dq_15_io

 // Row/Column address signals, 16 bits at maximum
 , output p_ddr_a_0_o
 , output p_ddr_a_1_o
 , output p_ddr_a_2_o
 , output p_ddr_a_3_o
 , output p_ddr_a_4_o
 , output p_ddr_a_5_o
 , output p_ddr_a_6_o
 , output p_ddr_a_7_o
 , output p_ddr_a_8_o
 , output p_ddr_a_9_o
 , output p_ddr_a_10_o
 , output p_ddr_a_11_o
 , output p_ddr_a_12_o
 , output p_ddr_a_13_o

 // Bank address signals, 3 bits at maximum
 , output p_ddr_ba_0_o
 , output p_ddr_ba_1_o

 // Control signals, p_ddr_odt_o and p_ddr_reset_o can be added to be
 // compatible with DDR2/3
 , output p_ddr_cke_o
 , output p_ddr_cs_n_o
 , output p_ddr_ras_n_o
 , output p_ddr_cas_n_o
 , output p_ddr_we_n_o

 // Differential output clock signals
 , output p_ddr_ck_p_o
 , output p_ddr_ck_n_o



 // *************************************************************************
 // Comm Link signals
 //
 // input clock signal
 , input  p_sdi_sclk_i

 // input valid signal
 , input  p_sdi_ncmd_i

 // input data signals
 , input  p_sdi_data_0_i
 , input  p_sdi_data_1_i
 , input  p_sdi_data_2_i
 , input  p_sdi_data_3_i
 , input  p_sdi_data_4_i
 , input  p_sdi_data_5_i
 , input  p_sdi_data_6_i
 , input  p_sdi_data_7_i

 // output token signal
 , output p_sdi_token_o

 // output clk signal
 , output p_sdo_sclk_o

 // output valid signal
 , output p_sdo_ncmd_o

 // output data signals
 , output p_sdo_data_0_o
 , output p_sdo_data_1_o
 , output p_sdo_data_2_o
 , output p_sdo_data_3_o
 , output p_sdo_data_4_o
 , output p_sdo_data_5_o
 , output p_sdo_data_6_o
 , output p_sdo_data_7_o

 // input token signal
 , input  p_sdo_token_i



 // *************************************************************************
 // misc signals to adjust the shape of the chip
 , input  p_misc_L_0_i
 , input  p_misc_L_1_i
 , input  p_misc_L_2_i

 , input  p_misc_T_0_i
 , input  p_misc_T_1_i
 , input  p_misc_T_2_i

 , input  p_misc_R_0_i
 , input  p_misc_R_1_i
 , input  p_misc_R_2_i
 , input  p_misc_R_3_o
 , input  p_misc_R_4_i
 , input  p_misc_R_5_i
 , input  p_misc_R_6_i
 , input  p_misc_R_7_i
 , input  p_misc_R_8_i

 , input  p_misc_T_1_i



 // *************************************************************************
 // Global input signals
 , input  p_reset_i



 // *************************************************************************
 // TAG signals
 , input  p_BYPASS_i
 , input  p_JTAG_TMS_i
 , input  p_JTAG_TDI_i
 , input  p_JTAG_TCK_i
 , input  p_JTAG_TRST_i
 , output p_JTAG_TDO_o
);
