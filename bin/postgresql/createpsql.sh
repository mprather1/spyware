#!/usr/bin/env bash
source $(dirname $0)/../../current_directory.sh

create_psql_user(){
sudo -u postgres createuser $1 -d -P
echo "All Done!!"
}
