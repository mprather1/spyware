#!/usr/bin/env bash

bashrc_config(){
  echo "
  Checking for .bashrc configuration..."
  sleep 1
  if [ ! -f bashrc.config ]
    then
      echo ".bashrc file configuration..."
      ROOT_DIR=$(directory) node $(directory)/run/random-ps1/index.js && \
      cat bashrc.tmp >> /home/$user/.bashrc && \
      rm -v bashrc.tmp && \
      touch $(directory)/bashrc.config && \
      echo "Done!!"
    else
      echo ".bashrc configuration has already been run..."
      echo "skipping..."
  fi  
}
