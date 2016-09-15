#!/usr/bin/python3

import sys
import os



##################################################################
#                     USER VARIABLES                             #
#                                                                #

# CSV file with pad info
INPUT_PAD_FILE = 'io_pads.csv'

# Die area coordinates
DIE_LL = 204.800
DIE_UR = 4795.200

# Pad widths
CORNER_PAD_WIDTH  = 247.52
POWER_PAD_WIDTH   = 30
SIGNAL_PAD_WIDTH  = 30
BREAKER_PAD_WIDTH = 20

# Filler cell widths in decending order
FILLER_CELLS = [20, 10, 5, 1, 0.5, 0.005]

# Rotation -- 0 = no, 1 = 90 degrees clockwise
ROTATE = 0

# If rotating, can generate a new csv
PRINT_NEW_IO_PAD_CSV = 0

#                                                                #
#                                                                #
##################################################################



# Chip side enum
LEFT   = 0
TOP    = 1
RIGHT  = 2
BOTTOM = 3

# Remove floating point error to 3 decimal points
FLOAT_ERR         = 1000

DIE_LL            = int(DIE_LL * FLOAT_ERR)
DIE_UR            = int(DIE_UR * FLOAT_ERR)
CORNER_PAD_WIDTH  = int(CORNER_PAD_WIDTH * FLOAT_ERR)
POWER_PAD_WIDTH   = int(POWER_PAD_WIDTH * FLOAT_ERR)
SIGNAL_PAD_WIDTH  = int(SIGNAL_PAD_WIDTH * FLOAT_ERR)
BREAKER_PAD_WIDTH = int(BREAKER_PAD_WIDTH * FLOAT_ERR)
FILLER_CELLS      = [int(F * FLOAT_ERR) for F in FILLER_CELLS]

# 2D list for printing out all generated filler cells
all_fillers = [[] for F in FILLER_CELLS]



###########################################################
# Entry Point
#
def main():

    # 2D list of all pads in the csv file
    pads        = [[], [], [], []]
    sorted_pads = [[], [], [], []]

    # Read in all the pads from csv file
    with open(INPUT_PAD_FILE, 'r') as fid:
        for line in fid:
            if not line.startswith('#'):
                items = line.split(',')
                pad_name = str(items[0]).strip()
                center = int(round(int(float(items[1])*FLOAT_ERR), -2))
                side = str(items[2]).strip()
                if side == 'top':
                    pads[TOP].append( (pad_name, center) )
                elif side == 'bottom':
                    pads[BOTTOM].append( (pad_name, center) )
                elif side == 'left':
                    pads[LEFT].append( (pad_name, center) )
                elif side == 'right':
                    pads[RIGHT].append( (pad_name, center) )
    
    # Sort by center value
    sorted_pads[TOP]    = sorted(pads[TOP],    key=lambda x: x[1])
    sorted_pads[BOTTOM] = sorted(pads[BOTTOM], key=lambda x: x[1])
    sorted_pads[LEFT]   = sorted(pads[LEFT],   key=lambda x: x[1])
    sorted_pads[RIGHT]  = sorted(pads[RIGHT],  key=lambda x: x[1])

    # Swap and invert if rotating
    if ROTATE:
        sorted_pads = rotate_pads_list(sorted_pads)
        sorted_pads[LEFT]  = sorted(invert_distances(sorted_pads[LEFT]),  key=lambda x: x[1])
        sorted_pads[RIGHT] = sorted(invert_distances(sorted_pads[RIGHT]), key=lambda x: x[1])

    # Create a new csv
    if PRINT_NEW_IO_PAD_CSV:
        print('# New io-pad csv: ROTATE=%d' % ROTATE)
        print('#')
        print('#padname,center,side')
        for index, pads in enumerate(sorted_pads):
            if index == TOP:
                side = 'top'
            elif index == BOTTOM:
                side = 'bottom'
            elif index == LEFT:
                side = 'left'
            elif index == RIGHT:
                side = 'right'
            for pad in pads:
                print('%s,%f,%s' % (pad[0], float(pad[1] /FLOAT_ERR), side))
        print('')

    # Print out the pin_pad_physical_constraints for all 4 sides
    print('### GOES IN pin_pad_physical_constraints.tcl')
    print('#')
    print_physical_constraints(LEFT,   sorted_pads[LEFT])
    print_physical_constraints(TOP,    sorted_pads[TOP])
    print_physical_constraints(RIGHT,  sorted_pads[RIGHT])
    print_physical_constraints(BOTTOM, sorted_pads[BOTTOM])
    print('')

    # Print out the filler cells for physical_only_cells_creation_file
    print('### GOES IN physical_only_cells_creation_file.tcl')
    print('#')
    for i, f in enumerate(FILLER_CELLS):
        print('create_cell {%s} <PAD FILLER %f>' % (' '.join(all_fillers[i]), float(f / FLOAT_ERR)))
    print('')



