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

echo "alias sshcopy='bash ${current_directory}/installation_shortcut.sh'" >> ~/.bash_aliases

echo "
All done!!"
echo "Restart your shell and type 'installnow' into terminal to install software with apt-get!!"
echo "
Go fuck yourself!!"
