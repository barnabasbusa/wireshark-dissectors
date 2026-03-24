FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends tshark && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.local/lib/wireshark/plugins

COPY libp2p-common.lua libp2p-identify.lua libp2p-gossipsub.lua eth-consensus.lua \
     /root/.local/lib/wireshark/plugins/

ENTRYPOINT ["tshark"]
