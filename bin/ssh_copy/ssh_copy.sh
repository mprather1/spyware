#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh

ssh-copy-id $2@$3

printf "alias ${1}='ssh ${2}@${3}'\n" >> ~/.bash_aliases

echo "
All done!!"
echo "Restart your shell and access the remote computer by typing '${1}'!!"
