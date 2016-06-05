ssh-copy-id $2@$3

echo "alias ${1}='ssh ${2}@${3}'" >> ~/.bash_aliases

echo "
All done!!"
echo "Restart your shell and access the remote computer by typing '${1}'!!"
echo "
Go fuck yourself!!"
