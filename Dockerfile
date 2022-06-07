## Collection of bioinformatics analysis tools

## Ubuntu 20.04 (focal)
## OS/ARCH: linux/amd64

ARG ROOT_CONTAINER=ubuntu:20.04@sha256:47f14534bda344d9fe6ffd6effb95eefe579f4be0d508b7445cf77f61a0e5724

ARG BASE_CONTAINER=$ROOT_CONTAINER
FROM $BASE_CONTAINER

LABEL maintainer="Masood Zaka<masood6985@gmail.com>"
ARG NB_USER="compbio"
ARG NB_UID="1000"
ARG NB_GID="100"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

ENV DEBIAN_FRONTEND=noninteractive

## Install all OS dependencies

RUN apt-get update && apt-get -yq dist-upgrade \
&& apt-get install --fix-missing -yq build-essential \
xorg-dev \
apt-utils \
htop \
wget \
bzip2 \
sudo \
ca-certificates \
locales \
git \
nano \
vim \
jed \
emacs \
python-dev \
unzip \
libsm6 \
pandoc \
texlive-full \
libxrender1 \
inkscape \
pkg-config \
libxml2-dev \
libcurl4-gnutls-dev \
libatlas3-base \
libopenblas-base \
libfreetype6-dev \
pigz \
zlib1g-dev \
autoconf \
automake \
libtool \
libexpat1-dev \
libxml2-dev \
libxslt1-dev \
ghostscript \
environment-modules \
gcc \
f2c \
gfortran \
libpcre3 \
libpcre3-dev \
libssl-dev \
libsqlite3-dev \
python-dev \
zlib1g-dev \
curl \
libbz2-dev \
emboss \
bioperl \
libjson-perl \
libtext-csv-perl \
libfile-slurp-perl \
liblwp-protocol-https-perl \
libwww-perl \
roary \
python3 \
python3-distutils \
libdatetime-perl \
libxml-simple-perl \
libdigest-md5-perl \
default-jre \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
locale-gen
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER ; \
echo "root:bioinfo" | chpasswd ; \
echo "compbio:bioinfo" | chpasswd ; \
adduser compbio sudo

## Bioinformatics tools starts here..!

## Quality check tools

## FastQC
RUN cd /opt && wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip -P /opt \
&& unzip fastqc_v0.11.9.zip \
&& chmod 755 FastQC/fastqc \
&& ln -s /opt/FastQC/fastqc /usr/bin

## Multiqc
RUN cd /opt && apt-get update && apt-get install -y software-properties-common \
&& add-apt-repository ppa:deadsnakes/ppa \
&& apt-get install -y python3.9 \
&& wget https://bootstrap.pypa.io/get-pip.py \
## RUN python3.9 get-pip.py (doesn't work)
&& apt-get install -y python3-pip \
&& pip3 install cython \
&& pip3 install multiqc

## Trimmomatic
RUN cd /opt && wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.39.zip \
&& unzip Trimmomatic-0.39.zip
ENV TRIMMOMATIC /opt/Trimmomatic-0.39/trimmomatic-0.39.jar

## Cutadapt
RUN cd /opt && pip3 install --user --upgrade cutadapt \
&& ln -s ~/.local/bin/cutadapt /usr/bin

## Trime Galore
RUN cd /opt && curl -fsSL https://github.com/FelixKrueger/TrimGalore/archive/0.6.6.tar.gz -o trim_galore.tar.gz \
&& tar xvzf trim_galore.tar.gz \
&& ln -s /opt/TrimGalore-0.6.6/trim_galore /usr/bin

## Htslib
RUN cd /opt && wget https://github.com/samtools/htslib/releases/download/1.15.1/htslib-1.15.1.tar.bz2 \
&& tar -xvjf htslib-1.15.1.tar.bz2 \
&& cd htslib-1.15.1 \
&& make \
&& ln -s /opt/htslib-1.15.1 /usr/bin/htslib-1.15.1

## Samtools
RUN cd /opt && wget https://github.com/samtools/samtools/releases/download/1.15.1/samtools-1.15.1.tar.bz2 \
&& tar -xvjf samtools-1.15.1.tar.bz2 \
&& cd samtools-1.15.1 \
&& make \
&& ln -s /opt/samtools-1.15.1/samtools /usr/bin/samtools-1.15.1

