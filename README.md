<!-- start badges -->
![GitHub release](https://img.shields.io/github/release/pablomenino/brcm-BCM4350-ctl)
![GitHub license](https://img.shields.io/github/license/pablomenino/brcm-BCM4350-ctl)
![GitHub last commit](https://img.shields.io/github/last-commit/pablomenino/brcm-BCM4350-ctl)
![GitHub repo size](https://img.shields.io/github/repo-size/pablomenino/brcm-BCM4350-ctl)
![Contributors](https://img.shields.io/github/contributors-anon/pablomenino/brcm-BCM4350-ctl)
![GitHub followers](https://img.shields.io/github/followers/pablomenino?label=Follow)
![Twitter Follow](https://img.shields.io/twitter/follow/pmenino)
<!-- end badges -->

<!-- start description -->
<h1>Welcome to brcm-BCM4350-ctl 👋</h1>
<p>
    <a href="https://lab.mfwlab.com/lab/brcm-BCM4350-ctl/" id="homepage" rel="nofollow">
        <img align="right" height="128" id="icon" src="logo.svg" width="128"/>
    </a>
</p>
<h2>🏠 <a href="https://lab.mfwlab.com/lab/brcm-BCM4350-ctl/" id="homepage">Homepage</a></h2>
<p>
    brcm-BCM4350-ctl is a Broadcom BCM4350 Workaround Fedora 29/30/31/32.
</p>
<!-- end description -->

## Table of contents

* [How it works](#how-it-works)
* [How to Use](#how-to-use)
* [Support me](#support-me)
* [Third party](#third-party)

## <a name="how-it-works"> How it works

Broadcom BCM4350 (Dell XPS 13 9350) network card misbehaves at system shutdown (firewalld time out) and on power saver feature (random crash), this script apply a workaround to makes usable the WiFi network card.

## <a name="how-to-use">How to Use

### Blacklist Kernel Driver

Blacklist the brcmfmac kernel module at system startup. This disable WiFi Broadcom kernel module at boot.

**Option A - Change Grub config with grubby.**

Execute from console:

```
sudo grubby --update-kernel=ALL --args="modprobe.blacklist=brcmfmac"
```

**Option B - Or manually change Grub Config**

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

### Install

Install scrip:

```
# sudo ./install.sh
```

### Control the service

Control the systemd service:

```
# systemctl start broadcomctl
# systemctl stop broadcomctl
# systemctl restart broadcomctl
```

### Uninstall

```
# sudo ./uninstall.sh
```

## <a name="support-me">Support me:

### Librepay

<a href="https://liberapay.com/pablomenino/donate"><img alt="Donate using Liberapay" src="https://liberapay.com/assets/widgets/donate.svg"></a>

### Paypal

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=4HPTG85J8NQVG)

## <a name="third-party">Third party:

* **Icons:** The icon images are from [Tela Icon Theme](https://github.com/vinceliuice/Tela-icon-theme)
