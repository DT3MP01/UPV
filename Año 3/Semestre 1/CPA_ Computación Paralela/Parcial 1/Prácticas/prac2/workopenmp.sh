#!/bin/sh
#PBS -l nodes=1,walltime=00:05:00
#PBS -q cpa
#PBS -d .


OMP_NUM_THREADS=1 ./pimagenes
OMP_NUM_THREADS=2 ./pimagenes
OMP_NUM_THREADS=4 ./pimagenes
OMP_NUM_THREADS=8 ./pimagenes
OMP_NUM_THREADS=32 ./pimagenes