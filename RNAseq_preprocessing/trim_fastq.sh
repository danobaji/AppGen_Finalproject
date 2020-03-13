#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --time=12:00:00
#SBATCH --mem=32GB
#SBATCH --job-name=fastq_trim
#SBATCH --output=slurm_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=dno214@nyu.edu

#i had the fastqs from the fastq dump 
#made a loop that went through everything that ended in .fastq
#for each of that file, it trims and saves the output as the same tag but
#replacing .fastq with _trim.fastq
#

cd /scratch/dno214/AppGen_Project/RNAseq

module load trimmomatic/0.36

for file in ./*.fastq
do
java -jar /share/apps/trimmomatic/0.36/trimmomatic-0.36.jar\
 SE -phred33 $file ${file::-6}_trim.fastq\
 ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
done
