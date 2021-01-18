#!/usr/bin/python3

# This script is used to generate the manually entered part of the padring/bump
# map CSV specification google sheet. The output of this script can be copied
# and split directly into the sheet.

die_size_x = 11000
die_size_y = 9000

num_bumps_x = 75
num_bumps_y = 60

bump_pitch_x = 141
bump_pitch_y = 142

bump_offset_x = (die_size_x - ((num_bumps_x-1) * bump_pitch_x)) / 2.0
bump_offset_y = (die_size_y - ((num_bumps_y-1) * bump_pitch_y)) / 2.0

bumps_8b_bank = \
[
  [      'V18_0',          '-',      'V18_1',          '-',      'V18_2',          '-', ],
  [          '-',      'VZZ_0',          '-',      'VZZ_1',          '-',      'VZZ_2', ],
  [        '0_o',          '-',      'clk_o',          '-',        '5_o',          '-', ],
  [          '-',        '2_o',          '-',        '4_o',          '-',        '7_o', ],
  [        '1_o',          '-',        '3_o',          '-',        '6_o',          '-', ],
  [          '-',      'tkn_o',          '-',        'v_i',          '-',        'v_o', ],
  [        '0_i',          '-',      'clk_i',          '-',        '5_i',          '-', ],
  [          '-',        '2_i',          '-',        '4_i',          '-',        '7_i', ],
  [        '1_i',          '-',        '3_i',          '-',        '6_i',          '-', ],
  [          '-',          '-',          '-',       'tkn_i',         '-',          '-', ],
]

pad_order_8b_bank = \
[
  ( (0, 2),    0 ),  # 0_o
  ( (0, 0),  '-' ),  # V18_0
  ( (0, 4),    1 ),  # 1_o
  ( (0, 6),    2 ),  # 0_i
  ( (0, 8),    3 ),  # 1_i
  ( (1, 3),    4 ),  # 2_o
  ( (1, 1),  '-' ),  # VZZ_0
  ( (1, 5),    5 ),  # tkn_o
  ( (1, 7),    6 ),  # 2_i
  ( (2, 2),    7 ),  # clk_o
  ( (2, 0),  '-' ),  # V18_1
  ( (2, 4),    8 ),  # 3_o
  ( (2, 6),    9 ),  # clk_i
  ( (2, 8),   10 ),  # 3_i
  ( (3, 3),   11 ),  # 4_o
  ( (3, 1),  '-' ),  # VZZ_1
  ( (3, 5),   12 ),  # v_i
  ( (3, 7),   13 ),  # 4_i
  ( (3, 9),   14 ),  # tkn_i
  ( (4, 2),   15 ),  # 5_o
  ( (4, 0),  '-' ),  # V18_2
  ( (4, 4),   16 ),  # 6_o
  ( (4, 6),   17 ),  # 5_i
  ( (4, 8),   18 ),  # 6_i
  ( (5, 3),   19 ),  # 7_o
  ( (5, 1),  '-' ),  # VZZ_2
  ( (5, 5),   20 ),  # v_o
  ( (5, 7),   21 ),  # 7_i
]

bumps_16b_bank = \
[
  [      'V18_0',          '-',      'V18_1',          '-',      'V18_2',          '-',        'V18_3',            '-',      'V18_4',          '-',      'V18_5',          '-', ],
  [          '-',      'VZZ_0',          '-',      'VZZ_1',          '-',      'VZZ_2',            '-',        'VZZ_3',          '-',      'VZZ_4',          '-',      'VZZ_5', ],
  [        '0_o',          '-',        '4_o',          '-',        '9_o',          '-',        'clk_o',            '-',        'v_o',          '-',       '13_o',          '-', ],
  [          '-',        '3_o',          '-',        '7_o',          '-',      'tkn_o',            '-', 'VSS_stable_1',          '-',       '12_o',          '-',       '15_o', ],
  [        '1_o',          '-',        '5_o',          '-',        '8_o',          '-', 'VSS_stable_0',            '-',       '11_o',          '-',       '14_o',          '-', ],
  [          '-',        '2_o',          '-',        '6_o',          '-',       '10_o',            '-',        'tkn_i',          '-',       '12_i',          '-',    'extra_o', ],
  [        '0_i',          '-',        '3_i',          '-',        '7_i',          '-',        'clk_i',            '-',        'v_i',          '-',       '13_i',          '-', ],
  [          '-',        '2_i',          '-',        '6_i',          '-',        '9_i',            '-', 'VSS_stable_2',          '-',       '11_i',          '-',       '15_i', ],
  [        '1_i',          '-',        '4_i',          '-',        '8_i',          '-', 'VDD_stable_0',            '-',    'extra_i',          '-',       '14_i',          '-', ],
  [          '-',          '-',          '-',        '5_i',          '-',          '-',            '-',            '-',          '-',       '10_i',          '-',          '-', ],
]

