#!/bin/python

import os

DIRS = [DIR for DIR in os.listdir('./') if os.path.isdir(DIR) and not DIR.startswith('.')]
DIRS = sorted(DIRS)

D2 = ['d2', 'd2shepp', 'd2star']

def d2mean(dir, c2, k):
    total = 0.0
    for i in range(1, 101):
        temp = open(os.path.join(dir, str(i), 'k'+str(k)+'-'+'d0'+'-'+c2+'Form'))
        c2value = temp.readlines()[1].split(',')[0]
        d2value = 1 - float(c2value)
        total += d2value
    return "%.4f"%(total / 100)
 
def getd2(d2):
    c2 = d2.replace('d', 'c')
    f = open(d2, 'wt')
    f.write(d2+','+','.join(map(str, range(3, 12)))+'\n')
    for dir in DIRS:
        f.write(dir)
        for k in range(3, 12):
            f.write(','+d2mean(dir, c2, k)) 
        f.write('\n')
    f.close()

for d2 in D2:
    getd2(d2) 
