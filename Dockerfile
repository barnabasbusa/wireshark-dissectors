FROM linuxserver/wireshark:latest

COPY libp2p-common.lua libp2p-identify.lua libp2p-gossipsub.lua eth-consensus.lua \
     /config/.local/lib/wireshark/plugins/
