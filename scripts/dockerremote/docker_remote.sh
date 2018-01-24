#!/usr/bin/env bash
source $(dirname $0)/../../state.sh
source $(directory)/bin/docker_remote/docker_remote.sh

docker_remote $1 $2
