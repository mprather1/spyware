#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh

mount_local(){
prompt=">>> "
user=$(whoami)
user_id=$(id -u $user)
group_id=$(id -g $user)

#argument 1 disk location
#argument 2 mount point
#argument 3 type

sudo mkdir $2 && printf "${1} ${2} ${3} rw,auto,user,uid=${user_id},gid=${group_id},fmask=0111,dmask=0000 0 0\n" | sudo tee -a /etc/fstab

sudo mount -a
echo "All done!!"
echo "If no errors have occured, hard disk is mounted in ${2}!!"
}
