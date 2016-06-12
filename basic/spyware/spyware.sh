#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh
for f in $(dirname $0)/../../bin/*.sh; do source $f; done;

spyware_info
