FROM gaow/base-notebook:1.0.0

MAINTAINER Diana Cornejo  <dmc2245@cumc.columbia.edu>

USER root
   
#Install dependecy tools and download datasets
     
RUN apt-get update && \
    apt-get clean		
RUN conda install -y  -c bioconda plink  && \
    conda clean --all 

RUN curl -fsSL http://statgen.us/files/2020/01/PRACDATA.zip -o PRACDATA.zip && \
    unzip PRACDATA.zip && \
    mv PRACDATA/fastlmmc /home/jovyan && chmod a+x fastlmmc && \
    mv PRACDATA/quantfamdata.*  /home/jovyan && \
    rm -rf PRACDAT* && \ 
    chown jovyan.users -R /home/jovyan/*

USER jovyan

ARG DUMMY=unknown

RUN curl -fsSL https://github.com/statgenetics/statgen-courses/blob/master/handout/FASTLMM-NY2020.pdf -o FASTLMM.pdf

