#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --time=4:00:00
#SBATCH --mem=32GB
#SBATCH --job-name=Homer_rnacount
#SBATCH --output=slurm_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=dno214@nyu.edu

module load homer/intel/4.10.1
module load samtools/intel/1.9

for sfile in ./*bt.sam
do

	makeTagDirectory ./${sfile::-4}_dir ./${sfile}
done


for dir in ./*dir
do
	analyzeRepeats.pl rna mm10 -d $dir -norm 1e7 > ${dir}.txt
done

