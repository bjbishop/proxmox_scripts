FROM debian:trixie-slim

USER 0

WORKDIR /tmp

RUN apt-get update && \
    apt-get install curl xorriso -y && \
    curl https://enterprise.proxmox.com/debian/proxmox-archive-keyring-trixie.gpg -o /usr/share/keyrings/proxmox-archive-keyring.gpg

COPY proxmox-pve.sources /etc/apt/sources.list.d/proxmox-pve.sources
COPY prepare-iso.sh /tmp

RUN apt-get update && \
    apt-get install proxmox-auto-install-assistant -y && \
    mkdir -p /tmp/tmp

ENTRYPOINT [ "/tmp/prepare-iso.sh" ]
