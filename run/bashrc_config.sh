#!/usr/bin/env bash

bashrc_config(){
  printf "\n$(random_color)Checking for .bashrc configuration${NC}...\n"
  sleep 1
  if [ ! -f $(directory)/bashrc.config ]
    then
      echo "bashrc file configuration..."
      HOME=$HOME node $(directory)/run/random-ps1/index.js $(pwd) $1 && \
      touch $(directory)/bashrc.config && \
      echo "Done!!"
    else
      echo "bashrc configuration has already been run..."
      echo "skipping..."
  fi  
}
