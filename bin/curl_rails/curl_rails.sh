#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

curl_rails(){
#simple script to access rails localhost
curl http://localhost:3000/$1
}
