FROM debian:trixie-slim

USER 0

WORKDIR /tmp

RUN apt-get update && \
    apt-get install curl -y && \
    curl https://enterprise.proxmox.com/debian/proxmox-archive-keyring-trixie.gpg -o /usr/share/keyrings/proxmox-archive-keyring.gpg

COPY proxmox-pve.sources /etc/apt/sources.list.d/proxmox-pve.sources
COPY prepare-iso.sh /tmp

RUN apt-get update && \
    apt-get install xorriso proxmox-auto-install-assistant -y --no-install-recommends && \
    mkdir -p /tmp/tmp && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/tmp/prepare-iso.sh" ]
