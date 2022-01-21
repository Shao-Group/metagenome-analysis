#!/bin/sh
#Author: Mayank Murali
#Script to run Canu metagenome assembler

canu=/datadisk1/mqm6516/canu/build/bin/canu

data_ecoli=/datadisk1/mqm6516/Data/metagenome/LR/ecoli/ecoli.fastq

data_atcc=/datadisk1/mqm6516/Data/metagenome/LR/ATCC/SRR11606871_subreads.fastq.gz

data_zymo=/datadisk1/mqm6516/Data/metagenome/LR/ZymoBIOMICS/SRR13128014_subreads.fastq.gz

data_sheep=/datadisk1/mqm6516/Data/metagenome/LR/sheep/SRR10963010_subreads.fastq

data_human=/datadisk1/mqm6516/Data/metagenome/LR/human/SRR15275211_subreads.fastq.gz

data_chicken=/datadisk1/mqm6516/Data/metagenome/LR/chicken/SRR152145153_subreads.fastq.gz

threads=40

#options: ecoli, atcc, zymo, sheep, human, chicken
declare -a input_data=("ecoli" "atcc" "zymo" "sheep" "human" "chicken")

for data in "${input_data[@]}"; do
  
  result=/datadisk1/mqm6516/canu/build/bin/${data}_hifi
  
  echo "... Running HiCanu on ${data} HiFi data ..."

  dataset=data_${data}
  
  rm -rf canu.jobs.list
  
  /usr/bin/time -v \
    ${canu} \
    -p ${data} \
    -d ${result} \
    genomeSize=1000m \
    maxInputCoverage=1000 \
    batMemory=200 \
    -pacbio-hifi ${!dataset}

#/datadisk1/mqm6516/canu/build/bin/canu -p atcc -d /datadisk1/mqm6516/canu/build/bin/atcc_hifi genomeSize=100m maxInputCoverage=1000 batMemory=200 -pacbio-hifi /datadisk1/mqm6516/Data/metagenome/LR/ATCC/SRR11606871_subreads.fastq.gz

  chmod +x run_canu.sh
  echo run_canu.sh >> canu.jobs.list

  echo -e "--------------------------------------------------- \n ";

done  
