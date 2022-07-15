#!/bin/bash

# Author: Kevin "nouillet" Pelletier
# License?
# 
# 
# Just a little script to configure symlinks in your home folder based on the files
# from this repo. 


for file in `ls -p | grep -v /` ; do
    echo "Creating $file symlink into $HOME/.$file\n"
    ln -s ./$file $HOME/.$file

echo "Symlinks done!\n"
echo "Copying vim plugins configuration files"

for file in `ls ./vim/plugins/` ; do


