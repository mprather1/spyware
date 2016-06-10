#!/usr/bin/env bash

source $(dirname $0)/../current_directory.sh

vim_config(){
  cp -rv $(directory)/.vim/ ~/
  touch ~/.vimrc
  cat $(directory)/vimrc.txt >> ~/.vimrc
}
