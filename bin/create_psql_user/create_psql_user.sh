#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

create_psql_user(){
  if chkarg $1; then
    sudo -u postgres createuser $1 -d -P
    echo "All Done!!"
  else
    printf "Input Error...\n\"psqluser <username>\""
  fi
}
