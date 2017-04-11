#!/usr/bin/env bash

install_spyware(){
  user=$(whoami)
  
  if [ ! -f $(directory)/.tmux.conf ]; then
    cat $(directory)/tmux.conf.txt > /home/$user/.tmux.conf
  fi
  
  if [ $software_type = "desktop" ]; then
    sudo cp -rv $(directory)/themes/* /usr/share/themes
    sudo cp -rv $(directory)/wallpaper/* /usr/share/xfce4/backdrops    
   
    touch ~/.gtkrc-2.0
    cat $(directory)/gtkrc.txt > /home/$user/.gtkrc-2.0
  fi
}
