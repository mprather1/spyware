#!/usr/bin/env bash

user=$(whoami)
user_id=$(id -u $user)
group_id=$(id -g $user)
current_directory="$(pwd)"
printf "printf \"${current_directory}\"\n}" >> current_directory.sh
source $(dirname $0)/current_directory.sh
for f in $(dirname $0)/run/*.sh; do source $f; done;
prompt=">>> "

echo "Hello ${user^}!!"
echo "Welcome to Spyware Installer..."
echo "Press any key to continue..."
read -n 1

touch ~/.hushlogin

echo "
Software installation..."
echo "1.) Desktop 2.) Server *.) Skip"
read -p "${prompt}" update_software
case $update_software in
  "1")
    echo "Installing Ubuntu Desktop software..."
      install_desktop_software
    echo "Done"
    ;;
  "2")
    echo "Installing Ubuntu Server software..."
      install_server_software
    echo "Done!!!"
    ;;
  *)
    echo "skipping..."
    ;;
esac

echo "Install synergy and xscreensaver? y/n"
read synergy
case $synergy in
  "y")
    echo "Installing..."
    sudo dpkg -i misc/synergy.deb misc/xscreensaver.deb
    ;;
  *)
    echo "skipping..."
    ;;
esac

echo "
Checking for .bashrc configuration..."
sleep 1
if [ ! -f bashrc_config.txt ]
  then
    echo ".bashrc file configuration..."
    bashrc_config
    echo "Done!!"
  else
    echo ".bashrc configuration has already been run..."
    echo "skipping..."
fi

echo "
Checking for .bash_aliases..."
sleep 1
if [ ! -f ~/.bash_aliases ]
  then
    echo "Creating .bash_aliases..."
    create_bash_aliases
  else
    echo ".bash_aliases already exits..."
    echo "skipping..."
fi

echo "
Checking for vim configuration..."
sleep 1
if [ ! -f ~/.vimrc ]
  then
    echo "Vim configuration..."
    vim_config
    echo "Done!!"
  else
    echo "vim is already configured..."
    echo "skipping..."
fi

echo "
Checking for id_rsa..."
sleep 1
if [ ! -f ~/.ssh/id_rsa ]
  then
    echo "
    id_rsa does not exist, creating..."
    ssh_config
    echo "Done!!"
  else
    echo "id_rsa already exists..."
    echo "skipping..."
fi

echo "
Checking for autofs..."
sleep 1
if [ -f /etc/auto.master ] && [ ! -f autofs_config.txt ]
  then
    echo "Configuring autofs for sshfs..."
    autofs_config
  else
    echo "skipping..."
fi

echo "
Mouse configuration..."
echo "Checking for xinput..."
sleep 1
if [ -f /usr/bin/xinput ]; then
    mouse_config
else
  echo "xinput not found skipping..."
fi

echo "
Installing Spyware..."
sleep 1
install_spyware
echo "Done"

echo "
Do you want to run network configuration? y/n"
read -p "${prompt}" network_configuration
case $network_configuration in
  "y")
    echo "Configuring network..."
    network_config
    printf "\nDone!!"
    ;;
  *)
    echo "Skipping network configuration..."
    ;;
esac

printf "\n"
if [ -f /usr/bin/pv ]
  then
    echo "Spyware has been successfully installed..." | pv -qL 15
  else
    echo "Spyware has been successfully installed..."
fi

echo "
You must leave this file in the location where you ran the installer or face the consequences!!"
echo "
Please restart shell and networking for changes to take effect..."
echo "
Go Fuck Yourself!!"
echo "Press any key to exit..."
read -n 1
