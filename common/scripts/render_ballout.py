#!/usr/bin/python

# parses pinout lists in the format https://bitbucket.org/taylor-bsg/bsg_packaging/src/master/uw_bga/pcb/pinout_list.csv
# and generates a BGA ball pattern.
#
# BGA.A9,CLK_B_I
# BGA.AA1,VSS
# BGA.AA10,VSS
# BGA.AA11,DDR_ADDR_9_O
# BGA.AA12,VSS
# BGA.AA13,V18
#
#
# note: this has not necessarily been verified
#
#


import sys;
import re

max_pin_number = -1;
min_pin_number = 1000000;
min_pin_letter_int = 1000000;
max_pin_letter_int = -1;

format_string = "{0:15}";

pin_to_coord = { 'A': 1,
                 'B': 2,
                 'C': 3,
                 'D': 4,
                 'E': 5,
                 'F': 6,
                 'G': 7,
                 'H': 8,
                 'J': 9,
                 'K': 10,
                 'L': 11,
                 'M': 12,
                 'N': 13,
                 'P': 14,
                 'R': 15,
                 'T': 16,
                 'U': 17,
                 'V': 18,
                 'W': 19,
                 'Y': 20,
                 'AA': 21,
                 'AB': 22,
                 'AC': 23,
                 'AD': 24,
                 'AE': 25,
                 'AF': 26,
                 'AG': 27,
                 'AH': 28
};

coord_to_pin = dict(map(reversed,pin_to_coord.items()));

rows, cols = (28,28)
arr = [[format_string.format("X") for i in range(cols)] for j in range(rows)]

for line in sys.stdin:
    x = line.split(",")
    signal = x[1].strip()
    y = x[0].split(".")
    pin = y[1].strip()
    components = re.split('(\d+)',pin)

    pin_number = int(components[1])
    pin_letter = components[0]
    pin_letter_int = pin_to_coord[pin_letter]
    max_pin_number = max(max_pin_number,pin_number)
    min_pin_number = min(min_pin_number,pin_number)

    max_pin_letter_int = max(max_pin_letter_int,pin_letter_int)
    min_pin_letter_int = min(min_pin_letter_int,pin_letter_int)

    print pin_letter, pin_number, signal, "(", pin_letter_int, pin_number, ")"
    arr[pin_letter_int][pin_number] = format_string.format(signal);

print "{0:2}".format(""),
for col in range(min_pin_number,max_pin_number+1) :
    print format_string.format(str(col)),
print "";
for row in range(min_pin_letter_int,max_pin_letter_int+1) :
    print "{0:2}".format(coord_to_pin[row]),
    for col in range(min_pin_number,max_pin_number+1) :
        print arr[row][col],
    print "";

print min_pin_letter_int,max_pin_letter_int, min_pin_number, max_pin_number


    
                          
