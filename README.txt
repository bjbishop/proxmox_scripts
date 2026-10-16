# Creating a new ISO image

From another debian/ubuntu/proxmox machine:

```
sudo apt -y install xorriso proxmox-auto-install-assistant
sudo proxmox-auto-install-assistant prepare-iso --fetch-from iso --answer-file $(pwd)/answer.toml --on-first-boot $(pwd)/first-boot.sh <path_to_installer_file.iso>
```

From a non-debian machine:

```
  podman compose run pve
```

See the docker-compose.yml for bind mount locations.
