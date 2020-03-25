#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=12:00:00
#SBATCH --mem=12GB
#SBATCH --job-name=Genrich
#SBATCH --array=0-24
#SBATCH --mail-type=END
#SBATCH --mail-user=sl7424@nyu.edu

module load genrich/intel/0.5

cd /scratch/sl7424/class_AG/project/atac/trimmed_fastq/sam/

new_arr=(./*trimm_sorted2.bam)

Genrich -t ${new_arr[$SLURM_ARRAY_TASK_ID]} -o ${new_arr[$SLURM_ARRAY_TASK_ID]::-20}.narrowPeak -j -y -r -e chrM


