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

printf "\nUsername and password for cloud9...\n"
echo "Enter new username..."
read -p "${prompt}" c9Username
echo "Enter new password..."
read -p "${prompt}" c9Password

ssh_config
create_bash_aliases
install_software
bashrc_config
vim_config
autofs_config
mouse_config
install_spyware

echo "
You must leave this file in the location where you ran the installer or face the consequences!!"
echo "Type 'spyware' for a list of commands!!"
echo "
Please restart shell and networking for changes to take effect..."
printf "Press any key to exit...\n"
read -n 1
