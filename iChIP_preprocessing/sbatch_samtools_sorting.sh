#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=48:00:00
#SBATCH --mem=5GB
#SBATCH --job-name=sarray_demo
#SBATCH --array=0-59
#SBATCH --mail-type=END
#SBATCH --mail-user=sl7424@nyu.edu

module load samtools/intel/1.9

cd /scratch/sl7424/class_AG/project/fastq/bam

new_arr=(./*.bam)

#Sort and indext them for IGV
samtools sort ${new_arr[$SLURM_ARRAY_TASK_ID]} -o ${new_arr[$SLURM_ARRAY_TASK_ID]::-4}_sorted.bam
samtools index ${new_arr[$SLURM_ARRAY_TASK_ID]::-4}_sorted.bam



