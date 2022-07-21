#!/bin/bash

# Author: Kevin "nouillet" Pelletier
# 
# 
# Just a little script to configure symlinks in your home folder based on the files
# from this repo. Make sure to run this script from the repository's top level


# Global variables
cwd=`pwd`
backup_folder="$HOME/.nouillet_backup"

# Create backup folder
mkdir $backup_folder

link_configuration_files() {
    
    for file in `ls -p | grep -v / | grep -v install.sh | grep -v tags` ; do
        # TODO
        #   - If target exists and is a file, back them up. 
        #   - If target exists validate if it comes from here. - DONE
        #   - If target exists and not from this repo, remove link and create a new one - DONE
        
        if [ -L "$HOME/.$file" ] ; then
            link=$(readlink -f "$HOME/.$file")
            if [ $link = "$cwd/$file" ] ; then
                echo "Symlink $HOME/.$file already exists"
            else
                rm "$HOME/.$file"
            fi
        elif [ -f "$HOME/.$file" ] ; then
            echo "Backing up file "$HOME/.$file" in "$backup_folder""
            mv "$HOME/.$file" "$backup_folder/"
        else
            echo "Creating $file symlink into $HOME/.$file"
            ln -s $cwd/$file $HOME/.$file
        fi
    done
    
    echo "Symlinks done!"
    
}

link_vim_plugins_configurations() {
    
    if [ ! -e "$HOME/.config" ] ; then
        mkdir $HOME/.config
    fi

    if [ -e "$HOME/.config/nvim" ] ; then
        echo "Destination folder $HOME/.config/nvim already exists. Backing it up."
        mv "$HOME/.config/nvim" "$backup_folder/.config"
    fi

    # TODO
    # If folder already exists, move to backup
    ln -s $cwd/config/vim $HOME/.config/vim
}


link_configuration_files
# link_vim_plugins_configurations
