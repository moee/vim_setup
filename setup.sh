#!/bin/bash

# Attention: This file will overwrite your vim settings without asking.
# You have been warned.

success () { echo -e "\x1B[00;32mSuccess\x1B[00m"; }
error () { echo -e "\x1B[00;31mError\x1B[00m"; }
info () { echo -e "\x1B[00;34m$1\x1B[00m"; }

clone_or_pull () {
    DIRNAME=$(echo $1 | sed "s/https:\/\/github.com\/.*\///g" | sed "s/\.git//g")
    if [ -d $DIRNAME ]; then
        info "updating $DIRNAME"
        cd $DIRNAME
        git pull
        cd - > /dev/null
    else
        info "cloning $1"
        git clone $1
    fi
}

if [ -z $HOME ]; then
    error "\$HOME does not exist"
    exit 1 
fi

PLUGINDIR=$HOME/.vim/plugin
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

if [ ! -z $1 ] && [ $1 == "-f" ] && [ -d $HOME/.vim ]; then
    info "Force removal of ~/.vim directory"
    rm -rf $HOME/.vim/*
fi

if [ ! -d $PLUGINDIR ]; then
    info "Directory $PLUGINDIR does not exist. Creating it."
    mkdir -p $PLUGINDIR
fi

if [ ! -d $PLUGINDIR ]; then
    error "Directory $PLUGINDIR still does not exist. Giving up."
    exit 1
fi

info "installing required packages"
if [ $(whereis apt-get | wc -l) -ne 0 ]; then
	sudo apt-get install -y exuberant-ctags curl
fi

info "installing mru plugin"

if [ -d mru.vim ]; then
    rm mru.vim -rf
fi

(git clone https://github.com/vim-scripts/mru.vim && cp mru.vim/plugin/mru.vim $PLUGINDIR/mru.vim && success) || error

info "installing pathogem.vim"
mkdir -p ~/.vim/autoload ~/.vim/bundle 
curl -LSso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

info "installing taglist.vim"
if [ ! -d ~/.vim/doc ]; then
    mkdir -p ~/.vim/doc
fi
(curl -LSso ~/.vim/plugin/taglist.vim https://raw.github.com/vim-scripts/taglist.vim/master/plugin/taglist.vim && \
curl -LSso ~/.vim/doc/taglist.txt https://raw.github.com/vim-scripts/taglist.vim/master/doc/taglist.txt && \
success) || error

info "installing SnipMate"
cd ~/.vim/bundle
clone_or_pull https://github.com/tomtom/tlib_vim.git
clone_or_pull https://github.com/MarcWeber/vim-addon-mw-utils.git
clone_or_pull https://github.com/garbas/vim-snipmate.git
clone_or_pull https://github.com/honza/vim-snippets.git

info "installing custom snippets"
cp -R $SCRIPTPATH/bundle/mysnippets $HOME/.vim/bundle && success

info "installing filetype.vim"
cp $SCRIPTPATH/filetype.vim $HOME/.vim/filetype.vim && success

info "installing .vimrc"
cp $SCRIPTPATH/.vimrc $HOME/.vimrc && success
