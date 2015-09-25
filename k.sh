#!/bin/bash
QSUB="qsub -q cmb -l nodes=1:ppn=4 -l mem=20000m -l walltime=50:00:00"

cd /home/rcf-40/kujin/panasas/CompareD 

cmd="cd /home/rcf-40/kujin/panasas/CompareD;"



for i in {1..100}; do
   echo "$cmd ./c2compute.sh $i" | $QSUB
done

