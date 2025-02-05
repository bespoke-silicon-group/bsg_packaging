
################################
# CONSTANTS
################################

set all_pads_csv_filename     "all_pads.csv"
set vdd_pads_csv_filename     "vdd_pads.csv"
set v18_pads_csv_filename     "v18_pads.csv"
set vss_vzz_pads_csv_filename "vss_vzz_pads.csv"
set supply_pads_csv_filename  "supply_pads.csv"
set signal_pads_csv_filename  "signal_pads.csv"

set DIE_WIDTH               [die_width]
set DIE_HEIGHT              [die_height]

set PAD_GLASS_WIDTH         0.044 ;# manually measured
set PAD_GLASS_HEIGHT        0.075 ;# manually measured
set PAD_GLASS_CENTER_OFFSET 2.500 ;# manually measured

################################
# PAD COLLECTIONS
################################

set all_pads     [get_cells -hier "*_PAD"]
set vdd_pads     [get_cells -hier "vdd_*_PAD"]
set v18_pads     [get_cells -hier "v18_*_PAD"]
set vss_vzz_pads [get_cells -hier "vss_*_PAD vzz_*_PAD"]

set supply_pads [list]
append_to_collection supply_pads $vdd_pads
append_to_collection supply_pads $v18_pads
append_to_collection supply_pads $vss_vzz_pads

set signal_pads [remove_from_collection $all_pads $supply_pads]

################################
# ORDERED PADS PER SIDE
################################

set west_pads  [list]
set north_pads [list]
set east_pads  [list]
set south_pads [list]

foreach_in_collection pad $all_pads {
  set gpio             [get_cells -hier [string map {_PAD {}} [get_object_name $pad]]]
  set gpio_ref         [get_attribute $gpio ref_name]
  set gpio_orientation [get_attribute $gpio orientation]
  if {[string match *_H $gpio_ref] && $gpio_orientation == "R0"} {
    append_to_collection west_pads $pad
  } elseif {[string match *_V $gpio_ref] && $gpio_orientation == "R180"} {
    append_to_collection north_pads $pad
  } elseif {[string match *_H $gpio_ref] && $gpio_orientation == "R180"} {
    append_to_collection east_pads $pad
  } elseif {[string match *_V $gpio_ref] && $gpio_orientation == "R0"} {
    append_to_collection south_pads $pad
  } else {
    puts "Error: Unknown side for gpio [get_object_name $gpio]"
  }
}

set east_pads  [sort_collection -descending $east_pads   bounding_box.ll_y]
set south_pads [sort_collection -descending $south_pads  bounding_box.ll_x]
set west_pads  [sort_collection             $west_pads   bounding_box.ll_y]
set north_pads [sort_collection             $north_pads  bounding_box.ll_x]

################################
# CREATE CSV LIST FOR ALL PADS
################################

set counter 1
set csv_row_list [list]

### EAST PADS ###

foreach_in_collection pad $east_pads {
  set orientation [get_attribute $pad orientation]
	set llx         [get_attribute $pad bounding_box.ll_x]
	set urx         [get_attribute $pad bounding_box.ur_x]
	set lly         [get_attribute $pad bounding_box.ll_y]
	set ury         [get_attribute $pad bounding_box.ur_y]
	set cx          [expr ($urx + $llx) / 2.0]
	set cy          [expr ($ury + $lly) / 2.0]

  set row [list]

  lappend row $counter
  lappend row [get_object_name $pad]
  lappend row "E"

  if {$orientation == "MXR90"} {
    lappend row "I"
    lappend row [expr (($cx - $PAD_GLASS_CENTER_OFFSET) - $DIE_WIDTH/2)/1000.0]
    lappend row [expr ($cy - $DIE_HEIGHT/2)/1000.0]
  } elseif {$orientation == "R90"} {
    lappend row "O"
    lappend row [expr (($cx + $PAD_GLASS_CENTER_OFFSET) - $DIE_WIDTH/2)/1000.0]
    lappend row [expr ($cy - $DIE_HEIGHT/2)/1000.0]
  } else {
    puts "Error: east pad [get_object_name $pad] with orientation $orientation"
  }

  lappend row $PAD_GLASS_HEIGHT
  lappend row $PAD_GLASS_WIDTH

  lappend csv_row_list $row
  incr counter
}

### SOUTH PADS ###

