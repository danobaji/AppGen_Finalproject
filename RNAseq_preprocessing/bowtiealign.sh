#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --time=8:00:00
#SBATCH --mem=32GB
#SBATCH --job-name=Bowtie_align
#SBATCH --output=slurm_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=dno214@nyu.edu


module load bowtie2/intel/2.3.2


for read in ./*fastq 
do
	bowtie2 --threads 16 -x mouse_bowtie_index -U $read -S ${read::-6}_bt.sam
done
