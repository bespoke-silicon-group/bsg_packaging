// pull in the macros that define I/Os for the chip
// this can also be swapped out for other technology files
// like verilog.

`define BSG_OUTPUTS_NEED_ENABLES

// PDDDGZ = input with pull down
`define BSG_PAD_INPUT_PULLDOWN PDDDGZ

// PRO12CDG = 12 mA output pad with limited slew rate (TSMC 180 only)
// PRT12DGZ = 12 mA output pad with limited slew rate, enable (TSMC 180, 250)
`define BSG_PAD_OUTPUT_A PRT12DGZ

`define BSG_PAD_OUTPUT_B PRT16DGZ

// PDO12CDG = 12 mA output pad (no slew rate control) (TSMC 180 only)
// PDT12CDG = 12 mA output pad (no slew rate control), enable (TSMC 180,250)
`define BSG_PAD_OUTPUT_C PDT12DGZ

`define BSG_PAD_OUTPUT_D PDT16DGZ

`define BSG_PAD_OUTPUT_SLOW PRT12DGZ

// for miscellaneous outputs that need to be fast (like the clock output pin for debug)
`define BSG_PAD_OUTPUT_FAST PDT12DGZ

`define BSG_PAD_DISABLE PDT02DGZ
