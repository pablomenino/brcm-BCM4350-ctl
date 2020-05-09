#!/bin/bash

#----------------------------------------------------------------------------------------
# brcm-BCM4350-ctl
# Version: 0.4
# 
# WebSite:
# https://github.com/pablomenino/brcm-BCM4350-ctl
# 
# Copyright © 2020 - Pablo Meniño <pablo.menino@gmail.com>
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# Main

start_service() {
    echo "Adding brcmfmac module"
    modprobe brcmfmac || exit -1
    sleep 3
    echo "Turning radio on"
    nmcli radio wifi on || exit -2
    echo "Disable power save"
    # Get first wifi device
    wifi_if_dev=$(iw dev | awk '$1=="Interface"{print $2}')
    iw dev $wifi_if_dev set power_save off || exit -3

}

stop_service() {
    echo "Turning radio off"
    nmcli radio wifi off || exit -1
    sleep 3
    echo "Removing brcmfmac module"
    modprobe -rf brcmfmac || exit -2
}

case $1 in
    start)
        start_service $1
        ;;
    stop)
        stop_service $1
        ;;
    restart)
        stop_service $1
        sleep 3
        start_service $1
        ;;
esac

#----------------------------------------------------------------------------------------
# Exit

exit 0
#----------------------------------------------------------------------------------------
