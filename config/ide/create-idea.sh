#!/bin/sh

set -x
bin_file=/opt/idea/bin/idea.sh
echo '' >>$bin_file
echo '# chinese input settings' >>$bin_file
echo 'export GTK_IM_MODULE=fcitx' >>$bin_file
echo 'export QT_IM_MODULE=fcitx' >>$bin_file
echo 'export XMODIFIERS=@im=fcitx' >>$bin_file

if [[ ! -d ~/.local/share/applications ]]; then
    mkdir -p ~/.local/share/applications
fi

if [[ ! -f ~/.local/share/applications/idea.desktop ]]; then
    touch ~/.local/share/applications/idea.desktop
fi

cat >~/.local/share/applications/idea.desktop <<EOF
[Desktop Entry]
Type=Application
Name=IntelliJ IDEA Community Edition
Icon=/opt/idea/bin/idea.svg
Exec="/opt/idea/bin/idea.sh" %f
Comment=Capable and Ergonomic IDE for JVM
Terminal=false
Categories=Development;IDE;
Encoding=UTF-8
EOF
