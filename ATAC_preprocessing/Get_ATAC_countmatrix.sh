#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=12:00:00
#SBATCH --mem=12GB
#SBATCH --job-name=Featurecounts
#SBATCH --mail-type=END
#SBATCH --mail-user=sl7424@nyu.edu

module load subread/intel/1.5.1
module load  bedtools/intel/2.27.1

# the final code for getting the atac count matrix

## first pick up all intersected regions overlapped in at least two samples
bedtools multiinter -i *.narrowPeak > atac_multiinter.bed
## Merge the intersection regions
bedtools merge -i atac_multiinter.bed > atac_consensus.bed
## Covert bed file format to saf file format
awk 'OFS="\t" {print $1”:"$2”-"$3, $1, $2, $3, "."}' atac_consensus.bed > atac_consensus.saf
## Run featureCounts with specifying an annotation file format as SAF
featureCounts -a atac_consensus.saf -F SAF -o atac_counts_consensus.txt /scratch/sl7424/class_AG/project/atac/trimmed_fastq/sam/processed_bam/*marked_dup.bam
