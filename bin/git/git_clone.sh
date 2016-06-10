#!/usr/bin/env bash
source $(dirname $0)/../current_directory.sh

git clone git@github.com:$1/$2
echo "
All Done!!!"
