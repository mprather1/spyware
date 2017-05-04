#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

docker_log(){
  if chkarg $1; then
    while true; do
      docker logs --tail=50 -f $1
      echo --------
      echo $1: lost logs, waiting 5 seconds \($(date -u)\)
      echo --------
      sleep 5
    done
  else
    printf "Input Error...\n\"docker_log <container>\"\n"
  fi
}
