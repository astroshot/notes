# Linux Cisco client Installation

## Systemd config

place vpnagend.service to `/usr/lib/systemd/system/`

## Replacement

Cisco client can be replaced by `openconnect`. Just install it with pacman(or aur helper) if your linux distribution is based on Archlinux.

```bash
yay -S openconnect
```

