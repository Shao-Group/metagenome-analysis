# Overview

## Benchmarking and analysis different de novo Metagenome Assemblers for long-read data

This project benchmarks different de novo metagenome assemblers to assess the
performance and limitations with respect to long-read metagenome data (both
synthetic and real). 

The following assemblers are benchmarked:

* **hifiasm-meta**
[hifiasm](https://github.com/xfengnefx/hifiasm-meta)

* **hiCanu**
[canu](https://github.com/marbl/canu)

* **metaFlye**
[Flye](https://github.com/fenderglass/Flye)

* **Raven**
[Raven](https://github.com/lbcb-sci/raven)

## Benchmarking datasets
The tools were evaluated using the following public datasets:


|                  | accession   | #bases (Gb) | N50 read<br>length (kb)| Median read QV | Sample description                               |
|------------------|-------------|-------------|-----------------------|----------------|--------------------------------------------------|
| ATCC        | SRR11606871 | 59.2        | 12.0                  | 36             | Mock, ATCC MSA-1003                     |
| zymoBIOMICS | SRR13128014 | 18.0        | 10.6                  | 40             | Mock, ZymoBIOMICS D6331                 |
| sheepA           | SRR10963010 | 51.9        | 14.3                  | 25             | Sheep gut microbiome                             |
| sheepB           | SRR14289618 | 206.4       | 11.8                  | N/A*            | Sheep gut microbiome                             |
| humanO1          | SRR15275213 | 18.5        | 11.4                  | 40             | Human gut, pool of 4 omnivore samples |
| humanO2          | SRR15275212 | 15.5        | 10.3                  | 41             | Human gut, pool of 4 omnivore samples |
| humanV1          | SRR15275211 | 18.8        | 11.0                  | 39             | Human gut, pool of 4 vegan samples    |
| humanV2          | SRR15275210 | 15.2        | 9.6                   | 40             | Human gut, pool of 4 vegan samples    |
| chicken          | SRR15214153 | 33.6        | 17.6                  | 30             | Chicken gut microbiome                           |
  


