#!/usr/bin/env bash

current_directory="$(pwd)"

touch ~/.bash_aliases

echo "
Installing make shortcut..."
echo "alias make_shortcut='bash ${current_directory}/make_shortcut/make_shortcut.sh'" >> ~/.bash_aliases

echo "
All done!!"
echo "Restart your shell and type 'make_shortcut' into terminal to create a shortcut!!"
echo "
Go fuck yourself!!"
