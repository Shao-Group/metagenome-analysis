#!/bin/bash
#Author: Mayank Murali
#Script to download E.coli K12 HiFi data

rm -rf ecoli_hifi.fastq

echo "Downloading E.coli K12 HiFi data..."

curl -L -o ecoli_hifi.fastq https://sra-pub-src-1.s3.amazonaws.com/SRR10971019/m54316_180808_005743.fastq.1

chmod +x ecoli_hifi.sh

:'
SRX7636524: WGS of E. coli K12 with PacBio HiFi
1 PACBIO_SMRT (Sequel) run: 95,514 spots, 1.4G bases, 1.1Gb downloads

Design: DNA sheared on Megaruptor to 20 kb, SMRTbell template prep, size selection with SageELF to 15kb
Submitted by: Pacific Biosciences

Study: WGS of E. coli K12 with PacBio HiFi reads

Sample:
  SAMN02604091 • SRS6067201

Organism: Escherichia coli str. K-12 substr. MG1655

Library:
  Name: EcoliK12-CCS-15kb
  Instrument: Sequel
  Strategy: WGS
  Source: GENOMIC
  Selection: size fractionation
  Layout: SINGLE

Runs: 1 run, 95,514 spots, 1.4G bases, 1.1Gb
'

