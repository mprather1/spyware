#!/usr/bin/env bash

curl_rails="Type 'curlrails <argument>' into terminal to access rails server at localhost:3000"
make_shortcut="Type 'shortcut' into terminal to create a shortcut!!"
sshcopy="Type 'sshcopy' to setup password free ssh connection!!"
installation_shortcut="Type 'installnow' into terminal to install software with apt-get!!"
mount_local_drive="Type 'mountlocal' into terminal to mount a local hard disk!!"

echo "Spyware installer..."
echo "Press any key to continue..."
read -n 1

current_directory="$(pwd)"
prompt=">>> "
echo "Creating .hushlogin..."
touch ~/.hushlogin
echo "Done!!"

echo "
Update and install software..."
echo "1.)Desktop 2.)Server *.)Skip"
read -p "${prompt}" update_software
case $update_software in
  "1")
    sudo add-apt-repository ppa:webupd8team/atom -y
    sudo add-apt-repository ppa:chris-lea/node.js -y
    sudo apt-get update && sudo apt-get install -y openssh-server avahi-daemon clementine ftp ftpd autofs sshfs libreoffice lolcat cmatrix sl puddletag deluge keepass2 geany vlc samba soundconverter ubuntu-restricted-extras fortunes fortunes-off gimp agave steam thunderbird remmina virtualbox calibre gparted curl libsqlite3-dev git vim postgresql git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libpq-dev libffi-dev libpq-dev pv toilet rig libaa-bin espeak nodjs && sudo apt-get upgrade -y
    sudo /usr/share/doc/libdvdread4/install-css.sh
    ;;
  "2")
    sudo add-apt-repository ppa:chris-lea/node.js -y
    sudo apt-get update && sudo apt-get install -y cmatrix sl lolcat fortunes fortunes-off curl git openssh-server avahi-daemon autofs sshfs vim postgresql git-core curl zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev build-essential libpq-dev pv toilet rig libaa-bin nodejs && sudo apt-get upgrade -y
    echo "Done!!!"
    ;;
  *)
    echo "Skipping update and software installation..."
    ;;
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
sleep 1
if [ ! -f ~/.bash_aliases ]
  then
    echo "Creating .bash_aliases..."
    touch ~/.bash_aliases
    cat aliases.txt > ~/.bash_aliases
    echo " "
    echo "Installing Spyware..."

    printf "alias spyware_update='cd ${current_directory} && git pull origin master'\n" >> ~/.bash_aliases

    declare -A scripts
      scripts[cloned]=/git/git_clone.sh
      scripts[gitd]=/git/git_commit.sh
      scripts[gitnew]=/git/git_init.sh
      scripts[gitp]=/git/git_commit_push_master.sh
      scripts[curlrails]=/curl_rails/curl_rails.sh
      scripts[shortcut]=/make_shortcut/make_shortcut.sh
      scripts[sshcopy]=/ssh_copy/ssh_copy.sh
      scripts[installnow]=/installation_shortcut/installation_shortcut.sh
      scripts[mountlocal]=/mount_local_drive/mount_local_drive.sh
    for c in "${!scripts[@]}"; do
      printf "alias %s='bash ${current_directory}%s'\n" "$c" "${scripts[$c]}" >> ~/.bash_aliases
    done
    echo "Done!!"
  else
    echo ".bash_aliases already exits!!"
    echo "skipping..."
fi

echo "
Checking for vim configuration..."
sleep 1
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
Checking for id_rsa..."
sleep 1
if [ ! -f ~/.ssh/id_rsa ]
  then
    echo "
    id_rsa does not exist, creating..."
    echo "Enter email address:"
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

if [ -f /usr/bin/pv ]
  then
    echo "Spyware has been successfully installed..." | pv -qL 15
  else
    echo "Spyware has been successfully installed..."
fi

echo "
You must leave this file in the location where you ran the installer or face the consequences!!
Type 'spyware_update' in the terminal to update this script!!"

echo $make_shortcut
echo $sshcopy
echo $installation_shortcut
echo $mount_local_drive
echo $curl_rails

echo "
Please restart shell for changes to take effect..."
echo "
Go Fuck Yourself!!"
echo "Press any key to exit..."
read -n 1
