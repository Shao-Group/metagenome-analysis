# Benchmarking and analysis different de novo Metagenome Assemblers for long-read data


**Contents**

1. [Overview](#1-overview)
2. [Long-read Metagenome Assembly](#2-long-read-metagenome-assembly)
    1.  [Quality Control](#21--quality-control)
    2.  [Assembly](#22--assembly)
    3.  [Assessment](#23--assessment)
3. [References](#3-references)

## 1. Overview

The following assemblers are benchmarked:

This project benchmarks different de novo metagenome assemblers to assess the performance and limitations with respect to long-read metagenome data (both synthetic and real).

The following assemblers are analyzed:

* [**metaFlye**](https://github.com/fenderglass/Flye)
* [**hiCanu**](https://github.com/marbl/canu)
* [**hifiasm-meta**](https://github.com/xfengnefx/hifiasm-meta)
* [**Raven**](https://github.com/lbcb-sci/raven)

## 2. Long-read Metagenome Assembly


### 2.1 Quality Control

### 2.2 Assembly
Here, we will be running all 4 assemblers (metaFlye[^fn1], hiCanu[^fn2], hifiasm-meta[^fn3] and Raven[^fn4]).

### 2.2.1 metaFlye Assembly
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

The shell script [run_flye.sh](https://github.com/Shao-Group/metagenome-analysis/blob/master/scripts/run_flye.sh) would run the assembly tool on
all the datasets.

### 2.2.2 hiCanu Assembly 
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

### 2.2.3 hifiasm-meta Assembly

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




### 2.3.2 Assembly evaluation using metaQUAST
For assembly evaluation, we used [metaQUAST](https://github.com/ablab/quast)[^fn5] to compute various metrics.

Command for running metaQUAST.
```
python3 metaquast.py \
    --threads=20 \
    --mgm \
    --gene-finding \
    --labels=metaFlye,hiCani,hifiasm-meta,Raven \
    /path/to/metaFlye/contigs ....
    -o /path/to/output
```
```
Usage: metaquast
--threads       maximum number of threads.
--mgm           force use of MetaGeneMark for gene finding.
--gene-finding  enables gene finding.
--labels        human-readable assembly names for the report.
-o              output directory. 
```

### 2.3.3 Binning using MetaBat2 

We used [MetaBat2](https://bitbucket.org/berkeleylab/metabat/src/master/)[^fn6] for binning the assembly result to be further able to check for genome completedness.

Command for running MetaBat2:

```
./metabat2 \
  -i /path/to/data/ecoli_assembly.fasta \
  -o ecoli_hifi/bin \
  -d -v
```
```
Usage: metabat2
-i  Contigs in (gzipped) fasta file format 
-o  Base file name and path for each bin. The default output is fasta format.                   
-d  Debug output
-v  Verbose output
```

### 2.3.4 Genome Completedness using CheckM
In here, we will be evaluate the assemblies using [CheckM](https://github.com/Ecogenomics/CheckM)[^fn7].

Some convention,
- Near-complete: > 90\% checkM completeness score & < 5\% contamination score.
- High-quality:  > 70\% complete & < 10\% contaminated.
- Medium-quality: > 50\% complete & QS > 50. 

where QS (quality score) is given by `completeness-(5*contamination)`.

Command for running CheckM:

```
./checkm lineage_wf \
  -t 40 \
  -x fa path/to/bins(MetaBat2) \
  path/to/output
  
./checkm analyze \
  -t 40 \
  checkm_data/hmms/phylo.hmm \
  -x fa \
  path/to/bins(MetaBat2) \
  path/to/output

./checkm qa \
  -t 40  \
  --out_format 1 \
  -f path/to/output/qa_result.txt \
  checkm_data/hmms/phylo.hmm \
  path/to/output
```
```
Usage: checkm
-t               number of threads
-x               input data extension
--output format  option 1
-f               file         
```

### 2.3.5 Quality Analysis using BUSCO

The quality of metagenome assembly was analyzed using [BUSCO](https://busco.ezlab.org/)[^fn8].

Command for running BUSCO:

```
./busco \
  -f \
  -c 40 \
  -m genome \
  --augustus \
  -i path/to/input/assembly \
  -o path/to/output \
  --auto-lineage-euk
  
mkdir path/to/output/summary   
cp path/to/output/short_summary.* path/to/output/summary

python3 generate_plot.py \
  -wd path/to/output/summary
```  
```
Usage: busco
-f                   force rewriting of existing files
-c                   specify the number of threads/cores to use
-m                   specify which BUSCO analysis mode to run (genome for genome assemblies)
--augustus           use augustus gene predictor for eukaryote runs
-i                   input sequence file in FASTA format
-o                   output directory
--auto-lineage-euk   run auto-placement just on eukaryote tree to find optimum lineage path
-wd                  location of your working directory
```


|             | >1Mb circular contigs | >1Mb circular contigs,<br>near-complete | Near-complete MAGs | High-quality MAGs | Medium-quality MAGs |
|-------------|-----------------------|--------------------------------------|--------------------|-------------------|---------------------|
| E.coli      | x                  | x                                | x             | x               | x                  |
| ATCC      | x                  | x                                 | x                | x              | x                 |
| Zymo     | x                    | x                                   | x                 | x                | x                |
| Sheep     | x                  | x                                   | x               | x                | x                  |
| human     | x                   | x                                  | x                | x                | x                 |
| Chicken     | x                  | x                                   |x                | x               | x                  |



|             | Wall clock (h) | PeakRSS (Gb) |
|-------------|------------|---------|
| E.coli       | y         | y    |
| ATCC | y       | y     |
| Zymo      | y      | y     |
| Sheep      | y        | y   |
| Human     | y      | y   |
| Chicken     | y         | y    |

### 2.3.6 Vizualization using Bandage
A [Bandage](https://github.com/rrwick/Bandage) plot of chicken's primary contig graph.
<p align="center">
 ![Graph](https://github.com/Shao-Group/metagenome-analysis/blob/master/plots/chicken/chicken_hifiasm_graph.png)

| **Assembler** | **Dataset**| **Node count**| **Edge count**| **Median depth** | 
|:-------------:|:-----------:|:---------------|:-------------:|:------------------:
| MetaFlye      | E\.coli     | 1         | 1           |         302.0x          | 
|               | ATCC        | 137       | 68          |         192.0x          | 
|               | Zymo        | 840       | 443          |     130.0x              | 
|               | SheepA      | 27,296    | 14,735        |  10.0x                 | 
|               | HumanV1     | 24,671    | 17,056        |   9.0x                | 
|               | Chicken     | 10,963    | 11,359         |   10.0x                | 
| HiCanu        | E\.coli     |   6,405   |       6,578  |    1.0x               | 
|               | ATCC        |     82,270| 95,069       |     1.0x              | 
|               | Zymo        | 31,164          |   34,126       |   1.0x       | 
|               | SheepA      |  505,391    | 499,733     |    1.0x       | 
|               | HumanV1     |  370,372    | 360,885    |     1.0x         | 
|               | Chicken     |   153,854 |   152,774     |      1.0x     | 
| Hifiasm-meta  | E\.coli     | 129    |   1          |    178.0x               | 
|               | ATCC        | 72,765   |   126,045         |    11.0x               | 
|               | Zymo        |   25,203 |   29,792        |    11.0x               | 
|               | SheepA      |  34,783 |    5,624       |    3.0x               | 
|               | HumanV1     |   23,114  |     3,720    |   3.0x             | 
|               | Chicken     |  21,903 | 14,556   |    2.0x      | 
| Raven         | E\.coli     |      1          |     1          |  0.00134x     | 
|               | ATCC        |     354     |     26         |  0.000612x       | 
|               | Zymo        |    940      |   52         |    0.000488x       | 
|               | SheepA      |     24,366    |  12,237   | 0.000349x         | 
|               | HumanV1     |     15,703   |      2,676      |   0.000396x        | 
|               | Chicken     |  8,635     |   1,721    |   0.000229x        |

    
## 3. References
[^fn1]: Mikhail Kolmogorov, Derek M. Bickhart, Bahar Behsaz, Alexey Gurevich, Mikhail Rayko, Sung Bong Shin, Kristen Kuhn, Jeffrey Yuan, Evgeny Polevikov, Timothy P. L. Smith and Pavel A. Pevzner "metaFlye: scalable long-read metagenome assembly using repeat graphs", Nature Methods, 2020 doi:s41592-020-00971-x

[^fn2]: Nurk S, Walenz BP, Rhiea A, Vollger MR, Logsdon GA, Grothe R, Miga KH, Eichler EE, Phillippy AM, Koren S. HiCanu: accurate assembly of segmental duplications, satellites, and allelic variants from high-fidelity long reads. biorXiv. (2020)

[^fn3]: Feng, Xiaowen, et al. "Metagenome assembly of high-fidelity long reads with hifiasm-meta." arXiv preprint arXiv:2110.08457 (2021)

[^fn4]: Vaser, R., Šikić, M. Time- and memory-efficient genome assembly with Raven. Nat Comput Sci 1, 332–336 (2021). https://doi.org/10.1038/s43588-021-00073-4

[^fn5]: Alla Mikheenko, Vladislav Saveliev, Alexey Gurevich, MetaQUAST: evaluation of metagenome assemblies, Bioinformatics, Volume 32, Issue 7, 1 April 2016, Pages 1088–1090, https://doi.org/10.1093/bioinformatics/btv697

[^fn6]: Kang DD, Li F, Kirton E, Thomas A, Egan R, An H, Wang Z. 2019. MetaBAT 2: an adaptive binning algorithm for robust and efficient genome reconstruction from metagenome assemblies. PeerJ 7:e7359 https://doi.org/10.7717/peerj.7359

[^fn7]: Parks DH, Imelfort M, Skennerton CT, Hugenholtz P, Tyson GW. 2015. CheckM: assessing the quality of microbial genomes recovered from isolates, single cells, and metagenomes. Genome Research, 25: 1043–1055.

[^fn8]: Mosè Manni, Matthew R Berkeley, Mathieu Seppey, Felipe A Simão, Evgeny M Zdobnov, BUSCO Update: Novel and Streamlined Workflows along with Broader and Deeper Phylogenetic Coverage for Scoring of Eukaryotic, Prokaryotic, and Viral Genomes, Molecular Biology and Evolution, Volume 38, Issue 10, October 2021, Pages 4647–4654.

[^fn9]: Wick R.R., Schultz M.B., Zobel J. & Holt K.E. (2015). Bandage: interactive visualisation of de novo genome assemblies. Bioinformatics, 31(20), 3350-3352.
