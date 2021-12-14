#!/bash/sh
#Author: Mayank Murali
#Script to run hifiasm metagenome assembler

#hifiasm=/datadisk1/mqm6516/hifiasm_meta

#data=/datadisk1/mqm6516/Data/metagenome/LR/ATCC/SRR11606871_subreads.fastq.g

#threads=10
#object=atcc_hifi

#result=/datadisk1/mqm6516/hifiasm

echo "running hifiasm..."

rm -rf run_hifiasm.jobs.list

#/usr/bin/time -v \
#  ${hifiasm} \
#  -t${threads} \
#  -o ${object} \
#  ${data} 2>atcc_hifi.log

./hifiasm_meta -t32 -o sheep_hifi /datadisk1/mqm6516/Data/metagenome/LR/sheep/SRR10963010_subreads.fastq 2>sheep_hifi.log

chmod +x run_hifiasm.sh
echo run_hifiasm.sh >> run_hifiasm.jobs.list
