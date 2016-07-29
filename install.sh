#!/usr/bin/env bash

user=$(whoami)
user_id=$(id -u $user)
group_id=$(id -g $user)
current_directory="$(pwd)"
printf "\ndirectory(){\n  printf \"${current_directory}\"\n}" >> data.sh
source $(dirname $0)/data.sh;
for f in $(directory)/run/*.sh; do source $f; done;
prompt=">>> "

echo "Hello ${user^}!!"
echo "Welcome to Spyware Installer..."
echo "Press any key to continue..."
read -n 1

touch ~/.hushlogin

echo "Advanced or basic installation..."
echo "1.) Basic"
echo "2.) Advanced"
read -p $prompt basic
case $basic in
  "1")
    echo "You have chosen basic installation..."
    installation_type=basic
    ;;
  "2")
    echo "You have chosen advanced installation..."
    installation_type=advanced
    ;;
esac

echo "
Software installation..."
echo "1.) Desktop"
echo "2.) Server"
echo "3.) Raspberry Pi"
echo "*.) Skip"
read -p "${prompt}" update_software
case $update_software in
  "1")
    echo "Installing Ubuntu Desktop software..."
      install_desktop_software
    echo "Done!!"
    ;;
  "2")
    echo "Installing Ubuntu Server software..."
      install_server_software
    echo "Done!!"
    ;;
  "3")
    echo "Installing Raspberry Pi software..."
      install_rpi_software
    echo "Done!!"
    ;;
  *)
    echo "skipping..."
    ;;
esac

echo "
Checking for .bashrc configuration..."
sleep 1
if [ ! -f bashrc.config ]
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
if [ -f /etc/auto.master ] && [ ! -f autofs.config ]
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
install_spyware
printf "\n"
if [ -f /usr/bin/pv ]
  then
    echo "..........................." | pv -qL 15
    printf "\nSpyware has been successfully installed..."
  else
    echo "Spyware has been successfully installed..."
fi

echo "
You must leave this file in the location where you ran the installer or face the consequences!!"
echo "Type 'spyware' for a list of commands!!"
echo "
Please restart shell and networking for changes to take effect..."
echo "
Go Fuck Yourself!!"
echo "Press any key to exit..."
read -n 1
