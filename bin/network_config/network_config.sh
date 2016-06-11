#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh

sudo sh -c "cat $(directory)/network.txt > /etc/network/interfaces"
printf "  address ${1}" | sudo tee -a /etc/network/interfaces
echo "Please reboot or restart networking..."
echo "New local ip address will be ${1}..."
