#!/usr/bin/env bash

vim_config(){
  printf "\n$(random_color)Checking for vim configuration...${NC}\n"
  sleep 1
  if [ ! -f /home/$user/.vimrc ]
    then
      echo "Vim configuration..."
      cp -rv $(directory)/.vim/ /home/$user/
      touch /home/$user/.vimrc
      cat $(directory)/vimrc.txt >> /home/$user/.vimrc      echo "Done!!"
    else
      echo "vim is already configured..."
      echo "skipping..."
  fi  
}
