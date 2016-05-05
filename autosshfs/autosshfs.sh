printf "${1} -fstype=fuse,rw,nodev,nonempty,noatime,allow_other,max_read=65536 :sshfs\#${2}@${3}\:/\n"

sudo ssh-copy-id $2@$3

echo "
All done!!"

echo "Your mount point can be found at /mnt/${1}"
