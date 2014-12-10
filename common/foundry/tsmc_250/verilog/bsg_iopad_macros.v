
// **********************************************************************
// BEGIN TOP LEVEL I/O MACROS : BSG ONE (TSMC 250 nm)
//
// these macros define the PAD instantiations for general I/Os
// these macros will often be defined on a per-process basis,
// as the interfaces for the I/O macros change across generations.
//

`define INPAD PDIDGZ

// we use 12 mA I/Os as a compromise between electromigration
// signal integrity, and transition rate

`define OUTPAD PDT12DGZ

// PDIDGZ foo_i (.PAD(p_foo_i), .C(foo_i_int));
`define XTC_IN(name)   wire name``_i_int; \
                       `INPAD name``_i (.PAD(p_``name``_i), .C(name``_i_int))

// PDIDGZ sdi_A_sclk_ex_i (.PAD(p_sdi_sclk_ex_i[0]), .C(sdi_sclk_ex_i_int[0])); --> XTC_IN_AO(sdi,sclk_ex,A,0)
`define XTC_IN_A(pre,suffix,letter,index) \
   `INPAD pre``_``letter``_``suffix``_i (.PAD(p_``pre``_``suffix``_i[index]), .C(pre``_``suffix``_i_int[index]))


// PDIDGZ foo_0_i (.PAD(p_foo_i[0]), .C(foo_i_int[0]));
`define XTC_IN_V(name,index) `INPAD name``_``index``_i (.PAD(p_``name``_i[index]), .C(name``_i_int[index]))


// PDT12DGZ foo_o (.PAD(p_foo_o), .OEN(foo_oen), .I(foo_o_int))
`define XTC_OUT(name) wire name``_o_int; \
                      wire name``_oen = '0; \
                      `OUTPAD name``_o (.PAD(p_``name``_o), .OEN(name``_oen), .I(name``_o_int))

// PDT12DG foo_0_o (.PAD(p_foo_o[0]), .OEN(foo_oen[0]), .I(foo_o_int[0]))
`define XTC_OUT_V(name,index) `OUTPAD name``_``index``_o (.PAD(p_``name``_o[index]), .OEN(name``_oen[index]), .I(name``_o_int[``index]))



// PDT12DGZ sdo_A_sclk_ex_o (.PAD(p_sdo_sclk_ex_o[0]), .OEN(sdo_sclk_ex_oen[0], .I(sdo_sclk_ex_o_int[0]))); --> XTC_OUT_AO(sdo,sclk_ex,A,0)
`define XTC_OUT_A(pre,suffix,letter,num) \
  `OUTPAD pre``_``letter``_``suffix``_o (.PAD(p_``pre``_``suffix``_o[num]), .OEN(pre``_``suffix``_oen[num]), .I(pre``_``suffix``_o_int[num]))


// shared macros
`include "bsg_iopad_meta_macros.v"

//
//
// END TOP LEVEL I/O MACROS (250 nm)
// **********************************************************************
