#!/usr/bin/env bash

install_desktop_software(){
  sudo apt-get install -y curl
  sudo add-apt-repository -y ppa:webupd8team/atom
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y openssh-server avahi-daemon clementine ftp ftpd autofs sshfs libreoffice lolcat cmatrix sl puddletag deluge keepass2 geany vlc samba soundconverter fortunes fortunes-off gimp agave steam thunderbird remmina virtualbox virtualbox-guest-additions-iso calibre gparted libsqlite3-dev git vim postgresql git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libpq-dev libffi-dev libpq-dev pv toilet rig libaa-bin espeak chromium-browser eclipse tuxguitar handbrake dosbox putty putty-tools unzip python-pip nmap whois atom mplayer nodejs make midori tuxguitar-alsa tuxguitar-jsa tuxguitar-oss lmms xscreensaver-screensaver-bsod clonezilla netdiscover vagrant libmysqlclient-dev libfprint0 libfprint-dev fprintd fprint-demo libxrandr-dev libfox-1.6-dev redis-server htop moreutils
  sudo dpkg -i $(directory)/misc/synergy.deb $(directory)/misc/xscreensaver.deb
  sudo apt-get upgrade -y
}

audio_software(){
  sudo apt-get install ardour rosegarden qtractor hydrogen hydrogen-drumkits yoshimi fluidsynth jack mixxx muse musescore xwax zynaddsubfx gladish
}

install_server_software(){
  sudo apt-get install -y curl
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y cmatrix sl lolcat fortunes fortunes-off git openssh-server avahi-daemon autofs sshfs vim postgresql git-core zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev build-essential libpq-dev pv toilet rig libaa-bin nodejs unzip python-pip nmap whois nodejs make ftp ftpd netdiscover libmysqlclient-dev redis-server htop moreutils
  sudo apt-get upgrade -y
}

install_rpi_software(){
  sudo apt-get install -y curl
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y openssh-server avahi-daemon ftp ftpd autofs sshfs lolcat cmatrix sl samba fortunes fortunes-off libsqlite3-dev git vim git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libpq-dev libffi-dev libpq-dev pv toilet rig libaa-bin espeak unzip python-pip nmap whois make libmysqlclient-dev nodejs redis-server netdiscover htop moreutils
  sudo apt-get upgrade -y
}
