#!/bin/sh
mkdir ~/.vim
cp .vimrc ~/
cp .zshrc ~/
cp -r plugin ~/.vim/

# Neovim
#mkdir ~/.nvim/nvim
#$XDG_CONFIG_HOME = ~/.nvim
#cp .vimrc init.vim
#cp init.vim $XDG_CONFIG_HOME/nvim/
#cp -r plugin $XDG_CONFIG_HOME/nvim/
