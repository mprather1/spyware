#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh

autofs_config(){
printf "${1} -fstype=fuse,rw,nodev,nonempty,noatime,allow_other,max_read=65536 :sshfs\#${2}\:/\n" | sudo tee -a /etc/auto.sshfs

sudo service autofs restart

echo "
All done!!"
echo "Your mount point can be found at /mnt/${1}"
}
