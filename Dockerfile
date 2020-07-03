FROM ubuntu:bionic

ADD https://cb.privatbank.ua/p24-cryptoplugin/1.2.2/cryptoplugin-1.2.2-all.deb /root
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        x11vnc xvfb chromium-browser openbox menu sudo \
        pcscd libccid libpcsclite1 libusb-1.0-0 && \
    dpkg -i /root/cryptoplugin-1.2.2-all.deb

RUN useradd -m -s /bin/bash ubuntu && \
    echo "ubuntu ALL = NOPASSWD: ALL" > /etc/sudoers.d/ubuntu

# USER ubuntu
# WORKDIR /home/ubuntu
# CMD /home/ubuntu/start.sh
