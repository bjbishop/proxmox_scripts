# Creating a new ISO image

## From another debian/ubuntu/proxmox machine:

```
sudo apt -y install xorriso proxmox-auto-install-assistant
sudo proxmox-auto-install-assistant prepare-iso --fetch-from iso --answer-file $(pwd)/answer.toml --on-first-boot $(pwd)/first-boot.sh <path_to_installer_file.iso>
```

## From a non-debian machine:

```
  podman compose run --build pve <path_to_answer.toml_within_bind_mount_dir_in_container> <path_to_installer_file.iso_within_bind_mount_dir_in_container>
```

For example:
```
  podman compose run --build pve /tmp/proxmox/answer.toml /tmp/downloads/proxmox-ve_9.2-1.iso
```


## Verifying the custom ISO by extracting out the answer.toml:

```
  podman compose run --entrypoint /bin/bash pve -c "proxmox-auto-install-assistant inspect-iso <path_to_custom_iso_within_bind_mount_dir_in_container>"
```

For example:
```
podman compose run --build pve --entrypoint /bin/bash pve -c "proxmox-auto-install-assistant inspect-iso /tmp/downloads/proxmox-ve_9.2-1.iso
```

See the docker-compose.yml for bind mount locations.
