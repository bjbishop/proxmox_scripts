FROM debian:trixie-slim

USER 0

WORKDIR /tmp

RUN apt-get update && \
    apt-get install curl xorriso -y && \
    curl https://enterprise.proxmox.com/debian/proxmox-archive-keyring-trixie.gpg -o /usr/share/keyrings/proxmox-archive-keyring.gpg

COPY proxmox-pve.sources /etc/apt/sources.list.d/proxmox-pve.sources

RUN apt-get update && \
    apt-get install proxmox-auto-install-assistant -y && \
    mkdir -p /tmp/tmp

CMD [ "proxmox-auto-install-assistant", "prepare-iso", "--tmp", "/tmp/tmp", "--fetch-from", "iso", "--answer-file", "/tmp/proxmox/answer.toml", "--on-first-boot", "/tmp/proxmox/first-boot.sh", "/tmp/downloads/proxmox-ve_9.2-1.iso" ]

# proxmox-auto-install-assistant prepare-iso --tmp /tmp/tmp --fetch-from iso --answer-file /tmp/proxmox/answer.toml --on-first-boot /tmp/proxmox/first-boot.sh /tmp/downloads/proxmox-ve_9.2-1.iso
