To make the new ISO image:

sudo apt -y install xorriso proxmox-auto-install-assistant
sudo proxmox-auto-install-assistant prepare-iso --fetch-from iso --answer-file $(pwd)/answer.toml --on-first-boot $(pwd)/first-boot.sh /var/lib/vz/template/iso/proxmox-ve_9.0-1.iso
