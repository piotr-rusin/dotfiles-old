#!/bin/bash

dotfiles="$HOME/.dotfiles"

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


if [ -d $dotfiles ] && ! [ -L $dotfiles ]; then
    echo "$dotfiles already exists, and it's a directory."
    abort
fi


echo "Creating a symbolic link from $current_dir to $dotfiles"
ln -Tsf $(pwd) $dotfiles

lns() {
    destination="$HOME/$2"

    mkdir -p $destination
    ln -snf "$dotfiles/$1/"* $destination
}


echo "Creating symbolic links"

lns fish .config/fish
lns virtualenv .virtualenvs

ln -sf "$dotfiles/nvim" "$HOME/.config"
ln -sf "$dotfiles/composer.json" "$HOME/.config/composer"

echo "Configuring git"

git config --global core.editor "nvim -u $HOME/.config/nvim/git_init.vim"
