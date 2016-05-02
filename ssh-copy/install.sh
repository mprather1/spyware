#!/usr/bin/env bash

current_directory="$(pwd)"

touch ~/.bash_aliases

echo "
Installing sshcopy..."
echo "alias sshcopy='bash ${current_directory}/ssh-copy/ssh_copy.sh'" >> ~/.bash_aliases

echo "
All done!!"
echo "Restart your shell and type 'sshcopy' into terminal to setup password free connection to a remote computer!!"
echo "
Go fuck yourself!!"
