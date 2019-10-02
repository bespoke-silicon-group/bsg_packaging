// pull in the macros that define I/Os for the chip
// this can also be swapped out for other technology files
// like verilog.

// decoder ring
// TSMC Standard I/O TPZN45GSGV18 Databook
// PCLAMP1ANA ESD Clamp Cell for Core Voltage
// PCLAMP2ANA ESD Clamp Cell for I/O Voltage
// PDB{02,04,08,12,16,24}DGZ Tri-State Output Pad with Input, High-Volt Tolerant
// PDD{02,04,08,12,16,24}DGZ Tri-State Output Pad with Input and Pull-Down, High-Volt Tolerant
// PDDDGZ Input Pad With Pull-down, High-Volt Tolerant
// PDDW{02,04,08,012,16,24}DGZ Tri-State Output Pad with Input and Enable Controlled Pull-Down,
// PDDWDGZ Input Pad with Enable Controlled Pull-Down, High-Volt Tolerant
// PDIDGZ Input Pad, High-Volt Tolerant
// PDO{02,04,08,12,16,24}CDG Output Pad
// PDT{02,04,08,12,16,24}DGZ Tri-State Output Pad, High-Volt Tolerant
// PDU{02,04,08,12,16,24}DGZ Tri-State Output Pad with Input and Pull-Up, High-Volt Tolerant
// PDUDGZ Input Pad With Pull-Up, High-Volt Tolerant
// PDUW{02,04,08,12,16,24}DGZ Tri-State Output Pad with Input and Enable Controlled Pull-Up,
// PDUWDGZ Input Pad with Enable Controlled Pull-Up, High-Volt Tolerant
// PDXO{01,02,03}DG Crystal Oscillator
// PDXOE{1,2,3}DG Crystal Oscillator with High Enable
// PRB{12,16,24}DGZ Tri-State Output Pad with Input and Limited Slew Rate, High-Volt Tolerant
// PRCUT Power-Cut Cell between Digital Domain A and Digital Domain B with VSS Shorted and the Rest of Rails Cut
// PRD{08,12,16,24}DGZ Tri-State Output Pad with Input, Pull-Down, and Limited Slew Rate, High-Volt Tolerant
// PRDW{08,12,16,24}DGZ Tri-State Output Pad with Input, Limited Slew Rate and Enable Controlled Pull-Down, High-Volt Tolerant
// PRDW{12,16,24}DGZ Tri-State Output Pad with Input, Limited Slew Rate and Enable Con-trolled Pull-Down, High-Volt Tolerant
// PRO{08,12,16,24}CDG Output Pad with Limited Slew Rate
// PRT{08,12,16,24}DGZ Tri-State Output Pad with Limited Slew Rate, High-Volt Tolerant
// PRU{08,12,16,24}DGZ Tri-State Output Pad with Input, Pull-Up, and Limited Slew Rate,
// PRUW{08,12,16,24}DGZ Tri-State Output Pad with Input, Limited Slew Rate and Enable Controlled Pull-Up, High-Volt Tolerant
// PVDD1ANA Dedicated Power Supply to Internal Macro with Core Voltage
// PVDD1DGZ Vdd Pad for Core Power Supply
// PVDD2ANA Dedicated Power Supply to Internal Macro with I/O Voltage
// PVDD2DGZ Power Pad for I/O Power Supply
// PVDD2POC Power-on Control Power Pad for I/O Power Supply
// PVSS1ANA Dedicated Ground Supply for PVDD1ANA
// PVSS1DGZ Vss Pad for Core Ground Supply
// PVSS2ANA Dedicated Ground Supply for PVDD2ANA
// PVSS2DGZ Ground Pad for I/O Ground Supply
// PVSS3DGZ Ground Pad for I/O and Core Ground Supply

`define BSG_OUTPUTS_NEED_ENABLES

// PDDDGZ = input with pull down
`define BSG_PAD_INPUT_PULLDOWN PDDDGZ

// PDT12DGZ = 12 mA output pad (TSMC40nm)
// Tri-State Output Pad, High-Volt Tolerant
`define BSG_PAD_OUTPUT_A PDT12DGZ
`define BSG_PAD_OUTPUT_B PDT12DGZ

// PDT12DGZ = 12 mA output pad (TSMC40nm)
// Tri-State Output Pad High-Volt Tolerant
`define BSG_PAD_OUTPUT_C PDT12DGZ
`define BSG_PAD_OUTPUT_D PDT12DGZ

// PDT12DGZ = 12 mA output pad (TSMC40nm)
`define BSG_PAD_OUTPUT_SLOW PDT12DGZ

// for miscellaneous outputs that need to be fast (like the clock output pin for debug)
// PDT12DGZ = 12 mA output pad (TSMC40nm)
// Tri-State Output Pad, High-Volt Tolerant
`define BSG_PAD_OUTPUT_FAST PDT12DGZ

// PDT02DGZ = 2 mA output pad (TSMC40nm)
// Tri-State Output Pad, High-Volt Tolerant
`define BSG_PAD_DISABLE PDT02DGZ

//PDD12DGZ = 12 mA inout pad (TSMC40nm).
//Tri-State Output Pad with Input and Pull-Down, High-Volt Tolerant
//PAD Cap = 3.67 pF
//DRAM output voltage measuring load: 20pF, 50O Transmition line.
`define BSG_PAD_INOUT PDD12DGZ
//`define BSG_PAD_INOUT PDU12DGZ
