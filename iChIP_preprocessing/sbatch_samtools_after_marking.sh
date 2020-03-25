#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=6:00:00
#SBATCH --mem=5GB
#SBATCH --job-name=samtools_after_markduplicates
#SBATCH --array=0-59
#SBATCH --mail-type=END
#SBATCH --mail-user=sl7424@nyu.edu

module load samtools/intel/1.9

cd /scratch/sl7424/class_AG/project/ichip/fastq/trimmed_fastq/remain

new_arr=(./*1_trimmed_sorted_marked.bam)

# #Expunge marked duplicate reads, and then index new BAM

samtools view -b -F 0x400 ${new_arr[$SLURM_ARRAY_TASK_ID]} > ${new_arr[$SLURM_ARRAY_TASK_ID]::-4}_dup.bam
samtools index ${new_arr[$SLURM_ARRAY_TASK_ID]::-4}_dup.bam



