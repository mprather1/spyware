#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh

time_d(){
#timer without counter

minutes=$1

seconds=$(($minutes * 60));
sleep $seconds

mplayer /usr/share/sounds/freedesktop/stereo/complete.oga > /dev/null 2>&1
}