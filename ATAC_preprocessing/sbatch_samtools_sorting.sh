#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=12:00:00
#SBATCH --mem=5GB
#SBATCH --job-name=samtools_sorting
#SBATCH --array=0-24
#SBATCH --mail-type=END
#SBATCH --mail-user=sl7424@nyu.edu

module load samtools/intel/1.9

cd /scratch/sl7424/class_AG/project/atac/trimmed_fastq/sam/

new_arr=(./*trimm.bam)

#Sort and indext them for IGV
#samtools sort ${new_arr[$SLURM_ARRAY_TASK_ID]} -o ${new_arr[$SLURM_ARRAY_TASK_ID]::-4}_sorted.bam
#samtools index ${new_arr[$SLURM_ARRAY_TASK_ID]::-4}_sorted.bam


# Sort by read names (i.e., the QNAME field) rather than by chromosomal coordinates. (for Genrich)
samtools sort -n ${new_arr[$SLURM_ARRAY_TASK_ID]} -o ${new_arr[$SLURM_ARRAY_TASK_ID]::-4}_sorted2.bam


