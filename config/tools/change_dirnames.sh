#!/bin/sh

desktop="$HOME/Desktop"
mkdir $desktop
downloads="$HOME/Downloads"
mkdir $downloads
templates="$HOME/Templates"
mkdir $templates
public="$HOME/Public"
mkdir $public
documents="$HOME/Documents"
mkdir $documents
music="$HOME/Music"
mkdir $music
pics="$HOME/Pictures"
mkdir $pics
videos="$HOME/Videos"
mkdir $videos

echo 'backup old user-dirs'
dir=$HOME/.config/user-dirs.dirs
mv $HOME/.config/user-dirs.dirs $HOME/.config/user-dirs.bak

echo 'generating new user-dirs'
echo "XDG_DESKTOP_DIR=$desktop" >>$dir
echo "XDG_DOWNLOAD_DIR=$downloads" >>$dir
echo "XDG_TEMPLATES_DIR=$templates" >>$dir
echo "XDG_PUBLICSHARE_DIR=$public" >>$dir
echo "XDG_DOCUMENTS_DIR=$documents" >>$dir
echo "XDG_MUSIC_DIR=$music" >>$dir
echo "XDG_PICTURES_DIR=$pics" >>$dir
echo "XDG_VIDEOS_DIR=$videos" >>$dir
