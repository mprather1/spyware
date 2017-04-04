#!/usr/bin/env bash
source $(dirname $0)/../../data.sh
prompt=">>> "

echo "Enter username..."
read -p $prompt username
echo 'Enter function surrounded by quotes...'
read -p $prompt function
echo "Enter hostnames or IP addresses seperated by commas..."
echo "Example: 192.168.0.1,192.168.0.2,192.168.0.3,localhost@localhost.domain"
read -p $prompt hostnames

ruby $(directory)/bin/ssh_tool/ssh_tool.rb -u $username -f $function -h $hostnames

