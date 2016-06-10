#!/usr/bin/env bash

source $(dirname $0)/../current_directory.sh

ssh_config(){
  echo "Enter email address:"
  read -p "${prompt}" email
  echo "Creating rsa key and adding to ssh agent..."
  ssh-keygen -t rsa -b 4096 -C "${email}"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
}