pad_order_16b_bank = \
[
  ( (0,  2),    0 ),    # 0_o
  ( (0,  0),  '-' ),    # V18_0
  ( (0,  4),    1 ),    # 1_o
  ( (0,  6),    2 ),    # 0_i
  ( (0,  8),    3 ),    # 1_i
  ( (1,  3),    4 ),    # 3_o
  ( (1,  1),  '-' ),    # VZZ_0
  ( (1,  5),    5 ),    # 2_o
  ( (1,  7),    6 ),    # 2_i
  ( (2,  2),    7 ),    # 4_o
  ( (2,  0),  '-' ),    # V18_1
  ( (2,  4),    8 ),    # 5_o
  ( (2,  6),    9 ),    # 3_i
  ( (2,  8),   10 ),    # 4_i
  ( (3,  3),   11 ),    # 7_o
  ( (3,  1),  '-' ),    # VZZ_1
  ( (3,  5),   12 ),    # 6_o
  ( (3,  7),   13 ),    # 6_i
  ( (3,  9),   14 ),    # 5_i
  ( (4,  2),   15 ),    # 9_o
  ( (4,  0),  '-' ),    # V18_2
  ( (4,  4),   16 ),    # 8_o
  ( (4,  6),   17 ),    # 7_i
  ( (4,  8),   18 ),    # 8_i
  ( (5,  3),   19 ),    # tkn_o
  ( (5,  1),  '-' ),    # VZZ_2
  ( (5,  5),   20 ),    # 10_o
  ( (5,  7),   21 ),    # 9_i
  ( (6,  2),   22 ),    # clk_o
  ( (6,  0),  '-' ),    # V18_3
  ( (6,  4),   23 ),    # VSS_stable_0
  ( (6,  6),   24 ),    # clk_i
  ( (6,  8),   25 ),    # VDD_stable_0
  ( (7,  1),  '-' ),    # VZZ_3
  ( (7,  3),   26 ),    # VSS_stable_1
  ( (7,  5),   27 ),    # tkn_i
  ( (7,  7),   28 ),    # VSS_stable_2
  ( (8,  2),   29 ),    # v_o
  ( (8,  0),  '-' ),    # V18_4
  ( (8,  4),   30 ),    # 11_o
  ( (8,  6),   31 ),    # v_i
  ( (8,  8),   32 ),    # extra_i
  ( (9,  3),   33 ),    # 12_o
  ( (9,  1),  '-' ),    # VZZ_4
  ( (9,  5),   34 ),    # 12_i
  ( (9,  7),   35 ),    # 11_i
  ( (9,  9),   36 ),    # 10_i
  ( (10, 2),   37 ),    # 13_o
  ( (10, 0),  '-' ),    # V18_5
  ( (10, 4),   38 ),    # 14_o
  ( (10, 6),   39 ),    # 13_i
  ( (10, 8),   40 ),    # 14_i
  ( (11, 3),   41 ),    # 15_o
  ( (11, 1),  '-' ),    # VZZ_5
  ( (11, 5),   42 ),    # extra_o
  ( (11, 7),   43 ),    # 15_i
]

v18_ctr        = {'left': -1, 'top': -1, 'right': -1, 'bottom': -1}
vzz_ctr        = {'left': -1, 'top': -1, 'right': -1, 'bottom': -1}
vdd_stable_ctr = {'left': -1, 'top': -1, 'right': -1, 'bottom': -1}
vss_stable_ctr = {'left': -1, 'top': -1, 'right': -1, 'bottom': -1}


