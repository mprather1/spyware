#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh

git init && git add -A && git commit -m "${3}" && git remote add origin git@github.com:$1/$2.git && git push -u origin master
echo "
All Done!!!"
