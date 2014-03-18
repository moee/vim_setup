#!/bin/bash

# Attention: This file will overwrite your vim settings without asking.
# You have been warned.

success () { echo -e "\e[00;32mSuccess\e[00m"; }
error () { echo -e "\e[00;31mError\e[00m"; }
info () { echo -e "\e[00;34m$1\e[00m"; }

if [ -z $HOME ]; then
    echo "\$HOME does not exist"
    exit 1 
fi

PLUGINDIR=$HOME/.vim/plugin
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

if [ ! -d $PLUGINDIR ]; then
    echo "Directory $PLUGINDIR does not exist. Creating it."
    mkdir -p $PLUGINDIR
fi

if [ ! -d $PLUGINDIR ]; then
    echo "Directory $PLUGINDIR still does not exist. Giving up."
    exit 1
fi

info "installing mru plugin"

if [ -d mru.vim ]; then
    rm mru.vim -rf
fi

(git clone https://github.com/vim-scripts/mru.vim && cp mru.vim/plugin/mru.vim $PLUGINDIR/mru.vim && success) || error

info "installing pathogem.vim"
mkdir -p ~/.vim/autoload ~/.vim/bundle 
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

info "installing SnipMate"
cd ~/.vim/bundle
git clone https://github.com/tomtom/tlib_vim.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone https://github.com/garbas/vim-snipmate.git
git clone https://github.com/honza/vim-snippets.git

info "installing custom snippets"
cp $SCRIPTPATH/bundle/mysnippets $HOME/.vim/bundle -R && success

info "installing filetype.vim"
cp $SCRIPTPATH/filetype.vim $HOME/.vim/filetype.vim && success

info "installing .vimrc"
cp $SCRIPTPATH/.vimrc $HOME/.vimrc && success
