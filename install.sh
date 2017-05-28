#!/usr/bin/env bash

user=$(whoami)
user_id=$(id -u $user)
group_id=$(id -g $user)
current_directory="$(pwd)"
dist=$(head -n1 /etc/issue | sed -e 's/\\n //;s/\\l//;s/ $//g')
prompt=">>> "

echo "Hello ${user^}!!"
echo "Welcome to Spyware Installer..."
echo "${dist}..."
echo "Press any key to continue..."
read -n 1

touch utilities.sh
cat utilities.txt > utilities.sh
printf "\ndirectory(){\n  printf \"${current_directory}\"\n}" >> utilities.sh
source $(dirname $0)/utilities.sh;
for f in $(directory)/run/*.sh; do source $f; done;

touch /home/$user/.hushlogin

echo "
Software installation..."
echo "1.) XUbuntu 16.04"
echo "2.) Ubuntu Server 16.04"
echo "3.) Raspbian"
echo "*.) Skip"
read -p "${prompt}" update_software
case $update_software in
  "1")
    echo "Installing Ubuntu Desktop software..."
      software_type=desktop
    ;;
  "2")
    echo "Installing Ubuntu Server software..."
      software_type=server
    ;;
  "3")
    echo "Installing Raspberry Pi software..."
      software_type=rpi
    ;;
  *)
    echo "skipping..."
    ;;
esac

echo "
Checking for .bash_aliases..."
sleep 1
if [ ! -f /home/$user/.bash_aliases ]
  then
    echo "Creating .bash_aliases..."
    create_bash_aliases
  else
    echo ".bash_aliases already exits..."
    echo "skipping..."
fi

if chkarg $software_type; then
  install_software
  echo "Done!!"
fi

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
Checking for vim configuration..."
sleep 1
if [ ! -f /home/$user/.vimrc ]
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
if [ ! -f /home/$user/.ssh/id_rsa ]
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
printf "Press any key to exit...\n"
read -n 1
