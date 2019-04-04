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


# compile using anaconda3
./configure --enable-terminal --enable-gui=auto \
      --with-features=huge \
      --enable-multibyte \
       --enable-cscope --enable-terminal --enable-gui=auto  \
      --prefix=$HOME/.local/vim \
   --enable-python3interp \
   --with-python3-config-dir=$HOME/.local/anaconda3/lib/python3.6/config \
   --includedir=$HOME/.local/anaconda3/include  \
   LDFLAGS=" -L$HOME/.local/anaconda3/lib -L$HOME/.local/anaconda3/lib/python3.6/config-3.6m-x86_64-linux-gnu"

# then export LD_LIBRARY_PATH="$HOME/.local/anaconda3/lib:$HOME/.local/lib:$LD_LIBRARY_PATH"
