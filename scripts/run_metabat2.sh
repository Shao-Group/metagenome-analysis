#!/bin/sh
#Author: Mayank Murali
#Script to run MetaBat2 binning tool

metabat2=/datadisk1/mqm6516/berkeleylab-metabat-8b5702be9852/build/bin/metabat2

#options: ecoli, atcc, zymo, sheep, human, chicken
data=ecoli

#options: Flye, canu, hifiasm, Raven
#assembler=Flye

input_assembly=/datadisk1/mqm6516/Flye/${data}_hifi/assembly.fasta

#ecoli_flye=/datadisk1/mqm6516/Flye/ecoli_hifi/assembly.fasta
#atcc_flye=/datadisk1/mqm6516/Flye/atcc_hifi/assembly.fasta
#zymo_flye=/datadisk1/mqm6516/Flye/zymo_hifi/assembly.fasta
#sheep_flye=/datadisk1/mqm6516/Flye/sheep_hifi/assembly.fasta
#human_flye=/datadisk1/mqm6516/Flye/human_hifi/assembly.fasta
#chicken_flye=/datadisk1/mqm6516/Flye/chicken_hifi/assembly.fasta

 
result=/datadisk1/mqm6516/berkeleylab-metabat-8b5702be9852/build/bin/${data}_flye/bin

echo "running MetaBat2..."

rm -rf metabat2.jobs.list
 
/usr/bin/time -v \
  ${metabat2} \
  -i ${input_assembly} \
  -o ${result} \
  -d \
  -v

chmod +x run_metabat2.sh
echo run_metabat2.sh >> metabat2.jobs.list