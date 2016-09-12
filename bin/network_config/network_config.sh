#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

network_config(){
  if chkarg $2; then
    printf "auto lo\niface lo inet loopback \n\nauto ${1}\niface ${1} inet static\n  address ${2}\n  gateway 192.168.0.1\n  netmask 255.255.255.0\n  dns-nameservers 8.8.8.8\n " | sudo tee /etc/network/interfaces
    printf "\nPlease reboot or restart networking...\n"
    printf "New local ip address will be ${2}...\n"
  else
    printf "Input Error...\n\"networkconfig <network adapter> <ip address>\"\n"
  fi
}
