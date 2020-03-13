#!/bin/bash
#
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --time=12:00:00
#SBATCH --mem=32GB
#SBATCH --job-name=HiSat_align
#SBATCH --output=slurm_%j.out
#SBATCH --array=0-51
#SBATCH --mail-type=END
#SBATCH --mail-user=dno214@nyu.edu

#for this, i made the index with hisat2 build
#then i made a loop that went through the fastqs
#and for each of those did the alignment to get a sam file and then convert that sam file to a bam file
#

cd /scratch/dno214/AppGen_Project/RNAseq
 
module load hisat2/intel/2.0.5


hisat2-build ./mm10.fna mouse_hisat_index

new_arr=(./*_trim.fastq)



hisat2 -p 16 -x mouse_hisat_index -U ${new_arr[$SLURM_ARRY_TASK_ID]} \
-S ${new_arr[$SLURM_ARRAY_TASK_ID]::-5}sam

