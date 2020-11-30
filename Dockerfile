FROM bioconductor/bioconductor_docker:RELEASE_3_12

#setup R configs
RUN Rscript -e "install.packages('Rcpp')"

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
RUN Rscript -e "remotes::install_github('twitter/AnomalyDetection')"
RUN Rscript -e "BiocManager::install('MSstats')"

RUN Rscript -e "install.packages('qcc')"
RUN Rscript -e "install.packages('ggQC')"
RUN Rscript -e "install.packages('MSQC')"
RUN Rscript -e "install.packages('IQCC')"
RUN Rscript -e "install.packages('yhatr')"
RUN Rscript -e "install.packages('pracma')"
RUN Rscript -e "install.packages('anomalize')"
RUN Rscript -e "install.packages('DMwR')"
RUN Rscript -e "install.packages('outliers')"

RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests \ 
  software-properties-common \
  git \
  vim \
  libgomp1 \
  zlib1g-dev \
  libstdc++6 \
  sudo \
  build-essential \
  libssl-dev \
  libcurl4-openssl-dev \
  gnupg2 \
  python-dev \
  python3-dev \
  libxml2-dev \
  libxslt-dev &&\
  rm -rf /var/lib/apt/lists/*

RUN pip3 install pip --upgrade
RUN pip3 install setuptools --upgrade
RUN pip3 install --force-reinstall 'pytest<=5.0.1'
RUN pip3 install numpy mypy pronto pytest jupyter rpy2 biopython flask

