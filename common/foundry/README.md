This folder is responsible for implementing a portability layer for I/Os cells in a verilog design.

Specifically, it provides common macros that are responsible for providing a portability layer between a generic BSG I/O pad
interface which has a portable verilog interface, and the foundry (e.g. TSMC 40) specific I/O pad instantiations, 
which will have their own unique port names and may potentially be low-true (in bsg, all ports should be high true!).

**Example MACRO Names**

MACRO | Description
------|------------
BSG_IO_IN(name,padtype) | input pad
BSG_IO_OUT(name,padtype)| output pad
BSG_IO_IN_DISABLE       | disable input pad
BSG_IO_TIELO            | tie pad's input signal to low



**Portable Implementations**

[This link](portable/verilog/bsg_iopad_macros.v)
contains the portable implementations for RTL-level simulation.

**Foundry Specific Implementations**

[This link](https://bitbucket.org/taylor-bsg/bsg_packaging/src/master/common/foundry/tsmc_180_250/verilog/bsg_iopad_macros.v) shows example TSMC 180 implementations that thunk down to a particular PDK's I/O pad interfaces

** PAD Mappings **

Note that although this provides a portable interface to a particular foundry, the drive strengths of particular cells are something that  the actual names of the pad cells are specified elsewhere, as they often encode design-specific parameters, for example 12 mA versus 16mA.

For the bsg 180nm chips (we tried several different I/O drive strengths and slew control settings), and found that 16 mA was good for 3.3V wirebond I/O with parallel termination;
and 12 mA was good for 1.8V flipchip I/O with parallel termination, and that slew control was not helpful in any case.

[For the 180nm TSMC chips](https://bitbucket.org/taylor-bsg/bsg_packaging/src/master/ucsd_bga_332/pinouts/bsg_two/tsmc_16/verilog/padmappings/one/bsg_padmapping.v)

[For the 16nm Celerity chip](https://bitbucket.org/taylor-bsg/bsg_packaging/src/master/ucsd_bga_332/pinouts/bsg_two/tsmc_16/verilog/padmappings/one/bsg_padmapping.v)


