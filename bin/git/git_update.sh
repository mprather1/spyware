#!/usr/bin/env bash

git_update(){
  printf "\n$(random_color)Installing system repositories from git...${NC}\n\n"
  repositories=$(directory)/bin/git/repos/repos.txt
  readarray repos < $repositories
    for repo in "${repos[@]}"; do
      if chkarg $repo; then
        dir=$(directory)/$(echo $repo | cut -d' ' -f2-)
        
        if [ ! -d $dir ] 
          then
            printf "cloning $(random_color)${repo##*/}${NC}...\n"
            git -C $(dirname $dir) clone --quiet ${repo%.*}
            npm --prefix $(directory)/run/${repo##*/} install $(directory)/run/${repo##*/}
          else
            printf "updating $(random_color)${repo##*/}${NC}...\n"
            git -C $dir pull --quiet origin master
        fi
      fi
    done
}
