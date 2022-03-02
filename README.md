# Template scripts for submitting jobs on NERSC's HPC

[job_submitter.sh](./job_submitter.sh), [perlmutter_job.sh](./permutter_job.sh),
and [shifter_job.sh](./shifter_job.sh) are template scripts used to submit jobs
on NERSC's supercomputer [permutter](https://www.nersc.gov/systems/perlmutter/).
While meant for perlmutter (and GPU access), simply removing any GPU related
settings will make these scripts usable with NERSC's
[cori](https://www.nersc.gov/systems/cori/).

As per NERSC's [documentation](https://docs.nersc.gov/development/shifter/)
these scripts make use of `shifter` which converts `Docker` images to a common
format which can be efficiently distributed. Just build a docker image and push
it to DockerHub. On NERSC's hpc pull the docker image and convert it to a
shifter image by running

``` sh
shifterimg -v pull <path-to-docker-image-on-dockerhub>
```

## [job_submitter.sh](./job_submitter.sh) 

This script serves as the entrypoint for submitting jobs. It creates a directory
located in `$SCRATCH` where one can find the job's `.out` files. It also export
the `EXP` variable for downstream use. It then submits a job by calling `sbatch`
with [perlmutter_job.sh](./perlmutter_job.sh) as argument.

## [perlmutter_job.sh](./perlmutter_job.sh)

This script contains the requested resources in the "header". It also set
additional environment variables needed downstream. This script calls `srun` (a
nested job using all allocated resources) which executes
[shifter_pyrpob_mining.sh](./shifter_pyprob_mining.sh).

## [shifter_job.sh](./shifter_job.sh)

This is the final script which runs the program within the shifter image. The
script also creates two directories used for storing results and figures. Those
directories are then mounted inside the image.
