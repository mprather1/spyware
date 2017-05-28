#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh

create_psql_user(){
  if chkarg $1; then
    sudo -u postgres createuser $1 -d -P
    printf "\nAll Done!!\n"
  else
    printf "Input Error...\n\"psqluser <username>\"\n"
  fi
}
