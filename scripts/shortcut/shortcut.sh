#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh
source $(directory)/bin/create_shortcut/create_shortcut.sh

create_shortcut $1 "${2}"
