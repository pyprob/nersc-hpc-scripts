#!/usr/bin/env bash

hpc_dir="${SCRATCH}/pyprob_mining_hpc_outputs"


if [ ! -d "${hpc_dir}" ]; then
    mkdir -p "${hpc_dir}"
fi

sbatch -o "${hpc_dir}/pyprob_mining_%j.out" pyprob_mining_perlmutter_job.sh
