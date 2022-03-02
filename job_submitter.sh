#!/usr/bin/env bash

export EXP=""
hpc_dir="${SCRATCH}/${EXP}"


if [ ! -d "${hpc_dir}" ]; then
    mkdir -p "${hpc_dir}"
fi

sbatch -o "${hpc_dir}/${EXP}_%j.out" perlmutter_job.sh
