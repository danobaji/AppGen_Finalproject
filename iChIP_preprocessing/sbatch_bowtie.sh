#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=48:00:00
#SBATCH --mem=5GB
#SBATCH --job-name=sarray_demo
#SBATCH --array=0-157
#SBATCH --mail-type=END
#SBATCH --mail-user=sl7424@nyu.edu


module load bowtie2/intel/2.3.2

cd /scratch/sl7424/class_AG/project/

new_arr=(./fastq/*.fastq)

## bowtie2-build ./mm10/mm10.fa mm10

## add flag "-p" for parallel computing
bowtie2 -p 4 -x mm10 -U ${new_arr[$SLURM_ARRAY_TASK_ID]} -S ${new_arr[$SLURM_ARRAY_TASK_ID]::-5}sam






