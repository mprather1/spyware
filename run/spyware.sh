#!/usr/bin/env bash

install_spyware(){
  sudo cp -r $(directory)/themes/* /usr/share/themes
  sudo cp -r $(directory)/wallpaper/* /usr/share/xfce4/backdrops

  touch ~/.gtkrc-2.0
  cat $(directory)/gtkrc.txt > ~/.gtkrc-2.0

}
