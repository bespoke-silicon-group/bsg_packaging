A package is generally a passive component with physical geometry, 
basically a set of electrically connected substrate bond pad (SBP) locations, 
and corresponding connections to pins or balls. 

It does not necessarily say anything about the whether those pins
are inputs or outputs, and it could change based on the use of the package.

We call a package combined with this information a "pinout". This 
directory is for holding pinout-specific files.

See <a href="http://bjump.org/basejump_socket_352.html">this link</a> for lots of useful details on this package.

This is the canonical padring for this package:

<a href="https://github.com/bespoke-silicon-group/bsg_packaging/blob/master/ucsd_bga_332/pinouts/bsg_two/common/padring.pdf"><img src="http://bjump.org/pics/332_io_names_small.png"></a>

The two current pinouts are:

- bsg_two:   **wirebond** BGA using the BGA_332 socket and final padring for BGA_332 (**use this**)
- bsg_three: **flipchip** BGA from DARPA CRAFT program, using CRAFT 5x5 Flipchip BGA, but with this pinout

This one should not be used:

- bsg_one:   preliminary version; do not use

This one is for historical reference:

- bsg_dram:  used in TSMC 40 <a href="https://www.bsg.ai/papers/JSSC_OuterSpace_Park_2020.pdf">Outerspace Chip</a>; but only one channel is used.


Porting the Padring to your process / chip design
------------------------------------------------------------
<pre>
When you resize your chip, or use different pads, which will have different sizes, you will
need to generate a modified pad ring.  Here are some helpful tips:

- The safest thing is to generate a padring diagram and then have your assembly house (bondhouse)
  approve your padring before you tapeout. Below are some general rules to help you replicate what we did
  but they are not hard and fast. If the bondhouse approves what you did, it's good to go. 
  
- In your modified ring, the center of each bondpad should have roughly the same distance (D) 
  to the middle (M) of the side of the chip it is on as in the original padrid.
  
  We have included these distances in the file bondpad_offsets.csv.
 
                            Top of Chip
     __....__________________________________________....___
     |          ____            |                          |
     |         |   |     D      |                          |
     |    -    | <------------->|                          |
     |    |    |___|            |                          |
     |    |S         ___        |                          |
     |    |         |   |       |                          |
     |    -         | <-------->|                          |
     |              |___|       |                          |
     |                          |                          |
     |           <--->          | M                        | 
     | ....        P            |                    ....  |
     
- This pad ring was design to be staggered; the centers of neighbor pads are 115 micron apart (S) in the direction
  perpendicular to the edge of the chip. It's unclear how much this distance can change before the bond house gets
  unhappy. 

  Potentially you can make this work with a linear pad ring
  but you would need pretty narrow wires to meet the 40 um effective pitch (P).

- If your die size is smaller than 4 by 4, you will have to eliminate pads starting from the edges.
  See https://github.com/bespoke-silicon-group/bsg_packaging/blob/master/ucsd_bga_332/pinouts/bsg_two/common/padring.pdf for guidance.
  The approximate range of I/Os for 5, 4, and 3mm dies is shown. What is shown is conservative. In our 40nm tapeout, we actually were
  able to do 3x3 mm^2 die and not eliminate very many signal wires.

Alignment of top metal layer and left/right side of padring.
------------------------------------------------------------

Note that bsg_two pinout is asymmetrical by design. Output channels are on top and bottom
and inputs channels are on the left and right side, to reduce the noise of output channels on the inputs.

Output channels require more I/O VDD pins, so there are fewer available pads available 
for Core VDD on those sides. Additionally, the PLL region reduces the amount of pins for 
supply. So Core VDD supply is more highly concentrated on the left and right side of the
package. In many cases, the top metal layer of a process has thicker metal and much lower 
resistance. So it is preferable to align the top metal layer with the left/right side of 
the package, which might require rotating the chip in the package,
depending on whether top metal runs horizontally or vertically.
</pre>
