#!/bin/bash
#SBATCH --job-name=Bridges-2
#SBATCH -A dmr190011p
#SBATCH -p RM
#SBATCH -N 1
#SBATCH --ntasks-per-node 128
#SBATCH -t 00:30:00

module purge
module load intelmpi/2021.3.0-intel2021.3.0
module load gcc/10.2.0
module load cuda/11.7.1
module load python

echo "SLURM_NTASKS: " $SLURM_NTASKS

ulimit -s unlimited
export OMP_NUM_THREADS=1

mpirun -n $SLURM_NTASKS /opt/packages/LAMMPS/lammps-23Jun2022/build/lmp -sf omp -pk omp $OMP_NUM_THREADS -in in.nemd.2d
