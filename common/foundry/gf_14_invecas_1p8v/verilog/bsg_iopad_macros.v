
`ifdef BSG_OUTPUTS_NEED_ENABLES
  `define BSG_OUTPUT_ENABLE_WIRE(name) wire name;
  `define BSG_OUTPUT_ENABLE(name) `TX_WITH_ENABLE(name)
`else
  `define BSG_OUTPUT_ENABLE_WIRE(name)
  `define BSG_OUTPUT_ENABLE(name) `TX_MODE
`endif

`define TX_MODE        .RXEN(1'b0),.TRIEN(1'b0)
`define TX_RX_OFF      .RXEN(1'b0),.TRIEN(1'b1)
`define TX_RX_LOOPBACK .RXEN(1'b1),.TRIEN(1'b0)
`define RX_MODE        .RXEN(1'b1),.TRIEN(1'b1)
`define RX_NOT_TX(en)  .RXEN(en),  .TRIEN(en)

// active low enables!
`define TX_WITH_ENABLE(en) .RXEN(1'b0),.TRIEN(en)
`define RX_WITH_ENABLE(en) .RXEN(~en),.TRIEN(1'b1)

`define  LOW_DRIVE  .DRV(2'b00)
`define  MID_DRIVE  .DRV(2'b01)
`define  LRG_DRIVE  .DRV(2'b10)
`define XLRG_DRIVE  .DRV(2'b11)

`define PU_ENABLE     .PUEN(1'b1),.PDEN(1'b0)
`define PD_ENABLE     .PUEN(1'b0),.PDEN(1'b1)
`define PU_PD_DISABLE .PUEN(1'b0),.PDEN(1'b0)

`define ND_TREE .NDIN(1'b0),.NDOUT()

`define PWR_MGMT .PWROK(1'b1),.IOPWROK(1'b1),.RETC(1'b1)

//
// **********************************************************************
//

`define BSG_IO_IN(name,padtype)  \
    wire name``_i_int;           \
    padtype name``_i             \
        ( .PAD  (p_``name``_i)   \
        , .DATA (1'b0)           \
        , .Y    (name``_i_int)   \
        , `RX_MODE               \
        , `XLRG_DRIVE            \
        , `PD_ENABLE             \
        , `ND_TREE               \
        , `PWR_MGMT              \
        );

`define BSG_IO_IN_A(pre,suffix,letter,index,padtype) \
    padtype pre``_``letter``_``suffix``_i            \
        ( .PAD  (p_``pre``_``suffix``_i[index])      \
        , .DATA (1'b0)                               \
        , .Y    (pre``_``suffix``_i_int[index])      \
        , `RX_MODE                                   \
        , `XLRG_DRIVE                                \
        , `PD_ENABLE                                 \
        , `ND_TREE                                   \
        , `PWR_MGMT                                  \
        );

`define BSG_IO_IN_V(name,index,padtype) \
  padtype name``_``index``_i            \
        ( .PAD  (p_``name``_i[index])   \
        , .DATA (1'b0)                  \
        , .Y    (name``_i_int[index])   \
        , `RX_MODE                      \
        , `XLRG_DRIVE                   \
        , `PD_ENABLE                    \
        , `ND_TREE                      \
        , `PWR_MGMT                     \
        );

`define BSG_IO_OUT(name,padtype)             \
    wire name``_o_int;                       \
    `BSG_OUTPUT_ENABLE_WIRE(name``_oen_int)  \
    padtype name``_o                         \
        ( .PAD  (p_``name``_o)               \
        , .DATA (name``_o_int)               \
        , .Y    ()                           \
        , `BSG_OUTPUT_ENABLE(name``_oen_int) \
        , `XLRG_DRIVE                        \
        , `PD_ENABLE                         \
        , `ND_TREE                           \
        , `PWR_MGMT                          \
        );

`define BSG_IO_OUT_A(pre,suffix,letter,num,padtype)         \
  padtype pre``_``letter``_``suffix``_o                     \
        ( .PAD  (p_``pre``_``suffix``_o[num])               \
        , .DATA (pre``_``suffix``_o_int[num])               \
        , .Y    ()                                          \
        , `BSG_OUTPUT_ENABLE(pre``_``suffix``_oen_int[num]) \
        , `XLRG_DRIVE                                       \
        , `PD_ENABLE                                        \
        , `ND_TREE                                          \
        , `PWR_MGMT                                         \
        );

`define BSG_IO_OUT_V(name,index,padtype)              \
     padtype name``_``index``_o                       \
        ( .PAD  (p_``name``_o[index])                 \
        , .DATA (name``_o_int[``index])               \
        , .Y    ()                                    \
        , `BSG_OUTPUT_ENABLE(name``_oen_int[``index]) \
        , `XLRG_DRIVE                                 \
        , `PD_ENABLE                                  \
        , `ND_TREE                                    \
        , `PWR_MGMT                                   \
        );

`define BSG_IO_INOUT(name,padtype)   \
    wire name``_i_int;               \
    wire name``_o_int;               \
    wire name``_oen_int;             \
    padtype name``_io                \
        ( .PAD  (p_``name``_io)      \
        , .DATA (name``_o_int)       \
        , .Y    (name``_i_int)       \
        , `RX_NOT_TX(name``_oen_int) \
        , `XLRG_DRIVE                \
        , `PD_ENABLE                 \
        , `ND_TREE                   \
        , `PWR_MGMT                  \
        );

`define BSG_IO_IN_DISABLE(name,padtype) \
    wire name``_i_int;                  \
    padtype name``_i                    \
        ( .PAD  (p_``name``_i)          \
        , .DATA (1'b0)                  \
        , .Y    (name``_i_int)          \
        , `TX_RX_OFF                    \
        , `XLRG_DRIVE                   \
        , `PD_ENABLE                    \
        , `ND_TREE                      \
        , `PWR_MGMT                     \
        );

`define BSG_IO_OUT_DISABLE(name,padtype) \
    wire name``_o_int;                   \
    padtype name``_o                     \
        ( .PAD  (p_``name``_o)           \
        , .DATA (name``_o_int)           \
        , .Y    ()                       \
        , `TX_RX_OFF                     \
        , `XLRG_DRIVE                    \
        , `PD_ENABLE                     \
        , `ND_TREE                       \
        , `PWR_MGMT                      \
        );

`define BSG_IO_INOUT_DISABLE(name,padtype) \
    wire name``_i_int;                     \
    wire name``_o_int;                     \
    wire name``_oen_int;                   \
    padtype name``_io                      \
        ( .PAD  (p_``name``_io)            \
        , .DATA (name``_o_int)             \
        , .Y    (name``_i_int)             \
        , `TX_RX_OFF                       \
        , `XLRG_DRIVE                      \
        , `PD_ENABLE                       \
        , `ND_TREE                         \
        , `PWR_MGMT                        \
        );

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

// shared macros
`include "bsg_iopad_meta_macros.v"

//
// END TOP LEVEL I/O MACROS (GF 14 nm)
// **********************************************************************

