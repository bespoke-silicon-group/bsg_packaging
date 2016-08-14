// MBT 9-22-14
//
// **********************************************************************
// UCSD BSG One Pinout (Based on UCSD BGA 332)
//
// This file defines all of the pads that are used for a given pinout of
// a package. It would change if we reversed the direction of a pad. It
// is recommended not to change the name of the
// pin (except the _i or _o) at this level so that we can maintain canonical
// naming for the package; instead just do an assign of a wire to rename.
//
// convention:
//
// - the input ports have a prefix of "p_"
// - the corresponding signals have no prefix
//   and have a suffix of _int.
// - the IO pad names are consistent with the
//   BGA 332 pinout names (e.g, sdi_B_data_7_i, sdi_B_ncmd_i)
//
// it is customary to include a macro file ahead of this one;
// for example bsg_one_iopad_macros_verilog.v

//module
// bsg_one
(
 // *******************************************************************
 // all "100-ohm impedance-controlled-in-package" differential pairs
 //

 input  p_clk_0_p_i    , input  p_clk_0_n_i
 , input  p_clk_1_p_i    , input  p_clk_1_n_i

 , input  p_SMA_in_p_i   , input  p_SMA_in_n_i
 , output p_SMA_out_p_o  , output p_SMA_out_n_o

 // *******************************************************************
 // ultra-shielded "50-ohm impedance-controlled-in-package" clock for PLL
 , input   p_PLL_CLK_i

 // *******************************************************************
 // all "50-ohm impedance-controlled-in-package" signals starting here
 // these are length matched within 1.55 mm length and
 // .76 mm bond wire length.

 // input clocks for input channels D,C,B,A
 , input  [3:0] p_sdi_sclk_i

 // input valids for input channels D,C,B,A
 , input  [3:0] p_sdi_ncmd_i

 // input datas for input channels D,C,B,A
 , input  [7:0] p_sdi_A_data_i, input [7:0] p_sdi_B_data_i
 , input  [7:0] p_sdi_C_data_i, input [7:0] p_sdi_D_data_i

 // output tokens for input channels D,C,B,A
 , output [3:0] p_sdi_token_o

 // output clocks for output channels D,C,B,A
 , output [3:0] p_sdo_sclk_o

 // output valids for output channels
 , output [3:0] p_sdo_ncmd_o

 // output data for out channels
 , output [7:0] p_sdo_A_data_o, output [7:0] p_sdo_B_data_o
 , output [7:0] p_sdo_C_data_o, output [7:0] p_sdo_D_data_o

 // extra output datas
 , output p_sdo_A_data_8_o , output p_sdo_C_data_8_o

 // input tokens for output channels
 , input  [3:0] p_sdo_token_i

 // spare clocks, length matched to channels
 , input  [3:0] p_sdi_sclk_ex_i
 , output [3:0] p_sdo_sclk_ex_o

 // spare tokens for input and output channels
 , output [3:0] p_sdi_tkn_ex_o
 , input  [3:0] p_sdo_tkn_ex_i

 // *******************************************************************
 // all "50-ohm impedance-controlled-in-package", starting here
 // but are next to clock or token signals
 // and are not length-matched

 , input  p_misc_T_0_i, input p_misc_T_1_i, input p_misc_T_2_i
 , input [7:0] p_misc_L_i, input [7:0] p_misc_R_i
 , input  p_reset_i

 // for JTAG, or other purposes
 , input  p_JTAG_TMS_i
 , input  p_JTAG_TDI_i
 , input  p_JTAG_TCK_i
 , input  p_JTAG_TRST_i
 , output p_JTAG_TDO_o

 // *******************************************************************
 // all "not impedance controlled in package", starting here
 // for powering PLL or can be used for low frequency debug signals
 // NOTE: Driver selected by XTC macro must be updated according to use.

 , input  p_PLL_VDD_i
 , input  p_PLL_VSS_i
 , input  p_PLL_V33_i
 , input  p_PLL_VZZ_i
 );

   // note this is a usually the primary clock for the system
   `XTC_IN (PLL_CLK);
   `XTC_IN (reset);

   `XTC_IN_ABCD (sdi,sclk);
   `XTC_IN_ABCD (sdi,sclk_ex);
   `XTC_IN_ABCD (sdi,ncmd);
   `XTC_OUT_ABCD(sdi,token);
   `XTC_OUT_ABCD(sdi,tkn_ex);
   `XTC_IN_V70  (sdi_A_data);  `XTC_IN_V70 (sdi_B_data); `XTC_IN_V70 (sdi_C_data); `XTC_IN_V70 (sdi_D_data);


   `XTC_OUT_ABCD(sdo,sclk);
   `XTC_OUT_ABCD(sdo,sclk_ex);
   `XTC_OUT_ABCD(sdo,ncmd);
   `XTC_IN_ABCD (sdo,token);
   `XTC_IN_ABCD (sdo,tkn_ex);
   `XTC_OUT_V70 (sdo_A_data);  `XTC_OUT_V70(sdo_B_data); `XTC_OUT_V70(sdo_C_data); `XTC_OUT_V70(sdo_D_data);

   // mbt fixme: note misc wires are all configured to be inputs
   // but some of them are actually slated to be outputs

   `XTC_IN_V70 (misc_L);
   `XTC_IN_V70 (misc_R);

   // note these are not part of the vector as bit number is in name.
   `XTC_IN (misc_T_0);
   `XTC_IN (misc_T_1);
   `XTC_IN (misc_T_2);

   `XTC_OUT(sdo_A_data_8);
   `XTC_OUT(sdo_C_data_8);

   // differential pairs
   `XTC_IN_DIFF(clk_0);
   `XTC_IN_DIFF(clk_1);
   `XTC_IN_DIFF(SMA_in);
   `XTC_OUT_DIFF(SMA_out);

   `XTC_IN(JTAG_TMS);
   `XTC_IN(JTAG_TDI);
   `XTC_IN(JTAG_TCK);
   `XTC_IN(JTAG_TRST);
   `XTC_OUT(JTAG_TDO);

   `XTC_IN(PLL_VDD);
   `XTC_IN(PLL_VSS);

   `XTC_IN(PLL_V33);
   `XTC_IN(PLL_VZZ);

// End UCSD BGA 332 PAD Definitions
// **********************************************************************


