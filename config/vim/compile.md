# Compile vim on CentOS 6

## Install python

Anaconda is recommended. Assume anaconda is installed in path `$HOME/.local/`

## Compile using Python 3

Using anaconda3 with python3.7:

```bash
./configure --enable-terminal --enable-gui=auto \
    --with-features=huge \
    --enable-multibyte \
    --enable-cscope --enable-terminal --enable-gui=auto  \
    --prefix=$HOME/.local/vim \
    --enable-python3interp=yes \
    --with-python3-config-dir=$HOME/.local/anaconda3/lib/python3.6/config \
    --includedir=$HOME/.local/anaconda3/include  \
    LDFLAGS=" -L$HOME/.local/anaconda3/lib -L$HOME/.local/anaconda3/lib/python3.6/config-3.6m-x86_64-linux-gnu"
```

Using anaconda3 with python3.7:

```bash
./configure --enable-terminal --enable-gui=auto \
    --with-features=huge \
    --enable-multibyte \
    --enable-cscope --enable-terminal --enable-gui=auto  \
    --prefix=$HOME/.local/vim \
    --enable-python3interp=yes \
    --with-python3-config-dir=$HOME/.local/anaconda3/lib/python3.7/config \
    --includedir=$HOME/.local/anaconda3/include  \
    LDFLAGS=" -L$HOME/.local/anaconda3/lib -L$HOME/.local/anaconda3/lib/python3.7/config-3.7m-x86_64-linux-gnu"
```

## Set `$PATH` and other environment variables

```bash
export PATH="$HOME/.local/vim/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.local/anaconda3/lib:$HOME/.local/lib:$LD_LIBRARY_PATH"
```
