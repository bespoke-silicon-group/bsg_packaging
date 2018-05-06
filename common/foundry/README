This folder is responsible for implementing a portability layer for I/Os cells in a verilog design.
The idea is, those macros are responsible for providing a portability layer between a generic BSG I/O pad
interface which has a portable verilog interface, and the foundry (e.g. TSMC 40) specific I/O pad instantiations, 
which will have their own unique port names and may potentially be low-true (in bsg, all ports should be high true!).

**portable/verilog/bsg_iopad_macros.v**

contains the portable implementations for RTL-level simulation.

**foundry/** 

provides the implementations that thunk down to a particular PDK's I/O pad interfaces

