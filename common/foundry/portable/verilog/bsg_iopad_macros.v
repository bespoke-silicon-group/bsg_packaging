// MBT 9-22-14
//
// **********************************************************************
// BEGIN TOP LEVEL I/O MACROS : (VERILOG; NOT REAL)
//
// these macros define the PAD instantiations for general I/Os
// when we actually don't want to bother instantiating real pads
//
// these macros will often be defined on a per-process basis,
// as the interfaces for the I/O macros change across generations.
//

// eventually XTC will go away

// PDIDGZ foo_i (.PAD(p_foo_i), .C(foo_i_int));
`define XTC_IN(name)                    wire name``_i_int = p_``name``_i;

//  name_i_io_int :  input data from pad
//  name_o_io_int :  output data to pad
//  name_oen_io_int:  output enable. ACTIVE_LOW
`define XTC_IN_A(pre,suffix,letter,index) assign pre``_``suffix``_i_int[index] = p_``pre``_``suffix``_i[index];

`define XTC_INOUT_A(pre,suffix,letter,index) \
        assign pre``_``suffix``_i_io_int[index] = p_``pre``_``suffix``_io[index]; \
        assign p_``pre``_``suffix``_io[index]= ``pre``_``suffix``_oen_io_int[index]   \
                                             ? 1'bz                                 \
                                             : ``pre``_``suffix``_o_io_int[index] ;

`define XTC_IN_V(name,index)            assign name``_i_int[index] = p_``name``_i[index];

`define XTC_INOUT_V(name,index)                 \
                assign name``_i_io_int[index]= p_``name``_io[index];       \
                assign p_``name``_io[index] = name``_oen_io_int[index]   \
                                             ? 1'bz                     \
                                             : name``_o_io_int[index];

`define XTC_OUT(name)     wire name``_o_int; wire name``_oen_int; \
                          assign p_``name``_o = name``_o_int;

`define XTC_OUT_V(name,index)    assign p_``name``_o[index] = name``_o_int[index];

`define XTC_OUT_A(pre,suffix,letter,num)        assign p_``pre``_``suffix``_o[num] = pre``_``suffix``_o_int[num];
`define XTC_OENOUT_A(pre,suffix,letter,num)     assign p_``pre``_``suffix``_o[num] = pre``_``suffix``_oen_int[num]? 1'bz : pre``_``suffix``_o_int[num];

`define BSG_IO_IN_DISABLE(name,padtype) wire name``_i_int = 0 & p_``name``_i;
`define BSG_IO_IN_DIFF_DISABLE(name,padtype) \
`BSG_IO_IN_DISABLE(name``_p,padtype)    \
`BSG_IO_IN_DISABLE(name``_n,padtype)

`define BSG_IO_IN(name,padtype) `XTC_IN(name)
`define BSG_IO_IN_A(pre,suffix,letter,index,padtype) `XTC_IN_A   (pre,suffix,letter,index)
`define BSG_IO_INOUT_A(pre,suffix,letter,index,padtype) `XTC_INOUT_A(pre,suffix,letter,index)
`define BSG_IO_IN_V(name,index,padtype) `XTC_IN_V(name,index)
`define BSG_IO_INOUT_V(name,index,padtype) `XTC_INOUT_V(name,index)
`define BSG_IO_OUT(name,padtype) `XTC_OUT(name)

`define BSG_IO_OUT_V(name,index,padtype) `XTC_OUT_V(name,index)
`define BSG_IO_OUT_A(pre,suffix,letter,num,padtype) `XTC_OUT_A(pre,suffix,letter,num)
`define BSG_IO_OENOUT_A(pre,suffix,letter,num,padtype) `XTC_OENOUT_A(pre,suffix,letter,num)

`define BSG_IO_TIEHI(name) assign name = 1'b1;
`define BSG_IO_TIELO(name) assign name = 1'b0;

`define BSG_IO_TIEHI_VEC(name,width) assign name = { width  {1'b1} };
`define BSG_IO_TIELO_VEC(name,width) assign name = { width  {1'b0} };

`define BSG_IO_TIELO_VEC_ONE(name,item) assign name[item] = 1'b0;
`define BSG_IO_TIEHI_VEC_ONE(name,item) assign name[item] = 1'b1;

`define BSG_PHYSICAL_ONLY_PAD(name,padtype) \

`define BSG_ANALOG_PAD(name,padtype) `XTC_IN(name)

  /* intentionally left blank */

// shared macros
`include "bsg_iopad_meta_macros.v"

//
//
// END TOP LEVEL I/O MACROS: (VERILOG; NOT REAL)
// **********************************************************************
