#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

_dir=$(pwd)

git_commit(){
  if [ -f $_dir/package.json ]
    then 
      standard && git add -A && git commit -m "${1}" && git tag $2
    else 
      git add -A && git commit -m "${1}" && git tag $2
  fi
  
  printf "\nAll Done!!!\n"
}
