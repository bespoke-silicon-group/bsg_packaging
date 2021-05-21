#===============================================================================
# post_io_placement.tcl
#
# Sourced at the end of the place_io script. This is responsible for any last
# minute IO stuff that is specific to the foundry. For this specific foundry,
# this includes IO filler cell insertion, bond pad creation, and some net
# connections for new "physical only" cells created.
#===============================================================================

puts "BSG-info: Running script [info script]\n"

### ROUTE RDL ##################################################################

set io_guide_map [bsg_rdl_create_io_guide_map "$::env(BSG_PACKAGING_PINOUT_SPEC_DIR)/bsg_padring_bump_map.csv"]

bsg_rdl_create_blockages
bsg_rdl_route_io_supply

bsg_rdl_route_guide $io_guide_map DL5
bsg_rdl_route_guide $io_guide_map DL4
bsg_rdl_route_guide $io_guide_map DL3
bsg_rdl_route_guide $io_guide_map DL2
bsg_rdl_route_guide $io_guide_map DL1

bsg_rdl_route_guide $io_guide_map DR5
bsg_rdl_route_guide $io_guide_map DR4
bsg_rdl_route_guide $io_guide_map DR3
bsg_rdl_route_guide $io_guide_map DR2
bsg_rdl_route_guide $io_guide_map DR1

bsg_rdl_route_guide $io_guide_map ML0
bsg_rdl_route_guide $io_guide_map DL0
bsg_rdl_route_guide $io_guide_map IT0
bsg_rdl_route_guide $io_guide_map CT0
bsg_rdl_route_guide $io_guide_map IT1
bsg_rdl_route_guide $io_guide_map DR0
bsg_rdl_route_guide $io_guide_map MR0

bsg_rdl_route_guide $io_guide_map ML1
bsg_rdl_route_guide $io_guide_map DL6
bsg_rdl_route_guide $io_guide_map DL7
bsg_rdl_route_guide $io_guide_map CB0
bsg_rdl_route_guide $io_guide_map DR7
bsg_rdl_route_guide $io_guide_map DR6
bsg_rdl_route_guide $io_guide_map MR1

optimize_rdl_routes -layer LB
bsg_rdl_remove_blockages
report_rdl_routes -open_nets true -create_error_data verification

puts "BSG-info: Completed script [info script]\n"

