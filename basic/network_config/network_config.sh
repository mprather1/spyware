#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh
for f in $(directory)/bin/*/*.sh; do source $f; done;
prompt=">>> "

echo "Enter device..."
read -p $prompt device
echo "Enter desired static ip address... "
read -p $prompt ipaddress

network_config $device $ipaddress
