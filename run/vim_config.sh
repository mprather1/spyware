#!/usr/bin/env bash

vim_config(){
  cp -rv $(directory)/.vim/ ~/
  touch ~/.vimrc
  cat $(directory)/vimrc.txt >> ~/.vimrc
}
