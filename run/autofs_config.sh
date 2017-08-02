#!/usr/bin/env bash

autofs_config(){
  printf "\n$(random_color)Checking for autofs${NC}...\n"
  sleep 1
  if [ -f /etc/auto.master ] && [ ! -f autofs.config ]
    then
      echo "Configuring autofs for sshfs..."
      printf "/mnt /etc/auto.sshfs uid=${user_id},gid=${group_id},--timeout=30,--ghost\n" | sudo tee -a /etc/auto.master
      touch $(directory)/autofs.config
    else
      echo "skipping..."
  fi  
}
