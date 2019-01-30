#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh

network_config(){
  if chkarg $5; then
    printf "auto lo\niface lo inet loopback \n\nauto ${1}\niface ${1} inet static\n  address ${2}\n  gateway ${3}\n  netmask ${4}\n  dns-nameservers $5\n " | sudo tee /etc/network/interfaces
    printf "\nPlease reboot or restart networking...\n"
    printf "New network_config for adapter: ${1}\n  IP: ${2}\n  gateway: ${3}\n  subnet: ${4}\n  DNS Sever: ${5}\n"
  else
    printf "Input Error...\n\"networkconfig <network adapter> <ip address> <gateway> <subnet> <dns-nameserver>\"\n"
  fi
}
