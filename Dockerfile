FROM sdhibit/rpi-raspbian

MAINTAINER Lee Mc Kay <v3047-github@yahoo.co.uk>

ENV ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends dh-autoreconf build-essential git libssl-dev python ca-certificates curl

RUN git clone https://github.com/sarfata/pi-blaster.git /pi-blaster && cd /pi-blaster/ && \
./autogen.sh && ./configure && make && make install && \
rm -rf /var/lib/apt/lists/*


ADD entrypoint.sh /root/entrypoint.sh


# docker build --rm -t rpi-piblater .
# https://github.com/sarfata/pi-blaster
# TODO - allow some config through ENV