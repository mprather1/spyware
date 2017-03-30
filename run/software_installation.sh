#!/usr/bin/env bash

install_software(){
  get_software_list
  pre_install
  sudo apt-get install -y curl
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get update && \
  sudo apt-get install $new_software -y
  sudo dpkg -i $(directory)/misc/synergy.deb $(directory)/misc/xscreensaver.deb
  bash $(directory)/misc/npm.sh
  post_install
  sudo apt-get upgrade -y  
}

pre_install(){
  case $software_type in
    "rpi")
      curl -sSL https://get.docker.com | sh
    ;;
    *)
    # Key for docker
      sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
      sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
    ;;
  esac  
}

post_install(){
  case $software_type in 
    "rpi")
      printf "No raspi ruby yet...\n"
    ;;
    *)
      echo "gem: --no-document" >> ~/.gemrc
      bash $(directory)/misc/ruby_gems.sh
    ;;
  esac
}

get_software_list(){
  repositories=$(directory)/run/software_lists/${software_type}/repos.txt
  readarray repos < $repositories
    for repo in "${repos[@]}"; do
      if chkarg $repo; then
        sudo apt-add-repository $repo -y
        sleep 1
      fi
    done  
    
  software=$(directory)/run/software_lists/${software_type}/software.txt
  readarray software_list < $software
    for software in "${software_list[@]}"; do
      new_software+="${software}"
    done    
}
