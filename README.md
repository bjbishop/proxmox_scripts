# Creating a new Proxmox auto installer ISO image file

See [automated installation instructions](https://pve.proxmox.com/wiki/Automated_Installation) for more details.

## From another proxmox machine:

```sh
sudo apt -y install xorriso proxmox-auto-install-assistant
sudo proxmox-auto-install-assistant prepare-iso \
    --fetch-from iso \
    --answer-file $(pwd)/answer.toml \
    --on-first-boot $(pwd)/first-boot.sh \
    <local_path_to_proxmox_installer_image.iso>
```

## From a non-debian machine:

Using podman here through podman-compose.yml, it bind mounts the current repo directory as /tmp/proxmox and the $HOME/Downloads directory as /tmp/downloads.  Then it takes 2 parameters: `answer.toml` and `proxmox.iso` from their path within the container.

```sh
  podman-compose run --build pve \
    <path_inside_container_to_answer.toml> \
    <path_inside_container_to_proxmox_installer_image.iso>
```

For example:
```sh
  podman-compose run --build pve \
    /tmp/proxmox/answer.toml \
    /tmp/downloads/proxmox-ve_9.2-1.iso
```

If permission denied errors are shown producing the final auto-from-iso.iso, then there might be errors writing to the file that this container produces, or qemu or a VM might have it open.  It generates a file like: `proxmox-ve_9.2-1-auto-from-iso.iso`

## Verifying the custom ISO by extracting out the answer.toml:

```sh
 podman-compose run --build --entrypoint /bin/bash \
    pve -c "proxmox-auto-install-assistant inspect-iso /tmp/downloads/proxmox-ve_9.2-1-auto-from-iso.iso"
```

See the podman-compose.yml for bind mount locations.

## Validating the answer file format:

This also runs as a [pre-commit](https://pre-commit.com) hook!

```sh
  podman-compose run --entrypoint /bin/bash \
    pve -c "proxmox-auto-install-assistant validate-answer /tmp/proxmox/answer.toml"
```
