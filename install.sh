#!/bin/sh

if [ -d ~/src/dotfiles  ]; then
  echo "dotfiles already installed."
  exit
fi

if type -a git >/dev/null 2>&1; then
  git_exists=true
else
  git_exists=false
fi

if $git_exists; then
  echo "git found."
else
  echo "git not found."
fi

if type -a vim >/dev/null 2>&1; then
  vim_exists=true
else
  vim_exists=false
fi

if $vim_exists; then
  echo "vim found."
else
  echo "vim not found."
fi

if type -a zsh >/dev/null 2>&1; then
  zsh_exists=true
else
  zsh_exists=false
fi

if $zsh_exists; then
  echo "zsh found."
else
  echo "zsh not found."
fi

if ! $git_exists || ! $vim_exists || ! $zsh_exists; then
  echo "git or vim or zsh not installed."
  echo "please install first."
  exit
fi

if [ -d ~/src/dotfiles  ]; then
  echo "dotfiles already installed."
  exit
fi

if [ -d ~/src ]; then
  cd ~/src
  echo "*********************************"
  echo "***** dotfiles insall start *****"
  echo "*********************************"
  git clone https://github.com/2vg/dotfiles
else
  mkdir -p ~/src
  cd ~/src
  echo "*********************************"
  echo "***** dotfiles insall start *****"
  echo "*********************************"
  git clone https://github.com/2vg/dotfiles
fi

cd ~/src/dotfiles
if type -a nvim >/dev/null 2>&1; then
  nvim_exists=true
else
  nvim_exists=false
fi

if $nvim_exists; then
  echo "nvim found."
else
  echo "nvim not found."
fi

if $nvim_exists; then
  if [ ! -d ~/.nvim ]; then
    mkdir -p ~/.nvim/plugin
  fi
  ln -s ~/src/dotfiles/.nvim/init.vim ~/.config/nvim/init.vim
  ln -s ~/src/dotfiles/.nvim/plugin ~/.nvim/
else
  if [ ! -d ~/.vim ]; then
    mkdir -p ~/.vim
  fi
  ln -s ~/src/dotfiles/.vim/.vimrc ~/.vimrc
  ln -s ~/src/dotfiles/.vim/plugin ~/.vim/
fi

if [ ! -d ~/.zplug ]; then
  mkdir -p ~/.zplug
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

fi

ln -s ~/src/dotfiles/.zshrc ~/.zshrc
chsh -s "/usr/bin/zsh"

echo "***************************************"
echo "***** dotfiles install finished ! *****"
echo "***************************************"

exit
