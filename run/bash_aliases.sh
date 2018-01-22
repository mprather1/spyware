#!/usr/bin/env bash

create_bash_aliases(){
  printf "\n$(random_color)Checking for .bash_aliases${NC}...\n"
  sleep 1
  if [ ! -f /home/$user/.bash_aliases ]
    then
      echo "Creating .bash_aliases..."
      touch /home/$user/.bash_aliases
      cat $(directory)/aliases.txt > /home/$user/.bash_aliases
    else
      echo ".bash_aliases already exits..."
      echo "skipping..."
  fi
}
