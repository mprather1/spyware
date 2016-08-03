#!/usr/bin/env bash
source $(dirname $0)/../../data.sh
for f in $(directory)/bin/*/*.sh; do source $f; done;
prompt=">>> "
echo "Enter shortcut..."
read -p $prompt shortcut
echo "Enter command..."
read -p $prompt commnd

create_shortcut $shortcut "${commnd}"
