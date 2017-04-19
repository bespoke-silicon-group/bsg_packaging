
// *****************************************************************************
// BEGIN TOP LEVEL I/O MACROS : BSG TWO (TSMC 16 nm)
//
// these macros define the PAD instantiations for general I/Os
// these macros will often be defined on a per-process basis,
// as the interfaces for the I/O macros change across generations.
//

// BIDIR Pad Port Definitions
//  OE  -- output enable (active high)
//  A   -- data from core to pad
//  IE  -- input enable (active high)
//  IS  -- input select (0: cmos, 1: schmitt)
//  Y   -- data from pad to core
//  PE  -- weak pull enable (active high)
//  PS  -- pull select (0: pull down, 1: pull high)
//  PAD -- external pad...
//  SNS -- sense input pin (0: output tri-state, 1: output normal)
//  SR  -- slew rate (0: fast, 1: slow)
//  DS0 -- output drive select
//  DS1 -- output drive select
//                   DS0 | DS1 | Ouput Drive
//                  -----+-----+-------------
//                    0  |  0  |     2mA
//                    0  |  1  |     4mA
//                    1  |  0  |     8mA
//                    1  |  1  |    12mA
//  PO  -- parametric inverted data (pad to core)
//  POE -- parametric output enable

// *****************************************************************************
//
//  OUTPUT PAD PARAMETERIZATION
//

// Set ouput drive strength to 2mA
//`define OUTPUT_DRIVE_SELECT_0   1'b0
//`define OUTPUT_DRIVE_SELECT_1   1'b0

// Set ouput drive strength to 4mA
//`define OUTPUT_DRIVE_SELECT_0   1'b0
//`define OUTPUT_DRIVE_SELECT_1   1'b1

// Set ouput drive strength to 8mA
//`define OUTPUT_DRIVE_SELECT_0   1'b1
//`define OUTPUT_DRIVE_SELECT_1   1'b0

// Set ouput drive strength to 12mA
`define OUTPUT_DRIVE_SELECT_0   1'b1
`define OUTPUT_DRIVE_SELECT_1   1'b1

// Set slew rate (0 = fast, 1 = slow)
`define OUTPUT_SLEW_RATE   1'b0

//50-Ohm variant
`define ANALOG_PAD_50(pad,a) \
   .PAD(pad),                      \
   .PADR2(a),                      \
   .SNS(1'b1),                     \
   .RTO(1'b1)

