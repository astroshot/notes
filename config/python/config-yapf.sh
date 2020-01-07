#!/bin/sh

if [[ ! -d ~/.config/yapf ]]; then
    mkdir -p ~/.config/yapf
fi

ln -s ~/Projects/notes/config/python/style ~/.config/yapf/style
