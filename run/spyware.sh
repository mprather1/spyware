#!/usr/bin/env bash

install_spyware(){
  if [ $software_type = "desktop" ]; then
      # sudo cp -r $(directory)/themes/* /usr/share/themes
      # sudo cp -r $(directory)/wallpaper/* /usr/share/xfce4/backdrops    
     
      # touch ~/.gtkrc-2.0
      # cat $(directory)/gtkrc.txt > ~/.gtkrc-2.0
      echo "desktop"
  fi
}
