#!/usr/bin/env bash

current_directory="$(pwd)"

echo "Checking for .bash_aliases..."
if [ ! -f ~/.bash_aliases ]
  then
    echo "Creating .bash_aliases..."
    touch ~/.bash_aliases
  else
    echo ".bash_aliases already exits"
    echo "skipping..."
fi

echo "alias make_shortcut='bash ${current_directory}/make_shortcut.sh'" >> ~/.bash_aliases

echo "
All done!!"
echo "Type 'make_shortcut' into terminal to create a shortcut!!"
echo "
Go fuck yourself!!"
