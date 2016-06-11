#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh

sudo -u postgres createuser $1 -d -P
echo "All Done!!"
