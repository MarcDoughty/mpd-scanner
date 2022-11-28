FROM kalilinux/kali-rolling

LABEL version="0.0.3"

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apt-utils \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ca-certificates \
    sslscan \
    nmap \
    && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y

