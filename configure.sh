#!/bin/bash

for file in vimrc bashrc gitconfig screenrc
do
  rm -rf $HOME/.$file
  cp $file $HOME/.$file
done
