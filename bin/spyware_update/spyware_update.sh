#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh
source $(directory)/bin/git/git_update.sh

spyware_update(){
  printf 'updating master git repo...\n'
  git -C $(directory) pull --quiet origin master && \

  git_update
}
