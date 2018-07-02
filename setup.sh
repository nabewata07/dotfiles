#!/bin/bash

# Don't move this file

vimdir="vim"
vimrc="vimrc"
screenrc="screenrc"
tmuxconf="tmux.conf"
zshrc="zshrc"
gitconfig="gitconfig"
dircolors="dir_colors"
dircolors="ctags"

# The function to make symbolic link
# Arguments
# $1 : target of symlink path
# $2 : linked file path
function makeSymLink() {
  if [ -e "$1" ]; then
    echo "$1 is already exists"
  else
    case "$0" in
      /*) cur=`dirname "$0"` ;;
      *) cur=`dirname "$PWD/$0"` ;;
    esac
    ln -s $cur$2 $1
    if [ $? -eq 0 ]; then
      echo "create symlink $1"
    fi
  fi
}

if [ $# -gt 0 ] ;then
  dir=$1
else
  dir="${HOME}/"
fi

makeSymLink "${dir}.${vimdir}" "/"
makeSymLink "${dir}.${vimrc}" "/${vimrc}"
makeSymLink "${dir}.${screenrc}" "/${screenrc}"
makeSymLink "${dir}.${tmuxconf}" "/${tmuxconf}"
makeSymLink "${dir}.${zshrc}" "/${zshrc}"
makeSymLink "${dir}.${dircolors}" "/${dircolors}"
makeSymLink "${dir}.${gitconfig}" "/${gitconfig}"
makeSymLink "${dir}.${ctags}" "/${ctags}"

git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

mkdir ~/.zsh
mkdir -p ~/tmp/vim

# set dotfiles repository user and email
cd ~/dotfiles
git config user.name "nabewata"
git config user.email "channel.momo@gmail.com"
