#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh

git add -A && git commit -m "${1}" && git push -u origin master
echo "
All Done!!!"
