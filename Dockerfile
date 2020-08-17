FROM opencpu/debian-10:latest
RUN apt update; \
  apt upgrade -y; \
  apt install -y \
   libnlopt-dev libnlopt-guile0 libnlopt0 wget
RUN wget https://raw.githubusercontent.com/b2b-web-id/docker-opencpu/master/cran.R -O /root/cran.R && \
    Rscript /root/cran.R
RUN wget https://raw.githubusercontent.com/b2b-web-id/docker-opencpu/master/github.R -O /root/github.R && \
    Rscript /root/github.R

