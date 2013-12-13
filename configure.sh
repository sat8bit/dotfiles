#!/bin/bash

for file in vimrc bashrc gitconfig
do
  cp $file $HOME/.$file
done
