#!/bin/sh
#Author: Mayank Murali
#Script to run Canu metagenome assembler

#canu=/datadisk1/mqm6516/canu/build/bin/canu

#data_sheep=/datadisk1/mqm6516/Data/metagenome/LR/sheep/SRR10963010_subreads.fastq.gz

#threads=20
 
#result=/datadisk1/mqm6516/canu/build/bin/sheep_hifi

echo "running HiCanu..."

rm -rf canu.jobs.list
 
#/usr/bin/time -v \
#  ${canu} \
#  -p sheep \
#  -d ${result} \
#  genomeSize=1000m \
#  maxInputCoverage=1000 \
#  batMemory=200 \
#  -pacbio-hifi ${data_sheep}

/datadisk1/mqm6516/canu/build/bin/canu -p sheep -d /datadisk1/mqm6516/canu/build/bin/sheep_hifi genomeSize=1000m maxInputCoverage=1000 batMemory=200 -pacbio-hifi /datadisk1/mqm6516/Data/metagenome/LR/sheep/SRR10963010_subreads.fastq

chmod +x run_canu.sh
echo run_canu.sh >> canu.jobs.list
