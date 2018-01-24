#!/usr/bin/env bash
source $(dirname $0)/../../state.sh
source $(directory)/bin/iflist/iflist.sh

iflist $1
