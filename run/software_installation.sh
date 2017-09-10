#!/usr/bin/env bash

install_software(){
  if chkarg $software_type; then
    # initialize
    pre_install
    printf "\n$(random_color)Installing software${NC}...\n\n"
    sudo apt-get update && \
    sudo apt-get install $new_software -y
    misc_software
    cleanup
    echo "All Done!!"
  fi
}

initialize(){
  mkdir tmp
  case $dist in 
    "Raspbian GNU/Linux 8")
      node_version='https://nodejs.org/dist/v6.10.2/node-v6.10.2-linux-armv7l.tar.xz'
    ;;
    *)
      node_version='https://nodejs.org/dist/v6.10.2/node-v6.10.2-linux-x64.tar.xz'
    ;;
  esac  
}

pre_install(){
  printf "\n$(random_color)Pre-install${NC}...\n"
  if not_installed curl; then
    sudo apt-get update && \
    sudo apt-get install curl -y
  fi

  if not_installed apt-transport-https; then
    sudo apt-get update && \
    sudo apt-get install apt-transport-https -y
  fi
  
  if not_installed software-properties-common; then
    sudo apt-get update && \
    sudo apt-get install software-properties-common -y
  fi

  # install_node
  install_repositories
  misc_repos
  get_software_list
}

install_repositories(){
  printf "\n$(random_color)Installing repositories${NC}...\n"
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

misc_software(){
  printf "\n$(random_color)Installing miscellaneous software${NC}...\n"
  install_npm_packages
  # install_cloud9
  sudo usermod -aG docker $(whoami)
  
  case $software_type in 
    "desktop")
      install_local_packages
      install_ruby_gems
      install_postman
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
  printf "\n$(random_color)Installing miscellaneous repositories${NC}...\n"

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
      install_docker
    ;;
  esac
}

install_docker(){
  if not_installed docker-engine; then
    sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
  fi
  
  if [ -d /usr/local/bin ] && [ ! -f /usr/local/bin/docker-compose ]; then
    printf "$(random_color)Installing Docker Compose${NC}..."
    sleep 1
     curl -L https://github.com/docker/compose/releases/download/1.12.0-rc2/docker-compose-`uname -s`-`uname -m` > tmp/docker-compose
    sudo cp tmp/* /usr/local/bin/ && \
    sudo  chmod +x /usr/local/bin/docker-compose
  fi
}

install_local_packages(){
  sudo dpkg -i $(directory)/misc/synergy.deb $(directory)/misc/xscreensaver.deb
}

install_ruby_gems(){
  echo "gem: --no-document" >> /home/$user/.gemrc
  bash $(directory)/misc/ruby_gems.sh  
}

install_npm_packages(){
  bash $(directory)/misc/npm.sh
}

install_postman(){
  wget -O tmp/postman.tar.gz https://dl.pstmn.io/download/latest/linux64 && \
  tar -xvf tmp/postman.tar.gz -C $HOME && \
  
  chmod +x $(directory)/misc/postman && \
  sudo cp $(directory)/misc/postman /usr/local/bin
}

install_node(){
  if [ ! -f /usr/local/bin/node ]; then
    printf "$(random_color)Installing Node.JS${NC}..."
    strip_url="${node_version##*/}"
    node_directory=${strip_url%.*.*}
    mkdir temp
    wget $node_version -O temp/node.tar.xz
    tar -xvf temp/node.tar.xz -C temp/
    sudo cp -R temp/$node_directory/* /usr/local/
    rm -rvf temp
  else
    printf "\nnode is already installed\nskipping..."
  fi
}

cleanup(){
  printf "finished installing ->\ncleaning up..."
  rm -rv tmp
}
