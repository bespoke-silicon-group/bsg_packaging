
`ifdef BSG_OUTPUTS_NEED_ENABLES
  `define BSG_OUTPUT_ENABLE_WIRE(name)        wire name;
  `define BSG_OUTPUT_ENABLE(pre,name)         `TX_WITH_ENABLE(pre,name)
  `define BSG_OUTPUT_ENABLE_V(pre,idx,name)   `TX_WITH_ENABLE_V(pre,idx,name)
`else
  `define BSG_OUTPUT_ENABLE_WIRE(name)
  `define BSG_OUTPUT_ENABLE(pre,name)         `TX_MODE(pre)
  `define BSG_OUTPUT_ENABLE_V(pre,idx,name)   `TX_MODE_V(pre,idx)
`endif

`ifdef BSG_USE_TIE_NETS
  `define BSG_TIE_NETS(pre)   wire pre``_thi, pre``_tlo;
  `define BSG_THI(pre)        pre``_thi
  `define BSG_TLO(pre)        pre``_tlo
  `define BSG_THI_V(pre,idx)  pre``_thi[idx]
  `define BSG_TLO_V(pre,idx)  pre``_tlo[idx]
`else
  `define BSG_TIE_NETS(pre)
  `define BSG_THI(pre)        1'b1
  `define BSG_TLO(pre)        1'b0
  `define BSG_THI_V(pre,idx)  1'b1
  `define BSG_TLO_V(pre,idx)  1'b0
`endif

// BSG-STD: these get re-assigned in the backend, no need to put them on the thi/tlo nets
`define PWR_MGMT .PWROK(1'b1), .IOPWROK(1'b1), .RETC(1'b1)

// ===========================
// Normal Macros
// ===========================

`define TX_MODE(pre)            .RXEN(`BSG_TLO(pre) /* 1'b0 */), .TRIEN(`BSG_TLO(pre) /* 1'b0 */)
`define TX_RX_OFF(pre)          .RXEN(`BSG_TLO(pre) /* 1'b0 */), .TRIEN(`BSG_THI(pre) /* 1'b1 */)
`define TX_RX_LOOPBACK(pre)     .RXEN(`BSG_THI(pre) /* 1'b1 */), .TRIEN(`BSG_TLO(pre) /* 1'b0 */)
`define RX_MODE(pre)            .RXEN(`BSG_THI(pre) /* 1'b1 */), .TRIEN(`BSG_THI(pre) /* 1'b1 */)
`define RX_NOT_TX(en)           .RXEN(en),                       .TRIEN(en)

// active low enables!
`define TX_WITH_ENABLE(pre,en)  .TRIEN(en), .RXEN(`BSG_TLO(pre)  /* 1'b0 */)
`define RX_WITH_ENABLE(pre,en)  .RXEN(~en), .TRIEN(`BSG_THI(pre) /* 1'b1 */)

`define  LOW_DRIVE(pre)         .DRV({`BSG_TLO(pre), `BSG_TLO(pre)} /* 2'b00 */)
`define  MID_DRIVE(pre)         .DRV({`BSG_TLO(pre), `BSG_THI(pre)} /* 2'b01 */)
`define  LRG_DRIVE(pre)         .DRV({`BSG_THI(pre), `BSG_TLO(pre)} /* 2'b10 */)
`define XLRG_DRIVE(pre)         .DRV({`BSG_THI(pre), `BSG_THI(pre)} /* 2'b11 */)

`define PU_ENABLE(pre)          .PUEN(`BSG_THI(pre) /* 1'b1 */), .PDEN(`BSG_TLO(pre) /* 1'b0 */)
`define PD_ENABLE(pre)          .PUEN(`BSG_TLO(pre) /* 1'b0 */), .PDEN(`BSG_THI(pre) /* 1'b1 */)
`define PU_PD_DISABLE(pre)      .PUEN(`BSG_TLO(pre) /* 1'b0 */), .PDEN(`BSG_TLO(pre) /* 1'b0 */)

`define ND_TREE(pre)            .NDIN(`BSG_TLO(pre) /* 1'b0 */), .NDOUT()

// ===========================
// Indexed (_V) Macros
// ===========================

`define TX_MODE_V(pre,idx)            .RXEN(`BSG_TLO_V(pre,idx) /* 1'b0 */), .TRIEN(`BSG_TLO_V(pre,idx) /* 1'b0 */)
`define TX_RX_OFF_V(pre,idx)          .RXEN(`BSG_TLO_V(pre,idx) /* 1'b0 */), .TRIEN(`BSG_THI_V(pre,idx) /* 1'b1 */)
`define TX_RX_LOOPBACK_V(pre,idx)     .RXEN(`BSG_THI_V(pre,idx) /* 1'b1 */), .TRIEN(`BSG_TLO_V(pre,idx) /* 1'b0 */)
`define RX_MODE_V(pre,idx)            .RXEN(`BSG_THI_V(pre,idx) /* 1'b1 */), .TRIEN(`BSG_THI_V(pre,idx) /* 1'b1 */)
`define RX_NOT_TX_V(en)               .RXEN(en),                             .TRIEN(en)

// active low enables!
`define TX_WITH_ENABLE_V(pre,idx,en)  .TRIEN(en), .RXEN(`BSG_TLO_V(pre,idx)  /* 1'b0 */)
`define RX_WITH_ENABLE_V(pre,idx,en)  .RXEN(~en), .TRIEN(`BSG_THI_V(pre,idx) /* 1'b1 */)

