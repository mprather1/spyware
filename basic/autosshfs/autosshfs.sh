#!/usr/bin/env bash
source $(dirname $0)/../../data.sh
for f in $(directory)/bin/*/*.sh; do source $f; done;
prompt=">>> "

echo "autofs sshfs configuration..."
echo "Enter name for mount point..."
read -p $prompt mountpoint
echo "Enter username and hostname(username@hostname)..."
read -p $prompt autofs_user


autofs_config $mountpoint $autofs_user
