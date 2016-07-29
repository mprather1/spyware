#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

die_function(){
mplayer $(directory)/sounds/shutdown.wav > /dev/null 2>&1 && sudo shutdown -h now
}

rest_function(){
mplayer $(directory)/sounds/shutdown.wav > /dev/null 2>&1 && sudo reboot -h now
}
