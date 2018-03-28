#!/usr/bin/env bash

if [ ! -z ${2+x} ]; then
  sudo apt-get install software-properties-common -y && \
  sudo add-apt-repository ppa:certbot/certbot -y && \
  sudo apt-get update && \
  sudo apt-get install certbot -y && \ 
  sudo certbot certonly --standalone --agree-tos -n -d $1 --email $2  
else
  printf "Usage -> ./auth.sh <domain> <email>\n"
fi
