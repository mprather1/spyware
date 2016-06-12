#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh

network_config(){
printf "auto lo\niface lo inet loopback \n\nauto ${1}\niface ${1} inet static\n  address ${2}\n  gateway 192.168.0.1\n  netmask 255.255.255.0\n  dns-nameservers 8.8.8.8\n " | sudo tee /etc/network/interfaces
printf "\nPlease reboot or restart networking...\n"
echo "New local ip address will be ${1}..."
}
