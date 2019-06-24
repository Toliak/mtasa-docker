FROM debian:9.9-slim

EXPOSE 22003/udp 22005/tcp 22126/udp

ARG GROUP_ID
ARG USER_ID
ENV GROUP_ID=1000
ENV USER_ID=1000
RUN groupadd -g ${GROUP_ID} mtasa && \
    useradd -ms /bin/bash mtasa -g ${GROUP_ID} -u ${USER_ID}
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
    rm -rf /tmp/ && \
    rm -rf /var/lib/apt && \
    rm -rf /var/lib/dpkg

VOLUME /home/mtasa/mods/deathmatch
VOLUME /home/mtasa/x64/modules
USER mtasa
CMD id && ./mta-server64