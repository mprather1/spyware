#!/usr/bin/env bash
source $(dirname $0)/../../data.sh

curl_rails(){
  curl http://localhost:8000/$1
}
