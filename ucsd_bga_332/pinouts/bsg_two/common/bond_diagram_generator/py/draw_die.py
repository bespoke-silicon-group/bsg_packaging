
import sys
import os

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

def ps_print_box (fid, pad_name, sub_name, x1, y1, x2, y2, color):
  fid.write('%% Pad box --> "%s" to "%s"\n' % (pad_name, sub_name))
  fid.write('newpath\n')
  fid.write('\t%d\t%d\tmoveto\n' % (x1, y1))
  fid.write('\t%d\t%d\tlineto\n' % (x1, y2))
  fid.write('\t%d\t%d\tlineto\n' % (x2, y2))
  fid.write('\t%d\t%d\tlineto\n' % (x2, y1))
  fid.write('closepath\n')
  fid.write('1 0.078 0.576 setrgbcolor\n')
  fid.write('fill\n')
  fid.write('\n')

# File paths
#
die_sub_csv_file  = None
output_file       = None

# Go through command line arguments
#
for flag,value in zip(sys.argv[1::2], sys.argv[2::2]):
  if flag == '--die_sub_csv_file':
    die_sub_csv_file = value
  elif flag == '--output_file':
    output_file = value
  else:
    print('Error: unknown flag "%s"' % flag)
    sys.exit(1)

# Remove the file if it already exists
#
if os.path.exists(output_file):
  os.remove(output_file)

# Make the output directory if it doesn't exist
#
if not os.path.exists(os.path.split(output_file)[0]):
  os.makedirs(os.path.split(output_file)[0])

#
#
wire_bond_map = csv_to_map(die_sub_csv_file, 3)

img_size  = int(os.environ['DIE_SIZE'])
img_scale = int(os.environ['IMAGE_SCALE'])

fid = open(output_file, 'w')

fid.write('%!PS\n')
fid.write('%%%%BoundingBox: 0 0 %d %d\n' % (img_size, img_size))
fid.write('\n')
fid.write('% Draw the background\n')
fid.write('newpath\n')
fid.write('\t0\t0\tmoveto\n')
fid.write('\t0\t%d\tlineto\n'  % (img_size))
fid.write('\t%d\t%d\tlineto\n' % (img_size, img_size))
fid.write('\t%d\t0\tlineto\n'  % (img_size))
fid.write('closepath\n')
fid.write('0.2 0.2 0.2 setrgbcolor\n')
fid.write('fill\n')
fid.write('\n')

for key,val in wire_bond_map.items():
  ps_print_box(fid, val['Pad Name'], val['Net Name'], (float(val['Die X']) - (float(val['Width'] ) / 2.0)) * img_scale + img_size // 2,
                                                       (float(val['Die Y']) - (float(val['Height']) / 2.0)) * img_scale + img_size // 2,
                                                       (float(val['Die X']) + (float(val['Width'] ) / 2.0)) * img_scale + img_size // 2,
                                                       (float(val['Die Y']) + (float(val['Height']) / 2.0)) * img_scale + img_size // 2,
                                                       0)

fid.close()
