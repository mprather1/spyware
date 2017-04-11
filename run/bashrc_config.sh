#!/usr/bin/env bash

bashrc_config(){
  cat bashrc.txt >> /home/$user/.bashrc
  touch $(directory)/bashrc.config
  
}
