#!/bin/bash

for file in vimrc bash_profile bashrc bash_prompt gitconfig screenrc tmux.conf
do
  rm -rf $HOME/.$file
  cp $file $HOME/.$file
done
