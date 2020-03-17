#!/bin/bash

#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=4:00:00
#SBATCH --mem=4GB
#SBATCH --job-name=MYJOB
#SBATCH --output=slurm_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=sl7424@nyu.edu


module load sra-tools/intel/2.9.6
echo "/repository/user/main/public/root = \"$SCRATCH\"" > $HOME/.ncbi/user-settings.mkfg


for (( i = 1521886 ; i <= 1521945; i++ ))
do
  	fastq-dump --outdir /scratch/sl7424/class_AG/project/fastq/ --split-files /scratch/sl7424/sra/SRR${i}.sra

done