//500-Ohm variant
`define ANALOG_PAD_500(pad,a) \
   .PAD(pad),                      \
   .PADR1(a),                      \
   .SNS(1'b1),                     \
   .RTO(1'b1)


`define BIDIR_PAD_OUTPUT_ENABLED(pad,a) \
    .OE(1'b1),                    \
    .A(a),                        \
    .IE(1'b0),                    \
    .IS(1'b0),                    \
    .Y(),                         \
    .PE(1'b0),                    \
    .PS(1'b0),                    \
    .PAD(pad),                    \
    .SNS(1'b1),                   \
    .SR(`OUTPUT_SLEW_RATE),       \
    .DS0(`OUTPUT_DRIVE_SELECT_0), \
    .DS1(`OUTPUT_DRIVE_SELECT_1), \
    .PO(),                        \
    .POE(1'b0),                   \
    .RTO(1'b1)

`define BIDIR_PAD_OUTPUT_DISABLE_HI_Z(pad,a) \
    .OE(1'b0),                    \
    .A(a),                        \
    .IE(1'b0),                    \
    .IS(1'b0),                    \
    .Y(),                         \
    .PE(1'b0),                    \
    .PS(1'b0),                    \
    .PAD(pad),                    \
    .SNS(1'b1),                   \
    .SR(`OUTPUT_SLEW_RATE),       \
    .DS0(`OUTPUT_DRIVE_SELECT_0), \
    .DS1(`OUTPUT_DRIVE_SELECT_1), \
    .PO(),                        \
    .POE(1'b0),                   \
    .RTO(1'b1)

`define BIDIR_PAD_OUTPUT_DISABLE_PULL_DOWN(pad,a) \
    .OE(1'b0),                    \
    .A(a),                        \
    .IE(1'b0),                    \
    .IS(1'b0),                    \
    .Y(),                         \
    .PE(1'b1),                    \
    .PS(1'b0),                    \
    .PAD(pad),                    \
    .SNS(1'b1),                   \
    .SR(`OUTPUT_SLEW_RATE),       \
    .DS0(`OUTPUT_DRIVE_SELECT_0), \
    .DS1(`OUTPUT_DRIVE_SELECT_1), \
    .PO(),                        \
    .POE(1'b0),                   \
    .RTO(1'b1)

`define BIDIR_PAD_OUTPUT_DISABLE_PULL_UP(pad,a) \
    .OE(1'b0),                    \
    .A(a),                        \
    .IE(1'b0),                    \
    .IS(1'b0),                    \
    .Y(),                         \
    .PE(1'b1),                    \
    .PS(1'b1),                    \
    .PAD(pad),                    \
    .SNS(1'b1),                   \
    .SR(`OUTPUT_SLEW_RATE),       \
    .DS0(`OUTPUT_DRIVE_SELECT_0), \
    .DS1(`OUTPUT_DRIVE_SELECT_1), \
    .PO(),                        \
    .POE(1'b0),                   \
    .RTO(1'b1)

// *****************************************************************************
//
//  INPUT PAD PARAMETERIZATION
//

// Set the input trigger type (0: normal cmos, 1: schmitt trigger)
`define INPUT_TRIGGER_SELECT   1'b0

`define BIDIR_PAD_INPUT_ENABLE(pad,y) \
    .OE(1'b0),                  \
    .A(1'b0),                   \
    .IE(1'b1),                  \
    .IS(`INPUT_TRIGGER_SELECT), \
    .Y(y),                      \
    .PE(1'b0),                  \
    .PS(1'b0),                  \
    .PAD(pad),                  \
    .SNS(1'b1),                 \
    .SR(1'b0),                  \
    .DS0(1'b0),                 \
    .DS1(1'b0),                 \
    .PO(),                      \
    .POE(1'b0),                 \
    .RTO(1'b1)

`define BIDIR_PAD_INPUT_ENABLE_PULL_DOWN(pad,y) \
    .OE(1'b0),                  \
    .A(1'b0),                   \
    .IE(1'b1),                  \
    .IS(`INPUT_TRIGGER_SELECT), \
    .Y(y),                      \
    .PE(1'b1),                  \
    .PS(1'b0),                  \
    .PAD(pad),                  \
    .SNS(1'b1),                 \
    .SR(1'b0),                  \
    .DS0(1'b0),                 \
    .DS1(1'b0),                 \
    .PO(),                      \
    .POE(1'b0),                 \
    .RTO(1'b1)

`define BIDIR_PAD_INPUT_ENABLE_PULL_UP(pad,y) \
    .OE(1'b0),                  \
    .A(1'b0),                   \
    .IE(1'b1),                  \
    .IS(`INPUT_TRIGGER_SELECT), \
    .Y(y),                      \
    .PE(1'b1),                  \
    .PS(1'b1),                  \
    .PAD(pad),                  \
    .SNS(1'b1),                 \
    .SR(1'b0),                  \
    .DS0(1'b0),                 \
    .DS1(1'b0),                 \
    .PO(),                      \
    .POE(1'b0),                 \
    .RTO(1'b1)

`define BIDIR_PAD_INPUT_DISABLE(pad,y) \
    .OE(1'b0),                  \
    .A(1'b0),                   \
    .IE(1'b1),                  \
    .IS(`INPUT_TRIGGER_SELECT), \
    .Y(y),                      \
    .PE(1'b0),                  \
    .PS(1'b0),                  \
    .PAD(pad),                  \
    .SNS(1'b1),                 \
    .SR(1'b0),                  \
    .DS0(1'b0),                 \
    .DS1(1'b0),                 \
    .PO(),                      \
    .POE(1'b0),                 \
    .RTO(1'b1)

