#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

autofs_config(){
  if chkarg $2; then
    printf "${1} -fstype=fuse,rw,nodev,nonempty,noatime,allow_other,max_read=65536 :sshfs\#${2}\:/\n" | sudo tee -a /etc/auto.sshfs
    sudo service autofs restart
    printf "\nAll done!!\n"
    printf "Your mount point can be found at /mnt/${1}\n"
  else
    printf "Input Error...\n\"autosshfs <share name> <user@hostname>\"\n"
  fi
}