def v18(side):
  v18_ctr[side] += 1
  return f'V18_{side[0].upper()}_{v18_ctr[side]}'


def vzz(side):
  vzz_ctr[side] += 1
  return f'VZZ_{side[0].upper()}_{vzz_ctr[side]}'


def vdd_stable(side):
  vdd_stable_ctr[side] += 1
  return f'VDD_STABLE_{side[0].upper()}_{vdd_stable_ctr[side]}'


def vss_stable(side):
  vss_stable_ctr[side] += 1
  return f'VSS_STABLE_{side[0].upper()}_{vss_stable_ctr[side]}'


def allocate_16b(side, guide, start_r, start_c):
  return allocate(bumps_16b_bank, pad_order_16b_bank, side, guide, start_r, start_c)


def allocate_8b(side, guide, start_r, start_c):
  return allocate(bumps_8b_bank, pad_order_8b_bank, side, guide, start_r, start_c)


def allocate(bump_bank, pad_order, side, guide, start_r, start_c):
  if side == 'right' or side == 'bottom':
    pad_order = pad_order[::-1]
  for pad_order,((r,c),rdl_order)in enumerate(pad_order):
    bump = f'{guide}_{bump_bank[c][r]}'
    y, x = ( -1 , -1 )
    y, x = ( start_r + r, start_c + c ) if side == 'left'   else ( y, x )
    y, x = ( start_r - c, start_c + r ) if side == 'top'    else ( y, x )
    y, x = ( start_r + r, start_c - c ) if side == 'right'  else ( y, x )
    y, x = ( start_r + c, start_c + r ) if side == 'bottom' else ( y, x )
    print_row(side, guide, pad_order, rdl_order, bump, y, x)


def print_row(side, guide, pad_order, rdl_order, bump, row, col, pad=None):

  pad = 'pad_' + bump if not pad else pad

  if "V18" in bump:
    pkg_bump_name = "V18"
    net_name = "VDDIO"
  elif "VZZ" in bump:
    pkg_bump_name = "VSS"
    net_name = "VSSIO"
  elif "VSS_stable" in bump:
    pkg_bump_name = "VSS_stable"
    net_name = "VSS_stable"
  elif "VDD_stable" in bump:
    pkg_bump_name = "VDD_stable"
    net_name = "VDD_stable"
  elif "VSS" in bump:
    pkg_bump_name = "VSS"
    net_name = "VSS"
  elif "VDD" in bump:
    pkg_bump_name = "VDD"
    net_name = "VDD"
  else:
    pkg_bump_name = bump
    net_name = "p_" + pad

  bump_x = col * bump_pitch_x + bump_offset_x
  bump_y = row * bump_pitch_y + bump_offset_y
  bump_die_x = bump_x - (die_size_x / 2.0)
  bump_die_y = bump_y - (die_size_y / 2.0)

  print(f'{side},{pad},{guide},{pad_order},{rdl_order},{bump},{row},{col},{pkg_bump_name},{net_name},{bump_x},{bump_y},{bump_die_x},{bump_die_y}')

################################################################################

### print header

side_h          = 'Side'
pad_h           = 'Pad Name'
guide_h         = 'IO Guide'
pad_order_h     = 'IO Order'
rdl_order_h     = 'RDL Routing Order'
bump_h          = 'Bump Name'
row_h           = 'Bump Row'
col_h           = 'Bump Col'
pkg_bump_name_h = 'Packaging Bump Name'
net_name_h      = 'Net Name'
bump_x_h        = 'Bump Center X (Relative to LL Corner) (um)'
bump_y_h        = 'Bump Center Y (Relative to LL Corner) (um)'
bump_die_x_h    = 'Bump Center X (Relative to Die Center) (um)'
bump_die_y_h    = 'Bump Center Y (Relative to Die Center) (um)'

print(f'{side_h},{pad_h},{guide_h},{pad_order_h},{rdl_order_h},{bump_h},{row_h},{col_h},{pkg_bump_name_h},{net_name_h},{bump_x_h},{bump_y_h},{bump_die_x_h},{bump_die_y_h}')

### left padring

