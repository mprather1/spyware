#!/usr/bin/env bash
source $(dirname $0)/../../data.sh
for f in $(directory)/bin/*/*.sh; do source $f; done;
prompt=">>> "

echo "Enter gateway address..."
read -p $prompt gateway

iflist $gateway
