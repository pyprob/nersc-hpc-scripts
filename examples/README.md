# Example scripts

The scripts found here serve as an example of how to submit jobs on NERSC's
supercomputer [permutter](https://www.nersc.gov/systems/perlmutter/). While
meant for perlmutter (and GPU access), simply removing any GPU related settings
will also make these secripts usable with NERSC's
[cori](https://www.nersc.gov/systems/cori/).

As per NERSC's [documentation](https://docs.nersc.gov/development/shifter/)
these scripts make use of `shifter` which converts `Docker` images to a common
format which can be efficiently distributed. The docker images used in this
example is build using the Dockerfile found in the Git repository
[mining-for-substructure-lens](https://github.com/pyprob/mining-for-substructure-lens/tree/pyprob_implementation).
A public docker container is available from
[DockerHub](https://hub.docker.com/r/mumunk/pyprob-mining) and can be directly
pulled by running

``` sh
shifterimg -v pull mmunk/pyprob-mining:latest
```

on NERSC's hpc.

## [job_submitter.sh](./job_submitter.sh) 

This scipt serves as the entrypoint for submitting jobs. It creates a directory
located in `$SCRATCH` where one can find the job's `.out` files. It then submits
a job by calling `sbatch` with
[pyprob_mining_perlmutter_job.sh](./pyprob_mining_perlmutter_job.sh) as
argument.

## [pyprob_mining_perlmutter_job.sh](./pyprob_mining_perlmutter_job.sh)

