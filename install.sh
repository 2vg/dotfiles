#!/bin/sh
mkdir ~/.vim
cp .vimrc ~/
cp -f plugin ~/.vim/

# Neovim
$XDG_CONFIG_HOME = ~/
mkdir ~/nvim
cp init.vim ~/nvim/
cp -f plugin ~/nvim/
