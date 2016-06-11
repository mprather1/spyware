#!/usr/bin/env bash

autofs_config(){
  printf "/mnt /etc/auto.sshfs uid=${user_id},gid=${group_id},--timeout=30,--ghost\n" | sudo tee -a /etc/auto.master
  touch $(directory)/autofs.config
}
