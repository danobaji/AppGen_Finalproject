#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=3:00:00
#SBATCH --mem=32GB
#SBATCH --job-name=markduplicates
#SBATCH --array=0-24
#SBATCH --mail-type=END
#SBATCH --mail-user=sl7424@nyu.edu


cd /scratch/sl7424/class_AG/project/atac/trimmed_fastq/sam/

new_arr=(./*trimm_sorted.bam)

java -jar /share/apps/picard/2.17.11/picard.jar MarkDuplicates I=${new_arr[$SLURM_ARRAY_TASK_ID]} O=${new_arr[$SLURM_ARRAY_TASK_ID]::-4}_marked.bam METRICS_FILE=${new_arr[$SLURM_ARRAY_TASK_ID]::-4}_report.txt





