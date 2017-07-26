#!/usr/bin/env bash

bashrc_config(){
  echo "
  Checking for .bashrc configuration..."
  sleep 1
  if [  -f bashrc.config ]
    then
      echo ".bashrc file configuration..."
      ROOT_DIR=$(directory) HOME_DIR=$HOME node $(directory)/run/random-ps1/index.js && \
      touch $(directory)/bashrc.config && \
      echo "Done!!"
    else
      echo ".bashrc configuration has already been run..."
      echo "skipping..."
  fi  
}
