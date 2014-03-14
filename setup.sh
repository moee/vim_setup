#!/bin/bash

# Attention: This file will overwrite your vim settings without asking.
# You have been warned.

if [ -z $HOME ]; then
    echo "\$HOME does not exist"
    exit 1 
fi

PLUGINDIR=$HOME/.vim/plugin

if [ ! -d $PLUGINDIR ]; then
    echo "Directory $PLUGINDIR does not exist. Creating it."
    mkdir -p $PLUGINDIR
fi

if [ ! -d $PLUGINDIR ]; then
    echo "Directory $PLUGINDIR still does not exist. Giving up."
    exit 1
fi

echo installing mru plugin

if [ -d mru.vim ]; then
    rm mru.vim -rf
fi

(git clone https://github.com/vim-scripts/mru.vim && cp mru.vim/plugin/mru.vim $PLUGINDIR/mru.vim && echo "success") || echo "failed"

echo installing .vimrc
cp .vimrc $HOME/.vimrc && echo "success"
