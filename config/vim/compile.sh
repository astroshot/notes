#!/bin/sh

# download vim 8.1 first, and enter the directory
./configure \
  --disable-nls \
  --enable-cscope \
  --enable-gui=no \
  --enable-multibyte  \
  --enable-python3interp=yes \
  --enable-pythoninterp=yes \
  --enable-rubyinterp=yes \
  --prefix=$HOME/.local/vim \
  --with-features=huge  \
  --with-python3-config-dir=$HOME/.local/anaconda3/lib/python3.6/config \
  --with-python-config-dir=/usr/lib/python2.6/config \
  --without-x
