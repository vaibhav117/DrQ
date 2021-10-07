#!/bin/bash -e
#SBATCH --open-mode=append
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=05:00:00
#SBATCH --mem=100GB
#SBATCH --mail-type=END
#SBATCH --gres=gpu
#SBATCH --array=1
#SBATCH --job-name=double-dqn
#SBATCH --output=./logs/double-dqn/%j_%x.out
#SBATCH --error=./logs/double-dqn/%j_%x.err
#SBATCH --export=ALL

bash ./run-mpi4py-singularity.bash \
	python train.py env=Breakout
