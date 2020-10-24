#!/bin/bash

#----------------------------------------------------------------------------------------
# brcm-BCM4350-ctl
# Version: 0.4.2
# 
# WebSite:
# https://lab.mfwlab.com/lab/brcm-BCM4350-ctl/
# 
# Copyright © 2020 - Pablo Meniño <pablo.menino@mfwlab.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# Uninstall brcm-BCM4350-ctl

if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root!!!"
    exit 1
fi

systemctl stop broadcomctl
systemctl disable broadcomctl

rm /usr/local/bin/broadcomctl.sh
rm /etc/systemd/system/broadcomctl.service

systemctl daemon-reload

#----------------------------------------------------------------------------------------
# Exit

exit 0
#----------------------------------------------------------------------------------------
