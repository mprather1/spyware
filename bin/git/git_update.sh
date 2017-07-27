#!/usr/bin/env bash

git_update(){
  printf "\nInstalling system repositories from git...\n\n"
  repositories=$(directory)/bin/git/repos/repos.txt
  readarray repos < $repositories
    for repo in "${repos[@]}"; do
      if chkarg $repo; then
        dir=$(directory)/$(echo $repo | cut -d' ' -f2-)
        
        if [ ! -d $dir ] 
          then
            printf "cloning ${repo##*/}\n"
            git -C $(dirname $dir) clone --quiet ${repo%.*}
          else
            printf "updating ${repo##*/}\n"
            git -C $dir pull --quiet origin master
        fi
      fi
    done    
  echo "Done!!"
    
}