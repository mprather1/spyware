#!/usr/bin/env bash
source $(dirname $0)/../../state.sh
source $(directory)/bin/git/git_clone.sh

git_clone $1 $2
