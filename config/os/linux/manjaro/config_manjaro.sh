#!/bin/sh

echo 'Install basic tools...'
sudo pacman -S go vim cmake

sudo rm /usr/bin/vi
sudo ln -s /usr/bin/vim /usr/bin/vi

echo 'Getting yay...'
sudo pacman -S yay
# git clone https://aur.archlinux.org/yay.git

echo 'Installing basic tools using yay...'
yay -S the_silver_searcher tmux tig boxes graphviz neofetch tree tcl tk ctags xclip mitmproxy tldr fzf

echo 'Installing fonts and symbola'
yay -S noto-fonts noto-fonts-cjk noto-fonts-emoji wqy-microhei ttf-symbola