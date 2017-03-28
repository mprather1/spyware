#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

iflist(){
  if chkarg $1; then
    IP=${1%.*}
    nmap -sP $IP.*
  else
    printf "Input Error...\n\"iflist <gateway address>\"\n"
  fi
}
