#!/bin/bash -e
#SBATCH --open-mode=append
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=05:00:00
#SBATCH --mem=50GB
#SBATCH --mail-type=END
#SBATCH --gres=gpu
#SBATCH --array=1
#SBATCH --job-name=dqn_breakout
#SBATCH --output=./logs/dqn_breakout/%j_%x.out
#SBATCH --error=./logs/dqn_breakout/%j_%x.err
#SBATCH --export=ALL

bash ./run-mpi4py-singularity.bash \
	python train.py
