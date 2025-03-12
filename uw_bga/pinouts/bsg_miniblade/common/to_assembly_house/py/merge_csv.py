
import sys
import os
import math

# CSV file to map
#
def csv_to_map (csv_file, key_index):
  res = {}
  with open(csv_file, 'r') as fid:
    keys = None
    for index,line in enumerate(fid):
      els = line.split(',')
      els = [e.strip() for e in els]
      if index == 0:
        keys = els
      else:
        res[els[key_index]] = {}
        for i,e in enumerate(els):
          res[els[key_index]][keys[i]] = e
  return res

sub_csv = csv_to_map(sys.argv[1], 0)
pad_csv = csv_to_map(sys.argv[2], 0)

# Header
print("Die#,Subs#,Net Name,Pad Name,Side,Layer,Length,Bond Angle,Die X,Die Y,Subs X,Subs Y,Width,Height")

for k,pad_v in pad_csv.items():
  sub_v = sub_csv[k]
  sub_x = float(sub_v['Subs X'])
  sub_y = float(sub_v['Subs Y'])
  die_x = float(pad_v['Die X'])
  die_y = float(pad_v['Die Y'])

  # die# and subs#
  row_str  = '%s,%s' % (k,k)
  # Net Name
  row_str += ',%s' % sub_v['Net Name']
  # Pad Name
  row_str += ',%s' % pad_v['Pad Name']
  # Side
  row_str += ',%s' % pad_v['Side']
  # Layer
  row_str += ',%s' % pad_v['Layer']
  # Wire Length
  row_str += ',%f' % math.sqrt((sub_x-die_x)**2 + (sub_y-die_y)**2)
  # Bond Angle
  row_str += ',%f' % math.degrees(math.atan2(math.fabs(sub_y-die_y),math.fabs(sub_x-die_x)))
  # Die X
  row_str += ',%f' % die_x
  # Die Y
  row_str += ',%f' % die_y
  # Sub X
  row_str += ',%f' % sub_x
  # Sub Y
  row_str += ',%f' % sub_y
  # Width
  row_str += ',%s' % pad_v['Width']
  # Height
  row_str += ',%s' % pad_v['Height']

  print(row_str)

