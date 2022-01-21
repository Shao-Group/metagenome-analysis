#!/bin/sh
#Author: Mayank Murali
#Script to run BUSCO tool

busco=/datadisk1/mqm6516/BUSCO/conda/bin/busco

plot=/datadisk1/mqm6516/BUSCO/conda/bin/generate_plot.py

#options: ecoli, atcc, zymo, sheep, human, chicken
declare -a input_data=("ecoli" "atcc" "zymo" "sheep" "human" "chicken")

#options: flye, canu, hifiasm, raven
declare -a input_assembler=("flye" "canu" "hifiasm" "raven")

for assembler in "${input_assembler[@]}"; do

  for data in "${input_data[@]}"; do

    if [ "$assembler" == "flye" ]
    then
      input_assembly=/datadisk1/mqm6516/Flye/${data}_hifi/assembly.fasta

    elif [ "$assembler" == "canu" ]
    then
      input_assembly=/datadisk1/mqm6516/canu/build/bin/${data}_hifi/${data}.contigs.fasta

    elif [ "$assembler" == "hifiasm" ]
    then
      input_assembly=/datadisk1/mqm6516/hifiasm-meta/output/${data}_hifi/${data}_hifi.p_ctg.fa
    
    else
      input_assembly=/datadisk1/mqm6516/raven/${data}_hifi_assembly.fasta

    fi

    result=${data}_${assembler}

    echo "... Running BUSCO on ${data} from ${assembler} ...";
  
    rm -rf busco.jobs.list

    time( \
      ${busco} \
      -f \
      -c 40 \
      -m genome \
      --augustus \
      -i ${input_assembly} \
      -o ${result} \
      --auto-lineage-euk
    
      mkdir /datadisk1/mqm6516/BUSCO/${result}/summary   
      cp /datadisk1/mqm6516/BUSCO/${result}/short_summary.* /datadisk1/mqm6516/BUSCO/${result}/summary

      python3 \
        ${plot} \
        -wd /datadisk1/mqm6516/BUSCO/${result}/summary
      ) 
    
    echo -e "--------------------------------------------------- \n ";

  done

done  

  chmod +x run_busco.sh
  echo run_busco.sh >> busco.jobs.list

