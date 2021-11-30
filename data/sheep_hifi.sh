#!/bin/bash
#Author: Mayank Murali
#Script to download sheep gut microbiome data

rm -rf sheep_hifi.fastq.gz

echo "Downloading Sheep gut microbiome data..."

wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR109/010/SRR10963010/SRR10963010_subreads.fastq.gz

mv SRR10963010_subreads.fastq.gz sheep_hifi.fastq.gz

chmod +x sheep_hifi.sh

:'
SRX7628648: metagenome of parasite-infected sheep:fecal material
1 PACBIO_SMRT (Sequel) run: 3.7M spots, 49.3G bases, 40.9Gb downloads

Design: CCS reads of inserts 9-15 kb

Submitted by: USDA Agricultural Research Service, U.S. Meat Animal Research Center

Study: 1898966 Metagenome

Sample: Sheep fecal metagenome sample from parasite-infected wether
  SAMN13561983 • SRS6060255
Organism: feces metagenome

Library:
  Name: USMARC_SAM109211
  Instrument: Sequel
  Strategy: WGS
  Source: METAGENOMIC
  Selection: size fractionation
  Layout: SINGLE

Runs: 1 run, 3.7M spots, 49.3G bases, 40.9Gb
'

