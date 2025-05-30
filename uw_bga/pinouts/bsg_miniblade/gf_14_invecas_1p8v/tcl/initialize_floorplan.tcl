  # BSG-STD: Initialize the floorplan with the exact die size (even if the
  # control_type is set to die, the tools prioritize the core_offset so it is
  # actaully a little tricky to get an exact die_size).
  bsg_initialize_floorplan_die_core_xy 1000 1900 812.952 1699.68 21.024 100.16

  # BSG-STD: Draw a crackstop (just for visual reasons, not mapped to any
  # layers when GDS is dumpped)
  bsg_draw_crackstop 1000 1900
