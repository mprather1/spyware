#!/usr/bin/env bash

current_directory="$(pwd)"

touch ~/.bash_aliases

echo "
Installing installation shortcut..."
echo "alias installnow='bash ${current_directory}/installation_shortcut/installation_shortcut.sh'" >> ~/.bash_aliases

echo "
All done!!"
echo "Restart your shell and type 'installnow' into terminal to install software with apt-get!!"
echo "
Go fuck yourself!!"
