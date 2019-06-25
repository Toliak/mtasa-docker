FROM debian:9.9-slim

EXPOSE 22003/udp 22005/tcp 22126/udp

RUN useradd -ms /bin/bash mtasa
WORKDIR /home/mtasa

RUN apt-get -y update && \
    apt-get -y install wget && \
    mkdir -p /tmp/mtasa && \
    cd /tmp/mtasa && \
    wget http://linux.mtasa.com/dl/multitheftauto_linux_x64.tar.gz && \
    tar -xf multitheftauto_linux_x64.tar.gz && \
    cd /home/mtasa && \
    mv -v /tmp/mtasa/multitheftauto_linux_x64/* . && \
    apt-get -y purge wget && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /tmp/mtasa && \
    rm -rf /var/lib/apt

VOLUME /home/mtasa/mods/deathmatch
VOLUME /home/mtasa/x64/modules
USER mtasa
CMD ./mta-server64