#!/usr/bin/env bash

source $(dirname $0)/../current_directory.sh

install_spyware(){
  sudo cp -r $(directory)/themes/* /usr/share/themes
  sudo cp -r $(directory)/wallpaper/* /usr/share/xfce4/backdrops

  touch ~/.gtkrc-2.0
  cat $(directory)/gtkrc.txt > ~/.gtkrc-2.0

  printf "\nmy \$current_directory = '$(directory)';\n" >> $(directory)/bin/die/death.pl
  cat $(directory)/bin/die/death.txt >> $(directory)/bin/die/death.pl
}
