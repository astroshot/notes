Basic dev tools
```bash
sudo pacman -S go vim autojump fcitx fcitx-configtool cmake the_silver_searcher octave python-requests terminus-font tmux tig
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

Install vscode
```bash
git clone https://AUR.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin/
makepkg -s
sudo pacman -U visual-studio-code-bin-*.pkg.tar.xz
```
Install google-chrome
```bash
git clone https://aur.archlinux.org/google-chrome.git
cd google-chrome
aurman -U google-chrome-67.0.3396.99-1-x86_64.pkg.tar.xz
```

Install aurman
```bash
git clone https://aur.archlinux.org/aurman.git
cd aurman
makepkg -s
```
Then error occurs:
```bash
aurman_sources git repo ... 失败 (未知的公共密匙 XXXXXXXXXXXXXXX)
==> 错误： 一个或多个 PGP 签名无法校验！
```
Fix:
```bash
gpg --recv-keys XXXXXXXXXXXXXXX
```

Install fonts and symbola
```bash
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji wqy-microhei
yaourt -S ttf-symbola
```

PyCharm
```bash
yaourt -S pycharm
```

Others
```bash
yaourt -S boxes fcitx-googlepinyin graphviz screenfetch
```