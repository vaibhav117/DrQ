#!/bin/bash

args=''
for i in "$@"; do 
    i="${i//\\/\\\\}"
    args="$args \"${i//\"/\\\"}\""
done

if [ "$args" == "" ]; then args="/bin/bash"; fi

if [[ "$(hostname -s)" =~ ^g[r,v] ]]; then nv="--nv"; fi

source /scratch/work/public/singularity/greene-ib-slurm-bind.sh

singularity exec $nv \
	    --overlay /scratch/vm2134/projects/deep_rl/overlay-50G-10M_deeprl_3.ext3:rw \
	    --overlay /scratch/work/public/singularity/openmpi4.1.1-ubuntu18.04.sqf:ro \
	    --overlay /scratch/work/public/singularity/mujoco200-dep-cuda11.1-cudnn8-ubunutu18.04.sqf:ro \
	    /scratch/work/public/singularity/cuda11.1-cudnn8-devel-ubuntu18.04.sif \
            /bin/bash -c "
source /ext3/openmpi.sh
if [ -f /ext3/env.sh ]; then source /ext3/env.sh; fi
source ~/.bashrc
export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/home/vm2134/.mujoco/mujoco200/bin
conda activate hw2_drq_new
conda info
eval $args
#exit
"

#exit

