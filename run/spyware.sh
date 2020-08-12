#!/usr/bin/env bash

install_spyware(){
  printf "\n$(random_color)Installing Spyware${NC}...\n"

  if [ ! -f $(directory)/.tmux.conf ]; then
    cat $(directory)/tmux.conf.txt > /home/$user/.tmux.conf
  fi
  
  if [ -z $software_type ] && [ "${software_type}" == "desktop" ]; then
    sudo cp -rv $(directory)/themes/* /usr/share/themes/
    sudo cp -rv $(directory)/wallpaper/* /usr/share/xfce4/backdrops/    
    sudo cp -rv $(directory)/icons/svg/* /usr/share/icons/
  
    touch /home/$user/.gtkrc-2.0
    cat $(directory)/gtkrc.txt > /home/$user/.gtkrc-2.0
  fi
  
  if [ -f /usr/bin/pv ]
    then
      printf "$(random_color)........................................................................................${NC}\n" | pv -qL 20
      printf "\n$(random_color)Spyware has been successfully installed${NC}...\n"
    else
      printf "$(random_color)........................................................................................${NC}\n"    
      printf "\n$(random_color)Spyware has been successfully installed...${NC}\n"
  fi  
}
