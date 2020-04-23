package bsg_iopad_macros_pkg;

////////////////////////////////////////////////////////////
// GPIO IO CELL PIN MACROS
//

`define TX_MODE        .RXEN(1'b0), .TRIEN(1'b0)
`define TX_RX_OFF      .RXEN(1'b0), .TRIEN(1'b1)
`define TX_RX_LOOPBACK .RXEN(1'b1), .TRIEN(1'b0)
`define RX_MODE        .RXEN(1'b1), .TRIEN(1'b1)
`define RX_NOT_TX(en)  .RXEN((en)), .TRIEN((en))

`define TX_MODE_W_DISABLE(D)      .RXEN(1'b0&(~(D))), .TRIEN(1'b0|(D))
`define RX_MODE_W_DISABLE(D)      .RXEN(1'b1&(~(D))), .TRIEN(1'b1|(D))
`define RX_NOT_TX_W_DISABLE(en,D) .RXEN((en)&(~(D))), .TRIEN((en)|(D))

`define  LOW_DRIVE  .DRV(2'b00)
`define  MID_DRIVE  .DRV(2'b01)
`define  LRG_DRIVE  .DRV(2'b10)
`define XLRG_DRIVE  .DRV(2'b11)

`define PU_ENABLE     .PUEN(1'b1),.PDEN(1'b0)
`define PD_ENABLE     .PUEN(1'b0),.PDEN(1'b1)
`define PU_PD_DISABLE .PUEN(1'b0),.PDEN(1'b0)

`define ND_TREE .NDIN(1'b0),.NDOUT()

////////////////////////////////////////////////////////////
// GPIO IO INPUT CELL
//

`define BSG_IO_IN(name,padtype,ctrl)  \
    wire name``_i_int;                \
    padtype name``_i                  \
        ( .PAD(p_``name``_i)          \
        , .DATA()                     \
        , .Y(name``_i_int)            \
        , .PWROK(pwrok_lo[ctrl])      \
        , .IOPWROK(iopwrok_lo[ctrl])  \
        , .RETC(retc_lo[ctrl])        \
        , `RX_MODE                    \
        , `XLRG_DRIVE                 \
        , `PD_ENABLE                  \
        , `ND_TREE                    \
        );

////////////////////////////////////////////////////////////
// GPIO IO OUTPUT CELL
//

`define BSG_IO_OUT(name,padtype,ctrl) \
    wire name``_o_int;                \
    padtype name``_o                  \
        ( .PAD(p_``name``_o)          \
        , .DATA(name``_o_int)         \
        , .Y()                        \
        , .PWROK(pwrok_lo[ctrl])      \
        , .IOPWROK(iopwrok_lo[ctrl])  \
        , .RETC(retc_lo[ctrl])        \
        , `TX_MODE                    \
        , `XLRG_DRIVE                 \
        , `PD_ENABLE                  \
        , `ND_TREE                    \
        );

////////////////////////////////////////////////////////////
// GPIO IO INOUT CELL
//

`define BSG_IO_INOUT(name,padtype,ctrl) \
    wire name``_i_io_int;               \
    wire name``_o_io_int;               \
    wire name``_oen_int;                \
    padtype name``_io                   \
        ( .PAD(p_``name``_io)           \
        , .DATA(name``_o_io_int)        \
        , .Y(name``_i_io_int)           \
        , .PWROK(pwrok_lo[ctrl])        \
        , .IOPWROK(iopwrok_lo[ctrl])    \
        , .RETC(retc_lo[ctrl])          \
        , `RX_NOT_TX(name``_oen_int)    \
        , `XLRG_DRIVE                   \
        , `PD_ENABLE                    \
        , `ND_TREE                      \
        );

////////////////////////////////////////////////////////////
// GPIO IO DISABLED INPUT CELL
//

`define BSG_IO_IN_DISABLE(name,padtype,ctrl)  \
    wire name``_i_int;                        \
    padtype name``_i                          \
        ( .PAD(p_``name``_i)                  \
        , .DATA()                             \
        , .Y(name``_i_int)                    \
        , .PWROK(pwrok_lo[ctrl])              \
        , .IOPWROK(iopwrok_lo[ctrl])          \
        , .RETC(retc_lo[ctrl])                \
        , `TX_RX_OFF                          \
        , `XLRG_DRIVE                         \
        , `PD_ENABLE                          \
        , `ND_TREE                            \
        );

////////////////////////////////////////////////////////////
// GPIO IO DISABLED OUTPUT CELL
//

`define BSG_IO_OUT_DISABLE(name,padtype,ctrl) \
    wire name``_o_int;                        \
    padtype name``_o                          \
        ( .PAD(p_``name``_o)                  \
        , .DATA(name``_o_int)                 \
        , .Y()                                \
        , .PWROK(pwrok_lo[ctrl])              \
        , .IOPWROK(iopwrok_lo[ctrl])          \
        , .RETC(retc_lo[ctrl])                \
        , `TX_RX_OFF                          \
        , `XLRG_DRIVE                         \
        , `PD_ENABLE                          \
        , `ND_TREE                            \
        );

////////////////////////////////////////////////////////////
// GPIO IO DISABLED INOUT CELL
//

`define BSG_IO_INOUT_DISABLE(name,padtype,ctrl) \
    wire name``_i_io_int;                       \
    wire name``_o_io_int;                       \
    wire name``_oen_int;                        \
    padtype name``_io                           \
        ( .PAD(p_``name``_io)                   \
        , .DATA(name``_o_io_int)                \
        , .Y(name``_i_io_int)                   \
        , .PWROK(pwrok_lo[ctrl])                \
        , .IOPWROK(iopwrok_lo[ctrl])            \
        , .RETC(retc_lo[ctrl])                  \
        , `TX_RX_OFF                            \
        , `XLRG_DRIVE                           \
        , `PD_ENABLE                            \
        , `ND_TREE                              \
        );

////////////////////////////////////////////////////////////
// GPIO IO DISABLEABLE VIA PARAMETER INPUT CELL
//

`define BSG_IO_IN_DISABLE_PARAM(name,padtype,ctrl)    \
    wire name``_i_int;                                \
    padtype name``_i                                  \
        ( .PAD(p_``name``_i)                          \
        , .DATA()                                     \
        , .Y(name``_i_int)                            \
        , .PWROK(pwrok_lo[ctrl])                      \
        , .IOPWROK(iopwrok_lo[ctrl])                  \
        , .RETC(retc_lo[ctrl])                        \
        , `RX_MODE_W_DISABLE(disable_``name``_i == 1) \
        , `XLRG_DRIVE                                 \
        , `PD_ENABLE                                  \
        , `ND_TREE                                    \
        );

////////////////////////////////////////////////////////////
// GPIO IO DISABLEABLE VIA PARAMETER OUTPUT CELL
//

`define BSG_IO_OUT_DISABLE_PARAM(name,padtype,ctrl)   \
    wire name``_o_int;                                \
    padtype name``_o                                  \
        ( .PAD(p_``name``_o)                          \
        , .DATA(name``_o_int)                         \
        , .Y()                                        \
        , .PWROK(pwrok_lo[ctrl])                      \
        , .IOPWROK(iopwrok_lo[ctrl])                  \
        , .RETC(retc_lo[ctrl])                        \
        , `TX_MODE_W_DISABLE(disable_``name``_o == 1) \
        , `XLRG_DRIVE                                 \
        , `PD_ENABLE                                  \
        , `ND_TREE                                    \
        );

////////////////////////////////////////////////////////////
// GPIO IO DISABLEABLE VIA PARAMETER INOUT CELL
//

`define BSG_IO_INOUT_DISABLE_PARAM(name,padtype,ctrl)                   \
    wire name``_i_io_int;                                               \
    wire name``_o_io_int;                                               \
    wire name``_oen_int;                                                \
    padtype name``_io                                                   \
        ( .PAD(p_``name``_io)                                           \
        , .DATA(name``_o_io_int)                                        \
        , .Y(name``_i_io_int)                                           \
        , .PWROK(pwrok_lo[ctrl])                                        \
        , .IOPWROK(iopwrok_lo[ctrl])                                    \
        , .RETC(retc_lo[ctrl])                                          \
        , `RX_NOT_TX_W_DISABLE(name``_oen_int,disable_``name``_io == 1) \
        , `XLRG_DRIVE                                                   \
        , `PD_ENABLE                                                    \
        , `ND_TREE                                                      \
        );

////////////////////////////////////////////////////////////
// PHYSICAL ONLY GPIO (NO LOGIC) --> GOOD FOR SUPPLY CELLS
//

`define BSG_PHYSICAL_ONLY_PAD(name,padtype,ctrl) \
    padtype name                                 \
        ( .PWROK(pwrok_lo[ctrl])                 \
        , .IOPWROK(iopwrok_lo[ctrl])             \
        , .RETC(retc_lo[ctrl])                   \
        );

////////////////////////////////////////////////////////////
// BREAKER CELLS --> ALL BREAKERS USE THE SAME PORTS
//

`define BSG_BREAKER_PAD(name,padtype,ctrlb,ctrla) \
    padtype name                                  \
        ( .PWROKA(pwrok_lo[ctrla])                \
        , .IOPWROKA(iopwrok_lo[ctrla])            \
        , .RETCA(retc_lo[ctrla])                  \
        , .PWROKB(pwrok_lo[ctrlb])                \
        , .IOPWROKB(iopwrok_lo[ctrlb])            \
        , .RETCB(retc_lo[ctrlb])                  \
        );

////////////////////////////////////////////////////////////
// POWER CONTROL PAD --> DRIVES CONTROL SIGNALS IN PADRING
//

`define BSG_POWER_CONTROL_PAD(name,padtype,ctrl) \
    padtype name                                 \
        ( .PWROKOUT(pwrok_lo[ctrl])              \
        , .IOPWROKOUT(iopwrok_lo[ctrl])          \
        , .RETCOUT(retc_lo[ctrl])                \
        , .RETCIN(1'b0)                          \
        );

// shared macros
`include "bsg_iopad_meta_macros.v"

//
// END TOP LEVEL I/O MACROS (GF 14 nm)
// **********************************************************************

endpackage // bsg_iopad_macros_pkg
