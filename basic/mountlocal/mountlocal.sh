#!/usr/bin/env bash
source $(dirname $0)/../../data.sh
for f in $(directory)/bin/*/*.sh; do source $f; done;
prompt=">>> "

echo "Enter disk location..."
echo "Example: '/dev/sda1'"
read -p $prompt disk_location
echo "Enter mount location..."
echo "Example: '/media/shared'"
read -p $prompt mount_point
echo "Enter type..."
echo "Example: 'ntfs' or 'vfat'"
read -p $prompt disk_type

mount_local $disk_location $mount_point $disk_type
