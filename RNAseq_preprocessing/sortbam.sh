#!/bin/bash
#
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --time=6:00:00
#SBATCH --mem=32GB
#SBATCH --job-name=samsort
#SBATCH --output=slurm_%j.out
#SBATCH --array=0-51
#SBATCH --mail-type=END
#SBATCH --mail-user=dno214@nyu.edu


module load hisat2/intel/2.0.5
new_arr=(./*.bam)

samtools sort ${new_arr[$SLURM_ARRAY_TASK_ID]} -o ${new_arr[$SLURM_ARRAY_TASK_ID]::-4}_sorted.bam
samtools index ${new_arr[$SLURM_ARRAY_TASK_ID]::-4}_sorted.bam
