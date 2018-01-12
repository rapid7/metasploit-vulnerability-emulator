FROM debian:9.2

LABEL maintainer "opsxcq@strm.sh"

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    perl \
    libjson-perl \
    libio-socket-ssl-perl \
    libtry-tiny-perl \
    libio-compress-perl \
    libclass-std-storable-perl \
    sed \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /emulator
WORKDIR /emulator
COPY . /emulator/
RUN sed -i 's/127.0.0.1/0.0.0.0/' /emulator/vulEmu.pl

# Ports described in service.cfg
EXPOSE 20
EXPOSE 21
EXPOSE 80
EXPOSE 443
EXPOSE 4848
EXPOSE 6000
EXPOSE 6060
EXPOSE 7000
EXPOSE 7181
EXPOSE 7547
EXPOSE 8000
EXPOSE 8008
EXPOSE 8020
EXPOSE 8080
EXPOSE 8400

ENTRYPOINT ["perl"]
CMD ["vulEmu.pl"]
