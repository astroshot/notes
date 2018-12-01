#!/bin/sh

git clone https://github.com/gpakosz/.tmux.git "$HOME/.tmux"
ln -s -f $HOME/.tmux/.tmux.conf $HOME/.tmux.conf
