#!/usr/bin/env bash

user=$(whoami)
user_id=$(id -u $user)
group_id=$(id -g $user)
current_directory="$(pwd)"
dist=$(head -n1 /etc/issue | sed -e 's/\\n //;s/\\l//;s/ $//g')

printf "\ndirectory(){\n  printf \"${current_directory}\"\n}" > state.sh

source $(dirname $0)/state.sh
source $(dirname $0)/utilities.sh

if (whiptail --title "Spyware Installer" --yesno "${dist}\nHello ${user}!\nWelcome to Spyware Installer.\nAre you sure you want to proceed?"  12 78)
  then
    printf "Installing spyware....\n"
  else
    printf "Exiting...\n"
    exit 1
  fi

touch /home/$user/.hushlogin
touch /home/$user/.env

if [ ! -d $HOME/opt/bin ]; then
  mkdir -p $HOME/opt/bin
fi

if [ ! -d $(directory)/lib ]; then
  mkdir -p $(directory)/lib
fi

if [ ! -d data ]; then
  mkdir data
fi

if [ ! -f data/users.json ]; then
  cp default_user.json data/users.json
fi

for f in $(directory)/run/*.sh; do source $f; done;

email=$(whiptail --fb --inputbox "Please enter an email address" 12 78 3>&1 1>&2 2>&3)

update_software=$(whiptail --title "Operating System" --fb --menu "Choose an option" 25 70 16 \
    "1" "XUbuntu 18.04" \
    "2" "Ubuntu Server 16.04" \
    "3" "Ubuntu Server 18.04" \
    "4" "Raspbian" \
    "*" "Skip" \
    3>&1 1>&2 2>&3)

case $update_software in
  "1")
    printf "Preparing to install Xbuntu Desktop 18.04 software...\n"
      software_type=desktop
    ;;    
  "2")
    printf "Preparing to install Ubuntu Server 16.04 software...\n"
      software_type=server-16.04
    ;;
  "3")
    printf "Preparing to install Ubuntu Server 18.04 software...\n"
      software_type=server-18.04
    ;;
  "4")
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
bashrc_config
install_software
install_scripts
vim_config
autofs_config
mouse_config
install_spyware
cleanup

printf "\n$(random_color)........................................................................................${NC}\n\nPress any key to continue...\n"
read -n 1
