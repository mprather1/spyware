#!/usr/bin/env bash

source $(dirname $0)/../current_directory.sh

network_config(){
  sudo sh -c "cat $(directory)/network.txt > /etc/network/interfaces"
  echo " "
  echo "Enter desired static IP address: "
  read ip_address
  printf "  address ${ip_address}" | sudo tee -a /etc/network/interfaces
}
