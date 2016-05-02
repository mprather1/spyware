#!/usr/bin/env bash

echo "Checking for id_rsa..."
if [ ! -f ~/.ssh/id_rsa ]
  then
    echo "Enter email address:"
    read email
    echo "Creating rsa key and adding to ssh agent..."
    ssh-keygen -t rsa -b 4096 -C "${email}"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    echo "Done!!"
  else
    echo "id_rsa already exists!!"
    echo "skipping...
    "
fi

echo "Enter username and press enter:"
read name

echo "Enter ip address of computer you want to connect to:"
read ipadd

ssh-copy-id ${name}@${ipadd}

echo "Checking for .bash_aliases..."
if [ ! -f ~/.bash_aliases ]
  then
    echo "Creating .bash_aliases..."
    touch ~/.bash_aliases
  else
    echo ".bash_aliases already exits!!"
    echo "skipping..."
fi

echo "Enter shortcut you would like to use to access remote computer:"
read shortcut

echo "alias ${shortcut}='ssh ${name}@${ipadd}'" >> ~/.bash_aliases

echo "
All done!!"
echo "Restart your shell and access the remote computer by typing '${shortcut}'!!"
echo "
Go fuck yourself!!"

echo "
Press any key to exit..."
read -n 1
