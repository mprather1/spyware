#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh
source $(dirname $0)/../bin/update-version/index.js

git_push(){
  git push -u origin master && git push --tags && update-version
  printf "\nAll Done!!\n"
}
