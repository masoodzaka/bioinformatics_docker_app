# Bioinformatics Docker App

[Introduction](#introduction)

[Software](#software)

[Usage](#usage)

[Contribution/Extending the current version](#versioning)


## Introduction

This docker app is collection of some of the most popular software currently being used in the analysis of next generation sequencing data. All of the software are ready to use in the docker image that can be run on any machine (e.g. Mac, Linux and Windows) or on high performance cluster/computing platform via singularity. The docker app respository is available from the [docker hub](https://hub.docker.com/repository/docker/masoodzaka/bioinformatics).

## Sotware 

Here is the list of software available through this docker app. All of the sotware binaries are paresent in the /opt directory and soft linked to the /usr/bin for ready to use. Each of the sotware/tool standard use or manual can be accessed on providers webpages.

* Fastq quality check and manipulation tools 
  - [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
  - [MultiQC](https://multiqc.info/)
  - [Trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic)
  - [Cutadapt](https://cutadapt.readthedocs.io/en/stable/index.html)
  - [Trim Galore](https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/)
* NGS data manipulation tools
  - [Bcftools](https://samtools.github.io/bcftools/bcftools.html)
  - [Samtools](http://www.htslib.org/download/)
  - [Htslib](http://www.htslib.org/download/)
  - [Seqkit](https://bioinf.shenwei.me/seqkit/)
  - [Vcftools](https://vcftools.github.io/index.html)
  - [Bedtools](https://bedtools.readthedocs.io/en/latest/)
  - [Bedops](https://bedops.readthedocs.io/en/latest/) 
* Fasta aligner and fastq alignment tools
  - [Blast+](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastDocs&DOC_TYPE=Download)
  - [ClustaW](https://vcru.wisc.edu/simonlab/bioinformatics/programs/clustal/clustalw.1.html)
  - [Mafft](https://mafft.cbrc.jp/alignment/software/)
  - [Bowtie2](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml)
  - [BWA](http://bio-bwa.sourceforge.net/)
  - [Minimap2](https://lh3.github.io/minimap2/minimap2.html)
  - [Lofreq](https://csb5.github.io/lofreq/)
  - [Hisat2](http://daehwankimlab.github.io/hisat2/)
  - [Tophat](https://ccb.jhu.edu/software/tophat/index.shtml)
  - [StringTie](https://ccb.jhu.edu/software/stringtie/)
  - [Cufflinks](http://cole-trapnell-lab.github.io/cufflinks/install/)
  - [STAR](https://github.com/alexdobin/STAR)
  - [Salmon](https://salmon.readthedocs.io/en/latest/salmon.html)
  - [Subread](http://subread.sourceforge.net/)
  - [GATK-4.2.6.1](https://github.com/broadinstitute/gatk/releases)
  - [PICARD](https://broadinstitute.github.io/picard/)
  - [Macs2](https://github.com/macs3-project/MACS)
 * Variant annotation tools
  - [SnpEFF](http://pcingola.github.io/SnpEff/)
  - [ANNOVAR](https://annovar.openbioinformatics.org/en/latest/)
 * NGS and genome download tools
  - [SRA Toolkit](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc)
