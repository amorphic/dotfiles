#!/bin/bash

PWD=`pwd`

# common shell configuration
ln -sf $PWD/commonrc ~/.commonrc

# bash
ln -sf $PWD/bashrc ~/.bashrc

# zsh
ln -sf $PWD/zshrc ~/.zshrc

# tmux
ln -sf $PWD/tmux ~/.tmux.conf 

# xbindkeys
ln -sf $PWD/xbindkeysrc ~/.xbindkeysrc

# vim
ln -sf $PWD/vimrc ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# git
ln -sf $PWD/gitconfig ~/.gitconfig
ln -sf $PWD/gitignore ~/.gitignore
ln -sf $PWD/gitattributes ~/.gitattributes
