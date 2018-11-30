#!/bin/sh

echo 'Install basic tools...'
sudo pacman -S go vim cmake

sudo rm /usr/bin/vi
sudo ln -s /usr/bin/vim /usr/bin/vi

echo 'Getting yay...'
git clone https://aur.archlinux.org/yay.git
