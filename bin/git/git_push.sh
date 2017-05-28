#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh

git_push(){
  git push -u origin master && git push --tags
  printf "\nAll Done!!\n"
}
