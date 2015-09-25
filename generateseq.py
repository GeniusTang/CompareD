#!/bin/python
import random
import os
import shutil
import numpy as np

distance = np.linspace(0, 1, 21) 
ALPHA = 'ATCG'
L = 1500

for d in distance:
    if os.path.exists(str(d)):
        shutil.rmtree(str(d))
    os.makedirs(str(d))
    for i in range(1, 101):
        seq1 = ''
        seq2 = ''
        pos = random.sample(range(L), int(L*d))
        for k in range(L):
            bp1 = random.choice(ALPHA)
            if k in pos:
                bp2 = random.choice(ALPHA.replace(bp1, ''))
            else:
                bp2 = bp1
            seq1 += bp1
            seq2 += bp2
        os.makedirs(os.path.join(str(d), str(i)))
        f = open(os.path.join(str(d), str(i), 'A'), 'wt')
        f.write(seq1)
        f.close()
        f = open(os.path.join(str(d), str(i), 'B'), 'wt')
        f.write(seq2)
        f.close()
