#!/bin/sh

if [ $(uname) = "Darwin"]; then
    echo 'install shfmt on mac'
    brew install shfmt
elif [ $(uname) = "Linux" ]; then
    echo 'install shfmt on linux'
    go get -u mvdan.cc/sh/cmd/shfmt
fi
