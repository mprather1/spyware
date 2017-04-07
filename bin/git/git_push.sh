#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

git_push(){
git push -u origin master && git push --tags
printf "\nAll Done!!\n"
}