// *****************************************************************************
//
// Begin Tie Cell Definitions
//

`define BSG_IO_TIEHI(name) \
    bsg_tiehi #(.width_p(1)) name``tiehi (.o(name));

`define BSG_IO_TIELO(name) \
    bsg_tielo #(.width_p(1)) name``tielo (.o(name));

`define BSG_IO_TIELO_VEC_ONE(name,item) \
    bsg_tielo #(.width_p(1)) name``_``_item``tielo (.o(name[item]));

`define BSG_IO_TIEHI_VEC_ONE(name,item) \
    bsg_tiehi #(.width_p(1)) name``_``_item``tiehi (.o(name[item]));

`define BSG_IO_TIEHI_VEC(name,width)               \
    for (i=0; i < width; i=i+1)                    \
      begin: tiehi_``name                          \
        bsg_tiehi #(.width_p(1)) hi (.o(name[i])); \
      end
`define BSG_IO_TIELO_VEC(name,width)               \
    for (i=0; i < width; i=i+1)                    \
      begin: tielo_``name                          \
        bsg_tielo #(.width_p(1)) lo (.o(name[i])); \
      end

// *****************************************************************************
//
// Begin IO Input Definitions
//

`define BSG_IO_IN_DISABLE(name,padtype) \
    wire name``_tlo;                    \
    `BSG_IO_TIELO(name``_tlo)           \
    padtype name``_i (`BIDIR_PAD_INPUT_DISABLE(p_``name``_i, name``_tlo));

`define BSG_IO_IN_DIFF_DISABLE(name,padtype) \
    `BSG_IO_IN_DISABLE(name``_p,padtype)     \
    `BSG_IO_IN_DISABLE(name``_n,padtype)

`define BSG_IO_IN(name,padtype) \
    wire name``_i_int;          \
    padtype name``_i (`BIDIR_PAD_INPUT_ENABLE(p_``name``_i, name``_i_int));

`define BSG_IO_IN_A(pre,suffix,letter,index,padtype) \
    padtype pre``_``letter``_``suffix``_i (`BIDIR_PAD_INPUT_ENABLE(p_``pre``_``suffix``_i[index], pre``_``suffix``_i_int[index]));

`define BSG_IO_IN_V(name,index,padtype) \
    padtype name``_``index``_i (`BIDIR_PAD_INPUT_ENABLE(p_``name``_i[index], name``_i_int[index]));

`define BSG_ANALOG_PAD(name,padtype) \
    wire name``_i_int;          \
    padtype name``_i (`ANALOG_PAD_500(p_``name``_i, name``_i_int));


// *****************************************************************************
//
// Begin IO Input Definitions
//

`define BSG_IO_OUT(name,padtype) \
    wire name``_o_int;           \
    padtype name``_o (`BIDIR_PAD_OUTPUT_ENABLED(p_``name``_o, name``_o_int));

`define BSG_IO_OUT_V(name,index,padtype) \
    padtype name``_``index``_o (`BIDIR_PAD_OUTPUT_ENABLED(p_``name``_o[index], name``_o_int[``index]));

`define BSG_IO_OUT_A(pre,suffix,letter,num,padtype) \
    padtype pre``_``letter``_``suffix``_o (`BIDIR_PAD_OUTPUT_ENABLED(p_``pre``_``suffix``_o[num], pre``_``suffix``_o_int[num]));

// *****************************************************************************
//
// Begin Physical Only Definitions
//
`define BSG_PHYSICAL_ONLY_PAD(name,padtype) \
    padtype name ();


// *****************************************************************************
//
// Source Shared Macros
//
`include "bsg_iopad_meta_macros.v"

//
// END TOP LEVEL I/O MACROS (16 nm)
//
// *****************************************************************************
