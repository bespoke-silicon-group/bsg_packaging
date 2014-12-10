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


// PDIDGZ foo_i (.PAD(p_foo_i), .C(foo_i_int));
`define XTC_IN(name)                    wire name``_i_int = p_``name``_i

`define XTC_IN_A(pre,suffix,letter,index) assign pre``_``suffix``_i_int[index] = p_``pre``_``suffix``_i[index]

`define XTC_IN_V(name,index)            assign name``_i_int[index] = p_``name``_i[index]


`define XTC_OUT(name)     wire name``_o_int; \
                          assign p_``name``_o = name``_o_int

`define XTC_OUT_V(name,index) assign p_``name``_o[index] = name``_o_int[index]

`define XTC_OUT_A(pre,suffix,letter,num) assign p_``pre``_``suffix``_o[num] = pre``_``suffix``_o_int[num]


// shared macros
`include "bsg_iopad_meta_macros.v"

//
//
// END TOP LEVEL I/O MACROS: (VERILOG; NOT REAL)
// **********************************************************************
