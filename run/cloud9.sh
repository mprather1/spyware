#!/usr/bin/env bash

user=$(whoami)

systemd_var="
[Unit]
Description=c9 
After=syslog.target network.target

[Service]
Type=simple
WorkingDirectory=/home/$user/Development
ExecStart=/bin/bash -lc 'node /home/$user/c9sdk/server.js -p 8080 -a : --listen localhost -w /home/$user/Development'
User=$user
Group=$user
UMask=0002

RestartSec=1
Restart=always

StandardOutput=syslog
StandardError=syslog

SyslogIdentifier=c9

[Install]
WantedBy=multi-user.target"

install_cloud9(){
  printf "\n$(random_color)Installing cloud9${NC}...\n"

  if [ ! -d /home/$user/Development ]; then
    mkdir /home/$user/Development
  fi

  git clone git://github.com/c9/core.git /home/$user/c9sdk
  /home/$user/c9sdk/scripts/install-sdk.sh

  # pm2 command
  # printf "alias cloud9='pm2 start /home/$user/c9sdk/server.js -x -- -p 8080 -a ${c9Username}:${c9Password} --listen localhost -w /home/$user/Development'\n" >> /home/$user/.bash_aliases

  printf '%s\n' "$systemd_var" | sudo tee -a /lib/systemd/system/c9.service > /dev/null

  sudo systemctl enable c9.service
  sudo systemctl start c9
}
