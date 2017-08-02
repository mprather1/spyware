#!/usr/bin/env bash

ssh_config(){
  printf "$(random_color)\n\nChecking for id_rsa...${NC}\n"
  sleep 1
  if [ ! -f /home/$user/.ssh/id_rsa ]
    then
      printf "
      id_rsa does not exist, creating...\n"
      
      printf "Enter email address:\n"
      read -p "${prompt}" email
      
      printf "Creating rsa key and adding to ssh agent...\n"
      ssh-keygen -t rsa -b 4096 -C "${email}"
      eval "$(ssh-agent -s)"
      
      ssh-add /home/$user/.ssh/id_rsa
      printf "Done!!\n"
    else
      printf "id_rsa already exists...\n"
      printf "skipping...\n"
  fi  
}
