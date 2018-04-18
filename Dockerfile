FROM opencpu/debian-9:v2.0.7
RUN apt update; \
  apt install -y \
   libnlopt-dev libnlopt-guile0 libnlopt0
COPY install.R /root
RUN Rscript /root/install.R; \
  rm /root/install.R
