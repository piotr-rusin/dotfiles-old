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


dotfiles="$HOME/.dotfiles"

if [ -d $dotfiles ] && ! [ -L $dotfiles ]; then
    echo "$dotfiles already exists, and it's a directory."
    abort
fi


echo "Creating a symbolic link from $current_dir to $dotfiles"
ln -Tsf $(pwd) $dotfiles

link_contents() {
    destination="$HOME/$2"

    mkdir -p $destination
    ln -snf "$dotfiles/$1/"* $destination
}


echo "Creating symbolic links"

mkdir -p "$HOME/.virtualenvs"
ln -sf "$dotfiles/idle.py" "$HOME/.virtualenvs"
ln -sf "$dotfiles/nvim" "$HOME/.config"
mkdir -p "$HOME/.config/composer"
ln -sf "$dotfiles/composer.json" "$HOME/.config/composer"
ln -sf "$dotfiles/termite" "$HOME/.config"

echo "Configuring git"

git config --global core.editor "nvim -u $HOME/.config/nvim/git_init.vim"
