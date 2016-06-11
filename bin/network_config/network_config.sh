#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh

sudo sh -c "cat $(directory)/network.txt > /etc/network/interfaces"
printf "auto lo\niface lo inet loopback \n\nauto ${1}\niface ${1} inet static\n address ${2}\ngateway 192.168.0.1\nnetmask 255.255.255.0\ndns-nameservers 8.8.8.8\n " | sudo tee -a /etc/network/interfaces
printf "\nPlease reboot or restart networking..."
echo "New local ip address will be ${1}..."
