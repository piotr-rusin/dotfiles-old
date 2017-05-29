#!/bin/bash

abort() {
    echo "Aborting installation"
    exit
}

echo "This script may overwrite files in your home directory."
read -p "Are you sure you want to continue? (Y/n)" -n 1 -r
echo ""
if ! [[ $REPLY =~ ^[Yy]$ ]]
then
    abort
fi

CURRENTDIR=$(pwd)

echo "Creating symbolic links"

mkdir -p ~/.virtualenvs
ln -sf $CURRENTDIR/idle.py ~/.virtualenvs
ln -sf $CURRENTDIR/nvim ~/.config
mkdir -p ~/.config/composer
ln -sf $CURRENTDIR/composer.json ~/.config/composer
ln -sf $CURRENTDIR/.Xresources ~

echo "Installing Oh-My-Zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
rm ~/.zshrc # remove zshrc created by Oh-My-Zsh

echo "Creating a symbolic link to .zshrc"
ln -sf $CURRENTDIR/.zshrc ~


echo "Configuring git"
git config --global core.editor "nvim -u $HOME/.config/nvim/git_init.vim"
