#!/usr/bin/env bash

current_directory="$(pwd)"

touch ~/.bash_aliases

echo "
Installing mount local drive..."
echo "alias mount_local_drive='bash ${current_directory}/mount_local_drive/mount_local_drive.sh'" >> ~/.bash_aliases

echo "
Finished installing mount local drive!!
