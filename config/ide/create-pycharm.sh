#!/bin/sh

set -x

bin_file=/opt/pycharm/bin/pycharm.sh
echo '' >>$bin_file
echo '# chinese input settings' >>$bin_file
echo 'export GTK_IM_MODULE=fcitx' >>$bin_file
echo 'export QT_IM_MODULE=fcitx' >>$bin_file
echo 'export XMODIFIERS=@im=fcitx' >>$bin_file

if [[ ! -d ~/.local/share/applications ]]; then
    mkdir -p ~/.local/share/applications
fi

if [[ ! -f ~/.local/share/applications/pycharm.desktop ]]; then
    touch ~/.local/share/applications/pycharm.desktop
fi

cat >~/.local/share/applications/pycharm.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=pycharm
Exec=pycharm
Icon=/opt/pycharm/bin/pycharm.png
Terminal=false
Type=Application
Categories=Development;
EOL
