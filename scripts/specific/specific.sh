#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh
source $(directory)/bin/specific_directory/specific_directory.sh

specific_directory $1 $2 $3
