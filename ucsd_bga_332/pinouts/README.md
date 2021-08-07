A package is generally a passive component with physical geometry, 
basically a set of electrically connected substrate bond pad (SBP) locations, 
and corresponding connections to pins or balls. 

It does not necessarily say anything about the whether those pins
are inputs or outputs, and it could change based on the use of the package.

We call a package combined with this information a "pinout". This 
directory is for holding pinout-specific files.

The two current pinouts are:

- bsg_two:   **wirebond** BGA using the BGA_332 socket and final padring for BGA_332 (**use this**)
- bsg_three: **flipchip** BGA from DARPA CRAFT program, using CRAFT 5x5 Flipchip BGA, but with this pinout

This one should not be used:

- bsg_one:   preliminary version; do not use

This one is for historical reference:

- bsg_dram:  used in TSMC 40 <a href="https://www.bsg.ai/papers/JSSC_OuterSpace_Park_2020.pdf">Outerspace Chip</a>; but only one channel is used.


