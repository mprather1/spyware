#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

git_commit_push(){
git add -A && git commit -m "${1}" && git push -u origin master
echo "
All Done!!!"
}
