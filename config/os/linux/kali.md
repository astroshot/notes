# Kali Config

## openvpn config

```bash
sudo apt install openresolv
```

## add user

```bash
useradd -m username
passwd username
usermod -a -G sudo username
chsh -s /bin/zsh username
```
