#!/bin/sh
#Author: Mayank Murali
#Script to run MetaBat2 binning tool

metabat2=/datadisk1/mqm6516/berkeleylab-metabat-8b5702be9852/build/bin/metabat2

#options: flye, canu, hifiasm, raven
declare -a input_assembler=("flye" "canu" "hifiasm" "raven")

#options: ecoli, atcc, zymo, sheep, human, chicken
declare -a input_data=("ecoli" "atcc" "zymo" "sheep" "human" "chicken")

for assembler in "${input_assembler[@]}"; do

  for data in "${input_data[@]}"; do
    
    if ${assembler}="flye"
    then
      input_assembly=/datadisk1/mqm6516/Flye/${data}_hifi/assembly.fasta
    elif ${assembler}="canu"
    then
      input_assembly=/datadisk1/mqm6516/canu/build/bin/${data}_hifi/${data}.contigs.fasta
    elif ${assembler}="hifiasm"
    then
      input_assembly=/datadisk1/mqm6516/hifiasm-meta/output/${data}_hifi/${data}_hifi.p_ctg.fa
    else 
      input_assembly=/datadisk1/mqm6516/raven/${data}_hifi_assembly.fasta
    fi

#ecoli_flye=/datadisk1/mqm6516/Flye/ecoli_hifi/assembly.fasta
#atcc_flye=/datadisk1/mqm6516/Flye/atcc_hifi/assembly.fasta
#zymo_flye=/datadisk1/mqm6516/Flye/zymo_hifi/assembly.fasta
#sheep_flye=/datadisk1/mqm6516/Flye/sheep_hifi/assembly.fasta
#human_flye=/datadisk1/mqm6516/Flye/human_hifi/assembly.fasta
#chicken_flye=/datadisk1/mqm6516/Flye/chicken_hifi/assembly.fasta

    result=/datadisk1/mqm6516/berkeleylab-metabat-8b5702be9852/build/bin/${data}_${assembler}/bin
 
    echo "... Running MetaBat2 on ${assembler} assembly ...";

    rm -rf metabat2.jobs.list

    /usr/bin/time -v \
      ${metabat2} \
      -i ${input_assembly} \
      -o ${result} \
      -d \
      -v

    chmod +x run_metabat2.sh
    echo run_metabat2.sh >> metabat2.jobs.list

    echo -e "--------------------------------------------------- \n "; 
  
  done

done
