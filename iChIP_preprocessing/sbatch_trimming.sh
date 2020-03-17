#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=48:00:00
#SBATCH --mem=5GB
#SBATCH --job-name=trimming
#SBATCH --array=0-31
#SBATCH --mail-type=END
#SBATCH --mail-user=sl7424@nyu.edu


module load cutadapt/1.16

cd /scratch/sl7424/class_AG/project/

new_arr=(./fastq/*.fastq)


## remove indexing adapter where NNNNNN is a sample barcode 

cutadapt -a GATCGGAAGAGCACACGTCTGAACTCCAGTCACNNNNNNATCTCGTATGCCGTCTTCTGTT -o ${new_arr[$SLURM_ARRAY_TASK_ID]::-6}_trimmed.fastq ${new_arr[$SLURM_ARRAY_TASK_ID]}


## to remove ATAC Tn5 adapter sequence do below


#module load trim_galore/0.4.4
#module load cutadapt/1.16
#trim_galore --phred33 --fastqc --nextera ${new_arr[$SLURM_ARRAY_TASK_ID]}



