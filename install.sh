#!/bin/bash

dotfiles="$HOME/.dotfiles"
current_dir=$(pwd)
abort="Aborting installation"

if [ -d $dotfiles ]; then
    if [ -L $dotfiles ]; then
        while true; do
            echo "A link $dotfiles already exists"
            read -p "Do you want to override it?" yn
            case $yn in
                [Yy]* ) break;;
                [Nn]* ) echo $abort; exit;;
                * ) echo "Please answer yes or no.";;
            esac
        done
    else
        echo "$dotfiles already exists, and it's a directory. $abort"
        exit
    fi
fi

echo "Creating a symbolic link from $current_dir to $dotfiles"
ln -Tsf $(pwd) $dotfiles

lns() {
    destination="$HOME/$2"

    mkdir -p $destination
    ln -sni "$dotfiles/$1/"* $destination
}


echo "Creating symbolic links"

# fish shell configuration files
lns fish .config/fish
lns virtualenv .virtualenvs
