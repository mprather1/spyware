#!/usr/bin/env bash
source $(dirname $0)/../current_directory.sh

#simple script to access rails localhost
curl http://localhost:3000/$1
