#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh

notify(){
  check=$(echo "$XDG_DATA_DIRS" | grep -Eo 'xfce|kde|gnome')

  if chkarg $1; then 
    if [ ! -z "${check}" ]; then
      $(command) $1 && notify-send "${1} has finished!!!" -i $(directory)/icons/windows-128.png
    else 
      $(command) $1 && wall "${1} has finished!!!"
    fi
  else
    printf "Incorrect usage: notify '<arg>'\n"
  fi
}
