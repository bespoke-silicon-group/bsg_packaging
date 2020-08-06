In this directory are a bunch of subdirectories, one for each unique package.

Currently there are three packages:

*ucsd_bga_332*: 4 full duplex 9 bits channels, verified to work from 3x3 to 5x5 die size; probably does 6x6 as well. 

*uw_bga*:       2 full duplex 9 bit channels, plus 32-bit LPDDR interface, targets 3x3 chip; likely can go to 3.7 x 3.7 mm.

*gf* (obsolete)


There is also the common directory, which contains files for constructing padrings, 
including portability files for each process (e.g. tsmc 250) being targeted.
