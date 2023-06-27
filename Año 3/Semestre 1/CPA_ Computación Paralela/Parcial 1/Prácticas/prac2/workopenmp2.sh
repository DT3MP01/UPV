#!/bin/sh
#PBS -l nodes=1,walltime=00:10:00
#PBS -q cpa
#PBS -d .

# OMP_NUM_THREADS=2 OMP_SCHEDULE=static ./planets2i
# OMP_NUM_THREADS=4 OMP_SCHEDULE=static ./planets2i
# OMP_NUM_THREADS=8 OMP_SCHEDULE=static ./planets2i
# OMP_NUM_THREADS=16 OMP_SCHEDULE=static ./planets2i
# OMP_NUM_THREADS=32 OMP_SCHEDULE=static ./planets2i

# OMP_NUM_THREADS=2 OMP_SCHEDULE=static,1 ./planets2i
# OMP_NUM_THREADS=4 OMP_SCHEDULE=static,1 ./planets2i
# OMP_NUM_THREADS=8 OMP_SCHEDULE=static,1 ./planets2i
# OMP_NUM_THREADS=16 OMP_SCHEDULE=static,1 ./planets2i
# OMP_NUM_THREADS=32 OMP_SCHEDULE=static,1 ./planets2i

# OMP_NUM_THREADS=2 OMP_SCHEDULE=static,2 ./planets2i
# OMP_NUM_THREADS=4 OMP_SCHEDULE=static,2 ./planets2i
# OMP_NUM_THREADS=8 OMP_SCHEDULE=static,2 ./planets2i
# OMP_NUM_THREADS=16 OMP_SCHEDULE=static,2 ./planets2i
# OMP_NUM_THREADS=32 OMP_SCHEDULE=static,2 ./planets2i

# OMP_NUM_THREADS=2 OMP_SCHEDULE=static,4 ./planets2i
# OMP_NUM_THREADS=4 OMP_SCHEDULE=static,4 ./planets2i
# OMP_NUM_THREADS=8 OMP_SCHEDULE=static,4 ./planets2i
# OMP_NUM_THREADS=16 OMP_SCHEDULE=static,4 ./planets2i
# OMP_NUM_THREADS=32 OMP_SCHEDULE=static,4 ./planets2i

# OMP_NUM_THREADS=2 OMP_SCHEDULE=dynamic ./planets2i
# OMP_NUM_THREADS=4 OMP_SCHEDULE=dynamic ./planets2i
# OMP_NUM_THREADS=8 OMP_SCHEDULE=dynamic ./planets2i
# OMP_NUM_THREADS=16 OMP_SCHEDULE=dynamic ./planets2i
# OMP_NUM_THREADS=32 OMP_SCHEDULE=dynamic ./planets2i

# OMP_NUM_THREADS=2 OMP_SCHEDULE=guided ./planets2i
# OMP_NUM_THREADS=4 OMP_SCHEDULE=guided ./planets2i
# OMP_NUM_THREADS=8 OMP_SCHEDULE=guided ./planets2i
# OMP_NUM_THREADS=16 OMP_SCHEDULE=guided ./planets2i
# OMP_NUM_THREADS=32 OMP_SCHEDULE=guided ./planets2i