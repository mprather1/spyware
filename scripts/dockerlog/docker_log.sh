#!/usr/bin/env bash
source $(dirname $0)/../../state.sh
source $(directory)/bin/docker_log/docker_log.sh

docker_log $1
