FROM opencpu/debian-10:latest
RUN apt update; \
  apt upgrade -y; \
  apt install -y \
   libnlopt-dev libnlopt-guile0 libnlopt0
COPY install.R /root
RUN Rscript /root/install.R; \
  rm /root/install.R
