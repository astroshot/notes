#!/bin/sh

echo 'First, make npm dir for current user...'
mkdir -p -v $HOME/.local/npm/lib/node_modules $HOME/.local/npm/bin

echo 'Then, install nodejs-lts and npm...'
yay -S nodejs-lts-dubnium npm

echo 'Last, set npm install prefix'
npm config set prefix "$HOME/.local/npm"
npm config set registry https://registry.npm.taobao.org

echo 'Install create-react-app...'
cnpm install -g create-react-app
