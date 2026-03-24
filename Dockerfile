FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends tshark && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY libp2p-common.lua libp2p-identify.lua libp2p-gossipsub.lua eth-consensus.lua \
     /usr/lib/x86_64-linux-gnu/wireshark/plugins/

ENTRYPOINT ["tshark"]
