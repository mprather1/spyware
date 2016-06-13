#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh

git_clone(){
git clone git@github.com:$1/$2
echo "
All Done!!!"
}
