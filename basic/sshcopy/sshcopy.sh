#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh
for f in $(directory)/bin/*/*.sh; do source $f; done;
prompt=">>> "

echo "Enter shortcut to be used for remote ssh connection..."
read -p $prompt shortcut
echo "Enter username and hostname, (username@hostname)..."
read -p $prompt sshcopyname

sshcopy $shortcut $sshcopyname
