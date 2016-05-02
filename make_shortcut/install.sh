#!/usr/bin/env bash

current_directory="$(pwd)"

touch ~/.bash_aliases

echo "
Installing make shortcut..."
echo "alias make_shortcut='bash ${current_directory}/make_shortcut/make_shortcut.sh'" >> ~/.bash_aliases

echo "
Finished installing make shortcut!!"
