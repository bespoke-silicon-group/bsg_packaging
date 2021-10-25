In this directory are a bunch of subdirectories, one for each unique BGA (ball grid array) package.

Currently there are three packages:

* **ucsd_bga_332**: 4 full duplex 9 bits channels, verified from 3x3 to 5x5 die size; probably does 6x6mm. 

* **uw_bga**:       2 full duplex 9 bit channels, plus 32-bit LPDDR interface, targets 3x3mm; likely can go to 3.7x3.7 mm.

* **gf** (obsolete)

If you use these packages in your publications, please acknowledge the use as "We employed the <name of package> from the Open Source BaseJump Project."


There is also the common directory, which contains files for constructing padrings, 
including portability files for each process (e.g. tsmc 250) being targeted.

<img src="http://bjump.org/manycore/pics/BSG_Ten_Sun.jpg">
