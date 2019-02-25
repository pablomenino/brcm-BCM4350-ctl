# brcm-BCM4350-ctl

![GitHub release](https://img.shields.io/github/release/pablomenino/brcm-BCM4350-ctl.svg) 
![GitHub](https://img.shields.io/github/license/pablomenino/brcm-BCM4350-ctl.svg)

**Version 0.3**

Broadcom BCM4350 Workaround Fedora 29

## Table of contents

* [How to Use](#how-to-use)

## <a name="how-to-use">How to Use

#### Usage

Broadcom BCM4350 (Dell XPS 13 9350) network card misbehaves at system shutdown (firewalld time out) and on power saver feature (random crash), this script apply a workaround to makes usable the WiFi network card.

#### Blacklist Kernel Driver

Blacklist the brcmfmac kernel module at system startup. This disable WiFi Broadcom kernel module at boot.

**Add `modprobe.blacklist=brcmfmac` in GRUB config.**

Edit the file `/etc/default/grub` and add `modprobe.blacklist=brcmfmac` to the end of `GRUB_CMDLINE_LINUX` 

**Example:**

```
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="resume=UUID=XXXXXXXXX rhgb quiet modprobe.blacklist=brcmfmac"
GRUB_DISABLE_RECOVERY="true"
```

And then update GRUB 2 configuration, more information here:

[https://fedoraproject.org/wiki/GRUB_2#Tasks_.2F_Common_issues](https://fedoraproject.org/wiki/GRUB_2#Tasks_.2F_Common_issues)

BIOS systems:

```
# sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

UEFI systems:

```
# sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
```





## Install

Install scrip:

```
# sudo ./install.sh
```

## Control the service

Control the service from systemd:

```
# systemctl start broadcomctl
# systemctl stop broadcomctl
# systemctl restart broadcomctl
```

## Uninstall

Remove the script:

```
# systemctl stop broadcomctl
# systemctl disable broadcomctl
# rm /usr/local/bin/broadcomctl.sh
# rm /etc/systemd/system/broadcomctl.service
```
