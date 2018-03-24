
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

# Print a postscript line from (x1,y1) to (x2,y2)
#
def ps_print_line (fid, pad_name, sub_name, x1, y1, x2, y2, color):
  fid.write('%% Wire Bond --> "%s" to "%s"\n' % (pad_name, sub_name))
  fid.write('%s %s moveto\n' % (x1,y1))
  fid.write('%s %s lineto\n' % (x2,y2))
  fid.write('3 setlinewidth\n')
  if color % 2 == 0:
    fid.write('1 0.4 0 setrgbcolor\n')
  else:
    fid.write('1 0 1 setrgbcolor\n')
  fid.write('stroke\n')
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
  elif flag == '--output_inner':
    output_file_inner = value
  elif flag == '--output_outer':
    output_file_outer = value
  else:
    print('Error: unknown flag "%s"' % flag)
    sys.exit(1)

# Remove the file if it already exists
#
if os.path.exists(output_file_inner):
  os.remove(output_file_inner)
if os.path.exists(output_file_outer):
  os.remove(output_file_outer)

# Make the output directory if it doesn't exist
#
if not os.path.exists(os.path.split(output_file_inner)[0]):
  os.makedirs(os.path.split(output_file_inner)[0])
if not os.path.exists(os.path.split(output_file_outer)[0]):
  os.makedirs(os.path.split(output_file_outer)[0])

#
#
wire_bond_map = csv_to_map(die_sub_csv_file, 3)

#
#
img_size  = int(os.environ['IMAGE_SIZE'])
img_scale = int(os.environ['IMAGE_SCALE'])

fid_inner = open(output_file_inner, 'w')
fid_outer = open(output_file_outer, 'w')

for fid in [fid_inner, fid_outer]:
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
  fid.write('0 0 0 setrgbcolor\n')
  fid.write('fill\n')
  fid.write('\n')

for key,val in wire_bond_map.items():
  fid = fid_inner if val['Layer'] == 'Inside' else fid_outer
  if val['Die X'] != '' and val['Die Y'] != '' and val['Subs X'] != '' and val['Subs Y'] != '':
    ps_print_line(fid, val['Pad Name'], val['Net Name'], float(val['Die X'])  * img_scale + img_size // 2,
                                                         float(val['Die Y'])  * img_scale + img_size // 2,
                                                         float(val['Subs X']) * img_scale + img_size // 2,
                                                         float(val['Subs Y']) * img_scale + img_size // 2,
                                                         int(val['Color']))

fid_inner.close()
fid_outer.close()
