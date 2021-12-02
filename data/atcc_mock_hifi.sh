#!/bin/bash
#Author: Mayank Murali
#Script to download ATCC MSA-1003 mock community data

rm -rf atcc_hifi.fastq.gz

echo "Downloading ATCC MSA-1003 mock data..."

wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR116/071/SRR11606871/SRR11606871_subreads.fastq.gz

mv SRR11606871_subreads.fastq.gz atcc_hifi.fastq.gz

chmod +x atcc_mock_hifi.sh

:'
SRX8173258: Metagenomic Std ATCC MSA-1003: PacBio HiFi Reads FASTQ
1 PACBIO_SMRT (Sequel II) run: 5.6M spots, 59.1G bases, 35.6Gb downloads

Design: WGS of mock metagenomic community ATCC MSA-1003 using PacBio HiFi (CCS) Sequencing

Submitted by: Pacific Biosciences

Study: Mouse, Strawberry, Frog, Maize, 20 Strain Staggered Metagenomes

Sample:
  SAMN14691545 • SRS6533472 
  Organism: synthetic metagenome

Library:
  Name: PacBio HiFi metagenome
  Instrument: Sequel II
  Strategy: WGS
  Source: GENOMIC
  Selection: RANDOM
  Layout: SINGLE

Runs: 1 run, 5.6M spots, 59.1G bases, 35.6Gb
'

