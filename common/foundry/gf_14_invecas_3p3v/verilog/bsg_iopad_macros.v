
`define TX_MODE        .RXENC(1'b0),.TRIENC(1'b0)
`define TX_RX_OFF      .RXENC(1'b0),.TRIENC(1'b1)
`define TX_RX_LOOPBACK .RXENC(1'b1),.TRIENC(1'b0)
`define RX_MODE        .RXENC(1'b1),.TRIENC(1'b1)
`define RX_NOT_TX(en)  .RXENC(en),  .TRIENC(en)

`define  LOW_DRIVE  .DRV1C(1'b0), .DRV0C(1'b0)
`define  MID_DRIVE  .DRV1C(1'b0), .DRV0C(1'b1)
`define  LRG_DRIVE  .DRV1C(1'b1), .DRV0C(1'b0)
`define XLRG_DRIVE  .DRV1C(1'b1), .DRV0C(1'b1)

`define PU_ENABLE    .PUC(1'b1),.PDC(1'b0)
`define PD_ENABLE    .PUC(1'b0),.PDC(1'b1)
`define PU_PD_DISABLE .PUC(1'b0),.PDC(1'b0)  

`define VREF .VREFN(),.VREFP()

`define ND_TREE .NDIN(1'b0),.NDOUT()

`define SCHMITT_TRIGGER_ENABLE  .SMTC(1'b1)
`define SCHMITT_TRIGGER_DISABLE .SMTC(1'b1)

`define SLEW_RATE_CONTROL_ENABLE  .SRC(1'b1)
`define SLEW_RATE_CONTROL_DISABLE .SRC(1'b0)

`define MODE_3P3V_2P5V .MODE18(1'b0)
`define MODE_1P8V      .MODE18(1'b1)

//
// **********************************************************************
//

`define BSG_IO_IN(name,padtype)      \
    wire name``_i_int;               \
    padtype name``_i                 \
        ( .PAD (p_``name``_i)        \
        , .IPC ()                    \
        , .OUTC(name``_i_int)        \
        , `VREF                      \
        , `SLEW_RATE_CONTROL_DISABLE \
        , `SCHMITT_TRIGGER_DISABLE   \
        , `RX_MODE                   \
        , `MODE_1P8V                 \
        , `LOW_DRIVE                 \
        , `PD_ENABLE                 \
        , `ND_TREE                   \
        );

`define BSG_IO_OUT(name,padtype)     \
    wire name``_o_int;               \
    padtype name``_o                 \
        ( .PAD (p_``name``_o)        \
        , .IPC (name``_o_int)        \
        , .OUTC()                    \
        , `VREF                      \
        , `SLEW_RATE_CONTROL_DISABLE \
        , `SCHMITT_TRIGGER_DISABLE   \
        , `TX_MODE                   \
        , `MODE_1P8V                 \
        , `LOW_DRIVE                 \
        , `PD_ENABLE                 \
        , `ND_TREE                   \
        );

`define BSG_IO_INOUT(name,padtype)   \
    wire name``_i_int;               \
    wire name``_o_int;               \
    wire name``_oen_int;             \
    padtype name``_io                \
        ( .PAD (p_``name``_io)       \
        , .IPC (name``_o_int)        \
        , .OUTC(name``_i_int)        \
        , `VREF                      \
        , `SLEW_RATE_CONTROL_DISABLE \
        , `SCHMITT_TRIGGER_DISABLE   \
        , `RX_NOT_TX(name``_oen_int) \
        , `MODE_1P8V                 \
        , `LOW_DRIVE                 \
        , `PD_ENABLE                 \
        , `ND_TREE                   \
        );

// shared macros
`include "bsg_iopad_meta_macros.v"

//
// END TOP LEVEL I/O MACROS (GF 14 nm)
// **********************************************************************

