# Manjaro config

## Basic dev tools

```bash
sudo pacman -S go neovim fcitx fcitx-configtool cmake the_silver_searcher octave python-requests python-neovim terminus-font tmux tig
```

source

```bash
sudo pacman-mirrors -i -c China -m rank
```

勾选 `http://mirrors.ustc.edu.cn/manjaro/`, 然后按 `OK` 键两次。

刷新缓存

```bash
sudo pacman -Syy
```

### Install vscode

```bash
git clone https://AUR.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin/
makepkg -s
sudo pacman -U visual-studio-code-bin-*.pkg.tar.xz
```

### Install google-chrome

```bash
git clone https://aur.archlinux.org/google-chrome.git
cd google-chrome
yay -U google-chrome-67.0.3396.99-1-x86_64.pkg.tar.xz
```

### Install yay

```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -s
```

If error occurs:

```bash
yay_sources git repo ... 失败 (未知的公共密匙 XXXXXXXXXXXXXXX)
==> 错误： 一个或多个 PGP 签名无法校验！
```

Fix:

```bash
gpg --recv-keys XXXXXXXXXXXXXXX
```

### Install fonts and symbola

```bash
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji wqy-microhei
yay -S ttf-symbola
```

### PyCharm

```bash
yay -S pycharm
sudo chown -R user:group /usr/share/pycharm
```

### Intellij-Idea

```bash
yay -S intellij-idea-community-edition
sudo chown -R user:group /usr/share/intellijidea-ce
```

## Others

```bash
yay -S boxes fcitx-googlepinyin graphviz neofetch tree tcl tk
```

Fix a stop job is running for session c2 of user xxx (xs / 1min 30s)

```bash
yay -S watchdog
systemctl enable watchdog.service
systemctl start watchdog.service
```

### Mysql Installation

```bash
yay -S mysql
```

Choose mariadb, and then initialize the MariaDB data directory prior to starting the service.

```bash
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
```

start service

```bash
systemctl start mariadb
```

stop service

```bash
systemctl stop mariadb
```

restart service

```bash
systemctl restart mariadb
```

## Timezone Config

```bash
timedatectl status
timedatectl set-local-rtc 0
timedatectl set-timezone Asia/Shanghai
```

## Change folder names to English

edit `~/.config/user-dirs.dirs`

```bash
vi ~/.config/user-dirs.dirs
```

then change dir name as you wish

```bash
XDG_DESKTOP_DIR="$HOME/Desktop"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_TEMPLATES_DIR="$HOME/Templates"
XDG_PUBLICSHARE_DIR="$HOME/Public"
XDG_DOCUMENTS_DIR="$HOME/Documents"
XDG_MUSIC_DIR="$HOME/Music"
XDG_PICTURES_DIR="$HOME/Pictures"
XDG_VIDEOS_DIR="$HOME/Videos"
```

## Shorten `A stop job is running`

```bash
vi /etc/systemd/system.conf
```

Then change

```bash
DefaultTimeoutStartSec=9s
DefaultTimeoutStopSec=9s
```

## Change hostname

```bash
sudo hostnamectl set-hostname $new_name
```
