#!/usr/bin/env bash

source $(dirname $0)/../current_directory.sh

bashrc_config(){
  cat bashrc.txt >> ~/.bashrc
  touch $(dirname $0)/../bashrc_config.txt
}
