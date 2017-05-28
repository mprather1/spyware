#!/usr/bin/env bash

bashrc_config(){
  echo "
  Checking for .bashrc configuration..."
  sleep 1
  if [ ! -f bashrc.config ]
    then
      echo ".bashrc file configuration..."
      cat bashrc.txt >> /home/$user/.bashrc
      touch $(directory)/bashrc.config
      echo "Done!!"
    else
      echo ".bashrc configuration has already been run..."
      echo "skipping..."
  fi  
}
