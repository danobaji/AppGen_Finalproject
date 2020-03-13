#!/bin/bash
#
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --time=12:00:00
#SBATCH --mem=32GB
#SBATCH --job-name=SRA_getfastq
#SBATCH --output=slurm_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=dno214@nyu.edu

module load sra-tools/intel/2.9.6

cd /scratch/dno214/AppGen_Project/RNAseq

srrbase=SRR1536

#I made a loop that adds three digits to the SRR base from 378 to 429
#This will correspond to all the SRR numbers needed
#Then i just ran fastq dump on those accesion numbers and saved the output in my working directory
#



for i in {378..429}
do
	fastq-dump -v --split-files ${srrbase}${i} -O ./
done
