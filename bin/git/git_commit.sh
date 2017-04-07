#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

git_commit(){
git add -A && git commit -m "${1}" && git tag $2
printf "\nAll Done!!!\n"
}
