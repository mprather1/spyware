#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

ssh_copy(){
  if chkarg $2; then
    ssh-copy-id $2
    printf "alias ${1}='ssh ${2}'\n" >> ~/.bash_aliases
    printf "\nAll done!!"
    printf "Restart your shell and access the remote computer by typing '${1}'!!\n"
  else
    printf "Input Error...\n\"sshcopy <alias> <user@hostname>\"\n"
  fi
}
