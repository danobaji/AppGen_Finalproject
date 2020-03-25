#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=10:00:00
#SBATCH --mem=32GB
#SBATCH --job-name=bedGraph
#SBATCH --array=0-157
#SBATCH --mail-type=END
#SBATCH --mail-user=sl7424@nyu.edu


cd /scratch/sl7424/class_AG/project/ichip/fastq/deduplicate_bam/
#cd /scratch/sl7424/class_AG/project/atac/trimmed_fastq/sam/processed_bam/

#module load kent/intel/20170111
#module load bedtools/intel/2.26.0

# This script will generate bedGraph and bigwig files for optimised viewing of coverage on IGV and UCSC browsers

new_arr=(./*_1_trimmed_sorted_marked_dup.bam)

# generate bedGraphs and bigWigs for visualisation in IGV or UCSC browsers, using deepTools

module load deeptools/intel/2.4.2
module load pysam/intel/0.10.0
module load pybigwig/intel/0.3.3

# chipseq (note: hg38)

# For chip-seq typically extend reads across DNA fragment

# bedgraph
bamCoverage --bam ${new_arr[$SLURM_ARRAY_TASK_ID]} -o ${new_arr[$SLURM_ARRAY_TASK_ID]::-24}.bedGraph --binSize 50 --scaleFactor 0.001 --normalizeUsingRPKM --ignoreForNormalization chrX --outFileFormat bedgraph #-p max # --extendReads

# Can also generate bigwig using deeptools 
bamCoverage --bam ${new_arr[$SLURM_ARRAY_TASK_ID]} -o ${new_arr[$SLURM_ARRAY_TASK_ID]::-24}_50.bw --binSize 50 --scaleFactor 0.001 --normalizeUsingRPKM --ignoreForNormalization chrX #-p max # --extendReads  # note: normally would specify --extendReads for chipseq (but not RNA-seq) and for single-ended we need to specify the fragment-size for --extendReads

