#!/usr/bin/python3

# This script is used to generate the manually entered part of the padring/bump
# map CSV specification google sheet. The output of this script can be copied
# and split directly into the sheet.

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

pads_8b_bank = \
[
    ('',      (0, 2)),
    ('',      (0, 0)),
    ('',      (0, 4)),
    ('',      (0, 6)),
    ('',      (0, 8)),
    ('',      (1, 3)),
    ('',      (1, 1)),
    ('',    (1, 5)),
    ('',      (1, 7)),
    ('',    (2, 2)),
    ('',      (2, 0)),
    ('',      (2, 4)),
    ('',    (2, 6)),
    ('',      (2, 8)),
    ('',      (3, 3)),
    ('',      (3, 1)),
    ('',      (3, 5)),
    ('',      (3, 7)),
    ('',    (3, 9)),
    ('',      (4, 2)),
    ('',      (4, 0)),
    ('',      (4, 4)),
    ('',      (4, 6)),
    ('',      (4, 8)),
    ('',      (5, 3)),
    ('',      (5, 1)),
    ('',      (5, 5)),
    ('',      (5, 7)),
]

pads_16b_bank = \
[
    ('', (0, 2)),
    ('', (0, 0)),
    ('', (0, 4)),
    ('', (0, 6)),
    ('', (0, 8)),
    ('', (1, 3)),
    ('', (1, 1)),
    ('', (1, 5)),
    ('', (1, 7)),
    ('', (2, 2)),
    ('', (2, 0)),
    ('', (2, 4)),
    ('', (2, 6)),
    ('', (2, 8)),
    ('', (3, 3)),
    ('', (3, 1)),
    ('', (3, 5)),
    ('', (3, 7)),
    ('', (3, 9)),
    ('', (4, 2)),
    ('', (4, 0)),
    ('', (4, 4)),
    ('', (4, 6)),
    ('', (4, 8)),
    ('', (5, 3)),
    ('', (5, 1)),
    ('', (5, 5)),
    ('', (5, 7)),
    ('', (6, 2)),
    ('', (6, 0)),
    ('', (6, 4)),
    ('', (6, 6)),
    ('', (6, 8)),
    ('', (7, 3)),
    ('', (7, 1)),
    ('', (7, 5)),
    ('', (7, 7)),
    ('', (8, 2)),
    ('', (8, 0)),
    ('', (8, 4)),
    ('', (8, 6)),
    ('', (8, 8)),
    ('', (9, 3)),
    ('', (9, 1)),
    ('', (9, 5)),
    ('', (9, 7)),
    ('', (9, 9)),
    ('', (10, 2)),
    ('', (10, 0)),
    ('', (10, 4)),
    ('', (10, 6)),
    ('', (10, 8)),
    ('', (11, 3)),
    ('', (11, 1)),
    ('', (11, 5)),
    ('', (11, 7)),
]

### begin allocate functions ########################################

def allocate(bump_bank, pad_bank, side, bump_prefix, pad_prefix, start_r, start_c):

  if side == 'right' or side == 'bottom':
    pad_bank = pad_bank[::-1]

  for i,(pad_suffix,(r,c)) in enumerate(pad_bank):

    bump = f'{bump_prefix}_{bump_bank[c][r]}'

    if pad_suffix == 'V18':
      pad = v18(side)
    elif pad_suffix == 'VZZ':
      pad = vzz(side)
    elif pad_suffix == 'VDD_STABLE':
      pad = vdd_stable(side)
    elif pad_suffix == 'VSS_STABLE':
      pad = vss_stable(side)
    else:
      pad = f'{pad_prefix}_{pad_suffix}'

    y, x = ( -1 , -1 )
    y, x = ( start_r + r, start_c + c ) if side == 'left'   else ( y, x )
    y, x = ( start_r - c, start_c + r ) if side == 'top'    else ( y, x )
    y, x = ( start_r + r, start_c - c ) if side == 'right'  else ( y, x )
    y, x = ( start_r + c, start_c + r ) if side == 'bottom' else ( y, x )

    print_row(side, 'pad_' + bump, bump_prefix, i, bump, y, x)

def allocate_16b(side, bump_prefix, pad_prefix, start_r, start_c):
  return allocate(bumps_16b_bank, pads_16b_bank, side, bump_prefix, pad_prefix, start_r, start_c)

def allocate_8b(side, bump_prefix, pad_prefix, start_r, start_c):
  return allocate(bumps_8b_bank, pads_8b_bank, side, bump_prefix, pad_prefix, start_r, start_c)

### end allocate functions ########################################

def print_row(side, pad, guide, order, bump, row, col):
  print(f'{side},{pad},{guide},{order},{bump},{row},{col}')

### left padring

allocate_16b('left', 'DL5', 'dram_ch_l5', 0,  0)
allocate_16b('left', 'DL4', 'dram_ch_l4', 12, 0)
allocate_16b('left', 'DL3', 'dram_ch_l3', 24, 0)
allocate_16b('left', 'DL2', 'dram_ch_l2', 36, 0)
allocate_16b('left', 'DL1', 'dram_ch_l1', 48, 0)

