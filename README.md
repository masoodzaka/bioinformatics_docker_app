# Bioinformatics Docker App

[Introduction](#introduction)

[Software](#software)

[Usage](#usage)

[Contributions and Updates](#contributions-and-updates)



## Introduction

This docker app is collection of some of the most popular software currently being used in the analysis of next generation sequencing data. All of the software are ready to use in the docker image that can be run on any machine (e.g. Mac, Linux and Windows) or on high performance cluster/computing platform via singularity. The docker app respository is available from the [docker hub](https://hub.docker.com/repository/docker/masoodzaka/bioinformatics).

## Software 

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

## Usage 

### Login account details for sudo

----
User: `compbio`

Password: `bioinfo`

----
### For docker desktop (windows)

* Pull image from online docker hub to local computer. 
```
docker pull masoodzaka/bioinformatics:v1.0.0
````
----
* Create a folder to map it to docker container on your window's drive
```
e.g. drive(d):/compbio
```
----
* Start the your contianer using following command from the latest version of docker app
```
docker run -d -v d:/compbio:/home/compbio \
--name bioinfo_container \
-it masoodzaka/bioinformatics:<tag>
```
* Connect to the running container using following command
```
docker exec -i -t bioinfo_container
```
* Stop the running container 
```
docker stop bioinfo_container
```
* Re-running the existing will have two steps
```
docker start bioinfo_container 
docker attach bioinfo_container
```
### For docker (Ubuntu)

* Create a folder to map it to docker container using following command
```
sudo mkdir -p compbio
```
----
* Start the your contianer using following command from the latest version of docker app
```
sudo docker run -d -v ~/compbio:/home/compbio \
--name bioinfo_container \
-it masoodzaka/bioinformatics:<tag>
```
* Connect to the running container using following command
```
docker exec -i -t bioinfo_container
```

### For HPC or Clusters

For security reasons, docker is not directory accessible on HPC or Computer clusters environment such as SGE or Slurm on private, research lab or University network. However, we can use [Singularity](https://hpc.nih.gov/apps/singularity.html) such as this one from NIH as an ulternate for performing similar tasks. To learn more about singularity visit this documentation from [Sylabs](https://sylabs.io/guides/2.6/user-guide/singularity_and_docker.html). 

You can quick start singularity by pulling the docker image using following command. 
```
singularity pull docker://masoodzaka/bioinformatics
```

## Contributions and updates

Clone the main git repository using:
```bash
git clone https://github.com/masoodzaka/bioinformatics_docker_app.git
```
and make a new folder with version tag:
```bash
cd bioinformatics_docker_app
mkdir -p v1.0.1
cd v1.0.1
touch Dockerfile
```
Access the content of previous Dockerfile image using the "FROM" root container:
```bash
FROM masoodzaka/bioinformatics:v1.0.0
```
And build the latest docker image app using standard docker build command
```bash
docker build -t masoodzaka/bioinformatics:v1.0.1
```
Push the docker image 
```bash
docker image push masoodzaka/bioinformatics:v1.0.1
```

----
The bioinformatics docker app will be regularly updated with latest software currently being implemented in the best practices analysis of high-throughput data. 
