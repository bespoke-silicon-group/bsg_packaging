
// **********************************************************************
// BEGIN TOP LEVEL I/O MACROS : BSG ONE (GF 28 nm)
//
// these macros define the PAD instantiations for general I/Os
// these macros will often be defined on a per-process basis,
// as the interfaces for the I/O macros change across generations.
//

`define INPAD PBIDIR_18_18_NT_DR
//`define INPAD_CONFIG .PO(), .A('0), .DS0('1), .DS1('0), .SR('0), .IE('1), .IS('0), .OE('0), .PE('1), .PS('0), .POE('0), .RTO(RTO), .SNS(SNS)
//`define INPAD_CONFIG .PO(), .A('0), .DS0('1), .DS1('0), .SR('0), .IE('1), .IS('0), .OE('0), .PE('1), .PS('0), .POE('0), .RTO('1), .SNS('1)
`define INPAD_CONFIG .PO(), .A('0), .DS0('1), .DS1('0), .SR('0), .IE('1), .IS('0), .OE('0), .PE('1), .PS('0), .POE('0), .RTO(RTOi), .SNS(SNSi)

`define OUTPAD PBIDIR_18_18_NT_DR
//`define OUTPAD_CONFIG .PO(), .Y(), .DS0('1), .DS1('0), .SR('0), .IE('0), .IS('0), .OE('1), .PE('0), .PS('0), .POE('0), .RTO(RTO), .SNS(SNS)
//`define OUTPAD_CONFIG .PO(), .Y(), .DS0('1), .DS1('0), .SR('0), .IE('0), .IS('0), .OE('1), .PE('0), .PS('0), .POE('0), .RTO('1), .SNS('1)
`define OUTPAD_CONFIG .PO(), .Y(), .DS0('1), .DS1('0), .SR('0), .IE('0), .IS('0), .OE('1), .PE('0), .PS('0), .POE('0), .RTO(RTOi), .SNS(SNSi)

`define XTC_IN(name)   wire name``_i_int; \
                       `INPAD name``_i (.PAD(p_``name``_i), .Y(name``_i_int), `INPAD_CONFIG)

`define XTC_IN_A(pre,suffix,letter,index) \
   `INPAD pre``_``letter``_``suffix``_i (.PAD(p_``pre``_``suffix``_i[index]), .Y(pre``_``suffix``_i_int[index]), `INPAD_CONFIG)


`define XTC_IN_V(name,index) `INPAD name``_``index``_i (.PAD(p_``name``_i[index]), .Y(name``_i_int[index]), `INPAD_CONFIG)


// FIXME: GF pads don't have OEN pin
`define XTC_OUT(name) wire name``_o_int; \
                      wire name``_oen = '0; \
                      `OUTPAD name``_o (.PAD(p_``name``_o), .A(name``_o_int), `OUTPAD_CONFIG)

`define XTC_OUT_V(name,index) `OUTPAD name``_``index``_o (.PAD(p_``name``_o[index]), .A(name``_o_int[``index]), `OUTPAD_CONFIG)



`define XTC_OUT_A(pre,suffix,letter,num) \
  `OUTPAD pre``_``letter``_``suffix``_o (.PAD(p_``pre``_``suffix``_o[num]), .A(pre``_``suffix``_o_int[num]), `OUTPAD_CONFIG)


// NRGH: Added for analog inputs
`define ANALOG_INPAD PANALOG_18_18_NT_DR 
`define ANALOG_INPAD_CONFIG .PADR1(), .PADR2(), .RTO(RTOi), .SNS(SNSi)
`define XTC_AIN(name)  wire name``_ai_int; \
                       `ANALOG_INPAD name``_ai (.PAD(p_``name``_ai), .PADC(name``_ai_int), `ANALOG_INPAD_CONFIG)

// NRGH: Added for PDVDDTIE cells (V33TIE) that drive RTO/SNS
`define DVDDTIE_PAD PDVDDTIE_18_18_NT_DR
`define XTC_DVDDTIE(name,ring) wire RTO``ring; wire SNS``ring; \
                               `DVDDTIE_PAD name (.RTO(RTO``ring), .SNS(SNS``ring))

// shared macros
//`include "bsg_one_iopad_meta_macros.v"
`include "bsg_iopad_meta_macros.v"

//
//
// END TOP LEVEL I/O MACROS (GF 28 nm)
// **********************************************************************
