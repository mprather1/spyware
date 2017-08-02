#!/usr/bin/env bash
source $(dirname $0)/../../utilities.sh

https(){
  http https://$1:8443/$2
}
