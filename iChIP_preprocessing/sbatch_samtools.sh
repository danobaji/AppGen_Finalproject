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

cd /scratch/sl7424/class_AG/project/fastq/

new_arr=(./*.sam)

samtools view -bS ${new_arr[$SLURM_ARRAY_TASK_ID]} > ${new_arr[$SLURM_ARRAY_TASK_ID]::-3}bam




