#!/usr/bin/env bash

bashrc_config(){
  cat bashrc.txt >> ~/.bashrc
  touch $(directory)/bashrc.config
  
}
