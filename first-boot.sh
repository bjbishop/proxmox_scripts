#!/bin/sh

set -o xtrace

apt-get -y install fzf screen gh lshw just shfmt sudo console-setup 2>&1 | tee -a /tmp/auto-installer.log
useradd -m -G sudo -s /bin/bash -p '$6$fZFpy8hKVPzDdd5x$fe2j6RoyMrSUpW9tQlXtYSLVJrrKTDDpGJAl2ASdxVFU3nOHcg1txh8EKOcWDIaqdYvRBnXRmT1g2aAqafyaL.' bishbr
sed -i.original 's|XKBVARIANT=""|XKBVARIANT="norman"|' /etc/default/keyboard

echo DONE  | tee -a /tmp/auto-installer.log
