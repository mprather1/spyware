#!/usr/bin/env bash

echo "Spyware installer..."
echo "Press any key to continue..."
read -n 1

current_directory="$(pwd)"
prompt=">>> "
echo "Creating .hushlogin..."
touch ~/.hushlogin
echo "Done!!"

echo "
Install Atom? y/n"
read -p "${prompt}" atom
case $atom in
  'y')
    echo "
    Adding repository for Atom:"
    sudo add-apt-repository ppa:webupd8team/atom -y
    sudo apt-get update
    sudo apt-get install atom
    echo "Done!!!"
    ;;
  *)
    echo "Skipping..."
    ;;
esac

echo "
Update and install software..."
echo "1.)Desktop 2.)Server *.)Skip"
read -p "${prompt}" update_software
case $update_software in
  "1")
    sudo apt-get update && sudo apt-get install -y openssh-server avahi-daemon clementine ftp ftpd autofs sshfs libreoffice lolcat cmatrix sl puddletag deluge keepass2 geany vlc samba soundconverter ubuntu-restricted-extras fortunes fortunes-off gimp agave steam thunderbird remmina virtualbox calibre gparted curl libsqlite3-dev git vim postgresql git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libpq-dev libffi-dev libpq-dev && sudo apt-get upgrade -y
    echo "Done!!"
    ;;
  "2")
    sudo apt-get update && sudo apt-get install -y cmatrix sl lolcat fortunes fortunes-off curl git openssh-server avahi-daemon autofs sshfs vim postgresql git-core curl zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev build-essential libpq-dev && sudo apt-get upgrade -y
    echo "Done!!!"
    ;;
  *)
    echo "Skipping update and software installation..."
    ;;
esac

echo "
Install encryption library? y/n"
read -p "${prompt}" encryption_library
case $encryption_library in
  'y')
    sudo /usr/share/doc/libdvdread4/install-css.sh
    echo "Done!!"
    ;;
  *)
    echo "Skipping encryption library..."
esac

echo "
Run .bashrc configuration? 'y/n'"
read -p "${prompt}" bashrc_configuration
case $bashrc_configuration in
  'y')
    echo ".bashrc file configuration..."
    cat bashrc.txt >> ~/.bashrc
    echo "Done!!"
    ;;
  *)
    echo "Skipping bashrc configuration..."
    ;;
esac

echo "
Checking for .bash_aliases..."
if [ ! -f ~/.bash_aliases ]
  then
    echo "Creating .bash_aliases..."
    touch ~/.bash_aliases
    cat aliases.txt > ~/.bash_aliases
    echo " "
    echo "Installing Spyware..."

    printf "alias spyware_update='cd ${current_directory} && git pull origin master'\n" >> ~/.bash_aliases

    declare -A software
      software[cloned]=/git/git_clone.sh
      software[gitd]=/git/git_commit.sh
      software[git_new]=/git/git_init.sh
      software[gitp]=/git/git_commit_push_master.sh
    for c in "${!software[@]}"; do
      printf "alias %s='${current_directory}%s'\n" "$c" "${software[$c]}" >> ~/.bash_aliases
    done
    echo "Done!!"
  else
    echo ".bash_aliases already exits!!"
    echo "skipping..."
fi

echo "
Checking for vim configuration..."
if [ ! -f ~/.vimrc ]
  then
    echo "Vim configuration..."
    mkdir ~/.vim
    cp -rv .vim/ ~/
    touch ~/.vimrc
    cat vimrc.txt >> ~/.vimrc
    echo "Done!!"
  else
    echo "Skipping vim configuration..."
fi

echo "
Do you want to run network configuration? y/n"
read -p "${prompt}" network_configuration
case $network_configuration in
  'y')
    echo "Enter desired static IP address: "
    read ip_address
    sudo cat network.txt > /etc/network/interfaces
    sudo echo "  address ${ip_address}" >> /etc/network/interfaces
    sudo /etc/init.d/networking restart
    echo "Done!!"
    ;;
  *)
    echo "Skipping network configuration..."
    ;;
esac

echo "
Checking for id_rsa..."
if [ ! -f ~/.ssh/id_rsa ]
  then
    echo "
    Enter email address:"
    read email
    echo "Creating rsa key and adding to ssh agent..."
    ssh-keygen -t rsa -b 4096 -C "${email}"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    echo "Done!!"
  else
    echo "id_rsa already exists!!"
    echo "skipping..."
fi

echo "
Install bonus scripts? y/n"
read -p "${prompt}" custom
case $custom in
  'y')
    var=true

    bash ./make_shortcut/install.sh
    make_shortcut="Type 'make_shortcut' into terminal to create a shortcut!!"
    echo "Done!!"

    bash ./ssh-copy/install.sh
    sshcopy="Type 'sshcopy' to setup password free ssh connection!!"
    echo "Done!!"

    bash ./installation_shortcut/install.sh
    installation_shortcut="Type 'installnow' into terminal to install software with apt-get!!"
    echo "Done!!"
    ;;
  *)
    echo "Skipping..."
    ;;
esac

echo "
All done!!"
echo "
You must leave this file in the location where you ran the installer or face the consequences!!
Type 'spyware_update' in the terminal to update!!"

if [ ! -z ${var+x} ]
  then
    echo $make_shortcut
    echo $sshcopy
    echo $installation_shortcut
fi

echo "
Please restart shell for changes to take effect..."
echo "
Go Fuck Yourself!!"
echo "Press any key to exit..."
read -n 1
