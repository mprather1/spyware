#!/usr/bin/env bash

get_software_list(){
  software=$(directory)/run/software_lists/${software_type}.txt
  readarray software_list < $software
    for software in "${software_list[@]}"; do
      new_software+="${software}"
    done
}

install_desktop_software(){
  sudo apt-get install -y curl
  sudo add-apt-repository -y ppa:webupd8team/atom
  sudo apt-add-repository -y ppa:numix/ppa
  sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'    
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get update && \
  sudo apt-get install $software_list -y
  sudo dpkg -i $(directory)/misc/synergy.deb $(directory)/misc/xscreensaver.deb
  echo "gem: --no-document" >> ~/.gemrc
  bash $(directory)/misc/npm.sh && \
  bash $(directory)/misc/ruby_gems.sh
  sudo apt-get upgrade -y
}

audio_software(){
  sudo apt-get install ardour rosegarden qtractor hydrogen hydrogen-drumkits yoshimi fluidsynth jack mixxx muse musescore xwax zynaddsubfx gladish
}

install_server_software(){
  sudo apt-get update
  sudo apt-get install -y curl
  sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'    
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get update && \
  sudo apt-get install $new_software -y 
  echo "gem: --no-document" >> ~/.gemrc
  bash $(directory)/misc/npm.sh && \
  bash $(directory)/misc/ruby_gems.sh  
  sudo apt-get upgrade -y
}

install_rpi_software(){
  sudo apt-get install -y curl
  curl -sSL https://get.docker.com | sh ## not tested yet
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get update && \
  sudo apt-get install $new_software -y 
  bash $(directory)/misc/npm.sh
  sudo apt-get upgrade -y
}
