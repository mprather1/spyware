#!/usr/bin/env bash

install_software(){
  pre_install
  printf "\nInstalling...\n"
  sudo apt-get update && \
  sudo apt-get install $new_software -y
  misc_software
}

pre_install(){
  printf "\nPre-install...\n"
  if not_installed curl; then
    sudo apt-get update && \
    sudo apt-get install curl -y
  fi
  install_repositories
  misc_repos
  get_software_list
}

misc_software(){
  printf "\nInstalling miscellaneous software...\n"
  install_npm_packages
  
  case $software_type in 
    "desktop")
      install_local_packages
      install_ruby_gems
    ;;
    "rpi")
      printf "\nNo raspi ruby yet...\n"
    ;;
    "server")
      install_ruby_gems
    ;;
  esac
  
  sudo apt-get upgrade -y  
}

misc_repos(){
  printf "\nInstalling miscellaneous repositories...\n"
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  
  if not_installed yarn; then
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -  
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list      
  fi
  
  case $software_type in
    "rpi")
      if not_installed docker-engine; then
        curl -sSL https://get.docker.com | sh
      fi
    ;;
    *)
      if not_installed docker-engine; then
        sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
        sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
      fi
    ;;
  esac
}

install_ruby_gems(){
  echo "gem: --no-document" >> ~/.gemrc
  bash $(directory)/misc/ruby_gems.sh  
}

install_npm_packages(){
  bash $(directory)/misc/npm.sh
}

install_local_packages(){
  sudo dpkg -i $(directory)/misc/synergy.deb $(directory)/misc/xscreensaver.deb
}

install_repositories(){
  printf "\nInstalling repositories...\n"
  repositories=$(directory)/run/software_lists/${software_type}/repos.txt
  readarray repos < $repositories
    for repo in "${repos[@]}"; do
      if chkarg $repo && repo_not_installed $repo; then
        sudo apt-add-repository $repo -y
      fi
    done    
}

get_software_list(){
  software=$(directory)/run/software_lists/${software_type}/software.txt
  readarray software_list < $software
    for software in "${software_list[@]}"; do
      new_software+="${software}"
    done    
}
