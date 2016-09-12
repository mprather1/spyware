#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

groups=($1 adm cdrom sudo plugdev dip lpadmin sambashare)

new_user(){
  if chkarg $1; then 
    sudo adduser $1
    for group in "${groups[@]}"; do
      sudo adduser $1 $group
    done
  else
    printf "Input Error...\n\"newuser <username>\"\n"
  fi
}