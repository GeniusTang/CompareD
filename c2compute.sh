#!/bin/bash

COMPATH="/home/rcf-40/kujin/panasas/CompareD/"
C2PATH="/home/rcf-40/kujin/work/SUN/iterationtest/T1/c2compute/"

cd $COMPATH

i=$1

for file in $(ls ${COMPATH})
do
    if [ -d $COMPATH${file} ]; then 
        cd ${COMPATH}${file}/${i}
        echo "${COMPATH}${file}/${i}/A A" > ./file
        echo "${COMPATH}${file}/${i}/B B" >> ./file
        cp -rf ${C2PATH}c2compute.out ./
        for k in {3..11}
        do
            ./c2compute.out $k file A &> /dev/null
        done
    fi
done
