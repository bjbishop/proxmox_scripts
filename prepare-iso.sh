#!/usr/bin/env bash
set -o errexit

proxmox-auto-install-assistant validate-answer $1
proxmox-auto-install-assistant prepare-iso \
    --tmp /tmp/tmp \
    --fetch-from iso \
    --answer-file $1 \
    --on-first-boot /tmp/proxmox/first-boot.sh \
    $2
