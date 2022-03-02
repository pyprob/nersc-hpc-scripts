#!/usr/bin/env bash

#SBATCH --image=<you-image>
#SBATCH --account=m4031_g
#SBATCH -N 1
#SBATCH --ntasks-per-node=4
#SBATCH --gpus-per-task=1 # gpus are allocated based on number of tasks (they are NOT bound by default)
#SBATCH --constraint=gpu
#SBATCH --time=00:30:00
#SBATCH --job-name=pyprob-mining
#SBATCH --gpu-bind=single:1 # bind 1 gpu per task - other ways to do this as well

export SLURM_CPU_BIND="cores"
export job_results_dir="${SCRATCH}/${EXP}_${SLURM_JOBID}"
srun bash ~/shifter_job.sh
echo "FINISHED ALL PROCESSES"
