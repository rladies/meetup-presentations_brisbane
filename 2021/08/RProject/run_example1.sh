#!/bin/bash -l
#PBS -N Example1
#PBS -l ncpus=1
#PBS -l cputype=6140
#PBS -l mem=8gb
#PBS -l walltime=8:00:00

ngrid=100
nsamp=1000
seed=3854

cd $PBS_O_WORKDIR
module load gdal/3.2.1-foss-2020b
module load r/4.0.3-foss-2020b

Rscript main.R $ngrid $nsamp $seed