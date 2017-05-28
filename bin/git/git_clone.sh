#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh

git_clone(){
  git clone git@github.com:$1/$2
  printf "\nAll Done!!\n"
}
