#!/bin/sh
#Author: Mayank Murali
#Script to run CheckM tool

checkm=/datadisk1/mqm6516/CheckM/conda/bin/checkm

#options: flye, canu, hifiasm, raven
declare -a input_assembler=("flye" "canu" "hifiasm" "raven")

#options: ecoli, atcc, zymo, sheep, human, chicken
declare -a input_data=("ecoli" "atcc" "zymo" "sheep" "human" "chicken")

assembler=canu

threads=40

marker_file=/datadisk1/mqm6516/CheckM/conda/checkm_data/hmms/phylo.hmm

for assembler in "${input_assembler[@]}"; do
  
  for data in "${input_data[@]}"; do
    
    input_bin=/datadisk1/mqm6516/berkeleylab-metabat-8b5702be9852/build/bin/${data}_${assembler}/
  
    result=/datadisk1/mqm6516/CheckM/conda/output/${data}_${assembler}/
  
    echo "... Running CheckM on ${assembler} assembly data ...";
  
    rm -rf checkm.jobs.list
  
    time( \
      ${checkm} lineage_wf \
      -t ${threads} \
      -x fa ${input_bin} \
      ${result};

      ${checkm} analyze \
      -t ${threads} \
      ${marker_file} \
      -x fa ${input_bin} \
      ${result};

      ${checkm} qa \
      -t ${threads} \
      --out_format 1 \
      -f ${result}qa_result.txt \
      ${marker_file} \
      ${result} \
      ) 
    
    chmod +x run_checkm.sh
    echo run_checkm.sh >> checkm.jobs.list

    echo -e "--------------------------------------------------- \n ";

  done

done  
