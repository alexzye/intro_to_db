import sys
from oracle2mysql import *

argv = sys.argv

file = open(argv[1])
output = open(argv[2], 'w+')

for line in file:
    date = line.strip().split('\'')
    date[1] = date2mysql(date[1])
    output.write(date[0] + "\'" + date[1] + "\'" + date[2] + '\n')

output.close()
    

