
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

 //LDO DIGITAL DOMAIN
 //NEED TO FIND AND REMOVE THE ONES BELOW IF THEY CAUSE VIOLATIONS FROM BEING ON THE RING STILL AND UNCONNECTED
 //misc_R_1_i_int, misc_R_2_i_int, misc_R_4_i_int, SMA_in_p_i_int, sdi_sclk_ex_i_int[0], SMA_in_n_i_int, JTAG_TDI_i_int, clk_0_p_i_int)
//sdo_sclk_ex_o, sdi_tkn_ex_o, SMA_out_p_o, SMA_out_n_o, JTAG_TDO_o
   output p_LDO_CLKOV64_o, output p_LDO_ENH_o, output p_LDO_ENHH_o, output p_LDO_ENL_o, output p_LDO_ENLL_o
 , input p_LDO_EXT_SAM_i, input p_LDO_CLK_LOAD_i, input p_LDO_CLK_REF_i, input p_LDO_RSTIN_i
 , input p_LDO_SPI_CLK_i, input p_LDO_SPI_IN_i, input p_LDO_SPI_RST_i
 // , input p_LDO_PLL_i

//LDO ANALOG DOMAIN
 , input  p_LDO_SECTION_VREFH_i, input p_LDO_SECTION_VREFL_i, input p_LDO_SECTION_VB_RING_i
 , input  p_LDO_SECTION_VCAL_HH_i, input  p_LDO_SECTION_VCAL_LL_i, input  p_LDO_SECTION_VL_i
 , input  p_LDO_SECTION_VDD_LOAD_i
 // , input  p_LDO_SECTION_VDDIO_i, input  p_LDO_SECTION_VDDC_i

//PLL DOMIN
 , input  p_PLL_SECTION_1_REF_i, input  p_PLL_SECTION_2_REF_i, input  p_PLL_SECTION_3_REF_i
 , input  p_PLL_SECTION_1_RST_i, input  p_PLL_SECTION_2_RST_i, input  p_PLL_SECTION_3_RST_i
 , output p_PLL_SECTION_1_TST_o ,output p_PLL_SECTION_2_TST_o, output p_PLL_SECTION_3_TST_o

//PLL Digital signals
 , input p_PLL_SCLK_i
 , input p_PLL_1_CS_i, input p_PLL_2_CS_i, input p_PLL_3_CS_i
 , input p_PLL_1_SDI_i, input p_PLL_2_SDI_i, input p_PLL_3_SDI_i
 , output p_PLL_1_SDO_o, output p_PLL_2_SDO_o, output p_PLL_3_SDO_o

 , input p_PLL_1_CLK_BKP_i, input p_PLL_2_CLK_BKP_i, input p_PLL_3_CLK_BKP_i
 , input p_PLL_1_CLK_SEL_i, input p_PLL_2_CLK_SEL_i, input p_PLL_3_CLK_SEL_i

 // unused differential inputs
 // we give these as outputs, and then go high-impedance
 // , output p_clk_0_p_i    , output  p_clk_0_n_i
 // , output  p_clk_1_p_i    , output  p_clk_1_n_i

 // unused differential inputs
 // we give these as outputs, and then go high-impedance
 // , output  p_SMA_in_p_i   , output p_SMA_in_n_i

 // , output p_SMA_out_p_o  , output p_SMA_out_n_o

 // *******************************************************************
 // ultra-shielded "50-ohm impedance-controlled-in-package" clock for PLL


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
 //, output p_sdo_A_data_8_o , output p_sdo_C_data_8_o

 // input tokens for output channels
 , input  [3:0] p_sdo_token_i

 // spare clocks, length matched to channels
 // , input  [3:0] p_sdi_sclk_ex_i
 // , output [3:0] p_sdo_sclk_ex_o

 // spare tokens for input and output channels
 // , output [3:0] p_sdi_tkn_ex_o
 // , input  [3:0] p_sdo_tkn_ex_i

 // *******************************************************************
 // all "50-ohm impedance-controlled-in-package", starting here
 // but are next to clock or token signals
 // and are not length-matched

 // , input  p_misc_R_4_i
 // , input p_misc_R_5_i
 // , input  p_misc_L_6_i
 // , input  p_misc_R_6_i

 // L3 and R3 are output pads because it works with the pad ring
 // , output p_misc_L_3_o
 // , output p_misc_R_3_o

 // , input  p_misc_L_2_i
 // , input  p_misc_R_2_i
 // , input  p_misc_L_1_i
 // , input  p_misc_R_1_i

 // , input p_misc_L_7_i
 // , input p_misc_L_6_i
 // , input p_misc_L_5_i
 // , input p_misc_L_4_i
 // , input p_misc_R_0_i
 // , input p_misc_R_1_i

 , input  p_reset_i

 // for JTAG, or other purposes
 // , input  p_JTAG_TDI_i
 // , input  p_JTAG_TCK_i
 // , output p_JTAG_TDO_o

 // *******************************************************************
 // all "not impedance controlled in package", starting here
 // for powering PLL or can be used for low frequency debug signals
 // NOTE: Driver selected by XTC macro must be updated according to use.

// , input  p_PLLVDD_i
// , input  p_PLL_VSS_i
// , input  p_PLL_V33_i
// , input  p_PLL_VZZ_i
 );

// End UCSD BGA 332 PAD Definitions
// **********************************************************************

