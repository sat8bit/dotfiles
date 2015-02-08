#!/bin/bash

for file in vimrc bashrc gitconfig screenrc tmux.conf
do
  rm -rf $HOME/.$file
  cp $file $HOME/.$file
done
