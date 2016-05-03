prompt=">>> "
user=$(whoami)
user_id=$(id -u $user)
group_id=$(id -g $user)

echo "Important Read this!!"
echo "Be very careful!! Do not make mistakes!!
Only use this for drives that you do not intend to remove!!"
echo "Press any key to continue or CTRL+C to exit!!"
read -n 1

echo "
Please enter location of hard disk..."
echo "Example: /dev/sda"
read -e -p ${prompt} disk_location

echo "
Enter mount point..."
echo "Example: /media/shared"
read -e -p ${prompt} mount_point

echo "
Choose type..."
echo "1.) ntfs 2.) vfat 3.) ext4"
read type
case $type in
  '1') type="ntfs"
  ;;
  '2') type="vfat"
  ;;
  '3') type='ext4'
  ;;
esac

printf "${disk_location} ${mount_point} ${type} rw,auto,user,uid=${user_id},git=${group_id},fmask=0111,dmask=0000 0 0\n" | sudo tee -a /etc/fstab

sudo mount -a

echo "All done!!"
echo "If no errors have occured, hard disk is mounted in ${mount_point}!!"
echo "
Go fuck yourself!!"
