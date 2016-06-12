#!/usr/bin/env bash

install_desktop_software(){
  sudo apt-get update && sudo apt-get install -y curl
  sudo add-apt-repository -y ppa:webupd8team/atom
  curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
  sudo dpkg -i $(directory)/misc/synergy.deb $(directory)/misc/xscreensaver.deb
  sudo apt-get update && sudo apt-get install -y openssh-server avahi-daemon clementine ftp ftpd autofs sshfs libreoffice lolcat cmatrix sl puddletag deluge keepass2 geany vlc samba soundconverter fortunes fortunes-off gimp agave steam thunderbird remmina virtualbox calibre gparted libdvdread4 libsqlite3-dev git vim postgresql git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libpq-dev libffi-dev libpq-dev pv toilet rig libaa-bin espeak chromium-browser eclipse tuxguitar handbrake dosbox putty putty-tools unzip python-pip nmap atom mplayer nodejs make midori && sudo apt-get upgrade -y
  sudo /usr/share/doc/libdvdread4/install-css.sh
}

install_server_software(){
  sudo apt-get update && sudo apt-get install -y curl
  curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
  sudo apt-get update && sudo apt-get install -y cmatrix sl lolcat fortunes fortunes-off git openssh-server avahi-daemon autofs sshfs vim postgresql git-core curl zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev build-essential libpq-dev pv toilet rig libaa-bin nodejs unzip python-pip nmap nodejs make && sudo apt-get upgrade -y
  touch installed.txt
}