#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

git_new(){
git init && git remote add origin git@github.com:$1/$2.git 
printf "\nAll Done!!\n"
}
