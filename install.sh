#!/bin/bash

#----------------------------------------------------------------------------------------
# brcm-BCM4350-ctl
# Version: 0.4.1
# 
# WebSite:
# https://lab.mfwlab.com/lab/brcm-BCM4350-ctl/
# 
# Copyright © 2020 - Pablo Meniño <pablo.menino@mfwlab.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# Install brcm-BCM4350-ctl

if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root!!!"
    exit 1
fi

cp broadcomctl.sh /usr/local/bin/
cp broadcomctl.service /etc/systemd/system/

chmod +x /usr/local/bin/broadcomctl.sh

systemctl daemon-reload
systemctl enable broadcomctl

#----------------------------------------------------------------------------------------
# Exit

exit 0
#----------------------------------------------------------------------------------------
