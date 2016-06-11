#!/usr/bin/env bash

create_bash_aliases(){
  touch ~/.bash_aliases
  cat $(directory)/aliases.txt > ~/.bash_aliases

  printf "alias spyware_update='cd $(directory) && git pull origin master'\n" >> ~/.bash_aliases

  scripts=($(directory)/bin/*/*.sh)
  for script in "${scripts[@]}"; do
    filename="/${script#*/}"
    alias_filename="${script##*/}"
    fwe="${alias_filename%.*}"
    file_path=$(printf "${filename}" | sed 's/\..\///g')
    printf "alias ${fwe}='bash $file_path'\n" >> ~/.bash_aliases
  done

  printf "alias death='perl $(directory)/die/death.pl'\n" >> ~/.bash_aliases
}
