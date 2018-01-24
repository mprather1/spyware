#!/usr/bin/env bash
source $(dirname $0)/../../state.sh
source $(directory)/bin/autosshfs/autosshfs.sh

autofs_config $1 $2
