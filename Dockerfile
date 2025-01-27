FROM petrosagg/balena-wpe:raspberrypi3-094d55a

COPY udev-rules/ /etc/udev/rules.d/

COPY wpe-init /wpe-init
RUN chmod +x /wpe-init

COPY timezone-init /timezone-init
RUN chmod +x /timezone-init

COPY init /init
RUN chmod +x /init

COPY run-cog /usr/bin/run-cog
RUN chmod +x /usr/bin/run-cog

CMD [ "/init" ]

ENV TOHORA_VERSION=0.3.2
RUN wget -O tohora.tgz \
    "https://github.com/mozz100/tohora/releases/download/v"$TOHORA_VERSION"/tohora_"$TOHORA_VERSION"_Linux_armv5.tar.gz" \
    && tar xzf tohora.tgz \
    && rm tohora.tgz
