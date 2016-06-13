#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh

create_shortcut(){
printf "alias ${1}='${2}'\n" >> ~/.bash_aliases
echo "
All done!!"
echo "Restart your shell and type '${1}' into the terminal to use your shortcut!!"
}
