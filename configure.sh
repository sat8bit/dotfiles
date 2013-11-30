#!/bin/bash

for file in vimrc bashrc
do
  cp $file $HOME/.$file
done
