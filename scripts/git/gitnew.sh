#!/usr/bin/env bash
source $(dirname $0)/../../data.sh
for f in $(directory)/bin/*/*.sh; do source $f; done;

git_new $1 $2 "${3}"
