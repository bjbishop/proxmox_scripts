build iso: validate
    podman-compose run --build pve /tmp/proxmox/answer.toml /tmp/downloads/{{iso}}

validate:
    podman-compose run --entrypoint /bin/bash pve -c "proxmox-auto-install-assistant validate-answer /tmp/proxmox/answer.toml"

show_answers iso:
    podman-compose run --build --entrypoint /bin/bash pve -c "proxmox-auto-install-assistant inspect-iso /tmp/downloads/{{iso}}"

check: validate
    pre-commit run -a
