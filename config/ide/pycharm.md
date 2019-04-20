# Install pycharm

```bash
sudo ln -s /opt/pycharm/bin/pycharm.sh /usr/bin/pycharm
cat > ~/.local/share/applications/pycharm.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=pycharm
Exec=pycharm
Icon=/opt/pycharm/bin/pycharm.png  
Terminal=false
Type=Application
Categories=Development;
EOL
```
