#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh
source $(directory)/bin/git/git_update.sh
source $(directory)/run/get_installer.sh

spyware_update(){
  printf "$(random_color)Updating master${NC}...\n"
  git -C $(directory) pull origin master && \

  git_update
  install_js
}
