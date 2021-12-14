#!/bin/sh
#Author: Mayank Murali
#Script to run CheckM tool

checkm=/datadisk1/mqm6516/CheckM/conda/bin/checkm

#options: ecoli, atcc, zymo, sheep, human, chicken
data=zymo

#options: flye, canu, hifiasm, raven
assembler=flye

threads=40

input_bin=/datadisk1/mqm6516/berkeleylab-metabat-8b5702be9852/build/bin/${data}_${assembler}/

marker_file=/datadisk1/mqm6516/CheckM/conda/checkm_data/hmms/phylo.hmm

result=/datadisk1/mqm6516/CheckM/conda/output/${data}_${assembler}/

echo "running CheckM..."

rm -rf checkm.jobs.list
 
/usr/bin/time -v \
  ${checkm} lineage_wf \
  -t ${threads} \
  -x fa ${input_bin} \
  ${result}

  ${checkm} analyze \
  -t ${threads} \
  ${marker_file} \
  -x fa ${input_bin} \
  ${result}

  ${checkm} qa \
  -t ${threads} \
  --out_format 1 \
  -f ${result}qa_result.txt \
  ${marker_file} \
  ${result} 

chmod +x run_checkm.sh
echo run_checkm.sh >> checkm.jobs.list
