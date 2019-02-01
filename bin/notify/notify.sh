#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh

notify(){
  check=$(echo "$XDG_DATA_DIRS" | grep -Eo 'xfce|kde|gnome')

  if [ ! -z "${check}" ]; then
    notify-send "Command has finished!!!" -i $(directory)/icons/windows-128.png
  else
    wall "Command has finished!!!"
  fi
}
