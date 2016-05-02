#!/usr/bin/env bash

current_directory="$(pwd)"

touch ~/.bash_aliases

echo "
Installing sshcopy..."
echo "alias sshcopy='bash ${current_directory}/ssh-copy/ssh_copy.sh'" >> ~/.bash_aliases

echo "
Finished installing sshcopy!!"
