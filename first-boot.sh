#!/bin/sh

echo "[INFO] start first-boot.sh" | tee -a /tmp/auto-installer.log
apt-get -y install fzf screen gh lshw just shfmt sudo console-setup 2>&1 | tee -a /tmp/auto-installer.log
# shellcheck disable=SC2016
useradd -m -G sudo -s /bin/bash -p '$y$j9T$rnPFcwFaC7U9Z7x2UPRrg0$Hix.3foZ6p3BaLLDX3LECDmq8Dzvj9MLXf5ycDR7mQ1' bishbr

sed -i.original 's|XKBVARIANT=""|XKBVARIANT="norman"|' /etc/default/keyboard

echo "[DONE] first-boot.sh"  | tee -a /tmp/auto-installer.log
