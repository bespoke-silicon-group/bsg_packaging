(
 // *************************************************************************
 // DDR DRAM interface signals
 //
 localparam dram_data_width_lp = 16;
 localparam dram_addr_width_lp = 14;
 localparam dram_strobe_width_lp = dram_data_width_lp >> 3;
 localparam dram_mask_width_lp   = dram_data_width_lp >> 3;
 // Data mask signals
   output[dram_strobe_width_lp-1:0] p_ddr_dm_o

 // DQ strobe signals, single-ended for DDR and differential for DDR2/3
 , inout [dram_strobe_width_lp-1:0] p_ddr_dqs_p_io

 // DQ signals
 , inout [dram_data_width_lp-1:0]   p_ddr_dq_io

 // Row/Column address signals, 16 bits at maximum
 , output[dram_addr_width_lp-1:0]   p_ddr_a_o

 // Bank address signals, 3 bits at maximum
 , output[dram_mask_width_lp-1:0]   p_ddr_ba_o

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
 localparam comm_link_data_width_lp = 8;
 , input  p_sdi_sclk_i

 // input valid signal
 , input  p_sdi_ncmd_i

 // input data signals
 , input  [comm_link_data_width_lp-1:0] p_sdi_data_i

 // output token signal
 , output p_sdi_token_o

 // output clk signal
 , output p_sdo_sclk_o

 // output valid signal
 , output p_sdo_ncmd_o

 // output data signals
 , output [comm_link_data_width_lp-1:0] p_sdo_data_o

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
