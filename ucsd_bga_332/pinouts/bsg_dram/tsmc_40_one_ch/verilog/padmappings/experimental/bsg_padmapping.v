// pull in the macros that define I/Os for the chip
// this can also be swapped out for other technology files
// like verilog.

`define BSG_OUTPUTS_NEED_ENABLES

// PDDDGZ = input with pull down
`define BSG_PAD_INPUT_PULLDOWN PDDDGZ

// PRT12DGZ = 12 mA output pad (TSMC40nm)
// Tri-State Output Pad with Limited Slew Rate, High-Volt Tolerant
`define BSG_PAD_OUTPUT_A PRT12DGZ
`define BSG_PAD_OUTPUT_B PRT12DGZ

// PRT12DGZ = 12 mA output pad (TSMC40nm)
// Tri-State Output Pad with Limited Slew Rate, High-Volt Tolerant
`define BSG_PAD_OUTPUT_C PRT12DGZ
`define BSG_PAD_OUTPUT_D PRT12DGZ

// PRT12DGZ = 12 mA output pad (TSMC40nm)
`define BSG_PAD_OUTPUT_SLOW PRT12DGZ

// PDT12DGZ = 12 mA output pad (TSMC40nm)
// Tri-State Output Pad, High-Volt Tolerant, NO slew control
// for miscellaneous outputs that need to be fast (like the clock output pin for debug)
`define BSG_PAD_OUTPUT_FAST PDT12DGZ

// PDT12DGZ = 2 mA output pad (TSMC40nm)
`define BSG_PAD_DISABLE PDT02DGZ

//PRB12DGZ = 12 mA inout pad (TSMC40nm).
//Tri-State Output Pad with Input and Limited Slew Rate, High-Volt Tolerant
//PAD Cap = 3.67 pF
//DRAM output voltage measuring load: 20pF, 50O Transmition line.
`define BSG_PAD_INOUT PRB12DGZ
