#!/usr/bin/env bash

user=$(whoami)
user_id=$(id -u $user)
group_id=$(id -g $user)
current_directory="$(pwd)"
dist=$(head -n1 /etc/issue | sed -e 's/\\n //;s/\\l//;s/ $//g')
prompt=">>> "

touch utilities.sh
cat utilities.txt > utilities.sh
printf "\ndirectory(){\n  printf \"${current_directory}\"\n}" >> utilities.sh
source $(dirname $0)/utilities.sh

printf "\nHello $(random_color)${user^}${NC}!!\n"
printf "Welcome to $(random_color)Spyware Installer${NC}...\n"
echo "${dist}..."
printf "$(random_color)........................................................................................${NC}\n\n"
printf "Press any key to continue..."

read -n 1

touch /home/$user/.hushlogin

if [ ! -d data ]; then
  mkdir data
fi

if [ ! -f data/users.json ]; then
  cp default_user.json data/users.json
fi

for f in $(directory)/run/*.sh; do source $f; done;

# create_user

printf "\n\n$(random_color)Software installation${NC}..."
printf "\nChoose one:\n"
printf "1.) XUbuntu 16.04\n"
printf "2.) Ubuntu Server 16.04\n"
printf "3.) Raspbian\n"
printf "*.) Skip\n"
read -p "${prompt}" update_software
case $update_software in
  "1")
    printf "Preparing to install Ubuntu Desktop software...\n"
      software_type=desktop
    ;;
  "2")
    printf "Preparing to install Ubuntu Server software...\n"
      software_type=server
    ;;
  "3")
    printf "Preparing to install Raspberry Pi software...\n"
      software_type=rpi
    ;;
  *)
    printf "skipping...\n"
    ;;
esac

printf "\n$(random_color)Updating spyware${NC}...\n"
initialize
install_node
git_update

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
cleanup

printf "\n$(random_color)........................................................................................${NC}\n\nPress any key to continue...\n"
read -n 1
