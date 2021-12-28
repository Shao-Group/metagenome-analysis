#!/bash/sh
#Author: Mayank Murali
#Script to run Raven metagenome assembler

raven=/datadisk1/mqm6516/raven/build/bin/raven 

data_ecoli=/datadisk1/mqm6516/Data/metagenome/LR/ecoli/ecoli.fastq

data_atcc=/datadisk1/mqm6516/Data/metagenome/LR/ATCC/SRR11606871_subreads.fastq.gz

data_zymo=/datadisk1/mqm6516/Data/metagenome/LR/ZymoBIOMICS/SRR13128014_subreads.fastq.gz

data_sheep=/datadisk1/mqm6516/Data/metagenome/LR/sheep/SRR10963010_subreads.fastq

data_human=/datadisk1/mqm6516/Data/metagenome/LR/human/SRR15275211_subreads.fastq.gz

data_chicken=/datadisk1/mqm6516/Data/metagenome/LR/chicken/SRR152145153_subreads.fastq.gz

threads=30

#options: ecoli, atcc, zymo, sheep, human, chicken
declare -a input_data=("ecoli" "atcc" "zymo" "sheep" "human" "chicken")

for data in "${input_data[@]}"; do
  
  echo "running Raven on ${data} hifi data ..."
  
  dataset=data_${data}
  
  rm -rf raven.jobs.list
  
  /usr/bin/time -v \
    ${raven} \
    --threads=${threads} \
    ${!dataset} \
    --graphical-fragment-assembly \
    ${data}_hifi.gfa > ${data}_hifi_assembly.fasta
  
  chmod +x run_raven.sh
  echo run_raven.sh >> raven.jobs.list

done  
