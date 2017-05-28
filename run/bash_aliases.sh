#!/usr/bin/env bash

create_bash_aliases(){
  echo "
  Checking for .bash_aliases..."
  sleep 1
  if [ ! -f /home/$user/.bash_aliases ]
    then
      echo "Creating .bash_aliases..."
      touch /home/$user/.bash_aliases
      cat $(directory)/aliases.txt > /home/$user/.bash_aliases
    
      printf "alias spyware_update='cd $(directory) && git pull origin master'\n" >> /home/$user/.bash_aliases
    
      scripts=($(directory)/scripts/*/*.sh)
      for script in "${scripts[@]}"; do
        filename="/${script#*/}"
        alias_filename="${script##*/}"
        fwe="${alias_filename%.*}"
        file_path=$(printf "${filename}" | sed 's/\..\///g')
        printf "alias ${fwe}='bash $file_path'\n" >> /home/$user/.bash_aliases
      done
    else
      echo ".bash_aliases already exits..."
      echo "skipping..."
  fi
}
