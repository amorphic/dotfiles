#!/bin/bash

PWD=`pwd`

# bash
ln -sf $PWD/bashrc ~/.bashrc

# tmux
ln -sf $PWD/tmux ~/.tmux.conf 

# xbindkeys
ln -sf $PWD/xbindkeysrc ~/.xbindkeysrc

# vim
ln -sf $PWD/vimrc ~/.vimrc

# git
ln -sf $PWD/gitconfig ~/.gitconfig
