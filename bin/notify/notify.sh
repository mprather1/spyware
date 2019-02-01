#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh

notify(){
  if chkarg $1; then 
    $(command) $1 && notify-send -i $(directory)/icons/windows-128.png "${1} has finished!!!"
  else
    notify-send -i $(directory)/icons/windows-128.png 'Command has finished!!!'
  fi
}
