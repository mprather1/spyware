#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh

sl -ale && mplayer $(directory)/sounds/shutdown.wav > /dev/null 2>&1 && sudo shutdown -h now
