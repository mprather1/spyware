#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

mount_local(){
user=$(whoami)
user_id=$(id -u $user)
group_id=$(id -g $user)

#argument 1 disk location
#argument 2 mount point
#argument 3 type

if chkarg $3; then
  sudo mkdir $2 && printf "${1} ${2} ${3} rw,auto,user,uid=${user_id},gid=${group_id},fmask=0111,dmask=0000 0 0\n" | sudo tee -a /etc/fstab
  sudo mount -a
  printf "\nAll done!!\n"
  printf "If no errors have occured, hard disk is mounted in ${2}!!\n"
else
  printf "Input Error...\n\"mountlocal <disk location> <mount point> <type>\"\n"
fi
}
