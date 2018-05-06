Pad Ring Creation Scripts for IC Compiler
-----------------------------------------

This script is used to help generate the tcl files for Synopsys IC Compiler found in ../../<node>/tcl. 
This script takes in a csv file where each line is the following:

    Pad Name, Center X Coordinate (in um), Center Y Coordinate (in um), Chip Side [top, bottom, left, right]

The script will take that csv file and create a list of 'set_pin_physical_constraints' tcl commands
which go in pin_pad_physical_constraints.tcl and a list of 'move_object' tcl commands which go in
pad_move_to_location_file.tcl.

bsg_two_centroid_rotate.csv:             chip rotated  (used for TSMC 180; 6 metal layers)

bsg_two_centroid.csv:                    chip centered (used for TSMC 250; 5 metal layers)

bsg_two_centroid_rotate_calculator.xlsx: calculator for generating pad rings for chips with different sizes
                                         for example only; not used in any tapeout

io_centers_to_tcl.py:                    script to generate IC compiler I/O PAD placement
                                         note: this is somewhat specific for TSMC 180 staggered I/O pads
					 and probably will not work out of the box.


