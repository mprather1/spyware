#!/usr/bin/env bash

user=$(whoami)

if [ ! -d /home/$user/Development ]; then
  mkdir /home/$user/Development
fi

git clone git://github.com/c9/core.git /home/$user/c9sdk

/home/$user/c9sdk/scripts/install-sdk.sh

printf "alias cloud9='pm2 start /home/$user/c9sdk/server.js -x -- -p 8080 -a : --listen localhost -w /home/$user/Development'\n" >> /home/$user/.bash_aliases
