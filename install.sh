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

touch /home/$user/.hushlogin

if [ ! -d data ]; then
  mkdir data
fi

if [ ! -f data/users.json ]; then
  cp default_user.json data/users.json
fi

touch utilities.sh
cat utilities.txt > utilities.sh
printf "\ndirectory(){\n  printf \"${current_directory}\"\n}" >> utilities.sh
source $(dirname $0)/utilities.sh
source $(directory)/bin/git/git_update.sh
for f in $(directory)/run/*.sh; do source $f; done;

printf "\nUpdating spyware...\n"
git_update

create_user

printf "\n\nSoftware installation...\nChoose one:\n"
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

ssh_config
create_bash_aliases
install_software
get_installer  
install_scripts
install_js
bashrc_config
vim_config
autofs_config
mouse_config
install_spyware

printf "\nYou must leave this file in the location where you ran the installer or face the consequences!!\n"
echo "Type 'spyware' for a list of commands!!"
echo "
Please restart shell and networking for changes to take effect..."
printf "Press any key to exit...\n"
read -n 1
