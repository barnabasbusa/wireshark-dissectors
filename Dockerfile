FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wireshark \
    tshark \
    xvfb \
    x11vnc \
    novnc \
    websockify \
    openbox \
    procps \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.local/lib/wireshark/plugins

COPY libp2p-common.lua libp2p-identify.lua libp2p-gossipsub.lua eth-consensus.lua \
     /root/.local/lib/wireshark/plugins/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
