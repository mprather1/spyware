#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh

notify(){
  notify-send -i $(directory)/icons/windows-128.png 'Command has finished!!!'
}
