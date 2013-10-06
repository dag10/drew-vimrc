#!/bin/bash

# Move to directory of script
OLDDIR=`pwd`
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# Backup old vimrc files
if [ -f ~/.vimrc ]; then
	mv ~/.vimrc ~/.vimrc.old
fi;
if [ -f ~/.vimrc_bundles ]; then
	mv ~/.vimrc_bundles ~/.vimrc_bundles.old
fi;
if [ -f ~/.vimrc_vundle ]; then
	mv ~/.vimrc_vundle ~/.vimrc_vundle.old
fi;

# Create hardlinks between local vimrc files and the actual vimrc files
ln -F .vimrc ~/
ln -F .vimrc_vundle ~/
ln -F .vimrc_bundles ~/

# Install Vundle (https://github.com/gmarik/vundle)
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Clean/install bundles
vim -u .vimrc_setup

# Return to original dir
cd $OLDDIR
