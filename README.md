# Creating a new ISO image

## From another debian/ubuntu/proxmox machine:

```
sudo apt -y install xorriso proxmox-auto-install-assistant
sudo proxmox-auto-install-assistant prepare-iso --fetch-from iso --answer-file $(pwd)/answer.toml --on-first-boot $(pwd)/first-boot.sh <path_to_installer_file.iso>
```

## From a non-debian machine:

```
  podman-compose run --build pve <path_to_answer.toml_within_bind_mount_dir_in_container> <path_to_installer_file.iso_within_bind_mount_dir_in_container>
```

For example:
```
  podman-compose run --build pve /tmp/proxmox/answer.toml /tmp/downloads/proxmox-ve_9.2-1.iso
```

If you see permission denied errors on producing the final auto.iso, then there is a prexisting auto.iso file in the way, remove it.

## Verifying the custom ISO by extracting out the answer.toml:

```
  podman-compose run --entrypoint /bin/bash pve -c "proxmox-auto-install-assistant inspect-iso <path_to_custom_iso_within_bind_mount_dir_in_container>"
```

For example:
```
 podman-compose run --build --entrypoint /bin/bash pve -c "proxmox-auto-install-assistant inspect-iso /tmp/downloads/proxmox-ve_9.2-1.iso"
```

See the docker-compose.yml for bind mount locations.

## Validating the answer file:

```
  podman-compose run --entrypoint /bin/bash pve -c "proxmox-auto-install-assistant validate-answer /tmp/proxmox/answer.toml"
```

## My actual Dell Opitplex hardware:

These are the ID_SERIAL_SHORT values:

- nvme0n1 0036580001504 by-id "nvme-NE-512_2280_0036580001504"
- sda 9VP43HG6 by-id "ata-ST31000528AS_9VP43HG6"
- sdb 6YD1NE4T by-id "ata-ST2000DL003-9VT166_6YD1NE4T"
- sdc 6VPDB7XZ by-id "ata-ST31000524AS_6VPDB7XZ"
- sdd Z3MCS0QUS by-id "ata-TOSHIBA_MQ01ABF050_Z3MCS0QUS"
