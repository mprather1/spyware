#!/usr/bin/env bash

install_spyware(){
  sudo cp -r $(directory)/themes/* /usr/share/themes
  sudo cp -r $(directory)/wallpaper/* /usr/share/xfce4/backdrops

  touch ~/.gtkrc-2.0
  cat $(directory)/gtkrc.txt > ~/.gtkrc-2.0
  
  if [ -f $(directory)/bin/die/death.txt ]
    then
      printf "\nmy \$current_directory = '$(directory)';\n" >> $(directory)/bin/die/death.pl
      cat $(directory)/bin/die/death.txt >> $(directory)/bin/die/death.pl && rm $(directory)/bin/die/death.txt
  fi
}
