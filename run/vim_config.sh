#!/usr/bin/env bash

vim_config(){
  cp -rv $(directory)/.vim/ /home/$user/
  touch /home/$user/.vimrc
  cat $(directory)/vimrc.txt >> /home/$user/.vimrc
}