###########################################################
# Returns a list of fillers to get from d1 to d2
#
def print_physical_constraints(side, pads):

    # String definitions based on chip side
    if side == LEFT:
        corner_suffix = 'ul'
        filler_letter = 'L'
    elif side == TOP:
        corner_suffix = 'ur'
        filler_letter = 'T'
    elif side == RIGHT:
        corner_suffix = 'lr'
        filler_letter = 'R'
    elif side == BOTTOM:
        corner_suffix = 'll'
        filler_letter = 'B'

    # Coner cell constraint
    print_constraint(side, 'corner_' + corner_suffix)

    dist = DIE_LL + CORNER_PAD_WIDTH    # Used to measure how far we have gone
    order = 1                           # Order flag counter
    filler_count = 0                    # Inserted filler counter

    # Go through each pad in the csv and place it using fillers
    # to make sure the centers are aligned
    for index, pad in enumerate(pads):
        pad_name   = pad[0]
        pad_center = pad[1]

        # Figure out the pad width
        if 'VDD' in pad_name or 'VSS' in pad_name or 'V33' in pad_name or 'VZZ' in pad_name:
            pad_width = POWER_PAD_WIDTH
        elif 'BREAKER' in pad_name:
            pad_width = BREAKER_PAD_WIDTH
        else:
            pad_width = SIGNAL_PAD_WIDTH

        # Insert fillers to fill the gap
        fillers = filler_insert(dist, pad_center - (pad_width // 2))
        if index != 0:
            for f in fillers:
                filler_name = 'FILLER_%s_%d_%d' % (filler_letter, filler_count, f)
                order = print_constraint(side, filler_name, order)
                all_fillers[FILLER_CELLS.index(f)].append(filler_name)
                filler_count = filler_count + 1
        dist = dist + sum(fillers)

        # Pad cell constraint
        order = print_constraint(side, pad_name, order)
        dist = dist + pad_width



###########################################################
# Prints the set_pad_physical_constraints tcl command and
# returns the new order for the next pad
#
def print_constraint(side, name, order=-1):
    cmd = 'set_pad_physical_constraints -side %d -pad_name %s' % (side+1, name)
    if order >= 0:
        cmd = cmd + ' -order ' + str(order)
    print(cmd)
    return order + 1



###########################################################
# Returns a list of fillers to get from d1 to d2
#
def filler_insert(d1, d2):
    ret = []
    delta = d2 - d1
    while delta != 0:
        for filler in FILLER_CELLS:
            if filler <= delta:
                ret.append(filler)
                delta = delta - filler
                break
    return ret



###########################################################
# Rotate the 4 pad lists clockwise
#
def rotate_pads_list(pads):
    temp = pads[LEFT]
    pads[LEFT] = pads[BOTTOM]
    pads[BOTTOM] = pads[RIGHT]
    pads[RIGHT] = pads[TOP]
    pads[TOP] = temp
    return pads



###########################################################
# Rotate the 4 pad lists clockwise
#
def invert_distances(pads):
    ret = []
    for pad in pads:
        dist = pad[1] - DIE_LL
        newcenter = DIE_UR + pad[1]
        ret.append( (pad[0], newcenter) )
    return ret



# Start at main()
if __name__ == '__main__':
    main()

