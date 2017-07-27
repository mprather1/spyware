#!/usr/bin/env bash

ssh_config(){
  printf "\nChecking for id_rsa...\n"
  sleep 1
  if [ ! -f /home/$user/.ssh/id_rsa ]
    then
      echo "
      id_rsa does not exist, creating..."
      
      echo "Enter email address:"
      read -p "${prompt}" email
      
      echo "Creating rsa key and adding to ssh agent..."
      ssh-keygen -t rsa -b 4096 -C "${email}"
      eval "$(ssh-agent -s)"
      
      ssh-add /home/$user/.ssh/id_rsa
      echo "Done!!"
    else
      echo "id_rsa already exists..."
      echo "skipping..."
  fi  
}
