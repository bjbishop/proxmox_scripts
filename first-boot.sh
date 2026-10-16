#!/bin/sh

set -o xtrace

apt-get -y install fzf screen gh lshw just shfmt sudo console-setup 2>&1 | tee -a /tmp/auto-installer.log
useradd -m -G sudo -s /bin/bash -p '$y$j9T$ZQ31qtmIPRvKQZtR85ELJ/$tgEIJKyB5Y7FQa/XPa7NSXkgxcy016aoHl0MJ7.9EX.' bishbr
sed -i.original 's|XKBVARIANT=""|XKBVARIANT="norman"|' /etc/default/keyboard

echo DONE  | tee -a /tmp/auto-installer.log

