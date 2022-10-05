FROM kastaneda/vnc_x11

USER root
ADD cryptoplugin-1.2.2-all.deb /root
RUN apt-get -q update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qy \
        libccid libgail-common libgail18 libgtk2.0-0 libgtk2.0-bin \
        libgtk2.0-common libpcsclite1 libusb-1.0-0 pcscd && \
    dpkg -i /root/cryptoplugin-1.2.2-all.deb && \
    apt-get clean && \
    rm -rf /var/cache/* /var/log/apt/* /var/lib/apt/lists/* /tmp/*

# Same entry point as kastaneda/vnc_x11 image use
USER user
WORKDIR /home/user
ENTRYPOINT /home/user/.startup
