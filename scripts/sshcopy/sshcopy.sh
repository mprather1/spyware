#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh
source $(directory)/bin/ssh_copy/ssh_copy.sh

ssh_copy $1 $2
