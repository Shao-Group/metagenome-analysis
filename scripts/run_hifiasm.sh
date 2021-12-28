#!/bash/sh
#Author: Mayank Murali
#Script to run hifiasm metagenome assembler

hifiasm=/datadisk1/mqm6516/hifiasm-meta/hifiasm_meta

data_ecoli=/datadisk1/mqm6516/Data/metagenome/LR/ecoli/ecoli.fastq

data_atcc=/datadisk1/mqm6516/Data/metagenome/LR/ATCC/SRR11606871_subreads.fastq.gz

data_zymo=/datadisk1/mqm6516/Data/metagenome/LR/ZymoBIOMICS/SRR13128014_subreads.fastq.gz

data_sheep=/datadisk1/mqm6516/Data/metagenome/LR/sheep/SRR10963010_subreads.fastq

data_human=/datadisk1/mqm6516/Data/metagenome/LR/human/SRR15275211_subreads.fastq.gz

data_chicken=/datadisk1/mqm6516/Data/metagenome/LR/chicken/SRR152145153_subreads.fastq.gz

threads=32

#options: ecoli, atcc, zymo, sheep, human, chicken
declare -a input_data=("ecoli" "atcc" "zymo" "sheep" "human" "chicken")

for data in "${input_data[@]}"; do
  
  echo "running hifiasm on ${data} hifi data ..."
  
  dataset=data_${data}

  rm -rf hifiasm.jobs.list
  
  /usr/bin/time -v \
    ${hifiasm} \
    -t${threads} \
    -o ${data}_hifi \
    ${!dataset} 2>${data}_hifi.log

#./hifiasm_meta -t32 -o sheep_hifi /datadisk1/mqm6516/Data/metagenome/LR/sheep/SRR10963010_subreads.fastq 2>sheep_hifi.log
  chmod +x run_hifiasm.sh
  echo run_hifiasm.sh >> hifiasm.job

done
