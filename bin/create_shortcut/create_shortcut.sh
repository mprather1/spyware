#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

create_shortcut(){
  if chkarg $2; then
    printf "alias ${1}='${2}'\n" >> ~/.bash_aliases
    printf "\nAll done!!"
    echo "Restart your shell and type '${1}' into the terminal to use your shortcut!!"
  else
    printf "Input Error...\n\"shortcut <alias> <command>\""
  fi
}
