#!/usr/bin/env bash

bashrc_config(){
  printf "\n$(random_color)Checking for .bashrc configuration${NC}...\n"
  sleep 1
  if [ ! -f $(directory)/bashrc.config ]
    then
      echo "configuring .bashrc..."
      HOME=$HOME node $(directory)/lib/random-ps1/index.js $(pwd) $1 && \
      touch $(directory)/bashrc.config && \
      echo "Done!!"
    else
      echo "bashrc configuration has already been run..."
      printf "skipping...\n"
  fi  
}
