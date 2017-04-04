#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

ruby $(directory)/bin/ssh_tool/ssh_tool.rb -u $1 -f $2 -h $3
