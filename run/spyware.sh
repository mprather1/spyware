#!/usr/bin/env bash

install_spyware(){
  if [ $software_type = "desktop" ]; then
    sudo cp -rv $(directory)/themes/* /usr/share/themes
    sudo cp -rv $(directory)/wallpaper/* /usr/share/xfce4/backdrops    
   
    touch ~/.gtkrc-2.0
    cat $(directory)/gtkrc.txt > ~/.gtkrc-2.0
  fi
}
