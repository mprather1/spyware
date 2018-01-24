#!/usr/bin/env bash
source $(dirname $0)/../../state.sh
source $(directory)/bin/git/git_commit.sh

git_commit "${1}" $2
