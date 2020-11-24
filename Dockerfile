FROM python:3.6.9-slim-buster
#FROM python:3.6.5-slim-jessie
#FROM python:2.7-slim-jessie

# terminal fix
ENV DEBIAN_FRONTEND noninteractive 
# apt-key fix
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1  
 
RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests \ 
  software-properties-common \
  git \
  vim \
  libqt4-network \
  libgomp1 \
  zlib1g-dev \
  libstdc++6 \
  sudo \
  build-essential \
  libssl-dev \
  libcurl4-openssl-dev \
  gnupg2

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN echo "deb http://http.debian.net/debian buster main" > /etc/apt/sources.list.d/debian-unstable.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0xE19F5F87128899B192B1A2C2AD5F960A256A04AF &&\
	add-apt-repository 'deb http://cloud.r-project.org/bin/linux/debian buster-cran40/' &&\
	apt-get update

RUN apt-get install -y --no-install-recommends \
  r-base-core \
  r-base \
  r-recommended \
  libopenblas-base \
  gfortran \
  pandoc &&\
  rm -rf /var/lib/apt/lists/*
    

#setup R configs
RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e "install.packages('tidyverse')"
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('tibble')"
RUN Rscript -e "install.packages('tidyr')"
RUN Rscript -e "install.packages('data.table')"

RUN Rscript -e "install.packages('RColorBrewer')"
RUN Rscript -e "install.packages('heatmap3')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('graphics')"
RUN Rscript -e "install.packages('cowplot')"
RUN Rscript -e "install.packages('ggrepel')"
RUN Rscript -e "install.packages('lubridate')"
RUN Rscript -e "install.packages('chron')"
RUN Rscript -e "install.packages('scales')"
RUN Rscript -e "install.packages('grid')"
RUN Rscript -e "install.packages('gridExtra')"

RUN Rscript -e "install.packages('plotly')"
RUN Rscript -e "install.packages('htmlwidgets')"
RUN Rscript -e "install.packages('knitr')"

RUN Rscript -e "install.packages('devtools')"
RUN Rscript -e "install.packages('Rcpp')"
RUN Rscript -e "library('devtools'); install_github('twitter/AnomalyDetection')"

RUN Rscript -e "install.packages('qcc')"
RUN Rscript -e "install.packages('ggQC')"
RUN Rscript -e "install.packages('MSQC')"
RUN Rscript -e "install.packages('IQCC')"
RUN Rscript -e "install.packages('yhatr')"
RUN Rscript -e "install.packages('MSstats')"
RUN Rscript -e "install.packages('pracma')"
RUN Rscript -e "install.packages('anomalize')"
RUN Rscript -e "install.packages('DMwR')"
RUN Rscript -e "install.packages('outliers')"

#RUN echo 'install.packages(c("ggplot2", "plyr", "reshape2", "RColorBrewer", "scales", "FactoMineR", \
#"Hmisc", "cowplot", "shiny"), repos="http://cran.us.r-project.org", dependencies=TRUE)' > /tmp/packages.R \
#&& Rscript /tmp/packages.R

RUN pip install pip --upgrade
RUN pip install setuptools --upgrade
RUN pip install --force-reinstall 'pytest<=5.0.1'
RUN pip install numpy mypy pronto pytest jupyter rpy2 biopython flask
