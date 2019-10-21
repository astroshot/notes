# Compile tmux 2.3 on CentOS 6u3

Compile and Install tmux 2.3 to dir `$HOME/.local`

## Prepare

```bash
yum install -y automake gcc git make
```

## Download tmux 2.3 source code

## Install dependance

### libevent

```bash
cd /path/to/libevent
./configure --prefix="$HOME/.local"
make
make install
```

### ncurses

```bash
cd /path/to/ncurses
./configure --prefix="$HOME/.local"
make
make install
```

## Compile

```bash
./configure --prefix="$HOME/.local" CFLAGS="-I$HOME/.local/include -I$HOME/.local/include/ncurses" LDFLAGS="-L$HOME/.local/lib -L$HOME/.local/include/ncurses -L$HOME/.local/include" CPPFLAGS="-I$HOME/.local/include -I$HOME/.local/include/ncurses" LDFLAGS="-static -L$HOME/.local/include -L$HOME/.local/include/ncurses -L$HOME/.local/lib"
```

## Make and Install

```bash
make
make install
```
