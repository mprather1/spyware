#!/usr/bin/env bash

source $(dirname $0)/../current_directory.sh

autofs_config(){
  printf "/mnt /etc/auto.sshfs uid=${user_id},gid=${group_id},--timeout=30,--ghost\n" | sudo tee -a /etc/auto.master
  touch $(dirname $0)/../autofs_config.txt
}
