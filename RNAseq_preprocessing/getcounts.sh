#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --time=12:00:00
#SBATCH --mem=32GB
#SBATCH --job-name=featureCounts
#SBATCH --output=slurm_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=dno214@nyu.edu

#this basically ran the counts function on all bam files using the 
#annotation file I downloaded which was the only file ending in .gtf in
#my working directory
#

module load subread/intel/1.5.1

featureCounts -T 16 -a ./*gtf -o featurecount_mouse ./*_sorted.bam

