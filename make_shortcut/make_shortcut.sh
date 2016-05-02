#!/usr/bin/env bash

prompt=">>> "

echo "Enter a word you would like to use for a shortcut: "
<<<<<<< HEAD
read -p "${prompt}" shortcut
=======
read -e -p "${prompt}" shortcut
>>>>>>> 6eec93d7b9c826cee3473d3be625ade27e0e18c7

echo "Enter the command that you would like to run:"
echo "Be sure to double check your spelling!!"
read -e -p "${prompt}" c

echo "Checking for .bash_aliases..."
if [ ! -f ~/.bash_aliases ]
  then
    echo "Creating .bash_aliases..."
    touch ~/.bash_aliases
  else
    echo ".bash_aliases already exits!!"
    echo "skipping..."
fi

echo "alias ${shortcut}='${c}'" >> ~/.bash_aliases

echo "
All done!!"
echo "Restart your shell and type '${shortcut}' into the terminal to use your shortcut!!"
echo "
Go fuck yourself!!"

echo "
Press any key to exit..."
read -n 1
