#!/bin/bash
#Author: Mayank Murali
#Script to download ZymoBIOMICS D6331 mock community data

rm -rf zymo_hifi.fastq.gz

echo "Downloading ZymoBIOMICS D6331 mock data..."

wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR131/014/SRR13128014/SRR13128014_subreads.fastq.gz

mv SRR13128014_subreads.fastq.gz zymo_hifi.fastq.gz

chmod +x zymo_mock_hifi.sh

:'
SRX9569057: Zymo D6331 PacBio Standard Input Library
1 PACBIO_SMRT (Sequel II) run: 2M spots, 18G bases, 9.9Gb downloads

Design: Standard Input: DNA was extracted using the Shoreline Breaker Kit. A total of 800 ng of starting DNA was used to perform the PacBio "Preparing HiFi Libraries from Low DNA Input Using SMRTbell Express Template Prep Kit 2.0" protocol (https://www.pacb.com/support/documentation/). DNA shearing was performed with a Megaruptor 3, sheared at speed 31. Typical steps were performed (remove single-strand overhangs, DNA damage repair, SMRTbell adapter ligation). Size selection was performed using 3.7X Diluted AMPure. The resulting library was sequenced on a SMRT Cell 8M on the Sequel II System, with a 30 hr movie. The subreads were used to generate HiFi (CCS) reads using a minimum 99% accuracy cutoff.

Submitted by: Pacific Biosciences

Study: Sequencing of ZymoBIOMICS Gut Microbiome Standard D6331: PacBio HiFi Data from Sequel II System

Sample: ZymoBIOMICS Gut Microbiome Standard D6331
  SAMN16885726 • SRS7763867
  Organism: synthetic metagenome

Library:
  Name: Zymo_D6331_STD
  Instrument: Sequel II
  Strategy: WGS
  Source: METAGENOMIC
  Selection: size fractionation
  Layout: SINGLE

Runs: 1 run, 2M spots, 18G bases, 9.9Gb
'

