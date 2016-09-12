#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

time_r(){
  if chkarg $1; then
    minutes=$1
    seconds=$(($minutes * 60)); date1=$((`date +%s` + $seconds));
    while [ "$date1" -ge `date +%s` ]; do
      echo -ne "$(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r";
    done
    mplayer /usr/share/sounds/freedesktop/stereo/complete.oga > /dev/null 2>&1
  else
    printf "Input Error...\n\"timed <minutes>\"\n"
  fi
}
