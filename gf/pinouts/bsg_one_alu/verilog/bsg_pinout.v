// NRGH: 2014-12-08
//
// **********************************************************************
// UCSD GF28 Pinout
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
    ( input  p_reset_i

    , input  [3:0] p_sdi_sclk_i
    , input  [3:0] p_sdi_ncmd_i
    , output [3:0] p_sdi_token_o

    , input  [7:0] p_sdi_A_data_i, input [7:0] p_sdi_B_data_i
    , input  [7:0] p_sdi_C_data_i, input [7:0] p_sdi_D_data_i

    , output [3:0] p_sdo_sclk_o
    , output [3:0] p_sdo_ncmd_o
    , input  [3:0] p_sdo_token_i

    , output [7:0] p_sdo_A_data_o, output [7:0] p_sdo_B_data_o
    , output [7:0] p_sdo_C_data_o, output [7:0] p_sdo_D_data_o

    , input  p_JTAG_TMS_i
    , input  p_JTAG_TDI_i
    , input  p_JTAG_TCK_i
    , input  p_JTAG_TRST_i
    , output p_JTAG_TDO_o

    // NRGH: Added these pads to match GF28 package:
    //       (all except p_clk_i and p_sdo_master_clk_i are still unused)
    , input p_PANALOG18_PLL_agndhf_ai
    , input p_PANALOG18_PLL_refclk_ai
    , input p_PANALOG18_PLL_guard_ai
    , input p_spare_1_i
    , input p_clk90_i
    , input p_clk_i
    , input p_spare_2_i
    , input p_spare_3_i
    , input p_sdo_master_clk_i
    , input p_spare_4_i
    , input p_pll_refclkbyp_i
    , input p_pll_reset_i
    , input p_spare_12_i
    , output p_spare_5_o
    , output p_spare_7_o
    , output p_spare_9_o
    , output p_spare_6_o
    , output p_spare_8_o
    , output p_spare_10_o
    , output p_spare_11_o
    , output p_PLL_clk_o
    , output p_spare_13_o
    );

    // NRGH: Added for driving RTO/SNS rings
    `XTC_DVDDTIE(V33TIE_17,o);
    `XTC_DVDDTIE(V33TIE_18_UNBONDED,i);

   `XTC_IN (reset);

   `XTC_IN_ABCD (sdi,sclk);
   `XTC_IN_ABCD (sdi,ncmd);
   `XTC_OUT_ABCD(sdi,token);
   `XTC_IN_V70  (sdi_A_data);  `XTC_IN_V70 (sdi_B_data); `XTC_IN_V70 (sdi_C_data); `XTC_IN_V70 (sdi_D_data);


   `XTC_OUT_ABCD(sdo,sclk);
   `XTC_OUT_ABCD(sdo,ncmd);
   `XTC_IN_ABCD (sdo,token);
   `XTC_OUT_V70 (sdo_A_data);  `XTC_OUT_V70(sdo_B_data); `XTC_OUT_V70(sdo_C_data); `XTC_OUT_V70(sdo_D_data);


   `XTC_IN(JTAG_TMS);
   `XTC_IN(JTAG_TDI);
   `XTC_IN(JTAG_TCK);
   `XTC_IN(JTAG_TRST);
   `XTC_OUT(JTAG_TDO);


    // NRGH: Added these pads to match GF28 package:
    //       (all except p_clk_i are still unused)
    `XTC_AIN(PANALOG18_PLL_agndhf);
    `XTC_AIN(PANALOG18_PLL_refclk);
    `XTC_AIN(PANALOG18_PLL_guard);
    `XTC_IN(spare_1);
    `XTC_IN(clk90);
    `XTC_IN(clk);
    `XTC_IN(spare_2);
    `XTC_IN(spare_3);
    `XTC_IN(sdo_master_clk);
    `XTC_IN(spare_4);
    `XTC_IN(pll_refclkbyp);
    `XTC_IN(pll_reset);
    `XTC_IN(spare_12);
    `XTC_OUT(spare_5);
    `XTC_OUT(spare_7);
    `XTC_OUT(spare_9);
    `XTC_OUT(spare_6);
    `XTC_OUT(spare_8);
    `XTC_OUT(spare_10);
    `XTC_OUT(spare_11);
    `XTC_OUT(PLL_clk);
    `XTC_OUT(spare_13);

// End UCSD GF28 PAD Definitions
// **********************************************************************

