#!/usr/bin/env bash

ssh_config(){
  printf "$(random_color)\n\nChecking for id_rsa...${NC}\n"
  sleep 1
  if [ ! -f /home/$user/.ssh/id_rsa ]
    then
      printf "Creating key and adding to agent...\n"
      ssh-keygen -t rsa -b 4096 -C "${email}" -f $HOME/.ssh/id_rsa -q -N ""
      eval "$(ssh-agent -s)"
      
      ssh-add /home/$user/.ssh/id_rsa
      printf "Done!!\n"
    else
      printf "key already exists...\n"
      printf "skipping...\n"
  fi  
}
