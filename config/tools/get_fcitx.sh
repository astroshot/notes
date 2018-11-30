#!/bin/sh

yay -S fcitx fcitx-configtool fcitx-rime fcitx-googlepinyin

conf_file=$HOME/.xprofile

if [ -f $conf_file ]; then
    echo "$conf_file exists! Now it is moved to $HOME/.xprofile_bak"
    mv $conf_file $HOME/.xprofile_bak
fi

echo 'GTK_IM_MODULE=fcitx' >>$conf_file
echo 'QT_IM_MODULE=fcitx' >>$conf_file
echo 'XMODIFIERS=@im=fcitx' >>$conf_file
