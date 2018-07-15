Basic dev tools
```
sudo pacman -S go vim autojump fcitx fcitx-configtool cmake the_silver_searcher octave python-requests terminus-font tmux tig yaourt
```

source
```
sudo pacman-mirrors -i -c China -m rank
```
勾选 `http://mirrors.ustc.edu.cn/manjaro/`, 然后按 `OK` 键两次。

刷新缓存
```sh
sudo pacman -Syy
```

Install vscode
```
git clone https://AUR.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin/
makepkg -s
sudo pacman -U visual-studio-code-bin-*.pkg.tar.xz
```

Install fonts and symbola
```
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji wqy-microhei
yaourt -S ttf-symbola
```

PyCharm
```
yaourt -S pycharm
```

Others
```
yaourt -S boxes fcitx-googlepinyin graphviz screenfetch
```