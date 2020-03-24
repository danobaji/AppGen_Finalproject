#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=1:00:00
#SBATCH --mem=8GB
#SBATCH --job-name=Homer_peakcall
#SBATCH --output=slurm_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=dno214@nyu.edu

cd /scratch/dno214/AppGen_Project/CHiPseq

#need the homer module and samtools

module load homer/intel/4.10.1
module load samtools/intel/1.9

# need to make a tag directory with your bam file

makeTagDirectory ./test_example SRR1521890_sorted.bam 


# then use this tagdirectory to find peaks
findPeaks test_example/ -style histone L 0 -C 3 -size 1000 -minDist 1000 -tbp 3 -o ./homer_peaks.txt

# convert to bed format
pos2bed.pl homer_peaks.txt > homer_peaks.bed

