```
This directory contains the final files for the UCSD BGA design, by Darren Smith and Michael Taylor.

Contents:

  README                                   this file
  352_bga_pins_top_down_flat.pdf           shows ballout of BGA, top-down (XRAY) view
  UCSD001-DesignInfo-2014-03-15.xlsx       detail design info for BGA

for_assembly_corwil/                       note that we actually used Quickpak

   UCSD001-BGA_2014_03-19.dwg              Bonding and balling diagram by Darren for Assembly (Corwil) 
                                           Note: these were just the substrate design time diagrams; look at the
                                           pinouts/*/common/to_assembly_house/example_files_for_assembly_house/
                                           for real examples.

for_fab_sierra_proto_express/

   impedance.png                           red marks 100 ohm impedance lines; yellow marks non-impedance controlled
   Q219234-5.docx 		   	                 quote for fabrication by Sierra Proto Express
   UCSD001_Gerber_2014-05-21.zip           final gerber files for fab house (Sierra Proto) (fixed clock trace width)}
   UCSD001-BGA-FabDrill-2014-04-22_mod.pdf drill pattern, stackup notes for fab; overrides numbers in Gerber files
                                           I hacked the file to change IS410 to N5000.                

for_socket_maker_ironwood/                 order for the socket that matches this package
     SO47885.pdf

for_us/

   332_io_names.pdf                        labeling of pad ring note use Chrome; not apple preview to view
   UCSD001-BGA_5mm_2014-05-21.pcb          final design

   UCSD001-BGA_5mm_2014-05-21/             unzipped Gerber files

   UCSD001-Bonding_2014-03-19.dwg.pdf      **(DO NOT USE)** .pdf of .dwg file in the for_assembly_Corwil directory
   UCSD001-Bonding_2014-03-19.zip          **(DO NOT USE)** .dxf file for above (autocad)
   **Original files provided by designer, which have already been replaced. New files are located in: [bsg_packaging/ucsd_bga_332/pinouts/bsg_two/common/to_assembly_house](../pinouts/bsg_two/common/to_assembly_house)**

   old for reference/                       intermediate files; not the final ones
      UCSD001-BGA_5mm_2014-04-22.pcb	    penultimate design, with final stackup notes by Darren
      UCSD001-BGA_5mm_2014-04-22.zip 	    gerber files for above .pcb file
      UCSD001-BGA-FabDrill-2014-04-22.pdf   drill pattern, stackup notes for fab; overrides numbers in Gerber files
                                            before IS410 to N5000 mod

      UCSD001-BGA_5mm_2014-03-20.pcb 	    semi-final design
      UCSD001-BGA_5mm_2014-03-20.zip        zipped gerbers of above .pcb file
      UCSD001-BGA_5mm_2014-03-20/           actual gerber files for above;
```
