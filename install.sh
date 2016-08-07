#!/bin/bash

dotfiles="$HOME/.dotfiles"

mkdir -p $dotfiles

if [ ! -e $dotfiles/.git ]
    then
        echo "Installing dotfiles into $dotfiles"
        git clone https://github.com/piotr-rusin/dotfiles $dotfiles
    else
        echo "Updating contents of $dotfiles"
        cd $dotfiles && git pull
fi

echo "Creating symbolic links"

# fish shell configuration files
fish_dir="$HOME/.config/fish/"

mkdir -p $fish_dir
ln -sni $dotfiles/fish/* $fish_dir