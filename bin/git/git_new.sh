#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

git_new(){
git init && git add -A && git commit -m "${3}" && git remote add origin git@github.com:$1/$2.git && git push -u origin master
printf "\nAll Done!!\n"
}
