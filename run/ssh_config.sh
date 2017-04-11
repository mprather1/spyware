#!/usr/bin/env bash

ssh_config(){
  echo "Enter email address:"
  read -p "${prompt}" email
  echo "Creating rsa key and adding to ssh agent..."
  ssh-keygen -t rsa -b 4096 -C "${email}"
  eval "$(ssh-agent -s)"
  ssh-add /home/$user/.ssh/id_rsa
}
