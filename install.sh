#!/bin/bash

#----------------------------------------------------------------------------------------
# brcm-BCM4350-ctl
# Version: 0.2
# 
# WebSite:
# https://github.com/pablomenino/brcm-BCM4350-ctl
# 
# Copyright © 2018 - Pablo Meniño <pablo.menino@gmail.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# Install brcm-BCM4350-ctl

if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root!!!"
    exit 1
fi

cp broadcomctl.sh /usr/local/bin/
cp broadcomctl.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable broadcomctl

#----------------------------------------------------------------------------------------
# Exit

exit 0
#----------------------------------------------------------------------------------------

