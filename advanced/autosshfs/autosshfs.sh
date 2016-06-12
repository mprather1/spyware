#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh
for f in $(directory)/bin/*/*.sh; do source $f; done;

autofs_config $1 $2