`define  LOW_DRIVE_V(pre,idx)         .DRV({`BSG_TLO_V(pre,idx), `BSG_TLO_V(pre,idx)} /* 2'b00 */)
`define  MID_DRIVE_V(pre,idx)         .DRV({`BSG_TLO_V(pre,idx), `BSG_THI_V(pre,idx)} /* 2'b01 */)
`define  LRG_DRIVE_V(pre,idx)         .DRV({`BSG_THI_V(pre,idx), `BSG_TLO_V(pre,idx)} /* 2'b10 */)
`define XLRG_DRIVE_V(pre,idx)         .DRV({`BSG_THI_V(pre,idx), `BSG_THI_V(pre,idx)} /* 2'b11 */)

`define PU_ENABLE_V(pre,idx)          .PUEN(`BSG_THI_V(pre,idx) /* 1'b1 */), .PDEN(`BSG_TLO_V(pre,idx) /* 1'b0 */)
`define PD_ENABLE_V(pre,idx)          .PUEN(`BSG_TLO_V(pre,idx) /* 1'b0 */), .PDEN(`BSG_THI_V(pre,idx) /* 1'b1 */)
`define PU_PD_DISABLE_V(pre,idx)      .PUEN(`BSG_TLO_V(pre,idx) /* 1'b0 */), .PDEN(`BSG_TLO_V(pre,idx) /* 1'b0 */)

`define ND_TREE_V(pre,idx)            .NDIN(`BSG_TLO_V(pre,idx) /* 1'b0 */), .NDOUT()

//
// **********************************************************************
//

`define BSG_IO_IN(name,padtype)                 \
    wire name``_i_int;                          \
    `BSG_TIE_NETS(name``_i)                     \
    padtype name``_i                            \
        ( .PAD(p_``name``_i)                    \
        , .DATA(`BSG_TLO(name``_i) /* 1'b0 */)  \
        , .Y(name``_i_int)                      \
        , `RX_MODE(name``_i)                    \
        , `XLRG_DRIVE(name``_i)                 \
        , `PD_ENABLE(name``_i)                  \
        , `ND_TREE(name``_i)                    \
        , `PWR_MGMT                             \
        );

`define BSG_IO_IN_A(pre,suffix,letter,index,padtype)             \
    padtype pre``_``letter``_``suffix``_i                        \
        ( .PAD(p_``pre``_``suffix``_i[index])                    \
        , .DATA(`BSG_TLO_V(pre``_``suffix``_i,index) /* 1'b0 */) \
        , .Y(pre``_``suffix``_i_int[index])                      \
        , `RX_MODE_V(pre``_``suffix``_i,index)                   \
        , `XLRG_DRIVE_V(pre``_``suffix``_i,index)                \
        , `PD_ENABLE_V(pre``_``suffix``_i,index)                 \
        , `ND_TREE_V(pre``_``suffix``_i,index)                   \
        , `PWR_MGMT                                                         \
        );

`define BSG_IO_IN_V(name,index,padtype)                 \
  padtype name``_``index``_i                            \
        ( .PAD(p_``name``_i[index])                     \
        , .DATA(`BSG_TLO_V(name``_i,index) /* 1'b0 */)  \
        , .Y(name``_i_int[index])                       \
        , `RX_MODE_V(name``_i,index)                    \
        , `XLRG_DRIVE_V(name``_i,index)                 \
        , `PD_ENABLE_V(name``_i,index)                  \
        , `ND_TREE_V(name``_i,index)                    \
        , `PWR_MGMT                                     \
        );

`define BSG_IO_OUT(name,padtype)                      \
    wire name``_o_int;                                \
    `BSG_OUTPUT_ENABLE_WIRE(name``_oen_int)           \
    `BSG_TIE_NETS(name``_o)                           \
    padtype name``_o                                  \
        ( .PAD(p_``name``_o)                          \
        , .DATA(name``_o_int)                         \
        , .Y()                                        \
        , `BSG_OUTPUT_ENABLE(name``_o,name``_oen_int) \
        , `XLRG_DRIVE(name``_o)                       \
        , `PD_ENABLE(name``_o)                        \
        , `ND_TREE(name``_o)                          \
        , `PWR_MGMT                          \
        );

`define BSG_IO_OUT_A(pre,suffix,letter,num,padtype)                                   \
  padtype pre``_``letter``_``suffix``_o                                               \
        ( .PAD(p_``pre``_``suffix``_o[num])                                           \
        , .DATA(pre``_``suffix``_o_int[num])                                          \
        , .Y()                                                                        \
        , `BSG_OUTPUT_ENABLE_V(pre``_``suffix``_o,num,pre``_``suffix``_oen_int[num])  \
        , `XLRG_DRIVE_V(pre``_``suffix``_o,num)                                       \
        , `PD_ENABLE_V(pre``_``suffix``_o,num)                                        \
        , `ND_TREE_V(pre``_``suffix``_o,num)                                          \
        , `PWR_MGMT                                                                   \
        );

`define BSG_IO_OUT_V(name,index,padtype)                                \
     padtype name``_``index``_o                                         \
        ( .PAD(p_``name``_o[index])                                     \
        , .DATA(name``_o_int[``index])                                  \
        , .Y()                                                          \
        , `BSG_OUTPUT_ENABLE_V(name``_o,index,name``_oen_int[``index])  \
        , `XLRG_DRIVE_V(name``_o,index)                                 \
        , `PD_ENABLE_V(name``_o,index)                                  \
        , `ND_TREE_V(name``_o,index)                                    \
        , `PWR_MGMT                                                     \
        );

`define BSG_IO_INOUT(name,padtype)    \
    wire name``_i_int;                \
    wire name``_o_int;                \
    wire name``_oen_int;              \
    `BSG_TIE_NETS(name``_io)          \
    padtype name``_io                 \
        ( .PAD(p_``name``_io)         \
        , .DATA(name``_o_int)         \
        , .Y(name``_i_int)            \
        , `RX_NOT_TX(name``_oen_int)  \
        , `XLRG_DRIVE(name``_io)      \
        , `PD_ENABLE(name``_io)       \
        , `ND_TREE(name``_io)         \
        , `PWR_MGMT                   \
        );

`define BSG_IO_IN_DISABLE(name,padtype)         \
    wire name``_i_int;                          \
    `BSG_TIE_NETS(name``_i)                     \
    padtype name``_i                            \
        ( .PAD(p_``name``_i)                    \
        , .DATA(`BSG_TLO(name``_i) /* 1'b0 */)  \
        , .Y(name``_i_int)                      \
        , `TX_RX_OFF(name``_i)                  \
        , `XLRG_DRIVE(name``_i)                 \
        , `PD_ENABLE(name``_i)                  \
        , `ND_TREE(name``_i)                    \
        , `PWR_MGMT                             \
        );

`define BSG_IO_OUT_DISABLE(name,padtype)  \
    wire name``_o_int;                    \
    `BSG_TIE_NETS(name``_o)               \
    padtype name``_o                      \
        ( .PAD(p_``name``_o)              \
        , .DATA(name``_o_int)             \
        , .Y()                            \
        , `TX_RX_OFF(name``_o)            \
        , `XLRG_DRIVE(name``_o)           \
        , `PD_ENABLE(name``_o)            \
        , `ND_TREE(name``_o)              \
        , `PWR_MGMT                       \
        );

`define BSG_IO_INOUT_DISABLE(name,padtype) \
    wire name``_i_int;                     \
    wire name``_o_int;                     \
    wire name``_oen_int;                   \
    `BSG_TIE_NETS(name``_io)               \
    padtype name``_io                      \
        ( .PAD(p_``name``_io)              \
        , .DATA(name``_o_int)              \
        , .Y(name``_i_int)                 \
        , `TX_RX_OFF(name``_io)            \
        , `XLRG_DRIVE(name``_io)           \
        , `PD_ENABLE(name``_io)            \
        , `ND_TREE(name``_io)              \
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

