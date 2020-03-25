#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=1:00:00
#SBATCH --mem=32GB
#SBATCH --job-name=markduplicates
#SBATCH --array=0-59
#SBATCH --mail-type=END
#SBATCH --mail-user=sl7424@nyu.edu


cd /scratch/sl7424/class_AG/project/ichip/fastq/trimmed_fastq/remain/

new_arr=(./*_1_trimmed_sorted.bam)

java -jar /share/apps/picard/2.17.11/picard.jar MarkDuplicates I=${new_arr[$SLURM_ARRAY_TASK_ID]} O=${new_arr[$SLURM_ARRAY_TASK_ID]::-4}_marked.bam METRICS_FILE=${new_arr[$SLURM_ARRAY_TASK_ID]::-4}_report.txt VALIDATION_STRINGENCY=LENIENT





## Validation stringency for all SAM files read by this program. Setting stringency to SILENT can improve performance 
#when processing a BAM file in which variable-length data (read, qualities, tags) do not otherwise need to be decoded. 
#Default value: STRICT. This option can be set to 'null' to clear the default value. Possible values: {STRICT, LENIENT, SILENT}
