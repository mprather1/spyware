#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh

git_commit(){
git add -A && git commit -m "${1}"
echo "
All Done!!!"
}