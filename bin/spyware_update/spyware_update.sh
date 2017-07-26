#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh

spyware_update(){
  printf 'updating master git repo...\n'
  git -C $(directory) pull origin master && \

  repositories=$(directory)/run/git/repos.txt
  readarray repos < $repositories
    echo 'updating misc git repos....'
    for repo in "${repos[@]}"; do
      if chkarg $repo; then
        git -C $(directory)/$(echo $repo | cut -d' ' -f2-) pull origin master
      fi
    done
}
