#!/bin/bash

for file in vimrc zshrc gitconfig tmux.conf zsh
do
  rm -rf $HOME/.$file
  cp -r $file $HOME/.$file
done
