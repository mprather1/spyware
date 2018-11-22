#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh

_dir=$(pwd)

git_commit(){
  if [ -f $_dir/package.json ]
    then 
      npm-updater $2 && git add -A && git commit -m "${1}" && git tag $2
    else 
      npm-updater $2 && git add -A && git commit -m "${1}" && git tag $2
  fi
  
  printf "\nAll Done!!!\n"
}
