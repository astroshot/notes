#!/bin/sh

sudo echo 'deb http://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main contrib non-free' >>/etc/apt/sources.list
sudo apt install openresolv tig cmake golang xfce4-terminal fcitx fcitx-config neofetch fcitx-rime fcitx-googlepinyin python3-virtualenv python-virtualenv tree ack silversearcher-ag boxes
