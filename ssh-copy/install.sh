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

echo "alias sshcopy='bash ${current_directory}/ssh_copy.sh'" >> ~/.bash_aliases

echo "
All done!!"
echo "Type 'sshcopy' into terminal to setup password free connection to a remote computer!!"
echo "
Go fuck yourself!!"
