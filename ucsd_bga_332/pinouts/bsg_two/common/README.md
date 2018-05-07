Porting the Padring to your process / chip design
------------------------------------------------------------

When you resize your chip, or use different pads, which will have different sizes, you will
need to generate a modified pad ring.  Here are some helpful tips:

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
  See https://bitbucket.org/taylor-bsg/bsg_packaging/src/master/ucsd_bga_332/pinouts/bsg_two/common/padring.pdf for guidance.
  The approximate range of I/Os for 5, 4, and 3mm dies is shown.

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


Files
-----

**padring.pdf**:         the bsg_two padring (note direction of misc_L_3_o and misc_R_3_o pins)

**bondpad_offsets.csv**: the distance from the center of each bondpad to the middle of the side of the chip

**py**:                  example tsmc 180nm scripts for customizing the bsg_two padring for a particular process flow

**verilog**:             top level verilog module for your chip (and your package simulation) for the pinout

**to_assembly_house**:   xls and scripts for telling the assemblyhouse how to bond your chip 
                     (and getting your bond diagram approved prior to tapeout)