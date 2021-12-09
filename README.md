# Benchmarking and analysis different de novo Metagenome Assemblers for long-read data


**Contents**

1. [Overview](#1-overview)
2. [Long-read Metagenome Assembly](#2-long-read-metagenome-assembly)
    1.  [Quality Control](#21--quality-control)
    2.  [Assembly](#22--assembly)
    3.  [Assessment](#23--assessment)


## 1. Overview

The following assemblers are benchmarked:

This project benchmarks different de novo metagenome assemblers to assess the performance and limitations with respect to long-read metagenome data (both synthetic and real).

The following assemblers are benchmarked:

* [**hifiasm-meta**](https://github.com/xfengnefx/hifiasm-meta)

* [**hiCanu**](https://github.com/marbl/canu)

* [**metaFlye**](https://github.com/fenderglass/Flye)

* [**Raven**](https://github.com/lbcb-sci/raven)


  

## 2. Long-read Metagenome Assembly


### 2.1 Quality Control

### 2.2 Assembly
Here, we will be running all 4 assemblers (metaFlye, hiCanu, hifiasm-meta and Raven).

### 2.2.1 hifiasm-meta Assembly

Command for running hifiasm assembly:

```
./hifiasm_meta \
  -t10 \
  -o ecoli_hifi \
  /path/to/data/ecoli.fastq 2>ecoli_hifi.log
```
```
Usage : hifiasm

-t  set number of CPUs in use
-o  prefix of output files
```

### 2.2.2 metaFlye Assembly
Command for running flye assembly:

```
./flye --pacbio-hifi /path/to/data/ecoli.fastq \
  --plasmids \
  --meta \ 
  --debug \ 
  --out-dir /path/to/output/ecoli_hifi/
``` 
```
Usage: flye 

--pacbio-hifi  for PacBio HiFi reads 
--plasmids   
--meta         for metagenome mode
--debuf        to enable debug output
--out-dir      output path
``` 

The shell script [run_flye.sh](script/flye.sh) would run the assembly tool on
all the datasets.

### 2.2.3 hiCanu Assembly 
Command for running canu assembly:
```
./canu \
  -p ecoli_hifi \
  -d path/to/output/ecoli_hifi/ \
  genomeSize=4.8m \ 
  -pacbio-hifi /path/to/data/ecoli.fastq 
```
```
Usage: canu 

-p            prefix for output
-d            output directory
genomeSize    approximate genome size to determine input reads coverage
-pacbio-hifi  for PacBio HiFi reads 
```

### 2.2.4 Raven Assembly
Command for running raven assembly:

```
./raven \
  --threads=10 \
  /path/to/data/ecoli.fastq \
  --graphical-fragment-assembly ecoli.gfa > ecoli.fasta
```
```
Usage: raven
--graphical-fragment-assembly  prints the assembly graph in GFA format  
--threads                      number of threads  
```

### 2.3 Assessment



### 2.3.1 Benchmarking datasets
The tools were evaluated using the following public datasets:


|                  | accession   | #bases (Gb) | N50 read<br>length (kb)| Median read QV | Sample description                               |
|------------------|-------------|-------------|-----------------------|----------------|--------------------------------------------------|
| E.coli        | SRR10971019 | 1.4       | ...                 | ...             | E.coli K12                    |
| ATCC        | SRR11606871 | 59.2        | 12.0                  | 36             | Mock, ATCC MSA-1003                     |
| zymoBIOMICS | SRR13128014 | 18.0        | 10.6                  | 40             | Mock, ZymoBIOMICS D6331                 |
| sheepA           | SRR10963010 | 51.9        | 14.3                  | 25             | Sheep gut microbiome                                  |
| humanV1          | SRR15275211 | 18.8        | 11.0                  | 39             | Human gut, pool of 4 vegan samples    |
| chicken          | SRR15214153 | 33.6        | 17.6                  | 30             | Chicken gut microbiome                           |
