#===============================================================================
# physical_only_cell_creation_file.tcl
#
# Note: the name of this file is misleading. These cells are not just "physical
# only" cells!
#
# This script is responsible for creating any additional IO cells that we need
# that are not present in the netlist. This includes corner cells, supply
# cells, and any other cells that might be required for the IO pad ring.
#===============================================================================

puts "BSG-info: Running script [info script]\n"

create_cell corner_io_filler_0 */IN12LP_GPIO18_13M9S30P_CORNER
create_cell corner_io_filler_1 */IN12LP_GPIO18_13M9S30P_CORNER
create_cell corner_io_filler_2 */IN12LP_GPIO18_13M9S30P_CORNER
create_cell corner_io_filler_3 */IN12LP_GPIO18_13M9S30P_CORNER

puts "BSG-info: Completed script [info script]\n"

