printf "${1} -fstype=fuse,rw,nodev,nonempty,noatime,allow_other,max_read=65536 :sshfs\#${2}@${3}\:/\n" | sudo tee -a /etc/auto.sshfs

sudo service autofs restart

mplayer $current_directory/sounds/ding.wav > /dev/null 2>&1
echo "
All done!!"
echo "Your mount point can be found at /mnt/${1}"
echo "
Go fuck yourself!!"
