#!/bin/bash
#
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --time=8:00:00
#SBATCH --mem=32GB
#SBATCH --job-name=sam2bam
#SBATCH --output=slurm_%j.out
#SBATCH --array=0-51
#SBATCH --mail-type=END
#SBATCH --mail-user=dno214@nyu.edu

module load samtools/intel/1.9 

new_arr=(./*sam)


samtools view -bS ${new_arr[$SLURM_ARRAY_TASK_ID]} \
> ${new_arr[$SLURM_ARRAY_TASK_ID]::-3}bam 
