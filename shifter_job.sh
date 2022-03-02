#!/usr/bin/env bash

id=$SLURM_PROCID

echo "$job_results_dir"
data_dir="${job_results_dir}/data_processid_${id}"
if [ ! -d "${data_dir}" ]; then
    mkdir -p "${data_dir}"
fi

figs_dir="${job_results_dir}/figs_processid_${id}"
if [ ! -d "${figs_dir}" ]; then
    mkdir -p "${figs_dir}"
fi

shifter --module=gpu --volume="${data_dir}:<image-path-to-results>;${figs_dir}:<image-path-to-figs>" --workdir <your commands to be executed inside image goes here>
