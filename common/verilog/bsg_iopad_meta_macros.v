// MBT eventually we should obsolete these XTC definitions

`define XTC_IN_DIFF(zod)                   \
  `XTC_IN(zod``_p);                        \
  `XTC_IN(zod``_n);



`define XTC_OUT_DIFF(name)                 \
                                           \
  `XTC_OUT(name``_p);                      \
  `XTC_OUT(name``_n);



`define XTC_IN_V70(name)                   \
                                           \
   wire [7:0] name``_i_int;                \
                                           \
  `XTC_IN_V(name,0);                       \
  `XTC_IN_V(name,1);                       \
  `XTC_IN_V(name,2);                       \
  `XTC_IN_V(name,3);                       \
  `XTC_IN_V(name,4);                       \
  `XTC_IN_V(name,5);                       \
  `XTC_IN_V(name,6);                       \
  `XTC_IN_V(name,7);



`define XTC_IN_V60(name)                   \
   wire [6:0] name``_i_int;                \
                                           \
  `XTC_IN_V(name,0);                       \
  `XTC_IN_V(name,1);                       \
  `XTC_IN_V(name,2);                       \
  `XTC_IN_V(name,3);                       \
  `XTC_IN_V(name,4);                       \
  `XTC_IN_V(name,5);                       \
  `XTC_IN_V(name,6);


`define XTC_OUT_V70(name)                  \
                                           \
   wire [7:0] name``_o_int;                \
   wire [7:0] name``_oen_int;              \
                                           \
  `XTC_OUT_V(name,0);                      \
  `XTC_OUT_V(name,1);                      \
  `XTC_OUT_V(name,2);                      \
  `XTC_OUT_V(name,3);                      \
  `XTC_OUT_V(name,4);                      \
  `XTC_OUT_V(name,5);                      \
  `XTC_OUT_V(name,6);                      \
  `XTC_OUT_V(name,7);


`define XTC_IN_ABCD(pre,suffix)            \
                                           \
   wire[3:0] pre``_``suffix``_i_int;       \
                                           \
  `XTC_IN_A(pre,suffix,A,0);               \
  `XTC_IN_A(pre,suffix,B,1);               \
  `XTC_IN_A(pre,suffix,C,2);               \
  `XTC_IN_A(pre,suffix,D,3);



`define XTC_OUT_ABCD(pre,suffix)           \
                                           \
   wire [3:0] pre``_``suffix``_o_int;      \
   wire [3:0] pre``_``suffix``_oen_int;    \
                                           \
  `XTC_OUT_A(pre,suffix,A,0);              \
  `XTC_OUT_A(pre,suffix,B,1);              \
  `XTC_OUT_A(pre,suffix,C,2);              \
  `XTC_OUT_A(pre,suffix,D,3);



// MBT use these definitions instead for bsg_two padring and on

`define BSG_IO_IN_V70(name,padtype)        \
                                           \
   wire [7:0] name``_i_int;                \
                                           \
  `BSG_IO_IN_V(name,0,padtype);            \
  `BSG_IO_IN_V(name,1,padtype);            \
  `BSG_IO_IN_V(name,2,padtype);            \
  `BSG_IO_IN_V(name,3,padtype);            \
  `BSG_IO_IN_V(name,4,padtype);            \
  `BSG_IO_IN_V(name,5,padtype);            \
  `BSG_IO_IN_V(name,6,padtype);            \
  `BSG_IO_IN_V(name,7,padtype);



`define BSG_IO_IN_V60(name,padtype)        \
                                           \
   wire [6:0] name``_i_int;                \
                                           \
   `BSG_IO_IN_V(name,0,padtype);           \
   `BSG_IO_IN_V(name,1,padtype);           \
   `BSG_IO_IN_V(name,2,padtype);           \
   `BSG_IO_IN_V(name,3,padtype);           \
   `BSG_IO_IN_V(name,4,padtype);           \
   `BSG_IO_IN_V(name,5,padtype);           \
   `BSG_IO_IN_V(name,6,padtype);



`define BSG_IO_OUT_V70(name,padtype)       \
                                           \
   wire [7:0] name``_o_int;                \
   wire [7:0] name``_oen_int;              \
                                           \
   `BSG_IO_OUT_V(name,0,padtype);          \
   `BSG_IO_OUT_V(name,1,padtype);          \
   `BSG_IO_OUT_V(name,2,padtype);          \
   `BSG_IO_OUT_V(name,3,padtype);          \
   `BSG_IO_OUT_V(name,4,padtype);          \
   `BSG_IO_OUT_V(name,5,padtype);          \
   `BSG_IO_OUT_V(name,6,padtype);          \
   `BSG_IO_OUT_V(name,7,padtype);


`define BSG_IO_IN_ABCD(pre,suffix,padtypeA,padtypeB,padtypeC,padtypeD) \
                                           \
    wire[3:0] pre``_``suffix``_i_int;      \
                                           \
    `BSG_IO_IN_A(pre,suffix,A,0,padtypeA);  \
    `BSG_IO_IN_A(pre,suffix,B,1,padtypeB);  \
    `BSG_IO_IN_A(pre,suffix,C,2,padtypeC);  \
    `BSG_IO_IN_A(pre,suffix,D,3,padtypeD);


`define BSG_IO_OUT_ABCD(pre,suffix,padtypeA,padtypeB,padtypeC,padtypeD)  \
                                                                         \
    wire [3:0] pre``_``suffix``_o_int;                                   \
    wire [3:0] pre``_``suffix``_oen_int;                                 \
                                                                         \
    `BSG_IO_OUT_A(pre,suffix,A,0,padtypeA);                              \
    `BSG_IO_OUT_A(pre,suffix,B,1,padtypeB);                              \
    `BSG_IO_OUT_A(pre,suffix,C,2,padtypeC);                              \
    `BSG_IO_OUT_A(pre,suffix,D,3,padtypeD);
