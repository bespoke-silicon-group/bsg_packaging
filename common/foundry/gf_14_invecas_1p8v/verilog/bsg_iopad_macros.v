
`define TX_MODE        .RXEN(1'b0),.TRIEN(1'b0)
`define TX_RX_OFF      .RXEN(1'b0),.TRIEN(1'b1)
`define TX_RX_LOOPBACK .RXEN(1'b1),.TRIEN(1'b0)
`define RX_MODE        .RXEN(1'b1),.TRIEN(1'b1)
`define RX_NOT_TX(en)  .RXEN(en),  .TRIEN(en)

`define  LOW_DRIVE  .DRV(2'b00)
`define  MID_DRIVE  .DRV(2'b01)
`define  LRG_DRIVE  .DRV(2'b10)
`define XLRG_DRIVE  .DRV(2'b11)

`define PU_ENABLE     .PUEN(1'b1),.PDEN(1'b0)
`define PD_ENABLE     .PUEN(1'b0),.PDEN(1'b1)
`define PU_PD_DISABLE .PUEN(1'b0),.PDEN(1'b0)

`define ND_TREE .NDIN(1'b0),.NDOUT()

//
// **********************************************************************
//

`define BSG_IO_IN(name,padtype)  \
    wire name``_i_int;           \
    padtype name``_i             \
        ( .PAD  (p_``name``_i)   \
        , .DATA ()               \
        , .Y    (name``_i_int)   \
        , .PWROK(1'b1)           \
        , .IOPWROK(1'b1)         \
        , .RETC(1'b1)            \
        , `RX_MODE               \
        , `XLRG_DRIVE            \
        , `PD_ENABLE             \
        , `ND_TREE               \
        );

`define BSG_IO_OUT(name,padtype) \
    wire name``_o_int;           \
    padtype name``_o             \
        ( .PAD  (p_``name``_o)   \
        , .DATA (name``_o_int)   \
        , .Y    ()               \
        , .PWROK(1'b1)           \
        , .IOPWROK(1'b1)         \
        , .RETC(1'b1)            \
        , `TX_MODE               \
        , `XLRG_DRIVE            \
        , `PD_ENABLE             \
        , `ND_TREE               \
        );

`define BSG_IO_INOUT(name,padtype)   \
    wire name``_i_int;               \
    wire name``_o_int;               \
    wire name``_oen_int;             \
    padtype name``_io                \
        ( .PAD  (p_``name``_io)      \
        , .DATA (name``_o_int)       \
        , .Y    (name``_i_int)       \
        , .PWROK(1'b1)               \
        , .IOPWROK(1'b1)             \
        , .RETC(1'b1)                \
        , `RX_NOT_TX(name``_oen_int) \
        , `XLRG_DRIVE                \
        , `PD_ENABLE                 \
        , `ND_TREE                   \
        );

`define BSG_IO_IN_DISABLE(name,padtype) \
    wire name``_i_int;                  \
    padtype name``_i                    \
        ( .PAD  (p_``name``_i)          \
        , .DATA ()                      \
        , .Y    (name``_i_int)          \
        , .PWROK(1'b1)                  \
        , .IOPWROK(1'b1)                \
        , .RETC(1'b1)                   \
        , `TX_RX_OFF                    \
        , `XLRG_DRIVE                   \
        , `PD_ENABLE                    \
        , `ND_TREE                      \
        );

`define BSG_IO_OUT_DISABLE(name,padtype) \
    wire name``_o_int;                   \
    padtype name``_o                     \
        ( .PAD  (p_``name``_o)           \
        , .DATA (name``_o_int)           \
        , .Y    ()                       \
        , .PWROK(1'b1)                   \
        , .IOPWROK(1'b1)                 \
        , .RETC(1'b1)                    \
        , `TX_RX_OFF                     \
        , `XLRG_DRIVE                    \
        , `PD_ENABLE                     \
        , `ND_TREE                       \
        );

`define BSG_IO_INOUT_DISABLE(name,padtype) \
    wire name``_i_int;                     \
    wire name``_o_int;                     \
    wire name``_oen_int;                   \
    padtype name``_io                      \
        ( .PAD  (p_``name``_io)            \
        , .DATA (name``_o_int)             \
        , .Y    (name``_i_int)             \
        , .PWROK(1'b1)                     \
        , .IOPWROK(1'b1)                   \
        , .RETC(1'b1)                      \
        , `TX_RX_OFF                       \
        , `XLRG_DRIVE                      \
        , `PD_ENABLE                       \
        , `ND_TREE                         \
        );

// shared macros
`include "bsg_iopad_meta_macros.v"

//
// END TOP LEVEL I/O MACROS (GF 14 nm)
// **********************************************************************

