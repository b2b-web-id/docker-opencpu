FROM b2bwebid/r-base:buster

ENV BRANCH 2.2.5-3
ENV RSTUDIO 1.4.1717

RUN apt install -y locales apt-utils wget libprotobuf-dev protobuf-compiler apache2 apache2-dev ssl-cert libapparmor-dev libcurl4-openssl-dev libssl-dev libxml2-dev libssh2-1-dev libcairo2-dev xvfb xfonts-base debhelper && \
    apt clean && \
    useradd -ms /bin/bash builder && \
    localedef -i en_US -f UTF-8 en_US.UTF-8

USER builder

RUN cd ~ && \
  wget --quiet https://github.com/opencpu/opencpu-server/archive/v${BRANCH}.tar.gz && \
  tar xzf v${BRANCH}.tar.gz && \
  cd opencpu-server-${BRANCH} && \
  sed -i 's/bionic/buster/g' debian/changelog && \
  dpkg-buildpackage -us -uc

USER root

RUN apt-get install -y libapache2-mod-r-base && \
  dpkg -i /home/builder/opencpu-lib_*.deb && \
  dpkg -i /home/builder/opencpu-server_*.deb

RUN apt-get install -y gdebi-core git sudo && \
  wget --quiet https://download2.rstudio.org/server/bionic/amd64/rstudio-server-${RSTUDIO}-amd64.deb && \
  gdebi --non-interactive rstudio-server-${RSTUDIO}-amd64.deb && \
  rm -f rstudio-server-${RSTUDIO}-amd64.deb && \
  echo "server-app-armor-enabled=0" >> /etc/rstudio/rserver.conf

RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
  ln -sf /proc/self/fd/1 /var/log/apache2/error.log && \
  ln -sf /proc/self/fd/1 /var/log/opencpu/apache_access.log && \
  ln -sf /proc/self/fd/1 /var/log/opencpu/apache_error.log

RUN echo "opencpu:opencpu" | chpasswd

EXPOSE 80
EXPOSE 443
EXPOSE 8004

RUN wget https://raw.githubusercontent.com/b2b-web-id/docker-opencpu/master/cran.R -O /root/cran.R && \
    Rscript /root/cran.R
RUN wget https://raw.githubusercontent.com/b2b-web-id/docker-opencpu/master/github.R -O /root/github.R && \
    Rscript /root/github.R

CMD /usr/lib/rstudio-server/bin/rserver && apachectl -DFOREGROUND