allocate_16b('left', 'DL5', 0,  0)
allocate_16b('left', 'DL4', 12, 0)
allocate_16b('left', 'DL3', 24, 0)
allocate_16b('left', 'DL2', 36, 0)
allocate_16b('left', 'DL1', 48, 0)

### top padring

# MISC LEFT 0
print_row('top', 'ML0', 0, 0, 'ML0_0_i', 59, 9 )
print_row('top', 'ML0', 1, 1, 'ML0_1_i', 55, 9 )
print_row('top', 'ML0', 2, 2, 'ML0_2_i', 53, 9 )
print_row('top', 'ML0', 3, 6, 'ML0_6_i', 52, 10)
print_row('top', 'ML0', 4, 5, 'ML0_5_i', 54, 10)
print_row('top', 'ML0', 5, 3, 'ML0_3_i', 58, 10)
print_row('top', 'ML0', 6, 4, 'ML0_4_i', 56, 10)

allocate_16b('top', 'DL0', 59, 11)
allocate_16b('top', 'IT0', 59, 23)
allocate_8b ('top', 'CT0', 59, 35)
allocate_16b('top', 'IT1', 59, 41)
allocate_16b('top', 'DR0', 59, 53)

# MISC RIGHT 0
print_row('top', 'MR0', 0, 2, 'MR0_2_i', 53, 65)
print_row('top', 'MR0', 1, 1, 'MR0_1_i', 55, 65)
print_row('top', 'MR0', 2, 0, 'MR0_0_i', 59, 65)

### right padring

allocate_16b('right', 'DR1', 48, 74)
allocate_16b('right', 'DR2', 36, 74)
allocate_16b('right', 'DR3', 24, 74)
allocate_16b('right', 'DR4', 12, 74)
allocate_16b('right', 'DR5', 0,  74)

### bottom padring

# MISC RIGHT 1
print_row('bottom', 'MR1', 0, 0, 'MR1_5_i', 1, 65)
print_row('bottom', 'MR1', 1, 1, 'MR1_6_i', 5, 65)
print_row('bottom', 'MR1', 2, 2, 'MR1_7_i', 7, 65)
print_row('bottom', 'MR1', 3, 7, 'MR1_4_i', 8, 64)
print_row('bottom', 'MR1', 4, 6, 'MR1_3_i', 6, 64)
print_row('bottom', 'MR1', 5, 3, 'MR1_0_i', 0, 64)
print_row('bottom', 'MR1', 6, 4, 'MR1_1_i', 2, 64)
print_row('bottom', 'MR1', 7, 5, 'MR1_2_i', 4, 64)

allocate_16b('bottom', 'DR6', 0, 52)
allocate_16b('bottom', 'DR7', 0, 40)
allocate_8b ('bottom', 'CB0', 0, 34)
allocate_16b('bottom', 'DL7', 0, 22)
allocate_16b('bottom', 'DL6', 0, 10)

# MISC LEFT 1
print_row('bottom', 'ML1', 0, 2, 'ML1_2_i', 7, 9)
print_row('bottom', 'ML1', 1, 1, 'ML1_1_i', 5, 9)
print_row('bottom', 'ML1', 2, 0, 'ML1_0_i', 1, 9)

### center supply bumps

row = 0
for i,n in enumerate([11,15,17,21,23,27,29,33,35,39,41,45,47,51,53,57,59,63]):
  print_row('center', '-', '-', '-', f'VSS_{row}_{i}', row+9, n, '-')

for j in range(7):
  adj0 = 1 if j==6 else 0
  for k in range(3-adj0):
    row += 1
    for i,n in enumerate(range(10,65,2)):
      print_row('center', '-', '-', '-', f'VDD_{row}_{i}', row+9, n, '-')
    row += 1
    adj1 = 2 if k==2 else 0
    for i,n in enumerate(range(9+adj1,66-adj1,2)):
      print_row('center', '-', '-', '-', f'VSS_{row}_{i}', row+9, n, '-')

row += 1
for i,n in enumerate([10,12,16,18,22,24,28,30,34,36,40,42,46,48,52,54,58,60,64]):
  print_row('center', '-', '-', '-', f'VDD_{row}_{i}', row+9, n, '-')

