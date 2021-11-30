#!/bin/bash
#Author: Mayank Murali
#Script to download chicken gut microbiome data

rm -rf chicken_hifi.fastq.gz

echo "Downloading Chicken gut microbiome..."

wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR152/053/SRR15214153/SRR15214153_subreads.fastq.gz

mv SRR15214153_subreads.fastq.gz chicken_hifi.fastq.gz

chmod +x chicken_hifi.sh

:'
SRX11520539: Pacbio of Broiler chicken: cecum metagenome
1 PACBIO_SMRT (Sequel) run: 2M spots, 33.6G bases, 25.7Gb downloads

Design: use PacBio to sequence gut metagenome extract from cecum content
Submitted by: China academy of agriculture

Study: Broiler chicken microbial metagenome

Sample: N04_cecum
  SAMN20308465 • SRS9558214
  Organism: chicken gut metagenome

Library:
  Name: 1
  Instrument: Sequel
  Strategy: WGS
  Source: METAGENOMIC
  Selection: RANDOM
  Layout: SINGLE

Runs: 1 run, 2M spots, 33.6G bases, 25.7Gb
'

