# To Assembly House
This directory is used to generated all of the files required by the assembly
house to get the uw_bga package substrate bonded to an ASIC using the
bsg_asic_cloud package.

## Files for assembly house:

- Assembly build sheet
- Orientation image
- Shape image
- Bond diagrams for signal/supply/vdd/v18/vss_vzz/all
- CSV files for coordinates

The assembly build sheet, orientation image and shape image can be found in the
`additional_files_for_assembly_house/` directory. The bond diagrams and CSV
files are generated. We have provided the scripts and a makefile to generate
these files.

## Generating the bond diagrams:

- Prerequisite: python3, ImageMagiks
- Run make (use -j6 to generate all images in parallel)

The bond diagram generator takes the csv files found inside ./csv (which
contains all the information about the substrate) and ../../<foundry>/csv
(which has all the information about the pads on the ASIC) and generate a
combined CSV that has all the package-padring connections, bond locatoins, bond
wire length, and bond angle. It will then use the combined csv file to draw a
bond diagram image.

The resulting files will be found in the `output/` directory. Inside here will
be 6 `*.csv` files and 6 `*_final.png`. These are the final csv files and bond
diagrams you will want to send to the assembly house. The 6 files are:

1. all -- every bond pad
2. signals -- all the signal bond pads (should be the inner bumps only)
3. supply -- all the supply bond pads (should be the outer bumps only)
4. vdd -- all the core power bond pads
5. v18 -- all the io power bond pads
6. vss_vzz -- all the core and io ground bond pads

**NOTE**: This tool can also be used as a visual verification tool. ASIC designers
should generate the die csv files for their implementation (there is a script
in the tcl/ directory for the specific foundry) and point the FOUNDRY_CSV_DIR
variable inside the makefile to the directory with the newly generated CSV
files and re-generate the bond diagrams and visual verify everything looks
okay.

## Port to new process node checklist

- Update PDF build sheet and orientation image accordingly
- Create a tcl script to generate the 7 die csv files. This needs to
  include Die#, Pad Name, Side, Layer, Die X, Die Y, Width, and Height. The
  order is clockwase with the top of the east side being the start point
  (E->S->W->N).
- Add the generate csv files inside the `csv/<foundry>` directory
- Change the FOUNDRY variable in the Makefile and re-generate the bond
  diagrams.

