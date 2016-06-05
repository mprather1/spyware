#!/usr/bin/env bash

echo "Checking for .bash_aliases..."
if [ ! -f ~/.bash_aliases ]
  then
    echo "Creating .bash_aliases..."
    touch ~/.bash_aliases
  else
    echo ".bash_aliases already exits!!"
    echo "skipping..."
fi

echo "alias ${1}='${2}'" >> ~/.bash_aliases

echo "
All done!!"
echo "Restart your shell and type '${1}' into the terminal to use your shortcut!!"
echo "
Go fuck yourself!!"
