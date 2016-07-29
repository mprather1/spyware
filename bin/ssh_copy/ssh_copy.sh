#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

ssh_copy(){
  if chkarg $2; then
    ssh-copy-id $2
    printf "alias ${1}='ssh ${2}'\n" >> ~/.bash_aliases
    echo "
    All done!!"
    echo "Restart your shell and access the remote computer by typing '${1}'!!"
  else
    printf "Input Error...\n\"sshcopy <alias> <user@hostname>\""
  fi
}
