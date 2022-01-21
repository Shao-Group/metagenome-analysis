#!/bin/sh
#Author: Mayank Murali
#Script to run QUAST tool

quast=/datadisk1/mqm6516/QUAST/conda/bin/quast.py

#options: ecoli, atcc, zymo, sheep, human, chicken
declare -a input_data=("ecoli" "atcc" "zymo" "sheep" "human" "chicken")

#options: flye, canu, hifiasm, raven
#assembler=hifiasm


for data in "${input_data[@]}"; do
  
  input_assembly_1=/datadisk1/mqm6516/Flye/${data}_hifi/assembly.fasta
  input_assembly_2=/datadisk1/mqm6516/canu/build/bin/${data}_hifi/${data}.contigs.fasta
  input_assembly_3=/datadisk1/mqm6516/hifiasm-meta/output/${data}_hifi/${data}_hifi.p_ctg.fa
  input_assembly_4=/datadisk1/mqm6516/raven/${data}_hifi_assembly.fasta

  result=/datadisk1/mqm6516/QUAST/${data}/
  
  echo -e "--------------------------------------------------- \n ";
  echo "running QUAST on ${data} ...";
  
  rm -rf quast.jobs.list
  
  time( \
    ${quast} \
    ${input_assembly_1} \
    ${input_assembly_2} \
    ${input_assembly_3} \
    ${input_assembly_4} \
    -o ${result}
    ) 
    
  chmod +x run_quast.sh
  echo run_quast.sh >> quast.jobs.list

done 
