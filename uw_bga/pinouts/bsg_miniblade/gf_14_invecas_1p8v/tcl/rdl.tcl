# set_attribute [get_nets p_pad_*] physical_status unrestricted
# remove_objects [add_to_collection [get_shapes -filter "shape_use==rdl"] [get_vias -filter "shape_use==rdl"]]

################################################################################
#
# DRAW RDL FOR THE SIGNALS
#
################################################################################

set     rdl_nets [list]
# lappend rdl_nets p_pad_DISABLE_i ;# This signal is hand routed...
lappend rdl_nets p_pad_LINK_0_o
lappend rdl_nets p_pad_LINK_1_o
lappend rdl_nets p_pad_LINK_clk_o
lappend rdl_nets p_pad_LINK_tkn_i
lappend rdl_nets p_pad_LINK_v_o
lappend rdl_nets p_pad_LINK_2_o
lappend rdl_nets p_pad_LINK_3_o
lappend rdl_nets p_pad_MON_clk_o
lappend rdl_nets p_pad_EXT_clk_i
lappend rdl_nets p_pad_TAG_clk_i
lappend rdl_nets p_pad_TAG_data_i
lappend rdl_nets p_pad_LINK_3_i
lappend rdl_nets p_pad_LINK_2_i
lappend rdl_nets p_pad_LINK_v_i
lappend rdl_nets p_pad_LINK_clk_i
lappend rdl_nets p_pad_LINK_tkn_o
lappend rdl_nets p_pad_LINK_1_i
lappend rdl_nets p_pad_LINK_0_i

set rdl_shape_y 1620.000

foreach rdl_net $rdl_nets {
    create_shape -end_endcap FLUSH -layer {LB:0} -net $rdl_net -path "{725.000 ${rdl_shape_y}} {912.707 ${rdl_shape_y}}" -shape_type path -shape_use rdl -start_endcap FLUSH -width 10.000
    create_via -net $rdl_net -orientation R0 -origin "907.407 ${rdl_shape_y}" -pitch {7.000 6.400} -shape_use rdl -size {2 2} -via_def {VV_XX_50_50_50_50_VV}
    set_attribute [get_nets $rdl_net] physical_status locked
    set rdl_shape_y [expr $rdl_shape_y - 80]
}

# Hand route for p_pad_DISABLE_i
set _ [create_shape -end_endcap OCTAGON -layer {LB:0} -net {p_pad_DISABLE_i} -path {{275.0000 1620.0000} {355.0000 1700.0000}} -shape_type path -shape_use rdl -start_endcap OCTAGON -width 10.0000]
set _ [create_shape -end_endcap FLUSH -layer {LB:0} -net {p_pad_DISABLE_i} -path {{355.0000 1700.0000} {912.7070 1700.0000}} -shape_type path -shape_use rdl -start_endcap FLUSH -width 10.0000]
set _ [create_via -net {p_pad_DISABLE_i} -orientation R0 -origin {907.4070 1700.0000} -pitch {7.0000 6.4000} -shape_use rdl -size {2 2} -via_def {VV_XX_50_50_50_50_VV}]
set_attribute [get_nets p_pad_DISABLE_i] physical_status locked

################################################################################
#
# DRAW RDL FOR THE SUPPLY
#
################################################################################

set     rdl_nets [list]
lappend rdl_nets VDDIO
lappend rdl_nets VSSIO
lappend rdl_nets VDD
lappend rdl_nets VSS
lappend rdl_nets VDDIO
lappend rdl_nets VSSIO
lappend rdl_nets VDD
lappend rdl_nets VSS
lappend rdl_nets VDD
lappend rdl_nets VSSIO
lappend rdl_nets VDDIO
lappend rdl_nets VSS
lappend rdl_nets VDD
lappend rdl_nets VSSIO
lappend rdl_nets VDDIO

set rdl_shape_y0 1491.450
set rdl_shape_y1 1508.550
set rdl_via_y    1500.000

foreach rdl_net $rdl_nets {
    create_shape -end_endcap FLUSH -layer {LB:0} -net $rdl_net -path "{907.407 $rdl_shape_y0} {907.407 $rdl_shape_y1}" -shape_type path -shape_use rdl -start_endcap FLUSH -width 10.000
    create_via -net $rdl_net -orientation R90 -origin "907.407 $rdl_via_y" -pitch {4.500 6.400} -shape_use rdl -size {2 4} -via_def {VV_XX_50_50_50_50_VV}
    set rdl_shape_y0 [expr $rdl_shape_y0 - 80]
    set rdl_shape_y1 [expr $rdl_shape_y1 - 80]
    set rdl_via_y    [expr $rdl_via_y    - 80]
}
