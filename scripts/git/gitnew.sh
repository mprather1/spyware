#!/usr/bin/env bash
source $(dirname $0)/../../state.sh
source $(directory)/bin/git/git_new.sh

git_new $1 $2 "${3}"
