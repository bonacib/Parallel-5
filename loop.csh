#!/bin/bash
#SBATCH -J bonaciproj5
#SBATCH -A cs475-575
#SBATCH -p class
#SBATCH --gres=gpu:1
#SBATCH -o bonaciproj5.out
#SBATCH -e bonaciproj5.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=bonacib@oregonstate.edu

for t in 1024 4096 16384 65536 262144 1048576 2097152 4194304
do
        for b in 8 32 128
        do
                /usr/local/apps/cuda/cuda-10.1/bin/nvcc -DNUMTRIALS=$t -DBLOCKSIZE=$b -o montecarlo  montecarlo.cu
                ./montecarlo
        done
done