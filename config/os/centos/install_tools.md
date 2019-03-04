# Install some useful tool on CentOS 6u3

## tmux 2.3 compile and install

```bash
if [[ $(fs --version) =~ "afs" ]] && fs whereis "$HOME/..local" ; then
    NCURSES_OPTION=" --enable-symlinks"
else
    NCURSES_OPTION=""
fi


./configure CFLAGS="-I$HOME/.local/include -I$HOME/.local/include/ncurses" LDFLAGS="-L$HOME/.local/lib -L$HOME/.local/include/ncurses -L$HOME/.local/include" CPPFLAGS="-I$HOME/.local/include -I$HOME/.local/include/ncurses" LDFLAGS="-static -L$HOME/.local/include -L$HOME/.local/include/ncurses -L$HOME/.local/lib" --prefix=$HOME/.local
make
make install
```

## vim 8.1 compile

```bash
./configure \
  --disable-nls \
  --enable-cscope \
  --enable-gui=no \
  --enable-multibyte  \
  --enable-pythoninterp \
  --enable-rubyinterp \
  --prefix=/home/jonny/.local/vim \
  --with-features=huge  \
  --with-python-config-dir=/usr/lib/python2.7/config \
  --with-tlib=ncurses \
  --without-x
```
