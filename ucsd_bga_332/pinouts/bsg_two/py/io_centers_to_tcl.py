#!/usr/bin/python3
import sys

PAD_WIDTH = 30
PAD_HEIGHT = 185

DIE_LL = 204.8
DIE_UR = 4795.2

def print_constraint(side, name, fid=None):
    print('set_pad_physical_constraints -side %d -pad_name %s' % (side, name), file=fid)

def print_mv_obj(ll_x, ll_y, name, fid=None):
    print('move_object -to [list %f %f] [get_cells -all %s]' % (ll_x, ll_y, name), file=fid)

# Open all files
#
pad_centroid_fid = open(sys.argv[1], 'r')
move_to_loc_fid = open('pad_move_to_location_file.tcl', 'w')
phys_constraint_fid = open('pin_pad_physical_constraints.tcl', 'w')

# Corner cells
#
print_constraint(1, 'corner_ul', phys_constraint_fid)
print_constraint(2, 'corner_ur', phys_constraint_fid)
print_constraint(3, 'corner_lr', phys_constraint_fid)
print_constraint(4, 'corner_ll', phys_constraint_fid)
print('', file=phys_constraint_fid)

# Go through each pad, set the phys constraints and move target
#
for line in pad_centroid_fid:
    if not line.startswith('#'):
        items = [i.strip() for i in line.split(',')]

        if items[3] == 'left':
            ll_x = DIE_LL
            ll_y = float(items[2]) - (PAD_WIDTH / 2)
            side = 1

        elif items[3] == 'top':
            ll_x = float(items[1]) - (PAD_WIDTH / 2)
            ll_y = DIE_UR - PAD_HEIGHT
            side = 2

        elif items[3] == 'right':
            ll_x = DIE_UR - PAD_HEIGHT
            ll_y = float(items[2]) - (PAD_WIDTH / 2)
            side = 3

        elif items[3] == 'bottom':
            ll_x = float(items[1]) - (PAD_WIDTH / 2)
            ll_y = DIE_LL
            side = 4

        print_mv_obj(ll_x, ll_y, items[0], move_to_loc_fid)
        print_constraint(side, items[0], phys_constraint_fid)

# Clost all files
#
pad_centroid_fid.close()
move_to_loc_fid .close()
phys_constraint_fid .close()

