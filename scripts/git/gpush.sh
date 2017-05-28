#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh
source $(directory)/bin/git/git_push.sh

git_push "${1}"
