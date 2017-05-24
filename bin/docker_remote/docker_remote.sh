#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

docker_remote(){
  if chkarg $2; then
    while true; do
      ssh $1 docker logs --tail=50 -f $2
      echo --------
      echo $2: lost logs, waiting 5 seconds \($(date -u)\)
      echo --------
      sleep 5
    done
  else
    printf "Input Error...\n\"docker_remote <username@hostname> <container>\"\n"
  fi
}