### top padring

print_row('top', 'pad_ML0_0_i', 'ML0', 0, 'ML0_0_i', 59, 9 )
print_row('top', 'pad_ML0_1_i', 'ML0', 1, 'ML0_1_i', 55, 9 )
print_row('top', 'pad_ML0_2_i', 'ML0', 2, 'ML0_2_i', 53, 9 )
print_row('top', 'pad_ML0_3_i', 'ML0', 3, 'ML0_3_i', 58, 10)
print_row('top', 'pad_ML0_4_i', 'ML0', 4, 'ML0_4_i', 56, 10)
print_row('top', 'pad_ML0_5_i', 'ML0', 5, 'ML0_5_i', 54, 10)
print_row('top', 'pad_ML0_6_i', 'ML0', 6, 'ML0_6_i', 52, 10)

allocate_16b('top', 'DL0', 'dram_ch_l0', 59, 11)
allocate_16b('top', 'IT0', 'io_ch_t0',   59, 23)
allocate_8b ('top', 'CT0', 'ctrl_ch_t0', 59, 35)
allocate_16b('top', 'IT1', 'io_ch_t1',   59, 41)
allocate_16b('top', 'DR0', 'dram_ch_r0', 59, 53)

print_row('top', 'pad_MR0_0_i', 'MR0', 0, 'MR0_0_i', 59, 65)
print_row('top', 'pad_MR0_1_i', 'MR0', 1, 'MR0_1_i', 55, 65)
print_row('top', 'pad_MR0_2_i', 'MR0', 2, 'MR0_2_i', 53, 65)

### right padring

allocate_16b('right', 'DR1', 'dram_ch_r1', 48, 74)
allocate_16b('right', 'DR2', 'dram_ch_r2', 36, 74)
allocate_16b('right', 'DR3', 'dram_ch_r3', 24, 74)
allocate_16b('right', 'DR4', 'dram_ch_r4', 12, 74)
allocate_16b('right', 'DR5', 'dram_ch_r5', 0,  74)

### bottom padring

print_row('bottom', 'pad_MR1_0_i', 'MR1', 0, 'MR1_0_i', 1, 65)
print_row('bottom', 'pad_MR1_1_i', 'MR1', 1, 'MR1_1_i', 5, 65)
print_row('bottom', 'pad_MR1_2_i', 'MR1', 2, 'MR1_2_i', 7, 65)
print_row('bottom', 'pad_MR1_3_i', 'MR1', 3, 'MR1_3_i', 0, 64)
print_row('bottom', 'pad_MR1_4_i', 'MR1', 4, 'MR1_4_i', 2, 64)
print_row('bottom', 'pad_MR1_5_i', 'MR1', 5, 'MR1_5_i', 4, 64)
print_row('bottom', 'pad_MR1_6_i', 'MR1', 6, 'MR1_6_i', 6, 64)
print_row('bottom', 'pad_MR1_7_i', 'MR1', 7, 'MR1_7_i', 8, 64)

allocate_16b('bottom', 'DR6', 'dram_ch_r6', 0, 52)
allocate_16b('bottom', 'DR7', 'dram_ch_r7', 0, 40)
allocate_8b ('bottom', 'CB0', 'ctrl_ch_b0', 0, 34)
allocate_16b('bottom', 'DL7', 'dram_ch_l7', 0, 22)
allocate_16b('bottom', 'DL6', 'dram_ch_l6', 0, 10)

print_row('bottom', 'pad_ML1_0_i', 'ML1', 0, 'ML1_0_i', 1, 9)
print_row('bottom', 'pad_ML1_1_i', 'ML1', 1, 'ML1_1_i', 5, 9)
print_row('bottom', 'pad_ML1_2_i', 'ML1', 2, 'ML1_2_i', 7, 9)

### center supply bumps

row = 0
for i,n in enumerate([11,15,17,21,23,27,29,33,35,39,41,45,47,51,53,57,59,63]):
  print_row('center', '-', '-', '-', f'VSS_{row}_{i}', row+9, n)

for j in range(7):
  adj0 = 1 if j==6 else 0
  for k in range(3-adj0):
    row += 1
    for i,n in enumerate(range(10,65,2)):
      print_row('center', '-', '-', '-', f'VDD_{row}_{i}', row+9, n)
    row += 1
    adj1 = 2 if k==2 else 0
    for i,n in enumerate(range(9+adj1,66-adj1,2)):
      print_row('center', '-', '-', '-', f'VSS_{row}_{i}', row+9, n)

row += 1
for i,n in enumerate([10,12,16,18,22,24,28,30,34,36,40,42,46,48,52,54,58,60,64]):
  print_row('center', '-', '-', '-', f'VDD_{row}_{i}', row+9, n)