foreach_in_collection pad $south_pads {
  set orientation [get_attribute $pad orientation]
	set llx         [get_attribute $pad bounding_box.ll_x]
	set urx         [get_attribute $pad bounding_box.ur_x]
	set lly         [get_attribute $pad bounding_box.ll_y]
	set ury         [get_attribute $pad bounding_box.ur_y]
	set cx          [expr ($urx + $llx) / 2.0]
	set cy          [expr ($ury + $lly) / 2.0]

  set row [list]

  lappend row $counter
  lappend row [get_object_name $pad]
  lappend row "S"

  if {$orientation == "MX"} {
    lappend row "I"
    lappend row [expr ($cx - $DIE_WIDTH/2)/1000.0]
    lappend row [expr (($cy + $PAD_GLASS_CENTER_OFFSET) - $DIE_HEIGHT/2)/1000.0]
  } elseif {$orientation == "R0"} {
    lappend row "O"
    lappend row [expr ($cx - $DIE_WIDTH/2)/1000.0]
    lappend row [expr (($cy - $PAD_GLASS_CENTER_OFFSET) - $DIE_HEIGHT/2)/1000.0]
  } else {
    puts "Error: south pad [get_object_name $pad] with orientation $orientation"
  }

  lappend row $PAD_GLASS_WIDTH
  lappend row $PAD_GLASS_HEIGHT

  lappend csv_row_list $row
  incr counter
}

### WEST PADS ###

foreach_in_collection pad $west_pads {
  set orientation [get_attribute $pad orientation]
	set llx         [get_attribute $pad bounding_box.ll_x]
	set urx         [get_attribute $pad bounding_box.ur_x]
	set lly         [get_attribute $pad bounding_box.ll_y]
	set ury         [get_attribute $pad bounding_box.ur_y]
	set cx          [expr ($urx + $llx) / 2.0]
	set cy          [expr ($ury + $lly) / 2.0]

  set row [list]

  lappend row $counter
  lappend row [get_object_name $pad]
  lappend row "W"

  if {$orientation == "R90"} {
    lappend row "I"
    lappend row [expr (($cx + $PAD_GLASS_CENTER_OFFSET) - $DIE_WIDTH/2)/1000.0]
    lappend row [expr ($cy - $DIE_HEIGHT/2)/1000.0]
  } elseif {$orientation == "MXR90"} {
    lappend row "O"
    lappend row [expr (($cx - $PAD_GLASS_CENTER_OFFSET) - $DIE_WIDTH/2)/1000.0]
    lappend row [expr ($cy - $DIE_HEIGHT/2)/1000.0]
  } else {
    puts "Error: west pad [get_object_name $pad] with orientation $orientation"
  }

  lappend row $PAD_GLASS_HEIGHT
  lappend row $PAD_GLASS_WIDTH

  lappend csv_row_list $row
  incr counter
}

### NORTH PADS ###

foreach_in_collection pad $north_pads {
  set orientation [get_attribute $pad orientation]
	set llx         [get_attribute $pad bounding_box.ll_x]
	set urx         [get_attribute $pad bounding_box.ur_x]
	set lly         [get_attribute $pad bounding_box.ll_y]
	set ury         [get_attribute $pad bounding_box.ur_y]
	set cx          [expr ($urx + $llx) / 2.0]
	set cy          [expr ($ury + $lly) / 2.0]

  set row [list]

  lappend row $counter
  lappend row [get_object_name $pad]
  lappend row "N"

  if {$orientation == "R0"} {
    lappend row "I"
    lappend row [expr ($cx - $DIE_WIDTH/2)/1000.0]
    lappend row [expr (($cy - $PAD_GLASS_CENTER_OFFSET) - $DIE_HEIGHT/2)/1000.0]
  } elseif {$orientation == "MX"} {
    lappend row "O"
    lappend row [expr ($cx - $DIE_WIDTH/2)/1000.0]
    lappend row [expr (($cy + $PAD_GLASS_CENTER_OFFSET) - $DIE_HEIGHT/2)/1000.0]
  } else {
    puts "Error: north pad [get_object_name $pad] with orientation $orientation"
  }

  lappend row $PAD_GLASS_WIDTH
  lappend row $PAD_GLASS_HEIGHT

  lappend csv_row_list $row
  incr counter
}

################################
# DUMP CSV PROC
################################

proc dump_csv { f pad_collection } {
  set csv_data [list]
  foreach_in_collection pad $pad_collection {
    set pad_name [get_object_name $pad]

    set res ""
    foreach row $::csv_row_list {
      if {[lindex $row 1] == $pad_name} {
        set res $row
        break
      }
    }

    if {$res == ""} {
      puts "Error: could not find pad [get_object_name $pad]"
    } else {
      lappend csv_data $res
    }
  }
  set csv_data [lsort -integer -index 0 $csv_data]

  set fid [open $f w]
  puts $fid "Die#,Pad Name,Side,Layer,Die X,Die Y,Width,Height"
  foreach line $csv_data {
    puts $fid [join $line {,}]
  }
  close $fid
}

################################
# DUMP CSV FOR EACH PAD COLLECTION
################################

dump_csv $all_pads_csv_filename     $all_pads
dump_csv $vdd_pads_csv_filename     $vdd_pads
dump_csv $v18_pads_csv_filename     $v18_pads
dump_csv $vss_vzz_pads_csv_filename $vss_vzz_pads
dump_csv $supply_pads_csv_filename  $supply_pads
dump_csv $signal_pads_csv_filename  $signal_pads

