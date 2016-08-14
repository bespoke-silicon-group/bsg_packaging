
// **********************************************************************
// BEGIN TOP LEVEL I/O MACROS : BSG TWO (TSMC 180 nm)
//
// these macros define the PAD instantiations for general I/Os
// these macros will often be defined on a per-process basis,
// as the interfaces for the I/O macros change across generations.
//


// this is used to disable a differential input signal
// even though this is an input
// we employ an output pad and tri-state (OEN=1) the output
// we are trying to avoid the case of having an input
// pad with 1.2 LVDS voltage that creates short-circuit current in a 3.3V LVCMOS pad
// cell.


`ifdef BSG_OUTPUTS_NEED_ENABLES
`define BSG_OUTPUT_ENABLE  ,.OEN(1'b0)
`else
`define BSG_OUTPUT_ENABLE
`endif

`define BSG_IO_IN_DISABLE(name,padtype)                           \
padtype name``_i (.PAD(p_``name``_i), .OEN(1'b1), .I(1'b0))

`define BSG_IO_IN_DIFF_DISABLE(name,padtype) \
  `BSG_IO_IN_DISABLE(name``_p,padtype);       \
  `BSG_IO_IN_DISABLE(name``_n,padtype)

// PDDDGZ foo_i (.PAD(p_foo_i), .C(foo_i_int));
`define BSG_IO_IN(name,padtype)   wire name``_i_int; \
padtype name``_i (.PAD(p_``name``_i), .C(name``_i_int))

// PDDDGZ sdi_A_sclk_ex_i (.PAD(p_sdi_sclk_ex_i[0]), .C(sdi_sclk_ex_i_int[0])); --> BSG_IO_IN_AO(sdi,sclk_ex,A,0)
`define BSG_IO_IN_A(pre,suffix,letter,index,padtype) \
   padtype pre``_``letter``_``suffix``_i (.PAD(p_``pre``_``suffix``_i[index]), .C(pre``_``suffix``_i_int[index]))


// PDDDGZ foo_0_i (.PAD(p_foo_i[0]), .C(foo_i_int[0]));
`define BSG_IO_IN_V(name,index,padtype) padtype name``_``index``_i (.PAD(p_``name``_i[index]), .C(name``_i_int[index]))


// PDT12DGZ foo_o (.PAD(p_foo_o), .OEN(foo_oen), .I(foo_o_int))
`define BSG_IO_OUT(name,padtype) wire name``_o_int; \
     padtype name``_o (.PAD(p_``name``_o) `BSG_OUTPUT_ENABLE, .I(name``_o_int))

// PDT12DG foo_0_o (.PAD(p_foo_o[0]), .OEN(foo_oen[0]), .I(foo_o_int[0]))
`define BSG_IO_OUT_V(name,index,padtype) padtype name``_``index``_o (.PAD(p_``name``_o[index])  `BSG_OUTPUT_ENABLE, .I(name``_o_int[``index]))

// PDT12DGZ sdo_A_sclk_ex_o (.PAD(p_sdo_sclk_ex_o[0]), .OEN(sdo_sclk_ex_oen[0], .I(sdo_sclk_ex_o_int[0]))); --> BSG_OUT_AO(sdo,sclk_ex,A,0)
`define BSG_IO_OUT_A(pre,suffix,letter,num,padtype) \
  padtype pre``_``letter``_``suffix``_o (.PAD(p_``pre``_``suffix``_o[num])  `BSG_OUTPUT_ENABLE, .I(pre``_``suffix``_o_int[num]))


// shared macros
`include "bsg_iopad_meta_macros.v"

//
//
// END TOP LEVEL I/O MACROS (180 nm)
// **********************************************************************
