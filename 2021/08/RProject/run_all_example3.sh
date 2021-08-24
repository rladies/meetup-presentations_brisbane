#!/bin/bash
ngrid=100
nsamp=1000

# data seed (controls the sample from the true model)
for (( seed = 1; seed <= 10; seed++ ))
do

	# job submit script name
	subfile='run'$seed'.sh'
	errorfile='run'$seed'_error.txt'
	outputfile='run'$seed'_output.txt'
	
	#write submit script to file 
	cat > scripts/$subfile << EOF
#!/bin/bash -l
#PBS -N EXAMPLE3_$seed
#PBS -l ncpus=1
#PBS -l cputype=6140
#PBS -l mem=8gb
#PBS -l walltime=8:00:00
#PBS -e scripts/$errorfile
#PBS -o scripts/$outputfile

cd \$PBS_O_WORKDIR
module load gdal/3.2.1-foss-2020b
module load r/4.0.3-foss-2020b
R -e "ngrid=$ngrid; nsamp=$nsamp; seed=$seed; source('./main.R');"
EOF
	# submit the script to the HPC queue    
	qsub scripts/$subfile

done
