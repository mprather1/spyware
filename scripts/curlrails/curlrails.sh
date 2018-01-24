#!/usr/bin/env bash
source $(dirname $0)/../../state.sh
source $(dirname $0)/../../utilities.sh
source $(directory)/bin/curl_rails/curl_rails.sh

curl_rails $1
