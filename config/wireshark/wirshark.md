# wireshark installation

```bash
yay -S wireshark-gtk
```

# add user to group

```bash
gpasswd -a $(whoami) wireshark
```

exec wireshark without relogin

```bash
newgrp wireshark
```
