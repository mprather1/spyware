#!/usr/bin/env bash
source $(dirname $0)/../../state.sh
source $(directory)/bin/network_config/network_config.sh

network_config $1 $2
