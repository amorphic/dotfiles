#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Get the repo root (parent of scripts/)
REPO_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"
CONFIG_DIR="$REPO_ROOT/config"

# common shell configuration
ln -sf $CONFIG_DIR/commonrc ~/.commonrc

# bash
ln -sf $CONFIG_DIR/bashrc ~/.bashrc

# zsh
ln -sf $CONFIG_DIR/zshrc ~/.zshrc

# tmux
ln -sf $CONFIG_DIR/tmux ~/.tmux.conf

# xbindkeys
ln -sf $CONFIG_DIR/xbindkeysrc ~/.xbindkeysrc

# vim
ln -sf $CONFIG_DIR/vimrc ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# git
ln -sf $CONFIG_DIR/gitconfig ~/.gitconfig
ln -sf $CONFIG_DIR/gitignore ~/.gitignore
ln -sf $CONFIG_DIR/gitattributes ~/.gitattributes
