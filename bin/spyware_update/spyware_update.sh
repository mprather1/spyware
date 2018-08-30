#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh

spyware_update(){
  printf "$(random_color)Updating master${NC}...\n"
  git -C $(directory) pull origin master

  # git_update
}
