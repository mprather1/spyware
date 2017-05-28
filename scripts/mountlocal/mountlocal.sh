#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh
source $(directory)/bin/mount_local/mount_local.sh

mount_local $1 $2 $3
