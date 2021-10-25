This is the subdirectory for the 352-ball UCSD wirebond BGA package, which is optimized for 5x5 to 4x4 mm die, but can go bigger (probably up to 6x6 mm), and can also go smaller (down to 3x3, but at some loss of pin count; as always confirm with your bond house). It provides 144 signal pins, out of a total of 332 bond pads (the rest are used for high-quality VDD,I/O VDD and VSS). The package has 4 layers; the inner two layers are power and ground planes. This particular package has been optimized for 4 full duplex 8-bit channels. The I/O is aggressively designed and supports LVCMOS speeds of 400-500 megabits+ per pin in a well-designed system that connects the ASIC to an FPGA with configurable sieres and parallel termination. Traces within signal groups are length matched.

- **pcb**:     design collatoral; inputs and outputs to BGA substrate designer; 
           mostly for curiousity but also potentially for modelling the package, clarifications, or modifying the substrate

- **pinouts**: this is what most chip designers will spend most of their time looking at

  [Verilog interface to the package](https://github.com/bespoke-silicon-group/bsg_packaging/blob/master/ucsd_bga_332/pinouts/bsg_two/common/verilog/bsg_pinout.v)
  


<img src="http://bjump.org/pics/DSC02197.JPG">


See this <a href="https://www.youtube.com/watch?v=pumrNqkXjfI&list=PLD1QnhK1caR3IrAtVAd1-leMkus7dVy6a&index=17">YouTube video</a> of the OpenFPGA FROG Testchip, which uses this package!

See the first  <a href="http://bjump.org/manycore/">ten-core RISC-V chip</a> in history, 5x5mm 180nm TSMC BSG-X, which used this package!


See the first  <a href="http://bjump.org/manycore/">511-core RISC-V chip</a> in history, 5x5mm 16nm TSMC Celerity, which used this pinout!

See the  <a href="http://bjump.org/pics/outerspace_package_photo.png">Outerspace chip,</a>,  3x3mm 40nm TSMC OuterSpace, which used this package!

           
