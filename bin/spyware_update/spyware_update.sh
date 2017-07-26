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
        dir=$(directory)/$(echo $repo | cut -d' ' -f2-)
        if [ ! -d $dir ]
          then
            echo "cloning repo: ${repo%.*}"
            git -C  $(dirname $dir) clone "${repo%.*}"
            echo "Done!!"
          else
            echo "updating repo: ${repo%.*}"
            git -C $dir pull origin master
            echo "Done!!"
        fi
      fi
    done
}
