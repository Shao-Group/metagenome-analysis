#!/bin/bash
#Author: Mayank Murali
#Script to download human gut from a pool of vegan samples

rm -rf human_hifi.fastq.gz

echo "Downloading Human gut from a pool of vegan samples..."

wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR152/011/SRR15275211/SRR15275211_subreads.fastq.gz

mv SRR15275211_subreads.fastq.gz human_hifi.fastq.gz

chmod +x human_hifi.sh

:'
SRX11580194: HiFi sequencing of pooled human gut microbiome standard: vegan diet
1 PACBIO_SMRT (Sequel II) run: 1.9M spots, 18.8G bases, 9.6Gb downloads

Design: High molecular weight DNA was extracted using the Qiagen PowerSoil Pro kit. Size selection was performed using 3.7X Diluted AMPure. Library prep was performed using the SMRTbell Express Template Prep Kit 2.0 and Enzyme Clean Up Kit 2.0. Each sample was sequenced on one SMRT Cell 8M on the Sequel IIe System with Sequel II Binding Kit 2.2 chemistry 2.0, with a 30hr movie time with a 2 hr pre-extension. HiFi reads (>Q20, >99% accurate CCS reads) were generated using CCS v6.0.0 in SMRT Link v10.1.

Submitted by: Pacific Biosciences

Study: Sequencing of The BioCollective Pooled Human Gut Microbiome Standards: PacBio HiFi Data from Sequel IIe System

Sample: Pooled gut microbiome vegan diet, sample 139369
  SAMN20443130 • SRS9613372
  Organism: human gut metagenome

Library:
  Name: BC-139369
  Instrument: Sequel II
  Strategy: WGS
  Source: METAGENOMIC
  Selection: size fractionation
  Layout: SINGLE

Runs: 1 run, 1.9M spots, 18.8G bases, 9.6Gb
'

