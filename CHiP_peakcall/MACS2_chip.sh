#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --time=4:00:00
#SBATCH --mem=32GB
#SBATCH --job-name=MACS2_peakcall
#SBATCH --output=slurm_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=dno214@nyu.edu

cd /scratch/dno214/AppGen_Project/CHiPseq

module load macs2/intel/2.1.1
macs2 callpeak  -t ./*bam --format=BAM  --broad --gsize=mm  --cutoff-analysis  --qvalue=0.05 --broad-cutoff=0.05 --outdir=./ --name test_example

# -t is the input bam file
# broad tells it to look for broad peakcalling for histone marks
# --gsize for mouse



