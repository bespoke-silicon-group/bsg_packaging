// MBT 8-17-2016
//
// **********************************************************************
// UCSD BSG Two Pinout (Based on UCSD BGA 332)
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
// bsg_two
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

 , input  p_misc_L_7_i, input  p_misc_R_7_i
 , input  p_misc_L_6_i, input  p_misc_R_6_i
 , input  p_misc_L_5_i, input  p_misc_R_5_i
 , input  p_misc_L_4_i, input  p_misc_R_4_i

 // L3 and R3 are output pads because it works with the pad ring
 , output p_misc_L_3_o, output p_misc_R_3_o

 , input  p_misc_L_2_i, input  p_misc_R_2_i
 , input  p_misc_L_1_i, input  p_misc_R_1_i
 , input  p_misc_L_0_i, input  p_misc_R_0_i

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

// , input  p_PLL_VDD_i
// , input  p_PLL_VSS_i
// , input  p_PLL_V33_i
// , input  p_PLL_VZZ_i
 );

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
   `BSG_IO_IN (PLL_CLK,`BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN (reset,  `BSG_PAD_INPUT_PULLDOWN);

   `BSG_IO_IN_ABCD (sdi,sclk,    `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN_ABCD (sdi,sclk_ex, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN_ABCD (sdi,ncmd,    `BSG_PAD_INPUT_PULLDOWN);

   `BSG_IO_OUT_ABCD(sdi,token,   `BSG_PAD_OUTPUT_A,    `BSG_PAD_OUTPUT_B,    `BSG_PAD_OUTPUT_C,    `BSG_PAD_OUTPUT_D   );
   `BSG_IO_OUT_ABCD(sdi,tkn_ex,  `BSG_PAD_OUTPUT_SLOW, `BSG_PAD_OUTPUT_SLOW, `BSG_PAD_OUTPUT_SLOW, `BSG_PAD_OUTPUT_SLOW);

   `BSG_IO_IN_V70 (sdi_A_data, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN_V70 (sdi_B_data, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN_V70 (sdi_C_data, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN_V70 (sdi_D_data, `BSG_PAD_INPUT_PULLDOWN);


   `BSG_IO_OUT_ABCD(sdo,sclk,     `BSG_PAD_OUTPUT_A, `BSG_PAD_OUTPUT_B, `BSG_PAD_OUTPUT_C, `BSG_PAD_OUTPUT_D);

   // we make these fast because they are used as data for 10-bit channels
   `BSG_IO_OUT_ABCD(sdo,sclk_ex,  `BSG_PAD_OUTPUT_A, `BSG_PAD_OUTPUT_B, `BSG_PAD_OUTPUT_C, `BSG_PAD_OUTPUT_D);
   `BSG_IO_OUT_ABCD(sdo,ncmd,     `BSG_PAD_OUTPUT_A, `BSG_PAD_OUTPUT_B, `BSG_PAD_OUTPUT_C, `BSG_PAD_OUTPUT_D);

   `BSG_IO_IN_ABCD (sdo,token,  `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN_ABCD (sdo,tkn_ex, `BSG_PAD_INPUT_PULLDOWN);

   `BSG_IO_OUT_V70 (sdo_A_data, `BSG_PAD_OUTPUT_A);
   `BSG_IO_OUT_V70 (sdo_B_data, `BSG_PAD_OUTPUT_B);
   `BSG_IO_OUT_V70 (sdo_C_data, `BSG_PAD_OUTPUT_C);
   `BSG_IO_OUT_V70 (sdo_D_data, `BSG_PAD_OUTPUT_D);

    // node L3 and R3 have been chosen as outputs

   `BSG_IO_IN (misc_L_7, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN (misc_L_6, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN (misc_L_5, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN (misc_L_4, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN (misc_L_2, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_OUT(misc_L_3,`BSG_PAD_OUTPUT_SLOW);
   `BSG_IO_IN (misc_L_1, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN (misc_L_0, `BSG_PAD_INPUT_PULLDOWN);

   `BSG_IO_IN (misc_R_7, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN (misc_R_6, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN (misc_R_5, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN (misc_R_4, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_OUT(misc_R_3,`BSG_PAD_OUTPUT_SLOW);
   `BSG_IO_IN (misc_R_2, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN (misc_R_1, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN (misc_R_0, `BSG_PAD_INPUT_PULLDOWN);

   // note these are not part of the vector as bit number is in name.
   `BSG_IO_IN (misc_T_0,`BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN (misc_T_1,`BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN (misc_T_2,`BSG_PAD_INPUT_PULLDOWN);

    // these can be used as fast i/os
   `BSG_IO_OUT(sdo_A_data_8,`BSG_PAD_OUTPUT_A);
   `BSG_IO_OUT(sdo_C_data_8,`BSG_PAD_OUTPUT_C);

   // differential pairs
   `BSG_IO_IN_DIFF_DISABLE (clk_0, `BSG_PAD_DISABLE);
   `BSG_IO_IN_DIFF_DISABLE (clk_1, `BSG_PAD_DISABLE);
   `BSG_IO_IN_DIFF_DISABLE (SMA_in,`BSG_PAD_DISABLE);


    // these are routed as 100 ohms to SMA connector
    // they do not have a differential termination resistor
    // on-board, so they can be driven with normal outputs
    // and used for debug.

   `BSG_IO_OUT(SMA_out_p,`BSG_PAD_OUTPUT_SLOW);
   `BSG_IO_OUT(SMA_out_n,`BSG_PAD_OUTPUT_SLOW);

   // Lutag inputs
   `BSG_IO_IN(JTAG_TMS, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN(JTAG_TDI, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN(JTAG_TCK, `BSG_PAD_INPUT_PULLDOWN);
   `BSG_IO_IN(JTAG_TRST,`BSG_PAD_INPUT_PULLDOWN);

   // debug output
   `BSG_IO_OUT(JTAG_TDO,`BSG_PAD_OUTPUT_SLOW);

   // these are dedicated power pins and should not be
   // instantiated as pins in the verilog
   //
   //`BSG_IO_IN(PLL_VDD);
   //`BSG_IO_IN(PLL_VSS);

   //`BSG_IO_IN(PLL_V33);
   //`BSG_IO_IN(PLL_VZZ);

// End UCSD BGA 332 PAD Definitions
// **********************************************************************


