#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

alarm_clock(){
  if chkarg $1; then
    minutes=$1
    seconds=$(($minutes * 60)); date1=$((`date +%s` + $seconds));
    while [ "$date1" -ge `date +%s` ]; do
      echo -ne "$(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r";
    done
    mplayer /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga > /dev/null 2>&1
  else
    printf "Input Error...\n\"alarm <minutes>\"\n"
  fi
}
