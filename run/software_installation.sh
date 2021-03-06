#!/usr/bin/env bash

install_software(){
  if chkarg $software_type; then
    pre_install
    printf "\n$(random_color)Installing software${NC}...\n"
    sudo apt-get update && \
    sudo apt-get install $new_software -y
    misc_software
    echo "All Done!!"
  fi
}

initialize(){
  mkdir temp
  case $dist in 
    "Raspbian GNU/Linux 8")
      node_version='https://nodejs.org/dist/v12.13.0/node-v12.13.0-linux-armv7l.tar.xz'
    ;;
    "Raspbian GNU/Linux 9")
      node_version='https://nodejs.org/dist/v12.13.0/node-v12.13.0-linux-armv7l.tar.xz'
    ;;
    "Raspbian GNU/Linux 10")
      node_version='https://nodejs.org/dist/v12.13.0/node-v12.13.0-linux-armv7l.tar.xz'
    ;;
    *)
      node_version='https://nodejs.org/dist/v12.13.0/node-v12.13.0-linux-x64.tar.xz'
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
  if [ $software_type != 'rpi' ]; then
    install_npm_packages
    sudo usermod -aG docker $(whoami)
    # install_c9
    # install_python_packages
    # install_ruby_gems
  fi
  
  if [ $software_type == 'desktop' ]; then
    #fix    # install_local_packages
    # install_postman
  fi

  sudo apt-get upgrade -y
}

misc_repos(){
  printf "\n$(random_color)Installing miscellaneous repositories${NC}...\n"

  if not_installed yarn; then
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -  
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  fi

  # case $software_type in
  #   "rpi")
  #     # if not_installed docker-engine; then
  #     #   curl -sSL https://get.docker.com | sh
  #     # fi
  #   ;;
  #   *)
  #     # install_docker
  #   ;;
  # esac
}

install_docker(){
  if not_installed docker-engine; then
    sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
  fi

  if [ -d /usr/local/bin ] && [ ! -f /usr/local/bin/docker-compose ]; then
    printf "$(random_color)Installing Docker Compose${NC}..."
    curl -L https://github.com/docker/compose/releases/download/1.12.0-rc2/docker-compose-`uname -s`-`uname -m` > temp/docker-compose
    sudo cp temp/* /usr/local/bin/ && \
    sudo chmod +x /usr/local/bin/docker-compose
  fi
}

install_local_packages(){
  printf "\n$(random_color)Installing local packages${NC}...\n"
  sudo dpkg -i $(directory)/misc/synergy.deb $(directory)/misc/xscreensaver.deb
}

install_ruby_gems(){
  printf "\n$(random_color)Ruby gems${NC}...\n"
  echo "gem: --no-document" >> /home/$user/.gemrc
  bash $(directory)/misc/ruby_gems.sh  
}

install_npm_packages(){
  printf "\n$(random_color)NPM packages${NC}...\n"
  bash $(directory)/misc/npm.sh
}

install_python_packages(){
  printf "\n$(random_color)Python packages${NC}...\n"
  bash $(directory)/misc/python.sh
}

install_postman(){
  wget -O temp/postman.tar.gz https://dl.pstmn.io/download/latest/linux64 && \
  tar -xvf temp/postman.tar.gz -C $HOME && \

  chmod +x $(directory)/misc/postman && \
  sudo cp $(directory)/misc/postman /usr/local/bin
}

install_node(){
  if [ ! -f /usr/local/bin/node ]; then
    printf "$(random_color)Installing Node.JS${NC}..."
    strip_url="${node_version##*/}"
    node_directory=${strip_url%.*.*}
    wget $node_version -O temp/node.tar.xz
    tar -xvf temp/node.tar.xz -C temp/
    sudo cp -R temp/$node_directory/* /usr/local/
  else
    printf "\nnode is already installed\nskipping...\n"
  fi
}

install_scripts(){
  printf "\n$(random_color)Installing scripts${NC}...\n"
  scripts=($(directory)/scripts/*/*.sh)
  for script in "${scripts[@]}"; do
    installer $script
  done
}

install_c9(){
  printf "\n$(random_color)Installing c9${NC}...\n"

  bash $(directory)/misc/c9/install.sh
}
