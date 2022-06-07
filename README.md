# Bioinformatics Docker App

[Introduction](#introduction)

[Software](#software)

[Usage](#usage)

[Contribution/Extending the current version](#versioning)


## Introduction

This docker app is collection of some of the most popular software currently being used in the analysis of next generation sequencing data. All of the software are ready to use in the docker image that can be run on any machine (e.g. Mac, Linux and Windows) or on high performance cluster/computing platform via singularity. The docker app respository is available from the [docker hub](https://hub.docker.com/repository/docker/masoodzaka/bioinformatics).

## Sotware 

Here is the list of software available through this docker app. All of the sotware binaries are paresent in the /opt directory and soft linked to the /usr/bin for ready to use. Each of the sotware/tool standard use or manual can be accessed on providers webpages.

* NGS quality check tools 
  - [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
* Aligner or alignment tools
  - [Blast+](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastDocs&DOC_TYPE=Download)
