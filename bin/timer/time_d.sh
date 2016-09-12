#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

time_d(){
#timer without counter
if chkarg $1; then
  minutes=$1
  seconds=$(($minutes * 60));
  sleep $seconds
  mplayer /usr/share/sounds/freedesktop/stereo/complete.oga > /dev/null 2>&1
else
  printf "Input Error...\n\"timed <minutes>\"\n"
fi
}