## Bcftools
RUN cd /opt && wget https://github.com/samtools/bcftools/releases/download/1.15.1/bcftools-1.15.1.tar.bz2 \
&& tar -xvjf bcftools-1.15.1.tar.bz2 \
&& cd bcftools-1.15.1 \
&& make \
&& ln -s /opt/bcftools-1.15.1/bcftools /usr/bin/bcftools

## Genome alignement tools

## Blast+
RUN cd /opt && wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.13.0+-x64-arm-linux.tar.gz \
&& tar -xzvf ncbi-blast-2.13.0+-x64-arm-linux.tar.gz \
&& ln -nsf /opt/ncbi-blast-2.13.0+/bin/* /usr/bin

## ClustalW
RUN cd /opt && wget ftp.ebi.ac.uk/pub/software/clustalw2/2.0.12/clustalw-2.0.12-linux-i686-libcppstatic.tar.gz \
&& tar -zxvf clustalw-2.0.12-linux-i686-libcppstatic.tar.gz \
&& ln -s /opt/clustalw-2.0.12-linux-i686-libcppstatic/clustalw2 /usr/bin

## Mafft
RUN cd /opt && wget https://mafft.cbrc.jp/alignment/software/mafft-7.490-with-extensions-src.tgz \
&& tar -xzvf mafft-7.490-with-extensions-src.tgz \
&& cd mafft-7.490-with-extensions/core \
&& make \
&& make install

## Bowtie2
RUN cd /opt && wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.4.2/bowtie2-2.4.2-sra-linux-x86_64.zip/download \
&& unzip download \
&& ln -s /opt/bowtie2-2.4.2-sra-linux-x86_64 /usr/bin

## BWA
RUN cd /opt && git clone https://github.com/lh3/bwa.git \
&& cd bwa \
&& make \
&& ln -s /opt/bwa /usr/bin/bwa-0.7.17

## Minimap2
RUN cd /opt && git clone https://github.com/lh3/minimap2 \
&& cd minimap2 \
&& make \
&& ln -s /opt/minimap2/minimap2 /usr/bin

## LoFreq
RUN cd /opt && wget -O lofreq_star-2.1.2.tgz https://sourceforge.net/projects/lofreq/files/lofreq_star-2.1.2_linux-x86-64.tgz/download \
&& tar -zxvf lofreq_star-2.1.2.tgz \
&& ln -s /opt/lofreq_star-2.1.2/bin/lofreq /usr/bin

## Hisat2
RUN cd /opt && wget -O hisat2-2.2.1.zip https://cloud.biohpc.swmed.edu/index.php/s/oTtGWbWjaxsQ2Ho/download \
&& unzip /opt/hisat2-2.2.1.zip \
&& ln -s /opt/hisat2-2.2.1/* /usr/bin

## StringTie
RUN cd /opt && wget http://ccb.jhu.edu/software/stringtie/dl/stringtie-2.2.1.Linux_x86_64.tar.gz \
&& tar -xzvf stringtie-2.2.1.Linux_x86_64.tar.gz \
&& cd stringtie-2.2.1.Linux_x86_64 \
&& ln -s /opt/stringtie-2.2.1.Linux_x86_64/stringtie /usr/bin

## Tophat
RUN cd /opt && wget http://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.1.Linux_x86_64.tar.gz \
&& tar -xzvf tophat-2.1.1.Linux_x86_64.tar.gz \
&& ln -s /opt/tophat-2.1.1.Linux_x86_64/tophat* /usr/bin

## Cufflinks
RUN cd /opt && wget http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz \
&& tar -xzvf cufflinks-2.2.1.Linux_x86_64.tar.gz \
&& ln -s /opt/cufflinks-2.2.1.Linux_x86_64/cuff* /usr/bin

## STAR 2.7.10a
RUN cd /opt && wget https://github.com/alexdobin/STAR/archive/2.7.10a.tar.gz \
&& tar -xzf 2.7.10a.tar.gz \
&& ln -s /opt/STAR-2.7.10a/bin/Linux_x86_64_static/STAR* /usr/bin

# Salmon
RUN cd /opt && wget https://github.com/COMBINE-lab/salmon/releases/download/v1.8.0/salmon-1.8.0_linux_x86_64.tar.gz \
&& tar -xzvf salmon-1.8.0_linux_x86_64.tar.gz \
&& ln -s /opt/salmon-1.8.0_linux_x86_64/bin/salmon /usr/bin

## Subread
RUN cd /opt && wget https://sourceforge.net/projects/subread/files/subread-2.0.3/subread-2.0.3-Linux-x86_64.tar.gz \
&& tar -xzvf subread-2.0.3-Linux-x86_64.tar.gz \
&& ln -s /opt/subread-2.0.3-Linux-x86_64/bin/* /usr/bin


## GATK 4.2.6.1
RUN cd /opt && wget https://github.com/broadinstitute/gatk/releases/download/4.2.6.1/gatk-4.2.6.1.zip \
&& unzip gatk-4.2.6.1.zip \
&& ln -s /opt/gatk-4.2.6.1/gatk /usr/bin

## PICARD
RUN mkdir -p /opt/picard && cd /opt/picard && wget https://github.com/broadinstitute/picard/releases/download/2.27.2/picard.jar
ENV PICARD /opt/picard/picard.jar

## MACS2
RUN cd /opt && pip3 install MACS2

## Variant annotations tools start here

## SnpEFF
RUN cd /opt && wget https://sourceforge.net/projects/snpeff/files/snpEff_latest_core.zip \
&& unzip snpEff_latest_core.zip \
&& mkdir /opt/snpEff/bin \
&& echo "#!/usr/bin/env bash" > /opt/snpEff/bin/snpEff \
&& echo "java -jar /opt/snpEff/snpEff.jar ${@}" >> /opt/snpEff/bin/snpEff \
&& echo "#!/usr/bin/env bash" > /opt/snpEff/bin/SnpSift \
&& echo "java -jar /opt/snpEff/SnpSift.jar ${@}" >> /opt/snpEff/bin/SnpSift \
&& chmod a+x /opt/snpEff/bin/*
ENV PATH /opt/snpEff/bin:${PATH}


## Annovar
RUN cd /opt &&  wget -O annovar.latest.tar.gz http://www.openbioinformatics.org/annovar/download/0wgxR2rIVP/annovar.latest.tar.gz \
&& tar -xzvf annovar.latest.tar.gz \
&& ln -s /opt/annovar/annotate_variation.pl /usr/bin


## Others tools start here

## NCBI toolkit
RUN cd /opt && wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz \
&& tar -xzvf sratoolkit.current-ubuntu64.tar.gz \
&& ln -s /opt/sratoolkit.3.0.0-ubuntu64/bin/* /usr/bin

## Bedtools
RUN cd /opt && wget https://github.com/arq5x/bedtools2/releases/download/v2.30.0/bedtools-2.30.0.tar.gz \
&& tar -xzvf bedtools-2.30.0.tar.gz \
&& cd bedtools2 \
&& make

## Bedops
RUN mkdir /opt/bedops && cd /opt/bedops \
&& wget https://github.com/bedops/bedops/releases/download/v2.4.40/bedops_linux_x86_64-v2.4.40.tar.bz2 \
&& tar -xjvf bedops_linux_x86_64-v2.4.40.tar.bz2 \
&& ln -s /opt/bedops/bin/* /usr/bin

## VCFtools
RUN cd /opt && wget https://sourceforge.net/projects/vcftools/files/vcftools_0.1.13.tar.gz \
&& tar xzvf vcftools_0.1.13.tar.gz \
&& cd vcftools_0.1.13 && make \
&& ln -s /opt/vcftools_0.1.13/bin/vcf* /usr/bin

## Seqkit
RUN mkdir -p /opt/seqkit/bin && cd /opt/seqkit/bin && wget https://github.com/shenwei356/seqkit/releases/download/v2.2.0/seqkit_linux_amd64.tar.gz \
&& tar -xzvf seqkit_linux_amd64.tar.gz \
&& ln -s /opt/seqkit/bin/seqkit /usr/bin


## Deleting temp files

RUN rm /opt/*.tar.gz \
&& rm /opt/*.tgz \
&& rm /opt/*.tar.bz2 \
&& rm /opt/*.zip

USER $NB_USER
WORKDIR $HOME/$NB_USER